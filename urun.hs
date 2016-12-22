import System.Environment
import System.IO
import qualified Data.Set as Set
import UParse
import UModuleLoader
import URunTime
import UEnvironment
import ULambdaExpression

interactiveRun args = do
	putStrLn "; type :q to quit, :? for help"
	(c0,revimports0) <- tryImportFile SIUnqualified "prelude" defaultLoadContext []
	runRealWorld args$repl (c0,(Set.fromList [])) revimports0
	where
		tryImportFile :: SImportMode -> [Char] -> MLoadContext -> [[Char]] -> IO (MLoadContext,[[Char]])
		tryImportFile vis modname c revimports = do
			c1_m <- addImport ("main",(0,0)) modname c
			case c1_m of
				MFail msg modname pos -> do
					putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
					return (c,revimports)
				MSucc c1 -> return (c1,(if (vis == SIQualified) then revimports else (modname:revimports)))
		repl :: MLocalLoadContext -> [[Char]] -> URealWorldEnv ()
		repl (c,locals) revimports = do
			(liftUR.putStr) ((joinStr " " (reverse revimports))++">")
			(liftUR.hFlush) stdout
			iseof <- (liftUR.hIsEOF) stdin
			if iseof then (liftUR.putStrLn) "" else do
				line <- (liftUR getLine)
				case line of
					[] -> repl (c,locals) revimports
					':':r -> case r of
						"q" -> return ()
						"?" -> do
							(liftUR.putStrLn) ":q   quit current session"
							(liftUR.putStrLn) ":?   show this help message"
							(liftUR.putStrLn) "expr compute expression"
							repl (c,locals) revimports
						_ -> do
							(liftUR.putStrLn) "unknown command"
							repl (c,locals) revimports
					_ -> case (parseSTokenTreeStr line) of
						SFail msg pos -> do
							(liftUR.putStrLn) ("parser error at "++(show pos)++" "++msg)
							repl (c,locals) revimports
						SSucc (t,pt) -> case t of
							STTList [(STTNode (STAtom "def"),_),(STTNode (STAtom name),_),(e,p)] -> tryAddDef name (e,p) SVGlobal
							STTList [(STTNode (STAtom "let"),_),(STTNode (STAtom name),_),(e,p)] -> tryAddDef name (e,p) SVLocal
							STTList [(STTNode (STAtom "import*"),_),(STTNode (STAtom name),_)] -> do
								(c1,imports1) <- liftUR$tryImportFile SIUnqualified name c revimports
								repl (c1,locals) imports1
							STTList [(STTNode (STAtom "import"),_),(STTNode (STAtom name),_)] -> do
								(c1,imports1) <- liftUR$tryImportFile SIQualified name c revimports
								repl (c1,locals) imports1
							_ -> case (parseSSExp (t,pt)) of
								SFail msg pos -> do
									(liftUR.putStrLn) ("parser error at "++(show pos)++" "++msg)
									repl (c,locals) revimports
								SSucc (e,p) -> let (MLoadContext loaded curchain) =c in
									case (mResolveNames "main" (e,p) revimports loaded locals (Set.fromList [])) of
										MFail msg modname pos -> do
											(liftUR.putStrLn) (msg++" at "++(show pos))
											repl (c,locals) revimports
										MSucc le -> do
											eval_result <- (runUEvalEnv$executeVExp$fromLExpr$assembleChainLExpr curchain le)
											case eval_result of
												URunning () -> do
													(liftUR.putStrLn) "execution interrupted"
													repl (c,locals) revimports
												UExited x -> do
													if (x==0) then return () else (liftUR.putStrLn) ("exit with code "++(show x))
													repl (c,locals) revimports
												UExceptionHappened f -> do
													(liftUR.putStrLn) ("exception: "++f)
													repl (c,locals) revimports
												UResultReturned (v,_) -> do
													(liftUR.putStrLn) (showValue v)
													repl (c,locals) revimports
							where
								tryAddDef :: [Char] -> (STokenTree,SPosition) -> SVisibility -> URealWorldEnv ()
								tryAddDef name (e,p) vis = case (parseSSExp (e,p)) of
									SFail msg pos -> do
										(liftUR.putStrLn) (msg++" at "++(show pos))
										repl (c,locals) revimports
									SSucc (se,pse) -> case (mAddDef "main" revimports (SSDef name (se,pse) vis) (c,locals)) of
										MFail msg modname pos -> do
											(liftUR.putStrLn) (msg++" at "++(show pos))
											repl (c,locals) revimports
										MSucc (c1,locals1) -> repl (c1,locals1) revimports
		joinStr sep strs = case strs of
			[] -> []
			a:[] -> a
			a:r -> a++sep++(joinStr sep r)
main = do
	args <- getArgs
	if null args || ((head args) == "-") then
		interactiveRun (drop 1 args)
	else do
		let ifname = head args
		loadc <- loadMainModule ifname defaultLoadContext
		case loadc of
			MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
			MSucc (MLoadContext loaded curchain)
				| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
				| otherwise -> do
					eval_result <- (runRealWorld (tail args)$runUEvalEnv$executeVExp$fromLExpr$assembleChainLExpr curchain (LRef "main.main"))
					case eval_result of
						URunning () -> putStrLn "execution interrupted"
						UExited x -> if (x==0) then return () else putStrLn ("exit with code "++(show x))
						UExceptionHappened f -> putStrLn ("exception: "++f)
						UResultReturned (v,_) -> putStrLn (showValue v)

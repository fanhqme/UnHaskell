import System.IO
import qualified Data.Set as Set

import UParse
import URunTime
import UEnvironment
import UModuleLoader

joinStr sep strs = case strs of
	[] -> []
	a:[] -> a
	a:r -> a++sep++(joinStr sep r)

main = do
	putStrLn "; type :q to quit, :? for help"
	(c0,revimports0) <- tryImportFile SIUnqualified "prelude" defaultLoadContext []
	repl (c0,(Set.fromList [])) revimports0
	where
		tryImportFile :: SImportMode -> [Char] -> MLoadContext -> [[Char]] -> IO (MLoadContext,[[Char]])
		tryImportFile vis modname c revimports = do
			c1_m <- addImport ("main",(0,0)) modname c
			case c1_m of
				MFail msg modname pos -> do
					putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
					return (c,revimports)
				MSucc c1 -> return (c1,(if (vis == SIQualified) then revimports else (modname:revimports)))
		repl :: MLocalLoadContext -> [[Char]] -> IO ()
		repl (c,locals) revimports = do
			putStr ((joinStr " " (reverse revimports))++">")
			hFlush stdout
			iseof <- hIsEOF stdin
			if iseof then putStrLn "" else do
				line <- getLine
				case line of
					[] -> repl (c,locals) revimports
					':':r -> case r of
						"q" -> return ()
						"?" -> do
							putStrLn ":q   quit current session"
							putStrLn ":?   show this help message"
							putStrLn "expr compute expression"
							repl (c,locals) revimports
						_ -> do
							putStrLn "unknown command"
							repl (c,locals) revimports
					_ -> case (parseSTokenTreeStr line) of
						SFail msg pos -> do
							putStrLn ("parser error at "++(show pos)++" "++msg)
							repl (c,locals) revimports
						SSucc (t,pt) -> case t of
							STTList [(STTNode (STAtom "def"),_),(STTNode (STAtom name),_),(e,p)] -> tryAddDef name (e,p) SVGlobal
							STTList [(STTNode (STAtom "let"),_),(STTNode (STAtom name),_),(e,p)] -> tryAddDef name (e,p) SVLocal
							STTList [(STTNode (STAtom "import"),_),(STTNode (STAtom name),_)] -> do
								(c1,imports1) <- tryImportFile SIUnqualified name c revimports
								repl (c1,locals) imports1
							STTList [(STTNode (STAtom "import"),_),(STTNode (STAtom "qualified"),_),(STTNode (STAtom name),_)] -> do
								(c1,imports1) <- tryImportFile SIQualified name c revimports
								repl (c1,locals) imports1
							_ -> case (parseSSExp (t,pt)) of
								SFail msg pos -> do
									putStrLn ("parser error at "++(show pos)++" "++msg)
									repl (c,locals) revimports
								SSucc (e,p) -> let (MLoadContext loaded curchain) =c in
									case (mResolveNames "main" (e,p) revimports loaded locals (Set.fromList [])) of
										MFail msg modname pos -> do
											putStrLn (msg++" at "++(show pos))
											repl (c,locals) revimports
										MSucc le -> do
											eval_result <- (runRealWorld$runUEvalEnv$executeVExp$fromLExpr$assembleChainLExpr curchain le)
											case eval_result of
												URunning () -> do
													putStrLn "execution interrupted"
													repl (c,locals) revimports
												UExited x -> do
													if (x==0) then return () else putStrLn ("exit with code "++(show x))
													repl (c,locals) revimports
												UExceptionHappened f -> do
													putStrLn ("exception: "++f)
													repl (c,locals) revimports
												UResultReturned (v,_) -> do
													putStrLn (showValue v)
													repl (c,locals) revimports
							where
								tryAddDef name (e,p) vis = case (parseSSExp (e,p)) of
									SFail msg pos -> do
										putStrLn (msg++" at "++(show pos))
										repl (c,locals) revimports
									SSucc (se,pse) -> case (mAddDef "main" revimports (SSDef name (se,pse) vis) (c,locals)) of
										MFail msg modname pos -> do
											putStrLn (msg++" at "++(show pos))
											repl (c,locals) revimports
										MSucc (c1,locals1) -> repl (c1,locals1) revimports

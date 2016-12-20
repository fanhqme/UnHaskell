module UModuleLoader where

import qualified Data.Map as Map
import qualified Data.Set as Set
import System.Directory
import UParse
import ULambdaExpression

data MMayFail a = MSucc a | MFail [Char] [Char] SPosition deriving Show     -- message, module name, position

instance Monad MMayFail where
	(MSucc f) >>= g = g f
	(MFail a b c) >>= g = MFail a b c
	return a = MSucc a

data MLoadContext = MLoadContext (Set.Set [Char]) [([Char],LExpr)] deriving Show

loadModule :: [Char] -> IO (SMayFail SSModule)
loadModule fname = readFile fname >>= (return . parseSSModuleStr)

type MLocalLoadContext = (MLoadContext,Set.Set [Char])

mAddDef :: [Char] -> [[Char]] -> SSDef -> MLocalLoadContext -> MMayFail MLocalLoadContext
mAddDef modname revimports (SSDef name (se,sp) vis) ((MLoadContext loaded curchain),locals) = do
	e <- resolveNames (se,sp) (Set.fromList [])
	let (name2,locals2) = case vis of
		SVLocal -> (getLocalName name,(Set.insert name locals))
		SVGlobal -> (modname++"."++name,(Set.delete name locals))
	let loaded2 = Set.insert name2 loaded
	return$(MLoadContext (loaded2) ((name2,e):curchain),locals2)
	where
		getLocalName a = " "++modname++"."++a
		resolveNames :: (SSExp,SPosition) -> (Set.Set [Char]) -> MMayFail LExpr
		resolveNames (e,p) c = case e of
			(SSInt a) -> return (LInt a)
			(SSDouble a) -> return (LDouble a)
			(SSLambda a (e1,p1)) -> do
				e2 <- resolveNames (e1,p1) (Set.insert a c)
				return (LAbs a e2)
			(SSRef a)
				| (Set.member a c) -> return$LRef a
				| (Set.member a loaded) -> return$LRef a
				| (Set.member a locals) -> return$LRef$getLocalName a
				| (Set.member (modname++"."++a) loaded) -> return$LRef$(modname++"."++a)
				| otherwise -> case (filter (\x -> (Set.member (x++"."++a) loaded)) revimports) of
					[] -> MFail ("undefined symbol "++a) modname p
					(x:_) -> return$LRef (x++"."++a)
			(SSApply (e1,p1) (e2,p2)) -> do
				re1 <- resolveNames (e1,p1) c
				re2 <- resolveNames (e2,p2) c
				return$LApply re1 re2
mAddDefs :: [Char] -> [[Char]] -> [SSDef] -> MLocalLoadContext -> MMayFail MLocalLoadContext
mAddDefs modname revimports defs c = case defs of
	[] -> return c
	(d:r) -> (mAddDef modname revimports d c) >>= mAddDefs modname revimports r


addModuleFile :: ([Char],SPosition) -> [Char] -> [Char] -> MLoadContext -> IO (MMayFail MLoadContext)
addModuleFile caller filename modname c = do
	hasfile <- doesFileExist filename
	if (not hasfile) then (return$MFail ("cannot find "++filename) (fst caller) (snd caller)) else do
		s_mod <- loadModule filename
		case s_mod of
			SFail msg pos -> return$MFail ("parser error: "++msg) filename pos
			SSucc (SSModule imports defs) -> do
				let pimports = if modname=="prelude" then imports else (((SSImport "prelude" SIUnqualified),(0,0)):imports)
				m_c2 <- addImports caller (map (\((SSImport x _),_) ->x) pimports) c
				case m_c2 of
					MFail x y z -> return$MFail x y z
					MSucc c2 -> let revimports = reverse$filter (\((SSImport _ x),_) -> (x == SIUnqualified)) pimports in
						let importnames=(map (\((SSImport x _),_) -> x) revimports) in
						let initlocal=(c2,(Set.fromList [])) in
						return$((mAddDefs modname importnames (map fst defs) initlocal)>>=(return.fst))
addImport :: ([Char],SPosition) -> [Char] -> MLoadContext -> IO (MMayFail MLoadContext)
addImport caller modname c = let
	(MLoadContext loaded curchain)=c in
	if (Set.member modname loaded) then (return$return c) else
		addModuleFile caller (modname++".u") modname c

addImports :: ([Char],SPosition) -> [[Char]] -> MLoadContext -> IO (MMayFail MLoadContext)
addImports caller modnames c = case modnames of
	[] -> return$return c
	(m:r) -> do
		m_c2 <- addImport caller m c
		case m_c2 of
			MFail x y z -> return$MFail x y z
			MSucc c2 -> addImports caller r c2

defaultLoadContext = MLoadContext (Set.fromList defaultBuiltinNames) []
loadMainModule :: [Char] -> MLoadContext -> IO (MMayFail MLoadContext)
loadMainModule filename c = addModuleFile ("main",(0,0)) filename "main" c

assembleChainLExpr :: [([Char],LExpr)] -> LExpr -> LExpr
assembleChainLExpr [] a = a
assembleChainLExpr ((name,e):r) a = assembleChainLExpr r (LApply (LAbs name a) e)


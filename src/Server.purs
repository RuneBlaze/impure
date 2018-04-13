module Server (runServer) where


import Prelude hiding (apply)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Node.Express.App (App, listenHttp, get, use)
import Node.Express.Response (send)
import Node.Express.Types (EXPRESS)
import Node.HTTP (Server)
import Node.Express.Middleware.Static (static)


appSetup :: forall e. App (console :: CONSOLE | e)
appSetup = do
    use $ static "_site"

runServer :: forall e. Eff (express :: EXPRESS, console :: CONSOLE | e) Server
runServer = do
    listenHttp appSetup 8080 \_ ->
        log $ "Listening on " <> show 8080
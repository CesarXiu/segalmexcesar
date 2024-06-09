(ns segalmexcesar.env
  (:require
    [selmer.parser :as parser]
    [clojure.tools.logging :as log]
    [segalmexcesar.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (log/info "\n-=[segalmexcesar started successfully using the development profile]=-"))
   :stop
   (fn []
     (log/info "\n-=[segalmexcesar has shut down successfully]=-"))
   :middleware wrap-dev})

(ns segalmexcesar.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[segalmexcesar started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[segalmexcesar has shut down successfully]=-"))
   :middleware identity})

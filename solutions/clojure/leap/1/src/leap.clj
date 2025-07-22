(ns leap)

(defn % [num op]
  (== (mod num op) 0))

(defn leap-year? [year]
  (cond
    (% year 400) true
    (% year 100) false
    (% year 4)   true
    :else          false))
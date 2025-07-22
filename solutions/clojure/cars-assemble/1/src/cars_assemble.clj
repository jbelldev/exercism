(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (def rate 221)
  (cond (=  speed 0)  (0)
        (<= speed 4)  (100)
        (<= speed 8)  (0.90)
        (<= speed 9)  (0.80)
        (<= speed 10) (0.77)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (* (production-rate speed) 221))

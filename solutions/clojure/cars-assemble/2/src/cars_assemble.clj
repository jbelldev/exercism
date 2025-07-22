(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [rate 221]
    (* speed rate
      (cond (== speed 0)  0.00
            (<= speed 4)  1.00
            (<= speed 8)  0.90
            (<= speed 9)  0.80
            (<= speed 10) 0.77))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60.0)))
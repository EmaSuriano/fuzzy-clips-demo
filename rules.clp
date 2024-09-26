;; Definition of fuzzy variables for temperature
(deftemplate Temperature
  0 40
  ((cold (0 1) (10 0))
   (warm (5 0) (20 1) (30 0))
   (hot (25 0) (40 1) (40 1))))

;; Definition of fuzzy variables for humidity
(deftemplate Humidity
  0 100
  ((low (0 1) (20 0))
   (medium (10 0) (50 1) (90 0))
   (high (70 0) (100 1) (100 1))))

;; Definition of fuzzy variable for fan speed
(deftemplate FanSpeed
  0 100
  ((slow (0 1) (30 0))
   (medium (20 0) (50 1) (80 0))
   (fast (60 0) (100 1) (100 1))))

;; Define rules to control the fan speed based on temperature and humidity
(defrule cool-fan
  (Temperature cold)
  (Humidity low)
  =>
  (assert (FanSpeed slow)))

(defrule moderate-fan
  (Temperature warm)
  (Humidity medium)
  =>
  (assert (FanSpeed medium)))

(defrule hot-humid-fan
  (Temperature hot)
  (Humidity high)
  =>
  (assert (FanSpeed fast)))


# Production rate of cards at each tier
def carsAtTier1: . * 221;
def carsAtTier2: . * 221 * .9;
def carsAtTier3: . * 221 * .8;
def carsAtTier4: . * 221 * .77;

# Task 1: calculate the production rate per hour
def production_rate_per_hour:
  if   . < 5  then carsAtTier1
  elif . < 9  then carsAtTier2
  elif . < 10 then carsAtTier3
  else             carsAtTier4
  end
;

# Task 2: calculate the number of working items produced per minute
def working_items_per_minute:
  # takes the hourly production rate and returns the minute rate
  if   . < 5  then carsAtTier1 / 60 | floor
  elif . < 9  then carsAtTier2 / 60 | floor
  elif . < 10 then carsAtTier3 / 60 | floor
  else             carsAtTier4 / 60 | floor
  end
;

.speed | (production_rate_per_hour, working_items_per_minute)

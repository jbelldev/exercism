# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
  processed = 0;
  if (num % 3 == 0) { printf "Pling"; processed=1; }
  if (num % 5 == 0) { printf "Plang"; processed=1; }
  if (num % 7 == 0) { printf "Plong"; processed=1; }
  if (!processed) printf num;
}

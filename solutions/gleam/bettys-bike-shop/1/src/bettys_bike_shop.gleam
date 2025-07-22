import gleam/int
import gleam/float

pub fn pence_to_pounds(pence: Int) -> Float {
  let pence_float = int.to_float(pence)

  pence_float /. 100.0
}

pub fn pounds_to_pence(pounds: Float) -> Int {
  float.truncate(pounds *. 100.0)
}

pub fn pounds_to_string(pounds: Float) -> String {
  "£" <> float.to_string(pounds)
}

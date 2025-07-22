import gleam/string

pub fn message(log_line: String) -> String {
  log_line
  |> string.crop(before: ": ")
  |> string.drop_left(up_to: 2)
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]"   <> _ -> "error"
    "[WARNING]" <> _ -> "warning"
    "[INFO]"    <> _ -> "info"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}

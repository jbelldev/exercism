import gleam/int.{to_string}

fn sound(input: Int, factor: Int, sound: String) -> String {
  case input % factor == 0 {
    True  -> sound
    False -> ""
  }
}

pub fn convert(number: Int) -> String {
  let result = sound(number, 3, "Pling")
            <> sound(number, 5, "Plang")
            <> sound(number, 7, "Plong")

  case result {
    "" -> number |> to_string
    _  -> result
  }
}

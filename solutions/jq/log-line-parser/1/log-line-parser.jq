def trim: sub("^\\s+"; "") | sub("\\s+$"; "");

def message:   split(":")[1] | trim ;
def log_level: split(":")[0] | trim | .[1:-1] | ascii_downcase ;

def reformat: "\(message) (\(log_level))" ;

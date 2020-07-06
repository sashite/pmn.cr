# Portable Move Notation

A Crystal interface for data serialization in [PMN](https://developer.sashite.com/specs/portable-move-notation) format.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pmn:
       github: sashite/pmn.cr
   ```

2. Run `shards install`

## Usage

Working with PMN can be very simple, for example:

```crystal
require "pmn"

# Emit a PMN string

some_moves = [
  [52, 36, "♙", nil],
  [12, 28, "♟", nil],
  [53, 37, "♙", nil]
]

PMN.dump(*some_moves) # => "52,36,♙.12,28,♟.53,37,♙"

# Parse a PMN string

PMN.parse("52,36,♙.12,28,♟.53,37,♙") # => [[52, 36, "♙", nil], [12, 28, "♟", nil], [53, 37, "♙", nil]]
```

## Examples

```crystal
# Black castles on king-side

PMN.dump([60, 62, "♔", nil, 63, 61, "♖", nil]) # => "60,62,♔;63,61,♖"
PMN.parse("60,62,♔;63,61,♖") # => [[60, 62, "♔", nil, 63, 61, "♖", nil]]

# Promoting a chess pawn into a knight

PMN.dump([12, 4, "♘", nil]) # => "12,4,♘"
PMN.parse("12,4,♘") # => [[12, 4, "♘", nil]]

# Capturing a rook and promoting a shogi pawn

PMN.dump([33, 24, "+P", "R"]) # => "33,24,+P,R"
PMN.parse("33,24,+P,R") # => [[33, 24, "+P", "R"]]

# Dropping a shogi pawn

PMN.dump([nil, 42, "P", nil]) # => "*,42,P"
PMN.parse("*,42,P") # => [[nil, 42, "P", nil]]

# Capturing a white chess pawn en passant

PMN.dump([48, 32, "♙", nil], [33, 32, "♟", nil, 32, 40, "♟", nil]) # => "48,32,♙.33,32,♟;32,40,♟"
PMN.parse('48,32,♙.33,32,♟;32,40,♟') # => [[48, 32, "♙", nil], [33, 32, "♟", nil, 32, 40, "♟", nil]]
```

## License

This library is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## About Sashite

This library is maintained by [Sashite](https://sashite.com/).

With some [lines of code](https://github.com/sashite/), let's share the beauty of Chinese, Japanese and Western cultures through the game of chess!

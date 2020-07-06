# The PMN (Portable Move Notation) module
module PMN
  VERSION = "0.1.0"

  def self.dump(*moves)
    Dumper.call(*moves)
  end

  def self.parse(string : String)
    Parser.call(string)
  end
end

require "./pmn/dumper"
require "./pmn/parser"

require "./move"

module PMN
  # Dumper class
  class Dumper < Move
    def self.call(*moves)
      moves.map do |move|
        actions = move.each_slice(4)
        actions.map do |action_items|
          new(
            action_items[0].as(Int32 | Nil),
            action_items[1].as(Int32),
            action_items[2].as(String),
            action_items[3].as(String | Nil)
          ).call
        end.join(action_separator)
      end.join(separator)
    end

    @src_square : String
    @dst_square : String
    @piece_name : String
    @piece_hand : String | Nil

    getter :src_square, :dst_square, :piece_name, :piece_hand

    def initialize(src_square : Int32 | Nil, dst_square : Int32, piece_name : String, piece_hand : String | Nil = nil)
      @src_square = src_square.nil? ? drop_char : src_square.to_s
      @dst_square = dst_square.to_s
      @piece_name = piece_name
      @piece_hand = piece_hand
    end

    def call
      action_items.join(separator)
    end

    private def action_items
      return {src_square, dst_square, piece_name} if piece_hand.nil?

      {src_square, dst_square, piece_name, piece_hand}
    end
  end
end

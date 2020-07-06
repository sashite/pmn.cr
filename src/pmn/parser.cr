require "./move"

module PMN
  # Parser class
  class Parser < Move
    def self.call(string : String)
      string.split(separator)
            .map { |serialized_move| new(serialized_move).call }
    end

    @serialized_actions : Array(String)

    getter :serialized_actions

    def initialize(serialized_move : String)
      @serialized_actions = serialized_move.split(self.class.action_separator)
    end

    def call
      serialized_actions.flat_map do |string|
        items = string.split(',')
        items << "" if items.size == 3
        action_items(*Tuple(String, String, String, String).from(items))
      end
    end

    private def action_items(src_square : String, dst_square : String, piece_name : String, piece_hand : String)
      src_square = src_square == drop_char ? nil : src_square.to_i
      dst_square = dst_square.to_i
      piece_hand = nil if piece_hand.empty?

      [src_square, dst_square, piece_name, piece_hand]
    end
  end
end

module PMN
  # Move class
  class Move
    private def self.separator
      '.'
    end

    protected def self.action_separator
      ';'
    end

    private def separator
      ','
    end

    private def drop_char
      "*"
    end
  end
end

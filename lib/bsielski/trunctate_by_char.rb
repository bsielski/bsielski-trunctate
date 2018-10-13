module BSielski
  class TrunctateByChar
    def initialize(limit:, suffix:)
      @limit, @suffix = limit, suffix
    end
    def call(string)
      raise "no options" unless @limit
      return string unless @limit < string.length
      "#{string[0...@limit]}#{@suffix}"
    end
  end
end

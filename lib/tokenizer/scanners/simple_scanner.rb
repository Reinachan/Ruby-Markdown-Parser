# frozen_string_literal: true

require_relative '../tokens/token'

class SimpleScanner
  TOKEN_TYPES = {
    '_' => 'UNDERSCORE',
    '*' => 'STAR',
    "\n" => 'NEWLINE',
    '#' => 'HASH'
  }.freeze

  def self.from_string(plain_markdown)
    char = plain_markdown[0]
    Token.new(type: TOKEN_TYPES[char], value: char)
  rescue InvalidTokenError
    Token.null
  end
end

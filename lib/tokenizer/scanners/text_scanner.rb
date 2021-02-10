# frozen_string_literal: true

require_relative 'simple_scanner'

class TextScanner
  def self.from_string(plain_markdown)
    text = plain_markdown
           .each_char
           .take_while { |char| SimpleScanner.from_string(char).null? }
           .join('')
    Token.new(type: 'TEXT', value: text)
  rescue InvalidtokenError
    Token.null
  end
end

# frozen_string_literal: true

require_relative 'base_parser'

class ItalicParser < BaseParser
  def match(tokens)
    return Node.null unless tokens.peek_or(%w[UNDERSCORE TEXT UNDERSCORE], %w[STAR TEXT STAR])

    Node.new(type: 'ITALIC', value: tokens.second.value, consumed: 3)
  end
end

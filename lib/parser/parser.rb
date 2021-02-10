# frozen_string_literal: true

require_relative 'parsers/base_parser'

class Parser
  def parse(tokens)
    body = body_parser.match(tokens)
    raise "Syntax error: #{tokens[body.consumed]}" unless tokens.count == body.consumed

    body
  end

  private

  def body_parser
    @body_parser ||= ParserFactory.build(:body_parser)
  end
end

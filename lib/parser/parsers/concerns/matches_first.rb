# frozen_string_literal: true

module MatchesFirst
  def match_first(tokens, *parsers)
    parsers.each do |parser|
      node = parser.match(tokens)
      return node if node.present?
    end
    Node.null
  end
end

# frozen_string_literal: true

module MatchesStar
  def match_star(tokens, with:)
    matched_nodes = []
    consumed      = 0
    parser        = with

    loop do
      node = parser.match(tokens.offset(consumed))
      break if node.null?

      matched_nodes += [node]
      consumed      += node.consumed
    end

    [matched_nodes, consumed]
  end
end

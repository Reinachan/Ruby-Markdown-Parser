# frozen_string_literal: true

require_relative 'elements/bold_visitor'
require_relative 'elements/italic_visitor'
require_relative 'elements/text_visitor'

class SentenceVisitor
  SENTENCE_VISITOR = {
    'BOLD' => BoldVisitor,
    'ITALIC' => ItalicVisitor,
    'TEXT' => TextVisitor
  }.freeze

  def visit(node)
    visitor_for(node).visit(node)
  end

  private

  def visitor_for(node)
    SENTENCE_VISITORS.fetch(node.type) { raise 'Invalid sentence node type' }.new
  end
end

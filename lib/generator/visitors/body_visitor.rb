# frozen_string_literal: true

require_relative 'sentence_visitor'

class BodyVisitor
  def visit(body_node)
    body_node.paragraphs.map do |paragraph|
      paragraph_visitor.visit(paragraph)
    end.join
  end

  private

  def paragraph_visitor
    @paragraph_visitor ||= ParagraphVisitor.new
  end
end

# frozen_string_literal: true

class ItalicVisitor
  def visit(node)
    "<i>#{node.value}</i>"
  end
end

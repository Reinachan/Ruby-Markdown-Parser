# frozen_string_literal: true

class BoldVisitor
  def visit(node)
    "<b>#{node.value}</b>"
  end
end

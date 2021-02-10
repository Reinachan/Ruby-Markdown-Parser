# frozen_string_literal: true

class NullToken
  def null?
    true
  end

  def present?
    false
  end
end

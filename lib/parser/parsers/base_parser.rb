# frozen_string_literal: true

require_relative 'parser_factory'

class BaseParser
  private

  def method_missing(name, *args, &block)
    raise ArgumentError, "Method #{name} does not exist." unless name.to_s.end_with?('_parser')

    ParserFactory.build(name, *args, &block)
  end
end

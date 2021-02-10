# frozen_string_literal: true

require_relative 'generator/generator'

class Markdown
  def self.to_html(input)
    @generator.generate(@parser.parse(@tokenizer.tokenize(input)))
  end
end

# frozen_string_literal: true

require_relative 'tokens/token'
require_relative 'scanners/simple_scanner'
require_relative 'scanners/text_scanner'

class Tokenizer
  TOKEN_SCANNER = [
    SimpleScanner,  # Looks for simple tokens like * or _
    TextScanner     # looks for everything except the above
  ].freeze

  def tokenize(plain_markdown)
    tokens_array = tokens_as_array(plain_markdown)
    TokenList.new(tokens_array)
  end

  private

  def tokens_as_array(plain_markdown)
    if plain_markdown.nil? || plain_markdown == ''
      [Token.end_of_file]
    else
      token = scan_one_token(plain_markdown)
      [token] + tokens_as_array(plain_markdown[token.length..-1])
    end
  end

  def scan_one_token(plain_markdown)
    TOKEN_SCANNERS.each do |scanner|
      token = scanner.from_string(plain_markdown)
      return token unless token.null?
    end
    raise "Scanners couldn't match the given input: #{plain_markdown}"
  end
end

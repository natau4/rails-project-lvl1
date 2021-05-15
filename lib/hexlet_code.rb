# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  class Tag
    def build(tag, attrs = {})
      attrs = attrs.reduce("") { |acc, (key, value)| acc + " #{key}=\"#{value}\"" }

      return "<#{tag}#{attrs}>" unless block_given?

      "<#{tag}#{attrs}>#{yield}</#{tag}>"
    end
  end
end

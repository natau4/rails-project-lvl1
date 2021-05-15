# frozen_string_literal: true

module HexletCode
  class Tag
    def build(tag, attrs = {})
      attrs = attrs.reduce("") { |acc, (key, value)| acc + " #{key}=\"#{value}\"" }

      return "<#{tag}#{attrs}>" unless block_given?

      "<#{tag}#{attrs}>#{yield}</#{tag}>"
    end
  end
end

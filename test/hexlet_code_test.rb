# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def setup
    @tag = HexletCode::Tag.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build_simple_tag
    assert_equal "<br>", @tag.build("br")
  end

  def test_build_tag_with_attrs
    assert_equal '<img src="path/to/image">', @tag.build("img", src: "path/to/image")
    assert_equal '<input type="submit" value="Save">', @tag.build("input", type: "submit", value: "Save")
  end

  def test_build_paired_tag
    assert_equal "<label>Email</label>", @tag.build("label") { "Email" }
    assert_equal '<label for="email">Email</label>', @tag.build("label", for: "email") { "Email" }
  end
end

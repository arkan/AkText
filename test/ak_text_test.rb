require 'test_helper'
require "ak_text"

class AkTextTest < ActiveSupport::TestCase
  test "Basic tests" do
	assert String.levenshtein("test", "test") == 0
	assert String.levenshtein("test", "test1") == 1
	assert String.levenshtein("", "") == 0
	assert String.levenshtein("test", "") == 4
	assert String.levenshtein("", "test1") == 5
	assert String.levenshtein("test", "abcdef") == 6
	assert "test".levenshtein_with("zba") == 4
	assert "".levenshtein_with("zba") == 4
	assert "test".levenshtein_with("") == 4
  end
end

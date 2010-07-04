require 'test_helper'
require "ak_text"

class AkTextTest < ActiveSupport::TestCase
  test "test_10" do
	assert String.levenshtein("test", "test") == 0
  end
  
  test "test_20" do
	assert String.levenshtein("test", "test1") == 1
  end
  
  test "test_21" do
	assert String.levenshtein("", "") == 0
  end
  
  test "test_22" do
	assert String.levenshtein("test", "") == 4
  end
  
  test "test_23" do
	assert String.levenshtein("", "test1") == 5
  end
  
  test "test_30" do
	assert String.levenshtein("test", "abcdef") == 6
  end
  
  test "test_40" do
	assert "test".levenshtein_with("zba") == 4
  end
  
  test "test_50" do
	assert "".levenshtein_with("zba") == 3
  end
  
  test "test_60" do
	assert "test".levenshtein_with("") == 4
  end
end

require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "title should exist" do
  	@submission.title = "     "
  	assert_not @submission.valid?
  end
  
  test "comment should exist" do
  	@submission.comment = "     "
  	assert_not @submission.valid?
  end

  test "URL should exist" do
  	@submission.URL = "     "
  	assert_not @submission.valid?
  end

  test "title should not be too long" do
    @submission.title = "a" * 143
    assert_not @submission.title?
  end

end

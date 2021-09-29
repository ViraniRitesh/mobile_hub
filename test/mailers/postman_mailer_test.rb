require 'test_helper'

class PostmanMailerTest < ActionMailer::TestCase
  test "purchase_complete" do
    mail = PostmanMailer.purchase_complete
    assert_equal "Purchase complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

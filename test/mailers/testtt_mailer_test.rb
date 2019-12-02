require 'test_helper'

class TestttMailerTest < ActionMailer::TestCase
  test "foo" do
    mail = TestttMailer.foo
    assert_equal "Foo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "bar" do
    mail = TestttMailer.bar
    assert_equal "Bar", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

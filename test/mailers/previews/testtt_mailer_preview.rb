# Preview all emails at http://localhost:3000/rails/mailers/testtt_mailer
class TestttMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/testtt_mailer/foo
  def foo
    TestttMailer.foo
  end

  # Preview this email at http://localhost:3000/rails/mailers/testtt_mailer/bar
  def bar
    TestttMailer.bar
  end

end

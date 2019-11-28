class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def invitation
    # TODO

  end

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Kokoon!')
    # This will render a view in `app/views/user_mailer`!


    @greeting = "Welcome to your new Kokoon!"

    mail to: "sj34606@gmail.com"
  end

  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'admin@kokoon.space',
      :from => 'sender@example.org',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

end

UserMailer.with(user: User.first).welcome

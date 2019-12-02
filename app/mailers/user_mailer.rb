class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def invitation
    # TODO
   # landlord selects tenant for rental
   # landlord enters tenant email in add tenant to flat form
   # tenent receives initation email to platform with link to signup page
  @user = params[:user]
  mail(to: @user.email, subject: 'Please accept your new rental invitation!')

  # mail to: "sj34606@gmail.com"

  end

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Kokoon!')
    # # This will render a view in `app/views/user_mailer`!


    @greeting = "Welcome to your new Kokoon!"

    # mail to: "sj34606@gmail.com"
  end

  # def hello
  #   @user = params[:user]
  #   mail(
  #     :subject => 'Hello from Sendgrid',
  #     :to  => 'admin@kokoon.space',
  #     :html_body => '<strong>Hello</strong> dear Postmark user.',
  #     :track_opens => 'true')
  # end

end


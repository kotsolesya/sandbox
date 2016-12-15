class UserNotifierMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to ToDo List')
  end

  def send_invite(to, user)
    @user = user
    @url  = 'http://localhost:3000/signup'
    mail(to: to, subject: 'Invite you to create new account')
  end

  def share_email(user, couser)
    @user = user
    @cuser = couser
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Share list for your')
  end
end

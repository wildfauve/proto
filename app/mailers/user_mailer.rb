class UserMailer < ActionMailer::Base
  default from: "wild.fauve@gmail.com"
  
  def welcome_email(member)
    @user = member
    @url  = member_registers_path(@user, :host => "http://example.com" )
    mail(:to => @user.email, :subject => "Come and Register at Loyalty")
  end
end

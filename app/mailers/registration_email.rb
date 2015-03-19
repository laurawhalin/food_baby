class RegistrationEmail < ActionMailer::Base
  def send_welcome_email(email, name)
    mail(
      to: email,
      from: "laurawhalin@gmail.com",
      subject: 'testing send mail',
      body: "Hello #{name}! You are registered for Food Baby!"
      )
  end
end

class ReportMailer < ActionMailer::Base
  def daily_new_users_report(users)
    @users = users
    mail(
    to: "laurawhalin@gmail.com",
    from: "laurawhalin@gmail.com",
    subject: "New Users Report for #{Time.now.to_date}"
    )
  end
end

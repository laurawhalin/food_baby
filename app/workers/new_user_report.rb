class NewUserReport < ActiveJob::Base
  def perform()
    users = User.where("created_at > ?", 24.hours.ago)
    ReportMailer.daily_new_users_report(users).deliver_now
  end
end

class SendLoginEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user

    puts "✅ Sending login email to #{user.email}"

    UserMailer.login_notification(user).deliver_now
  end
end

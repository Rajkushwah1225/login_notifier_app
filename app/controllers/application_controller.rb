class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    # Add this line to trigger mailer on login
    UserMailer.login_notification(resource).deliver_now
    # Optional: debug log
    Rails.logger.info "Email sent to #{resource.email} after login"
    # Redirect to homepage or wherever needed
    flash[:notice] = "Email sent successfully to #{resource.email}"

    root_path
  end
end


# def after_sign_in_path_for(resource)
#   UserMailer.login_notification(resource).deliver_now  # or deliver_later
#   root_path
# end

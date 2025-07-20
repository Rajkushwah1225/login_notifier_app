class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def after_database_authentication
    SendLoginEmailJob.perform_later(self.id)
  end
end

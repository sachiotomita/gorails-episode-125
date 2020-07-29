class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  # belongs_to :notifiable, polymorphic: true

  attr_accessor :message

  # after_commit ->{ NotificationRelayJob.perform_later(self) }


  # def as_json(options)
  #   super(options).merge(message: data['message'],  posted_at: ActionController::Base.helpers.time_ago_in_words(self.created_at))
  # end
end

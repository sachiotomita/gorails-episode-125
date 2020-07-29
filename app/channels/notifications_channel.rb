# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def sendMsg(data)

    # binding.pry
    recipient_id = User.find(User.pluck(:id).sample).id #User.first.id
    sender_id = User.find(User.pluck(:id).sample).id
    # byebug
    notification = Notification.create!(recipient_id: recipient_id, user_id: sender_id, action: "followed", message: data['message'], notifiable_type: User.name, notifiable_id: recipient_id)
    # byebug
    # hash = notification.attributes.to_hash.merge({message: data['message']})
    NotificationRelayJob.perform_later(notification)
  end
end

class GlobalRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'global_room'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

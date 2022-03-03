class CableChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    cable = Cable.find(params[:id])
    stream_for cable
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

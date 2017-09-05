class StoryChannel < ApplicationCable::Channel
  def subscribed
     stream_from "story_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

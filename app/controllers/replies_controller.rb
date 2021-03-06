class RepliesController < ApplicationController

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @user = current_user
    @replies = @tweet.replies
    @reply = Reply.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
    count_replies(@tweet)
    redirect_back(fallback_location: tweet_replies_path)
  end

  def count_replies(tweet)
    tweet.replies_count = tweet.replies.size
    tweet.save
  end

  private

  def reply_params
    params.require(:reply).permit(:comment)
  end
end

class Admin::TweetsController < Admin::BaseController

  def index
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_root_path
    flash[:alert] = "tweet was deleted!"
  end
end

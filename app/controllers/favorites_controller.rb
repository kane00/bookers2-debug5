class FavoritesController < ApplicationController

	#index,newアクションは作成必要ない
	  def create
	    current_user.follow(params[:user_id])
	    # リダイレクト先を同じページにする(更新のような形)
	    redirect_to request.referer
	  end
	  
	  def destroy
	    current_user.unfollow(params[:user_id])
	    # リダイレクト先を同じページにする(更新のような形)
	    redirect_back(fallback_location: root_path)
	  end

	  def follower
	    user = User.find(params[:user_id])
	    @users = user.following_user
	  end

	  def followed
	    user = User.find(params[:user_id])
	    @users = user.follower_user
	  end
end

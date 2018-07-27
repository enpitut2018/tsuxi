class JoinsController < ApplicationController

  def create
    user=current_user
    community=Community.find(params[:community_id])
    if Join.create(user_id: user.id,community_id:community.id)
      redirect_to community
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_user
    community=Community.find(params[:community_id])
    if join=Join.find_by(user_id: user.id,community_id:community.id)
      join.delete
      redirect_to current_user
    else
      redirect_to root_url
    end
  end
end

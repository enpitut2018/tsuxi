class JoinsController < ApplicationController

  def create
    user=current_user
    community=Community.find(params[:community_id])
    if Join.where(community_id: params[:community_id]).count >= 1
      flash[:notice] = "#{community.name}に参加できません"
      redirect_to communities_path
      # elsif User.where(sex: params[:sex]) == '女'
      # flash[:alert] = "あなたは女性なので参加できません"
      # redirect_to communities_path
    elsif Join.create(user_id: user.id,community_id:community.id)
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

class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    account = Account.find(params[:account_id])
    current_user.following << account
    redirect_to account, notice: 'You are now following this account.'
  end

  def destroy
    account = Account.find(params[:account_id])
    current_user.following.delete(account)
    redirect_to account, notice: 'You have unfollowed this account.'
  end
end

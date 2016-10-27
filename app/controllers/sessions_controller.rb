class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    return redirect to root_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid])
    if @user.nil?
      @user = User.build_from_github(auth_hash)
      flash[:notice] = "Unable to save the Merchant"
      return redirect_to root_path unless @user.save
    end

    #Save the merchant ID in the session
    session[:user_id] = @user.id.to_i
    redirect_to user_path(@user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

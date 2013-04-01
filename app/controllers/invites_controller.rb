class InvitesController < ApplicationController

  def index
    @invitation = Invity::Facebook::API.new( current_user[:oauth_token] )
    @friends = @invitation.friends_with_pics

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def new
    user_id = current_user[:uid]
    friends = params[:ids].split(',')

    Invity::Facebook::Message.new(
      access_token: current_user[:oauth_token],
      sender: user_id,
      recievers: friends,
      subject: 'This is subject',
      body: "my message"
    ).deliver

    redirect_to invites_path
  end

end

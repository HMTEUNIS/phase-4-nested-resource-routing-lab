class UsersController < ApplicationController
  
  def show
    user = User.find_by(id: params[:id])
    if user
    render json: user, include: :items
    else 
      render json: "user not found", status: :not_found
    end
  end

end

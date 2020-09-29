class HomesController < ApplicationController
  def top
    current_user
    @candigroup=nil
    if params[:search_key]
      @candigroup = Group.where('name LIKE ?', "%#{params[:search_key]}%")
    else
      @candigroup = 0
    end
  end

end

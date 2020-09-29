class GroupsController < ApplicationController
  #before_action :require_register,only: [:show]
 
  def new
    @group = Group.new
  end

  
  def show
    current_user
    session[:nowgroup]=params[:group_id]
    @messages = Message.all
    @params_group = params[:group_id].to_i
    
  end
  def created
    current_user
   set_group
  end
  def participate
    group_user = GroupUser.new
    group_user.group_id = params[:group_id]
    group_user.user_id = params[:user_id]
    group_user.save
  end
  
  def create
    current_user
    @group = Group.new(group_params)
        
    respond_to do |format|
      if @group.save
        @group.users << @current_user
        format.html { redirect_to "/created?id=#{@group.id}", notice: 'Group was successfully created.' }
        format.json { render :created, status: :created, location: @group }
      else
       format.html { render :new }
       format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name)
  end

  def require_register
    if params[:group_id]!=nil then
    @group = Group.find(params[:group_id])  
    @userlists = @group.userlists
    mode=0

    @userlists.each do |userlist|
      
      if userlist.user_id==session[:user_id] then
        mode=1;
      end

    end 

    if mode==0 then
      redirect_to group_url
    end
  end
  end
end

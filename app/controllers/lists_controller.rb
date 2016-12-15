class ListsController < ApplicationController
  before_action :authorize
  before_action :set_list, only: [:update, :edit, :destroy]

  def index
    @lists = current_user.olists
    @share_list = current_user.lists.where.not(owner_id: current_user.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.create(owner_id: current_user.id, title: params[:list][:title])
    if @list.save
      redirect_to lists_path
    else
      render(:new)
    end
  end

  def update
    #  @list = current_user.lists.find(params[:id])
    @list.update(list_params)
  end

  def edit
    #  @list = current_user.lists.find(params[:id])
  end

  def destroy
    #  @list = current_user.lists.find(params[:id])
    @list.destroy
  end

  def share
    if params[:_method] == 'patch'
      @email = params[:email]
      @user = User.find_by(email: @email)
      if @user
        @list = List.find(params[:id])
        @user.lists << @list
        UserNotifierMailer.share_email(@user, current_user).deliver_now
        redirect_to lists_path
      else
        UserNotifierMailer.send_invite(@email, current_user).deliver_now
        redirect_to share_list_path, notice: 'Registration invite has been sent'
      end
    else
      @clist = List.find(params[:id])
    end
  end

  private

  def list_params
    params.fetch(:list).permit(:title, :id_user)
  end

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def lists
    @lists ||= current_user.lists.all
  end

  helper_method :lists
end

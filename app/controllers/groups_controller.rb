class GroupsController < ApplicationController
  # before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @entities = @group.entities
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  # def edit
  # end

  # POST /groups
  # POST /groups.json
  def create
    @name = group_params[:name]
    @author = current_user
    @group = Group.new(name: @name, author_id: @author.id)
    @group.icon.attach(params[:group][:icon])
    
    if @group.save
      redirect_to @group, success: 'Category was successfully created.'
    else
      render :new, error: 'Category was not created.'
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  # def update
  #   respond_to do |format|
  #     if @group.update(group_params)
  #       format.html { redirect_to @group, notice: 'Group was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @group }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /groups/1
  # DELETE /groups/1.json
  # def destroy
  #   @group.destroy
  #   respond_to do |format|
  #     format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private 

  def group_params
    params.require(:group).permit(:name, :user_id,:icon)
  end

end
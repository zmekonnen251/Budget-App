class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.group_id = params[:group_id]
    @entity.author_id = current_user.id
    @entity.save

    if @entity.save
      redirect_to group_path(@entity.group_id), success: 'Transaction was successfully created.'
    else
      render 'new', error: 'Transaction was not created.'
    end
  end

  # def edit
  #   @entity = Entity.find(params[:id])
  # end

  # def update
  #   @entity = Entity.find(params[:id])
  #   @entity.update(entity_params)
  #   redirect_to group_path(@entity.group_id)
  # end

  # def destroy
  #   @entity = Entity.find(params[:id])
  #   @entity.destroy
  #   redirect_to group_path(@entity.group_id)
  # end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end

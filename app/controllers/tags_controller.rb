class TagsController < ApplicationController
	before_action :set_tag, only: %i[edit show update]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit; end

  def show; end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: 'Tag Successfully Created!'
    else
      flash.now[:alert] = @tag.errors.full_messages
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: 'Tag Successfully Updated!'
    else
      flash.now[:alert] = @tag.errors.full_messages
      render :edit
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end

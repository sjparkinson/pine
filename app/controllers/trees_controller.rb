# frozen_string_literal: true

class TreesController < ApplicationController
  before_action :set_tree, only: %i[show edit update destroy destroy_attachment]
  before_action :can_edit, only: %i[edit destroy destroy_attachment]

  def index
    @trees = Tree.includes(:user).all.order(updated_at: :desc)

    fresh_when last_modified: @trees.maximum(:updated_at).utc, etag: @trees unless @trees.empty?
  end

  def show
    fresh_when last_modified: @tree.updated_at.utc, etag: @tree
  end

  def new
    @tree = Tree.new
  end

  def edit
    fresh_when last_modified: @tree.updated_at.utc, etag: @tree
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user

    if @tree.save
      redirect_to @tree, notice: "#{@tree.common_name} was successfully added."
    else
      render :new
    end
  end

  def update
    if @tree.update(tree_params)
      redirect_to @tree, notice: "#{@tree.common_name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @tree.destroy
      redirect_to trees_url, notice: "#{@tree.common_name} was successfully removed."
    else
      redirect_to trees_url, alert: "#{@tree.common_name} couldn't be removed."
    end
  end

  def destroy_attachment
    @attachment = @tree.images.find(params[:image_id])

    @attachment.purge_later

    redirect_to @tree, notice: "#{@attachment.filename} was successfully removed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tree
    @tree = Tree.with_attached_images.find(params[:id])
  end

  # Only the owner can edit and remove their tree.
  def can_edit
    redirect_to @tree unless @tree.can_edit? current_user
  end

  # Only allow a list of trusted parameters through.
  def tree_params
    params.require(:tree).permit(:common_name, :scientific_name, :content, :fact, :openstreetmap_node, images: [])
  end
end

# frozen_string_literal: true

class TreesController < ApplicationController
  skip_before_action :authorized, only: %i[index show]
  before_action :set_tree, only: %i[show edit update destroy destroy_attachment]
  before_action :can_edit, only: %i[edit update destroy destroy_attachment]

  def index
    @trees = Tree.includes(:user).all.order(updated_at: :desc)

    fresh_when @trees
  end

  def show
    tree_slug = @tree.common_name.parameterize

    if params[:slug] != tree_slug
      redirect_to tree_with_slug_path(tree_slug, @tree)
    end

    fresh_when @tree
  end

  def new
    @tree = Tree.new
  end

  def edit
    fresh_when @tree
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user

    if @tree.save
      redirect_to @tree, notice: t('.success', tree: @tree.common_name)
    else
      render :new
    end
  end

  def update
    if @tree.update(tree_params)
      redirect_to @tree, notice: t('.success', tree: @tree.common_name)
    else
      render :edit
    end
  end

  def destroy
    if @tree.destroy
      redirect_to trees_url, notice: t('.success', tree: @tree.common_name)
    else
      redirect_to trees_url, alert: t('.failure', tree: @tree.common_name)
    end
  end

  def destroy_attachment
    @attachment = @tree.images.find(params[:image_id])

    @attachment.purge_later

    redirect_to @tree, notice: t('.success')
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
    params.require(:tree).permit(:common_name, :scientific_name, :content, :fact, images: [])
  end
end

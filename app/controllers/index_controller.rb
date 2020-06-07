class IndexController < ApplicationController
  skip_before_action :authorized

  def index
    @tree_count = Tree.all.size

    @featured_tree = Tree.offset(rand(@tree_count)).first
  end
end

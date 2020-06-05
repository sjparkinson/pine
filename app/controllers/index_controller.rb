class IndexController < ApplicationController
  skip_before_action :authorized

  def index
    @tree_count = Tree.all.size
  end
end

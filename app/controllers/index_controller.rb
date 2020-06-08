class IndexController < ApplicationController
  skip_before_action :authorized

  def index
    @tree_count = Tree.all.size

    @fact = Tree.select(:fact).where.not(fact: nil).order(Arel.sql('RANDOM()')).first.fact
  end
end

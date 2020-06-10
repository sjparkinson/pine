class IndexController < ApplicationController
  skip_before_action :authorized

  def index
    @tree_count = Tree.all.size

    @fact = Tree.select(:fact).where.not(fact: nil).order(Arel.sql('RANDOM()')).first&.fact
  end

  def error
    status_code = params[:code] || 500
    render status_code.to_s, status: status_code
  end

  def healthz
    head :ok
  end
end

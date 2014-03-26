class HomeController < ApplicationController

  def index
  end

  def test
    raise params.inspect
  end

end
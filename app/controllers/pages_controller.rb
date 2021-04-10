class PagesController < ApplicationController
  def home
    @game = Game.first
  end
end

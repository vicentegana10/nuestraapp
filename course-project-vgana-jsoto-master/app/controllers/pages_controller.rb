class PagesController < ApplicationController
  def home
    @lodgings = Lodging.all.sample(10)
  end
end

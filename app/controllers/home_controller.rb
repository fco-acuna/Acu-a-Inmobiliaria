class HomeController < ApplicationController
  def main
    @properties = Property.all
  end
end

class PagesController < ApplicationController
  def home
    @package = Package.all
  end
end

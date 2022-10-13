# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @package = Package.all
  end
end

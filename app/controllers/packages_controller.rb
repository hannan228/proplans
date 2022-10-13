# frozen_string_literal: true

class PackagesController < ApplicationController
  def index
    @package = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @user = @current_user
    @package = @user.packages.build(set_params)
    if @package.save
      flash[:notice] = 'Bug was created successfully.'
      redirect_to package_path(@package)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def delete; end

  def set_package; end

  private

  def set_params
    params.require(:package).permit(:name, :price, :detail, :description, :validity, :subscription_code, :area)
  end
end

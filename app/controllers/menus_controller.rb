class MenusController < ApplicationController
  before_action :admin_user, only: [:new, :create]
	
  def new
    @menus = Menu.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  	def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @menu = restaurant.menus.create(menu_params)
    if @menu.save
      redirect_to restaurant
      flash[:success] = "New item added!"
    else
      render 'new'
    end
  end
  
  def destroy
    Menu.find(params[:id]).destroy
    flash[:success] = "Menu Item deleted"
    redirect_to :back
  end

private

    def menu_params
      params.require(:menu).permit(:name, :price, :picture)
    end

end
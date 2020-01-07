class RestaurantsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, 
                                        :new]
   before_action :admin_user,     only: [:edit, :destroy]
	

	def index
		@restaurants = Restaurant.all
    if params[:search]
    @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
  else
    @restaurants = Restaurant.all.order('created_at DESC')
  end
end
	 
   def show
    @restaurant = Restaurant.find(params[:id])
     @menus = @restaurant.menus.paginate(page: params[:page])
   end
  

   def new
    @restaurant = Restaurant.new
   end

   def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant created!"
      redirect_to restaurants_path
    else
      render 'static_pages/home'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Restaurant updated"
      redirect_to restaurants_path
    else
      render 'edit'
    end
end

  def destroy
    @restaurant = Restaurant.find(params[:id ])
    @restaurant.destroy
    flash[:success] = "Restaurant deleted!"
    redirect_to restaurants_path
  end

   # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless !current_user?(@user) && current_user.admin?
    end


private

    def restaurant_params
      params.require(:restaurant).permit(:name, :picture, :owner)
    end


    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
   end   
end

 


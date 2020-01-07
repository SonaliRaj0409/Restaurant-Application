class OrderController < ApplicationController

   def create
    @order = Order.new(params[:order])
    @user = User.new(@order.user_id)
      if @order.save
      OrderMailer.order_send(@order, @user).deliver
      redirect_to @user, notice: "Order Completed Successfully."
    else
      render :new
    end
  end 

  def add
  	id = params[:id]
  	  if session[:order] then
  	  	order = session[:order]
  	  else
  	  	session[:order] ={}
  	  	order = session[:order]
  	  end

  	  if order[id] then
  	  	order[id] = order[id] + 1
  	  else
  	  	order[id] = 1
  	  end
  	  redirect_to :back, notice: "The Item Is Added You Can Check Your Order, By Going To The Order At The Header"
  end

  def clearorder
	  session[:order] = nil
	  redirect_to :action => :index
	end

  def index
  	  if session[:order] then
  	   	 @order = session[:order]
  	  else
  	   	 @order = {}
      end
  end

  def checkout
      if session[:order] then
         OrderMailer.order_send(@order, @user).deliver
         @order = session[:order]
      else
         @order = {}
      end
    end
 end


 




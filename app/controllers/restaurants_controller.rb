class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		if current_user
			@reservation = @restaurant.reservations.build
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	
	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path 
		
		else 
			render :new
		end
	end


	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant

		else 
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

private
		def restaurant_params
		params.require(:restaurant).permit(:name, :address, :phone, :capacity, :menu)
		end
end

    
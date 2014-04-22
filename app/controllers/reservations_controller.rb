class ReservationsController < ApplicationController
  before_filter :load_restaurant
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to restaurants_path, notice: "Reservation created successfully"

    else
      redirect_to restaurants_path, notice: "Reservation not created"
      # render :controller => :restaurants, :action => :show, :alert => "No Reservation Created"
      
    end
  end

  # def edit
  # end

  def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
  end

private
  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size, :party_time)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end

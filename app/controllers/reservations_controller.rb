class ReservationsController < ApplicationController

  def index
    @reservations = Reservations.all
  end

  def create
    @reservation = Reservations.new(reservation_params)
    if @reservation.save
      redirect_to root_path(submitted: true)
    else
      @tickets_available = [8, (Reservations::TICKET_LIMIT - Reservations.sum(:tickets))].min
      redirect_to root_path(errors: true, anchor: "form")
    end
  end

  def destroy
    Reservations.find(params[:id]).destroy
    redirect_to reservations_path
  end

  private

    def reservation_params
      params.require(:reservations).permit(:email, :name, :tickets)
    end

end

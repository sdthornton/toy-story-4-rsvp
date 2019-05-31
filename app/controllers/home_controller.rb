class HomeController < ApplicationController

  def index
    tickets_sum = Reservations.sum(:tickets)
    @reservation = Reservations.new
    @is_submitted = params[:submitted] == "true"
    @has_errors = params[:errors] == "true"
    @is_full = tickets_sum >= Reservations::TICKET_LIMIT
    @tickets_available = [8, (Reservations::TICKET_LIMIT - tickets_sum)].min
  end

end

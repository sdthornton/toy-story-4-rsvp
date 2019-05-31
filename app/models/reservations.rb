class Reservations < ActiveRecord::Base

  TICKET_LIMIT = 40

  validates :email, :name, :tickets, presence: true
  validates :email, uniqueness: true
  validate :tickets_cant_exceed_limit

  def tickets_cant_exceed_limit
    if (Reservations.sum(:tickets) + self.tickets) > TICKET_LIMIT
      errors.add(:tickets, "can't exceed limit")
    end
  end

end

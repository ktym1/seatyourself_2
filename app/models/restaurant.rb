class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, :through => :reservations

	validates :name, :address, :phone, :capacity, :presence => true
	def availability(party_size)
		reserve_size = reservations.where(party_time: party_time).sum(:party_size)
		reserve_size + party_size <= capacity
	end

end

# For when I want to validate Datetime
# class MyModel < ActiveRecord::Base
#   validate :mydate_is_date?

#   private

#   def mydate_is_date?
#     if !mydate.is_a?(Date)
#       errors.add(:mydate, 'must be a valid date') 
#     end
#   end
# end
class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :users

	validates :restaurant, presence: true
	validate :availability

	private
	def availability #only want to do something when a customer validation is false
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "restaurant is full, go away!") 
		end
	end	
end

#know an object is valid if the errors array is empty. If the error array is empty,... 
#...if there is one error it's invalid.
#validations run on save, create, and update_attributes; if there is an error, it will be added to the errors array. 
# Then, inspects the array. False means there are errors and the object does not get saved to the database.

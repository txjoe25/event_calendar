class User < ActiveRecord::Base
	has_secure_password
	has_many :attendees
	has_many :events, through: :attendees
	has_many :events_planned
	has_many :comments
	validates :password, length: { minimum: 8 }, allow_nil: true
	validate :in_state
	def in_state
		states = ["AK","AL","AZ","AR","CA","CO","CT","DE","FL","GA",
					"HI","ID","IL","IN","IA","KS","KY","LA","ME","MD",
					"MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
					"NM","NY","NC","ND","OH","OK","OR","PA","RI","SC",
					"SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
		if state.present? && !states.include?(state)
			errors.add(:state, "Must be a US state")
		end
	end
end

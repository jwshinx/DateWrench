class RigDetailsFormatter
	attr_reader	:downtime_duration, :downtime_distance, :downtime_update_count, :commuting_duration, :commuting_distance, :commuting_update_count, :collecting_duration, :collecting_distance, :collecting_update_count

	def initialize(data)
		if data.nil?
		elsif data.is_a?(Array) && data.length > 1

			data.each do |info|

				if info[:collection_status] == 'downtime'
					@downtime_duration = info[:duration]
					@downtime_distance = info[:distance]
					@downtime_update_count = info[:update_count]
				elsif info[:collection_status] == 'collecting'
					@collecting_duration = info[:duration]
					@collecting_distance = info[:distance]
					@collecting_update_count = info[:update_count]
				elsif info[:collection_status] == 'commuting'
					@commuting_duration = info[:duration]
					@commuting_distance = info[:distance]
					@commuting_update_count = info[:update_count]
				else
				end
			end
		elsif data.is_a?(Array) && data.length == 1

        else

        end
	end
	def sayhi
		'hi'
	end
end
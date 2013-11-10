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
        else # just one hash in an array
			if data[0][:collection_status] == 'downtime'
				@downtime_duration = data[0][:duration]
				@downtime_distance = data[0][:distance]
				@downtime_update_count = data[0][:update_count]
				@collecting_duration = 'NA'
				@collecting_distance = 'NA'
				@collecting_update_count = 'NA'
				@commuting_duration = 'NA'
				@commuting_distance = 'NA'
				@commuting_update_count = 'NA'

			elsif data[:collection_status] == 'collecting'
				@collecting_duration = data[0][:duration]
				@collecting_distance = data[0][:distance]
				@collecting_update_count = data[0][:update_count]
				@downtime_duration = 'NA'
				@downtime_distance = 'NA'
				@downtime_update_count = 'NA'
				@commuting_duration = 'NA'
				@commuting_distance = 'NA'
				@commuting_update_count = 'NA'				
			else
				@commuting_duration = data[0][:duration]
				@commuting_distance = data[0][:distance]
				@commuting_update_count = data[0][:update_count]
				@collecting_duration = 'NA'
				@collecting_distance = 'NA'
				@collecting_update_count = 'NA'
				@downtime_duration = 'NA'
				@downtime_distance = 'NA'
				@downtime_update_count = 'NA'				
			end
        end
	end
	def sayhi
		'hi'
	end
end
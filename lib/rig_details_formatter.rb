class RigDetailsFormatter
	attr_accessor :downtime_duration, :downtime_distance, :downtime_update_count, :commuting_duration, :commuting_distance, :commuting_update_count, :collecting_duration, :collecting_distance, :collecting_update_count

	def initialize(data)
		if data.empty?
			['downtime', 'collecting', 'commuting'].each { |status| set_elements_to_not_available status }
		elsif data.is_a?(Array) && data.length > 1
			data.each { |info| set_elements_to_value info }
        else # just one hash in an array
			['collecting', 'commuting', 'downtime'].each do |status|
				if data[0][:collection_status] == status
					set_elements_to_value data[0]
				end
				if data[0][:collection_status] != status
					set_elements_to_not_available status
				end
			end
        end
	end
	def set_elements_to_value info
		['duration', 'distance', 'update_count'].each do |elem| 
			send "#{info[:collection_status]}_#{elem}=", info["#{elem}".to_sym] 
		end
	end
	def set_elements_to_not_available( status )
		['duration', 'distance', 'update_count'].each { |element| send "#{status}_#{element}=", 'NA' }
	end
end
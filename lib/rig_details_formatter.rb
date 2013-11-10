class RigDetailsFormatter
	attr_accessor :downtime_duration, :downtime_distance, :downtime_update_count, :commuting_duration, :commuting_distance, :commuting_update_count, :collecting_duration, :collecting_distance, :collecting_update_count

	def initialize(data)
		if data.empty?
			['downtime', 'collecting', 'commuting'].each { |status| set_na status }
		elsif data.is_a?(Array) && data.length > 1
			data.each do |info|
				['duration', 'distance', 'update_count'].each do |elem| 
					send "#{info[:collection_status]}_#{elem}=", info["#{elem}".to_sym] 
				end
			end
        else # just one hash in an array
			#if data[0][:collection_status] == 'downtime'
			#	@downtime_duration = data[0][:duration]
			#	@downtime_distance = data[0][:distance]
			#	@downtime_update_count = data[0][:update_count]
			['collecting', 'commuting', 'downtime'].each do |status|
				if data[0][:collection_status] == status
					['duration', 'distance', 'update_count'].each do |elem| 
						send "#{data[0][:collection_status]}_#{elem}=", data[0]["#{elem}".to_sym] 
					end
				end
				unless data[0][:collection_status] == status
					set_na status
				end
			end

			#elsif data[:collection_status] == 'collecting'
			#	@collecting_duration = data[0][:duration]
			#	@collecting_distance = data[0][:distance]
			#	@collecting_update_count = data[0][:update_count]
			#	['downtime', 'commuting'].each { |status| set_na status }
			#else
			#	@commuting_duration = data[0][:duration]
			#	@commuting_distance = data[0][:distance]
			#	@commuting_update_count = data[0][:update_count]
			#	['downtime', 'collecting'].each { |status| set_na status }				
			#end
        end
	end
	def set_na( status )
		['duration', 'distance', 'update_count'].each { |elem| send "#{status}_#{elem}=", 'NA' }
	end
end
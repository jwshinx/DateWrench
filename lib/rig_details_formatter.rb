require 'date'

class RigDetailsFormatter
	attr_accessor :start_time, :end_time, :downtime_duration, :downtime_distance, :downtime_update_count, :commuting_duration, :commuting_distance, :commuting_update_count, :collecting_duration, :collecting_distance, :collecting_update_count

	def initialize(data)
		@start_time, @end_time = 'NA', 'NA'
		if data.empty?
			['downtime', 'collecting', 'commuting'].each { |status| set_elements_to_not_available status }
		elsif data.is_a?(Array) && data.length > 1
			data.each do |data_item| 
				set_elements_to_value data_item
				set_start_time(data_item) if is_not_the_earliest_start_time?(data_item[:start_time_utc])
				set_end_time(data_item) if is_not_the_latest_end_time?(data_item[:end_time_utc])
			end
        else # just one hash in an array
			['collecting', 'commuting', 'downtime'].each do |status|
				if data[0][:collection_status] == status
					set_elements_to_value data[0]
				end
				if data[0][:collection_status] != status
					set_elements_to_not_available status
				end
			end
			set_start_time data[0]
			set_end_time data[0]
        end
	end
	def is_not_the_earliest_start_time? time_string
		(@start_time == 'NA' || @start_time > as_datetime_obj(time_string)) ? true : false
	end
	def is_not_the_latest_end_time? time_string
		(@end_time == 'NA' || @end_time < as_datetime_obj(time_string)) ? true : false
	end	
	def as_datetime_obj string
		begin
			DateTime.strptime(string, '%Y-%m-%d %H:%M:%S')
		rescue Exception
			'NA'
		end
	end
	def set_start_time data_item
		@start_time = as_datetime_obj data_item[:start_time_utc]
	end
	def set_end_time data_item
		@end_time = as_datetime_obj data_item[:end_time_utc]
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
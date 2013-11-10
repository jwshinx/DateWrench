require 'date'

class RigDetailsFormatter
	attr_accessor :start_time, :end_time, :downtime_duration, :downtime_distance, :downtime_update_count, :commuting_duration, :commuting_distance, :commuting_update_count, :collecting_duration, :collecting_distance, :collecting_update_count

	RIG_STATUSES = ['downtime', 'collecting', 'commuting']
	RIG_STATUS_ATTRIBUTES = ['duration', 'distance', 'update_count']

	def initialize(data)
		@start_time, @end_time = 'NA', 'NA'
		if data.empty?
			RIG_STATUSES.each { |status| set_elements_to_not_available status }
		elsif data.is_a?(Array) && data.length > 1
			data.each do |data_item| 
				set_elements_to_value data_item
				set_start_time(data_item) if is_not_the_earliest_start_time?(data_item[:start_time_utc])
				set_end_time(data_item) if is_not_the_latest_end_time?(data_item[:end_time_utc])
			end
        else # just one hash in an array
			RIG_STATUSES.each do |status|
				set_elements_to_value( data[0] ) if data[0][:collection_status] == status				
				set_elements_to_not_available( status ) if data[0][:collection_status] != status
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
		RIG_STATUS_ATTRIBUTES.each do |attribute| 
			send "#{info[:collection_status]}_#{attribute}=", info["#{attribute}".to_sym] 
		end
	end
	def set_elements_to_not_available( status )
		RIG_STATUS_ATTRIBUTES.each { |attribute| send "#{status}_#{attribute}=", 'NA' }
	end
end
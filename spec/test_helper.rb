module TestHelper
	def myhashes 
		[ 
			{:collection_status => 'downtime', :duration => '11:11', :distance => '111.1', :update_count => '11',
			 	:start_time_utc => '2013-11-05 08:00:00', :end_time_utc => '2013-11-05 08:15:00'},
		  	{:collection_status => 'collecting', :duration => '77:77', :distance => '777.7', :update_count => '77',
			 	:start_time_utc => '2013-11-05 08:15:00', :end_time_utc => '2013-11-05 16:00:00'},
		  	{:collection_status => 'commuting', :duration => '22:22', :distance => '22.2', :update_count => '22',
			 	:start_time_utc => '2013-11-05 16:00:00', :end_time_utc => '2013-11-05 16:30:00'}
		]
	end
	def downtime_hash
		[ {:collection_status => 'downtime', :duration => '11:11', :distance => '111.1', :update_count => '11',
				:start_time_utc => '2013-11-05 08:00:00', :end_time_utc => '2013-11-05 16:00:00'}
		]
	end	
end
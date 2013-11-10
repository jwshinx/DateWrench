module TestHelper
	def myhashes 
		[ 
			{:collection_status => 'downtime', :duration => '11:11', :distance => '111.1', :update_count => '11'},
		  	{:collection_status => 'collecting', :duration => '77:77', :distance => '777.7', :update_count => '77'},
		  	{:collection_status => 'commuting', :duration => '22:22', :distance => '22.2', :update_count => '22'}
		]
	end
end
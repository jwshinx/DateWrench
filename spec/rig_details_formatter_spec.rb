require 'spec_helper'

def myhashes 
	[ 
		{:collection_status => 'downtime', :duration => '11:11', :distance => '111.1', :update_count => '11'},
	  	{:collection_status => 'collecting', :duration => '77:77', :distance => '777.7', :update_count => '77'},
	  	{:collection_status => 'commuting', :duration => '22:22', :distance => '22.2', :update_count => '22'}
	]
end

describe "RigDetailsFormatter" do
 	
	describe "when complete data with downtime, collecting and commuting" do
		subject { RigDetailsFormatter.new(myhashes) }
 		its(:downtime_distance) { should == '111.1' }
 		its(:downtime_duration)  { should == '11:11' }
 		its(:downtime_update_count) { should == '11' }
 		its(:collecting_distance) { should == '777.7' }
 		its(:collecting_duration) { should == '77:77' }
 		its(:collecting_update_count) { should == '77' }
 		its(:commuting_distance) { should == '22.2' }
 		its(:commuting_duration) { should == '22:22' }
 		its(:commuting_update_count) { should == '22' }
 	end

end

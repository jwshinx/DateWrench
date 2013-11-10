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
		before { @f = RigDetailsFormatter.new(myhashes) }
		describe "downtime_distance" do
 			it "returns 111.1" do
 				@f.downtime_distance.should == '111.1'
 			end
 		end
		describe "downtime_duration" do
 			it "returns 11:11" do
 				@f.downtime_duration.should == '11:11'
 			end
 		end
 		describe "downtime_update_count" do
 			it "returns 11" do
 				@f.downtime_update_count.should == '11'
 			end
 		end

 		describe "collecting_distance" do
 			it "returns 111.1" do
 				@f.collecting_distance.should == '777.7'
 			end
 		end
		describe "collecting_duration" do
 			it "returns 77:77" do
 				@f.collecting_duration.should == '77:77'
 			end
 		end
 		describe "collecting_update_count" do
 			it "returns 11" do
 				@f.collecting_update_count.should == '77'
 			end
 		end

  		describe "commuting_distance" do
 			it "returns 22.2" do
 				@f.commuting_distance.should == '22.2'
 			end
 		end
		describe "commuting_duration" do
 			it "returns 22:22" do
 				@f.commuting_duration.should == '22:22'
 			end
 		end
 		describe "commuting_update_count" do
 			it "returns 22" do
 				@f.commuting_update_count.should == '22'
 			end
 		end						
 	end

end

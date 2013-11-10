require 'spec_helper'
#$LOAD_PATH << File.expand_path('../lib', __FILE__)

describe "RigDetailsFormatter" do
	include TestHelper
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
	describe "when only with downtime data" do
		subject { RigDetailsFormatter.new(downtime_hash) }
 		its(:downtime_distance) { should == '111.1' }
 		its(:downtime_duration)  { should == '11:11' }
 		its(:downtime_update_count) { should == '11' }
 		its(:collecting_distance) { should == 'NA' }
 		its(:collecting_duration) { should == 'NA' }
 		its(:collecting_update_count) { should == 'NA' }
 		its(:commuting_distance) { should == 'NA' }
 		its(:commuting_duration) { should == 'NA' }
 		its(:commuting_update_count) { should == 'NA' }
 	end
end

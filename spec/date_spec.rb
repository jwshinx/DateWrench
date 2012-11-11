require 'spec_helper'

describe "Date" do
 it "sss" do
  x = AnniDateFactory.new Date.today
  x.sayhi.should == 'hi'
 end
 describe "converting to monthly" do
  describe "from old anni date 6/1/2012" do
   it "returns next 1st of the month" do
    old_anni_date = Date.new(2012, 6, 1)
    x = AnniDateFactory.new old_anni_date
    new_anni_date = x.generate_anni_date_for_new_monthly_subscription  
    #new_anni_date.should == Date.today.
   end
  end
 end
 describe "converting to yearly" do
  describe "from old anni date 6/1/2012" do
   it "returns 6/1/2013" do
    old_anni_date = Date.new(2012, 6, 1)
    x = AnniDateFactory.new old_anni_date
    new_anni_date = x.generate_anni_date_for_new_yearly_subscription  
    new_anni_date.should == Date.new(2013, 6, 1)
   end
  end 
  describe "from old anni date 6/1/2011" do
   it "returns 6/1/2013" do
    old_anni_date = Date.new(2011, 6, 1)
    x = AnniDateFactory.new old_anni_date
    new_anni_date = x.generate_anni_date_for_new_yearly_subscription  
    new_anni_date.should == Date.new(2013, 5, 31)
   end
  end 
  describe "from old anni date 10/1/2012" do
   it "returns 10/1/2012" do
    old_anni_date = Date.new(2012, 10, 1)
    x = AnniDateFactory.new old_anni_date
    new_anni_date = x.generate_anni_date_for_new_yearly_subscription  
    new_anni_date.should == Date.new(2012, 10, 1)
   end
  end 
 end
end

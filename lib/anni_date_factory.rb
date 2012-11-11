require 'dateable'

class AnniDateFactory
 include Dateable
 attr_reader :old_anni_date, :new_anni_date

 def initialize date
  @old_anni_date = date
 end
 
 def generate_anni_date_for_new_monthly_subscription

 end

 def generate_anni_date_for_new_yearly_subscription
  today = Date.today
  year_diff = (((today-@old_anni_date).to_i)/365).to_i
  new_anni_date = @old_anni_date+(year_diff*365)
  if((today-new_anni_date).to_i) > 60 
   new_anni_date+365 
  else
   new_anni_date
  end
 end
end

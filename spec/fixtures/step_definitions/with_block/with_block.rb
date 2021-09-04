module FridayStepHelper
  def is_it_friday(day)
  end
end

Given("today is Sunday") do
  @today = 'Sunday'
end

Given("today is Sunday and Monday") do
  @today = 'Sunday'
end

Given("today is Sunday and Monday and {string}") do |weekday|
  @today = 'Sunday'
end

Given("today is a {string} and {string}") do |weekday, weekday2|
  @today = 'Sunday'
end

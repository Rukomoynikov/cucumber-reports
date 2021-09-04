When(/^Нажать на элемент с текстом "([^"]*)" или "([^"]*)"$/) do |element1, element2|
  sleep 0.2
  find(:xpath, "//*[contains(text(),'#{element1}')] | //*[contains(text(),'#{element2}')]").click
end

Then(/^Проверить наличие (редактируемого|нередактируемого) поля "([^"]*)"$/) do |editable, elem|
  editable = editable == 'редактируемого' ? false : true
  expect(find("//div[@title='#{elem}']//parent::co-label//following-sibling::div//input | //div[@title='#{elem}']//parent::co-label//following-sibling::input").disabled?).to eq(editable)
end


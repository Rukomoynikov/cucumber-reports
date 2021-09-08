![Example of using](/github_readme/example.gif)

# Cucumber reports

Test automation engineers use BDD and Gherkin. We write features using narutal language. Example of a scenario
```gherkin
Feature: Site title
  Background:
    Given I am logged in
  Scenario: Set the site title and site title link
    When I am on the dashboard
    And I should see the site title "My Great Site"
```

Each scenario consists from the steps. Behind the hood each step is the ruby function or as we call them step definitions. Example of a step from scenario above:
```ruby
Then /^I should see the site title "([^"]*)"$/ do |title|
  expect(page).to have_css "h1#site_title", text: title
end
```

Goal of this gem is providing general view to step definitions in ruby projects. Using this tool you can create an independent HTML file with all step definitions from the project. 

[Example of a generated HTML file](https://rukomoynikov.github.io/cucumber-reports/pages/dist/activeadmin.html)

### Roadmap:
- [x] Building packed HTML file
- [ ] Searching
- [ ] Localization support
- [ ] Support for feature files
- [ ] History of changes

### Using 
Install gem:
```sh
gem install cucumber-reports
```

Launch gem:
```sh
cucumber-reports generate --path dir_with_steps
```

Open generated page:
```sh
open index.html
```

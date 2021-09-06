![Example of using](/github_readme/example.gif)

# Cucumber reports

Sometimes we need to have general view of the deifinitions in out projects. Using this tool you can create an independent html file with all step definitions from the project. 

[Example of a generated HTML file](https://raw.githubusercontent.com/Rukomoynikov/cucumber-reports/main/github_readme/activeadmin.html)

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
cucumber-reports generate --path spec/fixtures/step_definitions
```

Open generated page:
```sh
open index.html
```

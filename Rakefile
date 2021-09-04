require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Rebuild and run gem'
task :test_run do
  p "Buidling gem"
  `gem build cucumber-reports.gemspec`

  p "Installing gem"
  `gem install ./CucumberReports-0.0.2.gem --force --local`

  p "Running command"  
  `cucumber_steps_list generate  --path spec/fixtures/step_definitions/from_activeadmin`
end

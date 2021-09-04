require 'thor'
require 'cucumber-reports/commands.rb'

module CucumberReports
  class CLI < Thor
    def self.exit_on_failure?
      true
    end
    
    desc "generate", "Generate html file with all step deifinitions"
    option :path, default: "features/step_definitions", 
                  type:    :string, 
                  desc:    "Path where step deifinitions are"
    def generate
      command = CucumberReports::Commands.new(path: options[:path])
      generated_json = command.generate()
      command.insert_to_html(generated_json)
    end
  end
end

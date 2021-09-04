require "json"
require "cucumber-reports/ast_parser"
require "cucumber-reports/ast_cleaner"
require "cucumber-reports/transformer/json.rb"

module CucumberReports
  class Commands
    def initialize(params = {})
      @path = params[:path] || "./step_definitions"
    end

    def files
      Dir.glob(File.join("#{@path}/**", "*.rb"))
    end

    def generate
      jsons = files
        .map do |file_path| 
          {file: file_path.split("/").last, 
           ast:  AstParser.new(file_path).parse}
        end
        .map do |options|
          {file: options.fetch(:file),
            ast: AstCleaner.new.clean(
                  options.fetch(:ast), options.fetch(:file))
          }
        end
        .filter { |options| !options.fetch(:ast).nil? }
        .map do |options|
          {file: options.fetch(:file),
            steps: Transformer::Json.new.transform(
                     options.fetch(:ast), 
                     options.fetch(:file))
          }
        end

      JSON.generate(jsons)
    end

    def insert_to_html(data)
      template_file = "/#{File.expand_path(File.dirname(__FILE__))}/../templates/dist/index.html"
      format_file = File.open(template_file, File::RDWR)
      text = format_file.read
      text_with_data = text.gsub("%data%", data)
      new_file = File.new("index.html", "w+")
      new_file << text_with_data
    end
  end
end

require "parser/current"

module CucumberReports
  class AstParser
    attr_accessor :content

    def initialize(file_path)
      @content = File.read(file_path)
    end

    def parse
      Parser::CurrentRuby.parse(@content)
    end
  end
end

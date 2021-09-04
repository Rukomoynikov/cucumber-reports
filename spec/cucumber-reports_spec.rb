require "cucumber-reports/commands"
require "cucumber-reports/ast_parser"
require "json"

RSpec.describe CucumberReports do
  let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions") }

  it "should generate an ast tree from given file" do
    example_file = main_script.files.first
    expect(
      CucumberReports::AstParser.new(example_file).parse.class
    ).to eq(Parser::AST::Node)
  end

  context "With block" do
    let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions/with_block") }

    it "should generate a correct json" do
      generated_json = main_script.generate()

      expect(
        generated_json
      ).to eq("[{\"file\":\"simple.rb\",\"steps\":[{\"title\":\"today is Sunday\",\"arguments\":[]}]},{\"file\":\"with_block.rb\",\"steps\":[{\"title\":\"today is Sunday\",\"arguments\":[]},{\"title\":\"today is Sunday and Monday\",\"arguments\":[]},{\"title\":\"today is Sunday and Monday and {string}\",\"arguments\":[\"weekday\"]},{\"title\":\"today is a {string} and {string}\",\"arguments\":[\"weekday\",\"weekday2\"]}]}]")
    end
  end

  context "Simple example" do
    let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions/simple") }

    it "should generate a correct json" do
      generated_json = main_script.generate()

      expect(
        generated_json
      ).to eq("[{\"file\":\"simple.rb\",\"steps\":[{\"title\":\"today is Sunday\",\"arguments\":[]}]}]")
    end
  end

  context "With arguments example" do
    let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions/with_arguments") }

    it "should generate a correct json" do
      generated_json = main_script.generate()

      expect(
        generated_json
      ).to eq("[{\"file\":\"with_arguments.rb\",\"steps\":[{\"title\":\"^Нажать на элемент с текстом \\\"([^\\\"]*)\\\" или \\\"([^\\\"]*)\\\"$\",\"arguments\":[\"element1\",\"element2\"]}]},{\"file\":\"with_arguments_and_union.rb\",\"steps\":[{\"title\":\"^Проверить наличие (редактируемого|нередактируемого) поля \\\"([^\\\"]*)\\\"$\",\"arguments\":[\"editable\",\"elem\"]}]}]")
    end
  end

  context "From activeadmin" do
    let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions/from_activeadmin") }

    it "should generate a correct json" do
      generated_json = main_script.generate()

      expect(JSON.parse(generated_json).count).to eq(35)
    end
  end
end

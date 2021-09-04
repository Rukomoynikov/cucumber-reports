module CucumberReports
  class AstCleaner
    def clean(ast, filename)
      # Return files with only one instruction
      return nil if invalid?(ast)
      return [ast] if ast.type == :block

      # Remove modules
      array_with_steps = ast.children.filter {|block| !invalid?(block)}
      array_with_steps
    end

    def invalid?(ast)
      return true if ast.nil?
      return true if ast.type == :class
      return true if ast.type == :def
      return true if ast.type == :module
    end
  end
end

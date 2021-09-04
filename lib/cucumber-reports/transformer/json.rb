require "byebug"

module CucumberReports
  module Transformer
    class Json
      def transform(parsed_ast, filename)
        steps = parsed_ast.map do |code_block|
          begin
            block_type = code_block.children[0].children[2].type

            title = parse_title(block_type, code_block)
            arguments = parse_arguments(block_type, code_block)
            {title: title, arguments: arguments}
          rescue
            next
          end
        end

        steps.compact
      end

      def parse_title(block_type, parsed_ast)
        case block_type
        when :str
          title = parsed_ast.children[0].children[2].children[0]
        when :regexp
          title = parsed_ast.children[0].children[2].children[0].children[0]
          title = title.children[0] if title.is_a?(Parser::AST::Node)
        end

        title
      end

      def parse_arguments(block_type, parsed_ast)
        args = parsed_ast.children
          .filter do |block|
            block.is_a?(Parser::AST::Node) && [:args].include?(block.type)
          end
          .map do |ast_block|
            return [] if ast_block.children.empty?
            ast_block.children.map {|ast_arg| ast_arg.children[0] }
          end

        args.flatten
      end
    end
  end
end

require 'set'

class StringCalc
  def compute(expression)
    Parser.new(expression).parse_expression
  end

  class Parser
    def initialize(expression)
      @expression = expression
      @numbers = (0..9).to_a.map(&:to_s).to_set
      @high_order_operators = %i[* /]
      @low_order_operators = %i[+ -]
    end

    def parse_expression
      arg = parse_term
      while @low_order_operators.include?((operation = parse_operation))
        skip_current_char
        arg = arg.send operation, parse_term
      end
      arg
    end

    private

    def parse_term
      arg = parse_argument
      while @high_order_operators.include?((operator = parse_operation))
        skip_current_char
        arg = arg.send operator, parse_argument
      end
      arg
    end

    def parse_argument
      sub_expression? ? parse_sub_expression : parse_number
    end

    def sub_expression?
      @expression[0] == '('
    end

    def parse_sub_expression
      skip_current_char
      num = parse_expression
      skip_current_char
      num
    end

    def parse_number
      last = @expression[0] == '-' ? 1 : 0
      last += 1 while @numbers.include? @expression[last]
      arg = @expression[0..last]
      @expression = @expression[last..-1]
      arg.to_i
    end

    def parse_operation
      @expression[0].to_sym unless @expression.empty?
    end

    def skip_current_char
      @expression = @expression[1..-1]
    end
  end
end

require 'set'

class StringCalc
  def compute(src)
    Parser.new(src).parse_expression
  end

  class Parser
    def initialize(expression)
      @exp = expression
      @digits = (0..9).to_a.map(&:to_s).to_set
      @low_order_operators = %i[- +]
      @high_order_operators = %i[* /]
    end

    def parse_expression
      arg = parse_term
      while @low_order_operators.include?((operator = parse_operator))
        skip_current_char
        arg = arg.send operator, parse_term
      end
      arg
    end

    private

    def parse_term
      arg = parse_argument
      while @high_order_operators.include?((operator = parse_operator))
        skip_current_char
        arg = arg.send operator, parse_argument
      end
      arg
    end

    def parse_argument
      sub_expression? ? parse_sub_expression : parse_num
    end

    def parse_operator
      @exp[0].to_sym unless @exp.empty?
    end

    def skip_current_char
      @exp = @exp[1..-1]
    end

    def parse_num
      last = @exp[0] == '-' ? 1 : 0
      last += 1 while @digits.include? @exp[last]
      arg = @exp[0..last]
      @exp = @exp[last..-1]
      arg.to_i
    end

    def parse_sub_expression
      skip_current_char
      num = parse_expression
      skip_current_char
      num
    end

    def sub_expression?
      @exp[0] == '('
    end
  end
end

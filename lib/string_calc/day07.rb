require 'set'

class StringCalc
  def compute(src)
    Parser.new(src).parse_expression
  end

  class Parser
    def initialize(expr)
      @expr = expr
      @numbers = (0..9).to_a.map(&:to_s).to_set
      @high_order_operators = %i[* /]
      @low_order_operators = %i[- +]
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
      num = parse_argument
      while @high_order_operators.include?((operator = parse_operator))
        skip_current_char
        num = num.send operator, parse_argument
      end
      num
    end

    def parse_argument
      sub_expression? ? parse_sub_expression : parse_num
    end

    def parse_num
      last = @expr[0] == '-' ? 1 : 0
      last += 1 while @numbers.include? @expr[last]
      arg = @expr[0..last]
      @expr = @expr[last..-1]
      arg.to_i
    end

    def parse_sub_expression
      skip_current_char
      ret = parse_expression
      skip_current_char
      ret
    end

    def sub_expression?
      @expr[0] == '('
    end

    def parse_operator
      @expr[0].to_sym unless @expr.empty?
    end

    def skip_current_char
      @expr = @expr[1..-1]
    end
  end
end

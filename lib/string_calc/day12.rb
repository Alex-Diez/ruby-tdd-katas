require 'set'

class StringCalc
  def compute(src)
    Parser.new(src).parse_expression
  end

  class Parser
    def initialize(expr)
      @expr = expr
      @digits = (0..9).to_a.map(&:to_s).to_set
      @low_order_operators = %i[+ -]
      @high_order_operators = %i[* /]
    end

    def parse_expression
      num = parse_term
      while @low_order_operators.include?((operator = parse_operator))
        skip_current_char
        num = num.send operator, parse_term
      end
      num
    end

    def parse_term
      num = parse_argument
      if @high_order_operators.include?((operator = parse_operator))
        skip_current_char
        num = num.send operator, parse_argument
      end
      num
    end

    def parse_argument
      sub_expression? ? parse_sub_expression : parse_num
    end

    def sub_expression?
      @expr[0] == '('
    end

    def parse_sub_expression
      skip_current_char
      ret = parse_expression
      skip_current_char
      ret
    end

    def parse_num
      last = @expr[0] == '-' ? 1 : 0
      last += 1 while @digits.include? @expr[last]
      num = @expr[0..last]
      @expr = @expr[last..-1]
      num.to_i
    end

    def parse_operator
      @expr[0].to_sym unless @expr.empty?
    end

    def skip_current_char
      @expr = @expr[1..-1]
    end
  end
end

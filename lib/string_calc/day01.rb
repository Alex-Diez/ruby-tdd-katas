class StringCalc
  def compute(src)
    Parser.new(src).parse_expression
  end
end

class Parser
  def initialize(expression)
    @expression = expression
    @numbers = (0..9).to_a.map(&:to_s)
    @low_order_operations = %i[+ -]
    @high_order_operations = %i[* /]
  end

  def parse_expression
    arg = parse_term
    while @low_order_operations.include?((operation = parse_operation))
      skip
      arg = arg.send operation, parse_term
    end
    arg
  end

  private
  def parse_term
    arg = parse_argument
    while @high_order_operations.include?((operation = parse_operation))
      skip
      arg = arg.send operation, parse_argument
    end
    arg
  end

  def parse_argument
    sub_expression? ? parse_sub_expression : parse_num
  end

  def parse_operation
    @expression[0].to_sym unless @expression.empty?
  end

  def skip
    @expression = @expression[1..-1]
  end

  def parse_num
    last = @expression[0] == '-' ? 1 : 0
    last += 1 while @numbers.include? @expression[last]
    arg = @expression[0..last]
    @expression = @expression[last..-1]
    arg.to_i
  end

  def parse_sub_expression
    skip
    ret = parse_expression
    skip
    ret
  end

  def sub_expression?
    @expression[0] == '('
  end
end

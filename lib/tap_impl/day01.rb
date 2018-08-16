class Object
  def impl_tap(&block)
    instance_eval(&block) if block_given?
    self
  end
end

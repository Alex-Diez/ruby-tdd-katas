class Object
  def tap_impl(&block)
    instance_eval(&block) if block_given?
    self
  end
end

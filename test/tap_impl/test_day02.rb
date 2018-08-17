require 'rspec'
require 'tap_impl/day02'

describe 'tap impl method' do
  before(:each) do
    @local = 'self'
  end

  it 'has to return self' do
    expect(@local.tap_impl).to be @local
  end

  it 'has to pass self to a block' do
    expect { |block| @local.tap_impl(&block) }.to yield_with_args(@local)
  end

  context 'access to internals of an object' do
    class CustomClass
      def initialize(reference)
        @instance_var = reference
      end

      private
        def private_method
          @instance_var
        end
    end

    before(:each) do
      @ref = 'instance'
      @cc = CustomClass.new(@ref)
    end

    it 'has to have access to instance variables' do
      expect { |block| @cc.tap_impl { @instance_var.tap_impl(&block) } }.to yield_with_args(@ref)
    end

    it 'has to have access to private methods' do
      expect { |block| @cc.tap_impl { private_method.tap_impl(&block) } }.to yield_with_args(@ref)
    end
  end
end

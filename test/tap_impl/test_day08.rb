require 'rspec'
require 'tap_impl/day08'

describe 'tap impl method' do
  before(:each) do
    @self = 'self'
  end

  it 'has to return self' do
    expect(@self.tap_impl).to be @self
  end

  it 'has to pass self into a block' do
    expect { |block| @self.tap_impl(&block) }.to yield_with_args @self
  end

  context 'access to instance internals' do
    class CustomClass
      def initialize(ref)
        @instance_var = ref
      end

      private

        def private_method
          @instance_var
        end
    end

    before(:each) do
      @ref = 'ref'
      @cc = CustomClass.new(@ref)
    end

    it 'has to have access to instance variables' do
      expect { |block| @cc.tap_impl { @instance_var.tap_impl(&block) } }.to yield_with_args @ref
    end

    it 'has to have access to private methods' do
      expect { |block| @cc.tap_impl { private_method.tap_impl(&block) } }.to yield_with_args @ref
    end
  end
end

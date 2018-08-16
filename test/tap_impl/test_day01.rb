require 'rspec'
require 'tap_impl/day01'

describe 'tap impl method' do
  before(:each) do
    @local = 'self'
  end

  it 'returns self' do
    expect(@local.impl_tap).to be @local
  end

  it 'passes self to a block' do
    expect { |block| @local.impl_tap(&block) }.to yield_with_args(@local)
  end

  context 'access to object internals' do
    class CustomClass
      def initialize
        @instance_var = 'self'
      end

      private
        def private_method
          @instance_var
        end
    end

    before(:each) do
      @object = CustomClass.new
    end

    it 'allows access to instance variable' do
      expect { |block| @object.impl_tap { @instance_var.impl_tap(&block) } }.to yield_with_args('self')
    end

    it 'allows access to private methods' do
      expect { |block| @object.impl_tap { private_method.impl_tap(&block) } }.to yield_with_args('self')
    end
  end
end

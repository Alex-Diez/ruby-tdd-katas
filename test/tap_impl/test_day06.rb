require 'rspec'
require 'tap_impl/day06'

describe 'tap impl method' do
  before(:each) do
    @local = 'self'
  end

  it 'has to return self' do
    expect(@local.tap_impl).to be @local
  end

  it 'has to pass self into a block' do
    expect { |block| @local.tap_impl(&block) }.to yield_with_args(@local)
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

    it 'has access to instance variables' do
      ref = 'ref'
      cc = CustomClass.new(ref)
      expect { |block| cc.tap_impl { @instance_var.tap_impl(&block) } }.to yield_with_args(ref)
    end

    it 'has access to private methods' do
      ref = 'ref'
      cc = CustomClass.new(ref)
      expect { |block| cc.tap_impl { private_method.tap_impl(&block) } }.to yield_with_args(ref)
    end
  end
end

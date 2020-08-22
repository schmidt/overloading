RSpec.describe Overloading do
  it 'has a version number' do
    expect(Overloading::VERSION).not_to be nil
  end

  it 'calls the method with the expected number of parameters' do
    klass = Class.new do
      include Overloading

      def action(one)
        :one
      end

      def action(one, two)
        :two
      end
    end

    expect(klass.new.action(1)).to eq(:one)
    expect(klass.new.action(1, 2)).to eq(:two)
  end

  it 'triggers NoMethodError, when arg list does not match' do
    klass = Class.new do
      include Overloading

      def action(one)
        :one
      end
    end

    expect { klass.new.action }.to raise_error(NoMethodError)
  end

  it 'works with inheritance' do
    base = Class.new do
      include Overloading

      def action(one)
        :one
      end

      def action(one, two)
        :two
      end
    end

    klass = Class.new(base) do
      def action(one, two, three)
        :three
      end
    end

    expect(base.new.action(1)).to eq(:one)
    expect(base.new.action(1, 2)).to eq(:two)
    expect { base.new.action(1, 2, 3) }.to raise_error(NoMethodError)

    expect(klass.new.action(1)).to eq(:one)
    expect(klass.new.action(1, 2)).to eq(:two)
    expect(klass.new.action(1, 2, 3)).to eq(:three)
  end
end

require "spec_helper"

describe FactoryMethods do
  let(:placebo)  { Class.new }
  let(:response) { 'this is an instance method' }

  before { placebo.extend(FactoryMethods) }

  it "defines static method" do
    placebo.deffactory(:hello)

    expect(placebo).to respond_to(:hello)
  end

  it "acts as a factory method" do
    placebo.class_eval <<-EOF
      def call
       'this is an instance method'
      end
    EOF

    placebo.deffactory(:call)

    expect(placebo.call).to eq(response)
  end

  it 'passes factory arguments to initializer' do
    placebo.class_eval <<-EOF
      def initialize(msg)
        @msg = msg
      end

      def echo
        @msg
      end
    EOF

    placebo.deffactory(:echo)

    expect(placebo.echo('Test Instance')).to eq('Test Instance')
  end

  it 'passes factory block to instance method' do
    placebo.class_eval <<-EOF
      def call
        yield
      end
    EOF

    placebo.deffactory(:call)

    expect(placebo.call { 1234 }).to eq(1234)
  end
end

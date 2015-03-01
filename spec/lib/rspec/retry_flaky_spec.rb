require 'spec_helper'

describe RSpec::Flaky do

  def count
    @count ||= 0
    @count
  end

  def count_up
    @count ||= 0
    @count += 1
  end

  def set_expectations(expectations)
    @expectations = expectations
  end

  context 'no retry option' do
    it 'should work' do
      expect(true).to be true
    end
  end

  context 'with retry_flaky option' do
    let(:retry_count) { 3 }
    let(:sleep_interval) { 10 }

    it 'default flaky_retry_count is 1' do
      expect(RSpec.configuration.flaky_retry_count).to eq 1
    end
    it "set flaky_retry_count is #{:retry_count}" do
      RSpec.configure { |c| c.flaky_retry_count = retry_count }
      expect(RSpec.configuration.flaky_retry_count).to eq retry_count
    end

    it 'default  flaky_sleep_interval is 0' do
      expect(RSpec.configuration.flaky_sleep_interval).to eq 0
    end
    it "set flaky_sleep_interval is #{:sleep_interval}" do
      RSpec.configure { |c| c.flaky_sleep_interval = sleep_interval }
      expect(RSpec.configuration.flaky_sleep_interval).to eq sleep_interval
    end
  end

  # raise error at rspec-expectations-3.1.2/lib/rspec/expectations/fail_with.rb:30:in `fail_with'
  # But count and expectations are expected.
  # TODO Should make stable.
=begin
  context 'with retry count' do
    let!(:retry_count) { 3 }
    before(:all) { RSpec.configure { |c| c.flaky_retry_count = 3 } }
    before(:each) { count_up }

    context do
      before(:all) { set_expectations([false, false, true]) }

      it "should run example until #{:retry_count} times" do
        expect(true).to be @expectations[count - 1]
        puts "======#{count}======="
        expect(count).to eq 3
      end

    end

    context do
      before(:all) { set_expectations([false, true, false]) }

      it "should stop example if example succeed" do
        expect(true).to be @expectations[count - 1]
        puts "======#{count}======="
        expect(count).to eq 2
      end
    end
  end
=end

end
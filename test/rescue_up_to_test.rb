require "test_helper"

class CustomException < Exception; end
class CustomError < StandardError; end

class RescueUpToTest < Test::Unit::TestCase
  
  def test_rescues_a_number_of_times
    total_rescued_times = 0
    rescue_up_to(10.times, from: CustomError) do |rescued_times|
      total_rescued_times = rescued_times
      raise CustomError.new
    end
  rescue CustomError
    assert_equal(10, total_rescued_times)
  end

  def test_raise_original_error_if_not_successful
    assert_raise(CustomError) do
      rescue_up_to(10.times) { raise CustomError.new }
    end
  end
  
  def test_stops_when_successful
    counter = 0
    rescue_up_to(10.times) do
      counter += 1
      raise StandardError.new if counter < 5
    end
    assert_equal(5, counter)
  end

  def test_returns_execution_value
    counter = 0
    return_value = rescue_up_to(10.times) do
      counter += 1
      raise StandardError.new if counter < 5
      counter
    end
    assert_equal(5, return_value)
  end
  
  def test_yields_rescued_times
    rescued_times = 0
    rescue_up_to(10.times, from: CustomError) do |yielded_value|
      assert_equal(rescued_times, yielded_value)
      rescued_times += 1
      raise CustomError.new
    end
  rescue CustomError
  end

  def test_rescues_standard_error_only
    assert_raise(CustomException) do
      rescue_up_to(10.times) do |rescued_times|
        raise RuntimeError.new if rescued_times == 0
        raise CustomException.new
      end
    end
  end
  
  def test_rescues_custom_exception
    assert_raise(StandardError) do
      rescue_up_to(10.times, from: CustomError) do |rescued_times|
        raise CustomError.new if rescued_times == 0
        raise StandardError.new if rescued_times == 1
        raise Exception
      end
    end
  end

  def test_rescues_custom_exceptions
    assert_raise(StandardError) do
      rescue_up_to(10.times, from: [CustomError, CustomException]) do |rescued_times|
        raise CustomError.new if rescued_times == 0
        raise CustomException.new if rescued_times == 1
        raise StandardError.new if rescued_times == 2
        raise Exception
      end
    end
  end
  
  def test_rescues_with_lambda
    total_rescued_times = 0
    rescue_up_to(10.times, from: CustomError, with: ->{total_rescued_times += 1}) do |rescued_times|
      raise CustomError.new
    end
  rescue CustomError
    assert_equal(10, total_rescued_times)
  end

  def test_rescue_with_lambda_yields_rescued_times
    total_rescued_times = nil
    rescue_up_to(10.times, from: CustomError, with: ->(rescued_times){total_rescued_times = rescued_times}) do |rescued_times|
      raise CustomError.new
    end
  rescue CustomError
    assert_equal(10, total_rescued_times)
  end

  
end



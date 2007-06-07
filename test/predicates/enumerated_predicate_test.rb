require File.dirname(__FILE__) + '/../test_helper'

class EnumeratedPredicateTest < Test::Unit::TestCase
  def setup
    @predicate = Predicates::Enumerated.new
  end

  def test_validation
    @predicate.options = [1, 2, '3']

    assert @predicate.validate(1, nil)
    assert @predicate.validate(2, nil)
    assert !@predicate.validate(3, nil), 'type is important'
    assert @predicate.validate('3', nil)
    assert !@predicate.validate(6, nil)
  end
end

require 'minitest/autorun'
require 'ci_uy'

# rubocop:disable Metrics/BlockLength
describe CiUY do
  it 'should return a valid checker digit' do
    ci = '1111111'
    assert 1, CiUY.get_validation_digit(ci)

    ci2 = '2222222'
    assert 2, CiUY.get_validation_digit(ci2)
  end

  it 'should validate numbers' do
    ci = '11111111'
    assert CiUY.validate_ci(ci)
  end

  it 'should validate numbers even when using dots and dashes' do
    ci = '1.111.111-1'
    assert CiUY.validate_ci(ci)

    ci = '1-111/111/1'
    assert CiUY.validate_ci(ci)
  end

  it 'should not validate wrong numbers' do
    ci = '1.111.222.1'
    assert !CiUY.validate_ci(ci)
  end

  it 'should get a valid random ci number' do
    ci = CiUY.get_random_ci
    assert CiUY.validate_ci(ci)
  end

  it 'should validate ci\'s with 6 digits' do
    ci = '1111113'
    assert CiUY.validate_ci(ci)
  end

  it 'should accept integers as input' do
    ci = 51_691_703
    assert CiUY.validate_ci(ci)
  end

  it 'should use more idiomatic aliases for methods' do
    ci = CiUY.random
    assert CiUY.validate(ci)
    assert CiUY.validation_digit(ci) == ci[-1]
  end

  it 'should not validate numbers smaller than 100_000' do
    ci = '12345'
    assert !CiUY.validate(ci)
    ci2 = '17'
    assert !CiUY.validate(ci2)
    ci3 = '34.993'
    assert !CiUY.validate(ci3)
  end
end
# rubocop:enable Metrics/BlockLength

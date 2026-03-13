# frozen_string_literal: true

# 메인 애플리케이션 파일

# 두 숫자를 더하는 함수
# @param num1 [Numeric] 첫 번째 숫자
# @param num2 [Numeric] 두 번째 숫자
# @return [Numeric] 두 숫자의 합계
def add(num1, num2)
  num1 + num2
end

# 두 숫자를 빼는 함수
# @param num1 [Numeric] 첫 번째 숫자
# @param num2 [Numeric] 두 번째 숫자
# @return [Numeric] 두 숫자의 차이
def subtract(num1, num2)
  num1 - num2
end

# 두 숫자를 곱하는 함수
# @param num1 [Numeric] 첫 번째 숫자
# @param num2 [Numeric] 두 번째 숫자
# @return [Numeric] 두 숫자의 곱
def multiply(num1, num2)
  num1 * num2
end

# 두 숫자를 나누는 함수
# @param num1 [Numeric] 피제수
# @param num2 [Numeric] 제수
# @return [Float] 두 숫자의 몫
# @raise [ArgumentError] 제수가 0인 경우 오류 발생
def divide(num1, num2)
  raise ArgumentError, '제수는 0이 될 수 없습니다' if num2.zero?

  num1.to_f / num2
end

# 결과 출력 함수
# @param operation [String] 연산 이름
# @param result [Numeric] 연산 결과
# @return [void]
def print_result(operation, result)
  puts "#{operation}: #{result}"
end

# 메인 실행 블록
if __FILE__ == $PROGRAM_NAME
  print_result('덧셈 (10 + 5)', add(10, 5))
  print_result('뺄셈 (10 - 5)', subtract(10, 5))
  print_result('곱셈 (10 * 5)', multiply(10, 5))
  print_result('나눗셈 (10 / 5)', divide(10, 5))
end

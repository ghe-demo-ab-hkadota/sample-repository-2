# 가위바위보 게임 테스트

require "minitest/autorun"
require_relative "janken"

# 게임 로직을 테스트하는 클래스
class JankenTest < Minitest::Test
  # judge 함수: 플레이어가 이기는 경우를 테스트
  def test_judge_player_wins
    assert_equal :win, judge("rock", "scissors")
    assert_equal :win, judge("scissors", "paper")
    assert_equal :win, judge("paper", "rock")
  end

  # judge 함수: 플레이어가 지는 경우를 테스트
  def test_judge_player_loses
    assert_equal :lose, judge("scissors", "rock")
    assert_equal :lose, judge("paper", "scissors")
    assert_equal :lose, judge("rock", "paper")
  end

  # judge 함수: 무승부 경우를 테스트
  def test_judge_draw
    assert_equal :draw, judge("rock", "rock")
    assert_equal :draw, judge("paper", "paper")
    assert_equal :draw, judge("scissors", "scissors")
  end

  # parse_input 함수: 유효한 입력을 테스트
  def test_parse_input_valid
    assert_equal "rock",     parse_input("rock")
    assert_equal "rock",     parse_input("r")
    assert_equal "rock",     parse_input("바위")
    assert_equal "paper",    parse_input("paper")
    assert_equal "paper",    parse_input("p")
    assert_equal "paper",    parse_input("보")
    assert_equal "scissors", parse_input("scissors")
    assert_equal "scissors", parse_input("s")
    assert_equal "scissors", parse_input("가위")
  end

  # parse_input 함수: 대소문자 구분 없이 처리되는지 테스트
  def test_parse_input_case_insensitive
    assert_equal "rock",     parse_input("ROCK")
    assert_equal "paper",    parse_input("Paper")
    assert_equal "scissors", parse_input("SCISSORS")
  end

  # parse_input 함수: 유효하지 않은 입력을 테스트
  def test_parse_input_invalid
    assert_nil parse_input("banana")
    assert_nil parse_input("")
    assert_nil parse_input("  ")
  end

  # result_message 함수: 각 결과 메시지를 테스트
  def test_result_message
    assert_match(/승리/, result_message(:win))
    assert_match(/패배/, result_message(:lose))
    assert_match(/무승부/, result_message(:draw))
  end

  # computer_choice 함수: 반환값이 유효한 선택인지 테스트
  def test_computer_choice_is_valid
    10.times do
      assert_includes CHOICES, computer_choice
    end
  end

  # play_round 함수: 유효한 입력으로 올바른 구조를 반환하는지 테스트
  def test_play_round_valid_input
    round = play_round("rock")
    assert_includes CHOICES, round[:player]
    assert_includes CHOICES, round[:computer]
    assert_includes %i[win lose draw], round[:result]
  end

  # play_round 함수: 유효하지 않은 입력으로 에러를 반환하는지 테스트
  def test_play_round_invalid_input
    round = play_round("invalid")
    assert round[:error]
  end
end

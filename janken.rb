# 가위바위보 게임 - 컴퓨터와 대결하는 프로그램

CHOICES = %w[rock paper scissors].freeze
CHOICE_LABELS = {
  "rock" => "✊ 바위 (Rock)",
  "paper" => "✋ 보 (Paper)",
  "scissors" => "✌️ 가위 (Scissors)"
}.freeze

# 컴퓨터의 선택을 무작위로 반환하는 함수
def computer_choice
  CHOICES.sample
end

# 승패를 판정하는 함수
# 반환값: :win (플레이어 승), :lose (플레이어 패), :draw (무승부)
def judge(player, computer)
  return :draw if player == computer

  if (player == "rock" && computer == "scissors") ||
     (player == "scissors" && computer == "paper") ||
     (player == "paper" && computer == "rock")
    :win
  else
    :lose
  end
end

# 결과 메시지를 반환하는 함수
def result_message(result)
  case result
  when :win  then "🎉 당신의 승리입니다! (You win!)"
  when :lose then "💀 당신의 패배입니다. (You lose...)"
  when :draw then "🤝 무승부입니다. (Draw!)"
  end
end

# 플레이어 입력을 검증하고 정규화하는 함수
# 유효하지 않은 입력이면 nil을 반환
def parse_input(input)
  normalized = input.to_s.strip.downcase
  aliases = {
    "rock" => "rock", "r" => "rock", "바위" => "rock",
    "paper" => "paper", "p" => "paper", "보" => "paper",
    "scissors" => "scissors", "s" => "scissors", "가위" => "scissors"
  }
  aliases[normalized]
end

# 게임을 한 번 실행하는 함수
def play_round(player_input)
  player = parse_input(player_input)
  return { error: "유효하지 않은 입력입니다. rock/paper/scissors 중 하나를 입력하세요." } if player.nil?

  computer = computer_choice
  result = judge(player, computer)

  {
    player: player,
    computer: computer,
    result: result
  }
end

# 게임 결과를 출력하는 함수
def display_round(round)
  if round[:error]
    puts round[:error]
    return
  end

  puts "당신: #{CHOICE_LABELS[round[:player]]}"
  puts "컴퓨터: #{CHOICE_LABELS[round[:computer]]}"
  puts result_message(round[:result])
end

# 메인 게임 루프 함수
def main
  puts "========================================="
  puts " 가위바위보 게임에 오신 것을 환영합니다!"
  puts " (Rock-Paper-Scissors Game)"
  puts "========================================="
  puts ""

  loop do
    puts "선택하세요 [rock/paper/scissors] 또는 'quit'으로 종료:"
    print "> "
    input = gets&.chomp

    break if input.nil? || input.downcase == "quit"

    round = play_round(input)
    puts ""
    display_round(round)
    puts ""
  end

  puts "게임을 종료합니다. 감사합니다!"
end

# 스크립트로 직접 실행될 때만 main을 호출
main if __FILE__ == $PROGRAM_NAME

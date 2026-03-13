# じゃんけんゲーム - コンピューターとじゃんけんをするアプリケーション

# 손 목록 정의
HANDS = { 1 => "グー (✊)", 2 => "チョキ (✌️)", 3 => "パー (✋)" }.freeze

# 입력 스트림이 끊어졌을 때 안전하게 처리하는 함수
def safe_gets
  input = gets
  if input.nil?
    puts "\n입력이 종료되었습니다. 게임을 종료합니다."
    exit
  end
  input.chomp
end

# 플레이어의 손 선택을 표시하고 입력받는 함수
def prompt_player_hand
  puts "\n손을 선택하세요:"
  HANDS.each { |num, name| puts "  #{num}: #{name}" }
  print "번호를 입력하세요 (1/2/3): "
  num = safe_gets.to_i
  unless HANDS.key?(num)
    puts "올바른 번호를 입력하세요."
    return prompt_player_hand
  end
  num
end

# 컴퓨터의 손을 무작위로 선택하는 함수
def computer_hand
  HANDS.keys.sample
end

# 승패를 판정하는 함수
# 반환값: :win, :lose, :draw
def judge(player, computer)
  if player == computer
    :draw
  elsif (player == 1 && computer == 2) ||
        (player == 2 && computer == 3) ||
        (player == 3 && computer == 1)
    :win
  else
    :lose
  end
end

# 결과를 화면에 출력하는 함수
def display_result(player, computer, result)
  puts "\n--- 결과 ---"
  puts "당신: #{HANDS[player]}"
  puts "컴퓨터: #{HANDS[computer]}"
  case result
  when :win
    puts "🎉 당신의 승리입니다!"
  when :lose
    puts "😢 당신의 패배입니다..."
  when :draw
    puts "🤝 비겼습니다!"
  end
end

# 다시 한 번 플레이할지 묻는 함수
def play_again?
  print "\n다시 플레이하시겠습니까? (y/n): "
  safe_gets.downcase == "y"
end

# 게임 메인 루프를 실행하는 함수
def play_game
  puts "=============================="
  puts "  じゃんけんゲームへようこそ！  "
  puts "=============================="

  loop do
    player = prompt_player_hand
    computer = computer_hand
    result = judge(player, computer)
    display_result(player, computer, result)
    break unless play_again?
  end

  puts "\n게임을 종료합니다. 감사합니다！"
end

# 메인 진입점
play_game

class Age
  attr_accessor :age, :country, :vote, :smoke, :drink, :car

  def initialize
    self.age = 0
    self.country = 'us'
    self.vote = 18
    self.smoke = 18
    self.drink = 21
    self.car = 25
  end

  def check_country
    while true
      puts "What country are you in? (US/UK)"
      answer = gets.chomp.downcase
      if answer == "us" || answer == "uk"
        self.country = answer
        break
      else
        puts "Please pick either 'US' or 'UK'."
      end
    end
  end

  def check_age
    while true
      puts "What is your age?"
      answer = gets.chomp
      if answer.to_i.to_s == answer && answer.to_i >= 0
        answer = answer.to_i
        if answer >= 0 && answer <= 115
          self.age = answer
          check_drink
          break
        elsif answer > 115
          puts "I highly doubt that..."
        end
      else
        puts "Please enter an integer greater than zero."
      end
    end
  end

  def check_drink
    if self.country == 'us'
      self.drink = 21
    else
      self.drink = 18
      check_supervised
    end
  end

  def check_supervised
    if self.age < 18
      if self.age == 16 || self.age == 17
        puts "Are your parents present? (y/n)"
        answer = gets.chomp.downcase
        if answer == 'y'
          self.drink = self.age
        end
      end
    end
  end

  def bounce
    if self.age >= self.car
      puts "You can do it all - you can vote, smoke, drink, and rent a car."
    elsif self.age >= self.drink && self.age >= self.vote
      puts "You can drink, smoke, and vote. You'll have to wait to rent a car."
    elsif self.age < self.drink && self.age >= self.vote
      puts "You can vote and smoke, but you can't drink or rent a car yet."
    elsif self.age >= self.drink && self.age < self.vote
      puts "You can drink with an adult present."
    else
      puts "Sorry youngin, looks like you can't legally do anything yet."
    end
    play_again_prompt
  end

  def play_again_prompt
    puts ""
    puts "Want to play again? (y/n)"
    answer = gets.chomp.downcase
    if answer != 'n'
      play_again
    end
  end

  def play_again
    while true
      puts "Would you like to change your age, your country, or quit? (age / country / quit)"
      answer = gets.chomp.downcase
      if answer == 'age'
        check_age
        bounce
        break
      elsif answer == 'country'
        check_country
        check_drink
        bounce
        break
      elsif answer == 'quit'
        break
      else
        puts "Please chose a response from the list."
      end
    end
  end

end

person = Age.new
person.check_country
person.check_age
person.bounce

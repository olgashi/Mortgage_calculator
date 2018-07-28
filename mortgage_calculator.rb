def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def maturity_years_to_months(months)
  months * 12
end

def monthly_apr(interest)
  interest / 1200
end

def monthly_payment(p, j, n)

  m = p.to_f * (monthly_apr(j.to_f) / (1 - (1 + monthly_apr(j.to_f))**(-maturity_years_to_months(n.to_i))))
end

loop do # main loop
  principal = ''
  apr = ''
  n = ''
  loop do
    puts "Enter loan amount. Please provide whole dollar amount (for example, $130500)."
    principal = gets.chomp
    if integer?(principal)
      break
    else
      puts "Please enter a valid amount."
    end
  end

  loop do
    puts "Enter Annual Percentage Rate without '%' sign, (for example, if 5.5%, then enter 5.5): "
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      puts "Please enter a valid amount."
    end
  end
  
  loop do
    puts "Enter loan duration (maturity) as a whole number, in years: "
    n = gets.chomp
    if integer?(n)
      break
    else
      puts "Please enter a valid amount."
    end
  end
  
  puts (monthly_payment(principal, apr, n)).round(2)


  puts "Do you want to repeat? Enter 'y' for yes, any other key for no."
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')      
end

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def prompt(message)
  puts("=> #{message}")
end

prompt(MESSAGES['welcome'])

loop do # main loop
  principal = ''
  apr = ''
  n = ''
  loop do
    prompt(MESSAGES['principal'])
    principal = gets.chomp
    if integer?(principal)
      break
    else
      prompt(MESSAGES['valid_amount'])
    end
  end

  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['valid_amount'])
    end
  end

  loop do
    prompt(MESSAGES['maturity'])
    n = gets.chomp
    if integer?(n)
      break
    else
      puts "Please enter a valid amount."
    end
  end

  principal = principal.to_f
  apr = apr.to_f / 1200
  n = n.to_i * 12

  puts "Monthly payment is: $#{monthly_payment(principal, apr, n).round(2)}"

  prompt(MESSAGES['repeat'])
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])

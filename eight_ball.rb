# Magic Eight Ball Assignment Pseudocode:
# The team leader: in the command line:

# Create an eight_ball directory
# Create main.rb and answers.rb files in that directory
# Create a git repository in that directory
# The team leader then create a git repository on GitHub, push project to GitHub, and add additional partners to project.

# Divide up the work below to complete the project please try to focus on using Classes for this assignment. (Don’t be afraid of more than one person coding the same file, as this will give you practice with Git flow and merge conflict resolution. The more practice you have now with Git the better you will be down the road.)

 

# Basic Objectives:

# - User inputs question
# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits
# - ability to add more answers:
# - via easter egg question ("add_answers")
# - do not let them add the same answer if the eight ball already has that answer
# - ability to reset answers back to the original bank (hint: think arr.clone)
# - via easter egg question ("reset_answers")
# - ability to have eight ball print all answers
# - via easter egg question ("print_answers")
# Bonus Objectives:

# -ability to use script arguments when the magic eight ball is started to do bonus functionality above
# - for example ruby magic_eight.RB add_answers
# this would start your script but instead of running the regular way you would be prompted to add answers first

require_relative './answers'

class Eight_Ball < Answers
    attr_accessor :name, :question 
    def initialize(name, question)
        @name = name
        @question = question
        super()
    end
end


def get_user_input
    puts
    puts "Please enter your first name:"
    puts
    name = gets.strip.to_s
    puts
    puts "If you would like to quit type 'QUIT'"
    puts
    puts
    puts "#{name}, please type your question below."
    puts
    question = gets.strip.to_s.downcase
    if question == 'quit'
        puts "Goodbye..."
        exit(0)
    else
        Eight_Ball.new(name, question)
    end
end

def add_answer
  puts
  puts "Would you like to add an answer? (y/n)"
  puts 
  input = gets.strip.to_s.downcase
  if input == "y" 
      puts "What answer would you like to add?"
      new_answer = gets.strip 
      @answer << new_answer  
  elsif input == "n"
    # ask for question
  else
    puts "Try again"
    add_answer
  end
end


get_user_input
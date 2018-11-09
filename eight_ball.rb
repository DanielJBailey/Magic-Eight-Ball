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

# # # # # # # # # # -ability to use script arguments when the magic eight ball is started to do bonus functionality above
# # # # # # # # # # - for example ruby magic_eight.RB add_answers
# # # # # # # # # # this would start your script but instead of running the regular way you would be prompted to add answers first

require_relative './answers'

class Eight_Ball < Answers
    def initialize
        @clone_array = []
        super()
    end

    def generate_answer
        puts
        puts "*" * 40
        puts
        puts "The Magic 8 Ball says: #{@answers.sample}"
        puts
        puts "*" * 40
        get_user_input
    end

    def add_answers
        puts
        puts "*" * 40
        puts  "Add answer to Magic 8 Ball, or type 'quit' to go back to start."
        puts
        input = gets.strip.to_s
        if input  == 'quit'
            get_user_input
        elsif @answers.include? input
            puts
            puts "Sorry no duplicates"
            add_answers
            puts
        else 
            @answers << input  
        end 
        get_user_input
    end

    def get_user_input
        puts
        puts "Please type your question below, or type 'quit' to exit."
        puts
        question = gets.strip.to_s.downcase
        handle_user_input(question)
    end

    def handle_user_input(input)
        case input
        when 'quit'
            quit_program
        when 'print_answers'
            puts
            puts "Printing all answers..."
            print_answers
        when 'reset_answers'
            puts
            puts "Resetting answers back to start..."
            puts
            puts "All ready...sending to start"
            @answers = @clone_array
            get_user_input
        when 'add_answers' #(mike)
            @clone_array = @answers.clone
            add_answers
        else
            # If quit, or no easter egg is requested, generate an answer
            generate_answer
        end
    end

    def quit_program
        puts "Thanks for playing."
        puts
        puts "Goodbye..."
    end

    # PRINT ALL ANSWERS EASTER EGG
    def print_answers
        puts
        @answers.each_with_index do |answer, index|
            puts "#{index+1}) #{answer}"
        end
        puts
        get_user_input
    end
end

x = Eight_Ball.new
x.get_user_input


# case
#     quit
#     question (not in array)
#     add_answers (call ability to add answers)
#     print_answers (show all answers)
#     reset_answers (reset all answers) array.clone
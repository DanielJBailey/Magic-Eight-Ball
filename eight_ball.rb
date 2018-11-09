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
    # create class Eight Ball
    def initialize
        # initialize clone array and leave empty for now
        @clone_array = []
        # call initialize method on answers to initialize
        super()
    end

    # generate random answer from storage
    def generate_answer
        puts
        puts "*" * 40
        puts
        puts "The Magic 8 Ball says: #{@answers.sample}"
        puts
        puts "*" * 40
        # after 8 ball output, route back to start
        get_user_input
    end

    # add answers easter egg
    def add_answers
        puts
        puts "*" * 40
        puts  "Add answer to Magic 8 Ball, or type 'quit' to go back to start."
        puts
        # get new answer from user
        input = gets.strip.to_s
        # if user input = quit, 
        if input  == 'quit'
            # quit back to menu
            get_user_input
        # check to see if answers list includes input
        elsif @answers.include? input
            puts
            puts "Sorry no duplicates"
            # if answer is already in list, re route back to add_answers start
            add_answers
            puts
        else 
            # if answer is not in list add it to array
            @answers << input  
        end 
        # route back to start of program once added to list
        get_user_input
    end

    # get user question and pass to handle user input method
    def get_user_input
        puts
        puts "Please type your question below, or type 'quit' to exit."
        puts
        question = gets.strip.to_s.downcase
        # pass question to handle_user_input
        handle_user_input(question)
    end

    # handle user input, receive user question as parameter
    def handle_user_input(input)
        case input
        # quit if user types 'quit'
        when 'quit'
            quit_program
        # print answers easter egg option
        when 'print_answers'
            puts
            puts "Printing all answers..."
            print_answers
        # reset answers back to base
        when 'reset_answers'
            puts
            puts "Resetting answers back to start..."
            puts
            puts "All ready...sending to start"
            # reset answers back to the original cloned array
            @answers = @clone_array
            # route back to user input
            get_user_input
        # add answers to call stack
        when 'add_answers' #(mike)
            # clone array on add answer option to retain base array
            @clone_array = @answers.clone
            # call add answers function
            add_answers
        else
            # If quit, or no easter egg is requested, generate an answer
            generate_answer
        end
    end

    # quit program on call
    def quit_program
        puts "Thanks for playing."
        puts
        puts "Goodbye..."
    end

    # print all answers easter egg to see options
    def print_answers
        puts
        # loop through answers array and print list
        @answers.each_with_index do |answer, index|
            puts "#{index+1}) #{answer}"
        end
        puts
        get_user_input
    end
end

x = Eight_Ball.new
x.get_user_input
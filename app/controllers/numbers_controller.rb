class NumbersController < ApplicationController
  def index
  	#runs generate_number method if there is no session
  	generate_number if !session[:random_number].present?
  	# create @session for testing purposes!
  	# @session = session[:random_number]
  	#automatically loads index.html.erb
  end 

  #triggered by index method
  def generate_number
  	session[:random_number] = rand(1..100) 
  	#sets session[:random_number] to number between 1-100
  end 

  def guess
  	if params[:guess].present? #if any input was submitted
  	  # set 'guess' as variable to represent the input, changed to integer
  	  # if not to_i, will interpret as string
  	  guess = params[:guess].to_i 
  	  if guess > session[:random_number]
  	  	flash[:message] = "Too High!"
  	  elsif guess < session[:random_number]
  	  	flash[:message] = "Too Low!"
  	  elsif guess == session[:random_number]
  	  	# if guess is correct, run 'generate_number' to set new random number
  	  	generate_number
  	  	flash[:message] = "Correct, you guessed it! Play again!"
  	  end
  	# if no input is submitted
  	else
  	  flash[:message] = "Take a guess!"
  	end 
    redirect_to action: 'index'
    # to note, different than redirect_to #index
    # that will take you localhost/#index (works, but no!)
  end
end

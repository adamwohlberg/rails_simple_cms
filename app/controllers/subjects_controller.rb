class SubjectsController < ApplicationController

  layout false

  def index
    # we defined sorted in the model with a lambda
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the object
    if @subject.save
    #If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
    #If save fails, redisplay the form so user can fix the problems
      render('new')
    end
  end

  def new
    @subject = Subject.new(:name => "Joe Cockster", :position => 69)
  end

  def edit
  end

  def delete
  end

  private

  def subject_params
  # same as using "params[:subject]", except that it:
  # - raises an error if :subject is not present
  # - allows lists attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible)
  end

end

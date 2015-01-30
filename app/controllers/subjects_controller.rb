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
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
    #If save fails, redisplay the form so user can fix the problems
      render('new')
    end
  end

  def update
    #Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    #Update the object
    if @subject.update_attributes(subject_params)
    #If update succeeds, redirect to the index action
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
    #If save fails, redisplay the form so user can fix the problems
      render('edit')
    end
  end

  def new
    @subject = Subject.new(:name => "Joe Cockster", :position => 69)
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def delete
    @subject = Subject.find(params[:id]) 
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def subject_params
  # same as using "params[:subject]", except that it:
  # - raises an error if :subject is not present
  # - allows lists attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible)
  end

end

class SectionsController < ApplicationController

  layout false

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    #Instantiate a new object using form parameters
    @section = Section.new(section_params)
    #Save the object
    if @section.save
    #If save succeeds, redirect to the index action
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
    #If save fails, redisplay the form so user can fix the problems
      render('new')
    end
  end

  def update
    #Find an existing object using form parameters
    @section = Section.find(params[:id])
    #Update the object
    if @section.update_attributes(section_params)
    #If update succeeds, redirect to the index action
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id)
    else
    #If save fails, redisplay the form so user can fix the problems
      render('edit')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully be-atch!"
    redirect_to(:action => 'index')
  end

  private

  def section_params
  # same as using "params[:subject]", except that it:
  # - raises an error if :subject is not present
  # - allows lists attributes to be mass-assigned
    params.require(:section).permit(:page_id, :name, :permalink, :position, :content, :content_type, :visible)
  end
end


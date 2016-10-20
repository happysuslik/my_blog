class PublicationsController < ApplicationController
  before_action :load_publication, only: [:show, :edit, :update, :destroy]
 
  def index
    @publications = Publication.all
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to @publication
    else
      render :new
    end
  end

  def update
    if @publication.update(publication_params)
      redirect_to @publication
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to publications_path
  end


  private

  def publication_params
    params.require(:publication).permit(:title, :avatar, :description)
  end

  def load_publication
    @publication = Publication.find(params[:id])
  end
end

class PublicationsController < ApplicationController
  before_action :load_publication, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
 
  def index
    @publications = Publication.all
  end

  def show
    @random_publications = Publication.random_publications
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
    params.require(:publication).permit(:title, :avatar, :description, :short_description)
  end

  def load_publication
    @publication = Publication.find(params[:id])
  end
end

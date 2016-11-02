class PublicationsController < ApplicationController
  load_and_authorize_resource param_method: :publication_params
  before_action :load_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy, :create]
 
  def index
    @publications = Publication.paginate(page: params[:page])
  end

  def show
    @author_user = Publication.author_publication(current_user, @publication)
    @review = Publication.reviews(current_user, @publication)
    @random_publications = Publication.random_publications
  end

  def new
    @publication = current_user.publications.new
  end

  def edit
  end

  def create
    @publication = current_user.publications.new(publication_params)

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

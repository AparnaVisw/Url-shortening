class LinksController < ApplicationController
  before_action :set_link, only: [:show]
  extend ActiveModel::Callbacks
  define_model_callbacks :create, :only => [:after]
  after_create :generate_short_url


  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  def show
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      if redirect_to @link.given_url
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end
  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    debugger
    @link.save
    @short_url = @link.id.to_s(36)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
        format.js
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(short_url: params[:short_url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:given_url,:short_url)
    end
end

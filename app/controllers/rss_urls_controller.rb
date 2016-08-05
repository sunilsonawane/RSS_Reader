require 'open-uri'

class RssUrlsController < ApplicationController
  before_action :set_rss_url,
                only: [:show, :edit, :update, :destroy],
                except: [:parse_rss]

  # GET /rss_urls
  # GET /rss_urls.json
  def index
    @rss_urls = RssUrl.all
  end

  # GET /rss_urls/1
  # GET /rss_urls/1.json
  def show
  end

  # GET /rss_urls/new
  def new
    @rss_url = RssUrl.new
  end

  # GET /rss_urls/1/edit
  def edit
  end

  # POST /rss_urls
  # POST /rss_urls.json
  def create
    @rss_url = RssUrl.new(rss_url_params)

    respond_to do |format|
      if @rss_url.save
        format.html { redirect_to @rss_url, notice: 'Rss url was successfully created.' }
        format.json { render :show, status: :created, location: @rss_url }
      else
        format.html { render :new }
        format.json { render json: @rss_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_urls/1
  # PATCH/PUT /rss_urls/1.json
  def update
    respond_to do |format|
      if @rss_url.update(rss_url_params)
        format.html { redirect_to @rss_url, notice: 'Rss url was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_url }
      else
        format.html { render :edit }
        format.json { render json: @rss_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_urls/1
  # DELETE /rss_urls/1.json
  def destroy
    @rss_url.destroy
    respond_to do |format|
      format.html { redirect_to rss_urls_url, notice: 'Rss url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def parse_rss
    @feeds = Feed.parse_urls
    render json: @feeds
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_url
      @rss_url = RssUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_url_params
      params.require(:rss_url).permit(:url)
    end
end

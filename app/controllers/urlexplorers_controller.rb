require 'open-uri'
class UrlexplorersController < ApplicationController
  before_action :set_urlexplorer, only: [:show, :edit, :update, :destroy]

  # GET /urlexplorers
  # GET /urlexplorers.json
  def index
    @urlexplorers = Urlexplorer.all
  end

  # GET /urlexplorers/1
  # GET /urlexplorers/1.json
  def show
  end

  # GET /urlexplorers/new
  def new
    @urlexplorer = Urlexplorer.new
  end

  # GET /urlexplorers/1/edit
  def edit
  end

  # POST /urlexplorers
  # POST /urlexplorers.json
  def create
    @urlexplorer = Urlexplorer.new(urlexplorer_params)

    respond_to do |format|
      if @urlexplorer.save
        format.html { redirect_to @urlexplorer, notice: 'Url was successfully stored. We would parse and process it.' }
        format.json { render :show, status: :created, location: @urlexplorer }
      else
        format.html { render :new }
        format.json { render json: @urlexplorer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urlexplorers/1
  # PATCH/PUT /urlexplorers/1.json
  def update
    respond_to do |format|
      if @urlexplorer.update(urlexplorer_params)
        format.html { redirect_to @urlexplorer, notice: 'Urlexplorer was successfully updated.' }
        format.json { render :show, status: :ok, location: @urlexplorer }
      else
        format.html { render :edit }
        format.json { render json: @urlexplorer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urlexplorers/1
  # DELETE /urlexplorers/1.json
  def destroy
    @urlexplorer.destroy
    respond_to do |format|
      format.html { redirect_to urlexplorers_url, notice: 'Urlexplorer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urlexplorer
      @urlexplorer = Urlexplorer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urlexplorer_params
      params.require(:urlexplorer).permit(:url, :content, :parsed_headers, :is_parsing_done)
    end
end

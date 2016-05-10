class MatchmakersController < ApplicationController
  before_action :set_matchmaker, only: [:show, :edit, :update, :destroy]

  # GET /matchmakers
  # GET /matchmakers.json
  def index
    @matchmakers = Matchmaker.all
  end

  # GET /matchmakers/1
  # GET /matchmakers/1.json
  def show
  end

  # GET /matchmakers/new
  def new
    @matchmaker = Matchmaker.new
  end

  # GET /matchmakers/1/edit
  def edit
  end

  # POST /matchmakers
  # POST /matchmakers.json
  def create
    @matchmaker = Matchmaker.new(matchmaker_params)

    respond_to do |format|
      if @matchmaker.save
        format.html { redirect_to @matchmaker, notice: 'Matchmaker was successfully created.' }
        format.json { render :show, status: :created, location: @matchmaker }
      else
        format.html { render :new }
        format.json { render json: @matchmaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchmakers/1
  # PATCH/PUT /matchmakers/1.json
  def update
    respond_to do |format|
      if @matchmaker.update(matchmaker_params)
        format.html { redirect_to @matchmaker, notice: 'Matchmaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @matchmaker }
      else
        format.html { render :edit }
        format.json { render json: @matchmaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchmakers/1
  # DELETE /matchmakers/1.json
  def destroy
    @matchmaker.destroy
    respond_to do |format|
      format.html { redirect_to matchmakers_url, notice: 'Matchmaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchmaker
      @matchmaker = Matchmaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matchmaker_params
      params.require(:matchmaker).permit(:uid, :address, :latitude, :longitude)
    end
end

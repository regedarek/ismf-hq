class RaceEditionsController < ApplicationController
  before_action :set_race_edition, only: %i[ show edit update destroy ]

  # GET /race_editions or /race_editions.json
  def index
    @race_editions = RaceEdition.all
  end

  # GET /race_editions/1 or /race_editions/1.json
  def show
  end

  # GET /race_editions/new
  def new
    @race_edition = RaceEdition.new
  end

  # GET /race_editions/1/edit
  def edit
  end

  # POST /race_editions or /race_editions.json
  def create
    @race_edition = RaceEdition.new(race_edition_params)

    respond_to do |format|
      if @race_edition.save
        format.html { redirect_to race_edition_url(@race_edition), notice: "Race edition was successfully created." }
        format.json { render :show, status: :created, location: @race_edition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @race_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /race_editions/1 or /race_editions/1.json
  def update
    respond_to do |format|
      if @race_edition.update(race_edition_params)
        format.html { redirect_to race_edition_url(@race_edition), notice: "Race edition was successfully updated." }
        format.json { render :show, status: :ok, location: @race_edition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @race_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_editions/1 or /race_editions/1.json
  def destroy
    @race_edition.destroy

    respond_to do |format|
      format.html { redirect_to race_editions_url, notice: "Race edition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race_edition
      @race_edition = RaceEdition.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def race_edition_params
      params.require(:race_edition).permit(:name, :slug, :start_date, :end_date)
    end
end

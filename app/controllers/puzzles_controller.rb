class PuzzlesController < ApplicationController
  before_action :set_puzzle, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show check]

  # GET /puzzles or /puzzles.json
  def index
    @puzzles = Puzzle.all
  end

  # GET /puzzles/1 or /puzzles/1.json
  def show
  end

  # GET /puzzles/new
  def new
    @puzzle = Puzzle.new
  end

  # GET /puzzles/1/edit
  def edit
  end

  # POST /puzzles or /puzzles.json
  def create
    @puzzle = Puzzle.new(puzzle_params)
    @puzzle.user = current_user

    respond_to do |format|
      if @puzzle.save
        format.html { redirect_to puzzle_url(@puzzle), notice: "Puzzle was successfully created." }
        format.json { render :show, status: :created, location: @puzzle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puzzles/1 or /puzzles/1.json
  def update
    respond_to do |format|
      if @puzzle.update(puzzle_params)
        format.html { redirect_to puzzle_url(@puzzle), notice: "Puzzle was successfully updated." }
        format.json { render :show, status: :ok, location: @puzzle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puzzles/1 or /puzzles/1.json
  def destroy
    @puzzle.destroy

    respond_to do |format|
      format.html { redirect_to puzzles_url, notice: "Puzzle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check
    @puzzle = Puzzle.find(params[:id])

    respond_to do |format|
      if @puzzle.it_phrase.downcase == params.dig(:puzzle_guess, :it_phrase)&.downcase
        format.html { redirect_to root_path, notice: "You guessed correctly!" }
      else
        format.html { redirect_to root_path, alert: "You guessed incorrectly!" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzzle
      @puzzle = Puzzle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def puzzle_params
      params.require(:puzzle).permit(:en_phrase, :it_phrase, :body, :thumbnail)
    end
end

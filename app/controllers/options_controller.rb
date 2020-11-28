class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:index, :new, :create, :edit]

  # GET /options
  # GET /options.json
  def index
    @options = Option.where(question_id: params[:question_id]).order("position")
  end

  # GET /options/1
  # GET /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    @option = Option.new(option_params)
    @option.question = @question

    respond_to do |format|
      if @option.save
        format.html { redirect_to exam_question_options_path(@question.exam, @question), notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to exam_question_options_path(@option.question.exam, @option.question), notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @question = @option.question
    @option.destroy
    respond_to do |format|
      format.html { redirect_to exam_question_options_path(@question.exam, @question), notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def option_params
      params.require(:option).permit(:content, :position, :is_correct, :question_id)
    end
end

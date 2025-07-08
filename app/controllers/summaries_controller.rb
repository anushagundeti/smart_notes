class SummariesController < ApplicationController
  before_action :set_summary, only: %i[ show edit update destroy ]

  # GET /summaries or /summaries.json
  def index
    @summaries = Summary.all
  end

  # GET /summaries/1 or /summaries/1.json
  def show
  end

  # GET /summaries/new
  def new
    @summary = Summary.new
  end

  # GET /summaries/1/edit
  def edit
  end

  # POST /summaries or /summaries.json
  def create
    @summary = current_user.summaries.build(summary_params)
    @summary.summary = SummaryGenerator.call(@summary.original_text)
    debugger
    if @summary.save
      redirect_to @summary, notice: "Summary created!"
    else
      render :new
    end
  end


  # PATCH/PUT /summaries/1 or /summaries/1.json
  def update
    respond_to do |format|
      if @summary.update(summary_params)
        format.html { redirect_to @summary, notice: "Summary was successfully updated." }
        format.json { render :show, status: :ok, location: @summary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1 or /summaries/1.json
  def destroy
    @summary.destroy!

    respond_to do |format|
      format.html { redirect_to summaries_path, status: :see_other, notice: "Summary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def summary_params
      params.expect(summary: [ :title, :original_text, :summary, :user_id ])
    end
end

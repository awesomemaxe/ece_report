class ReportCardsController < ApplicationController
  require 'json'
  before_action :set_report_card, only: [:show, :edit, :update, :destroy]

#-------------------------------------------------
# Use search conditions by search params for column names. 
# This allows urls like "contacts/list?company_id=5".
  def collection
    conditions = conditions_from_params
    @collection ||= end_of_association_chain.find(:all, :conditions => conditions)
  end
 
# Builds search conditions by search params for column names.
  def conditions_from_params
    conditions = nil
    params.reject {|key, value| [:controller, :action, :id].include?(key.to_sym)}.each do |key, value|
      next unless model.column_names.include?(key)
      if value.is_a?(Array)
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} in (?)", value])
      else
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} = ?", value])
      end
    end
    conditions
  end
 
  def merge_conditions(*conditions)
    c = conditions.find_all {|c| not c.nil? and not c.empty? }
    c.empty? ? nil : c.collect{|c| model.send(:sanitize_sql, c)}.join(' AND ')
  end

  #---------------------------------------------


  # GET /report_cards
  # GET /report_cards.json
  def index
    @report_cards = ReportCard.all
    @pbphdees = Student.find(:all, :params => {:degree=> 'pb-phd-ee'})
  
        @pb_phd_ee_count = 0;

    @pmphdees = Student.find(:all, :params => {:degree=> 'pm-phd-ee'})
       @pm_phd_ee_count = 0;

    @pbphdces = Student.find(:all, :params => {:degree=> 'pb-phd-ce'})
        @pb_phd_ce_count = 0;

    @pmphdces = Student.find(:all, :params => {:degree=> 'pm-phd-ce'})
        @pm_phd_ce_count = 0;
        @phd_count = 0

  end

  # GET /report_cards/1
  # GET /report_cards/1.json
  def show
  end

  # GET /report_cards/new
  def new
    @report_card = ReportCard.new
  end

  # GET /report_cards/1/edit
  def edit
  end

  # POST /report_cards
  # POST /report_cards.json
  def create
    @report_card = ReportCard.new(report_card_params)

    respond_to do |format|
      if @report_card.save
        format.html { redirect_to @report_card, notice: 'Report card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @report_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @report_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_cards/1
  # PATCH/PUT /report_cards/1.json
  def update
    respond_to do |format|
      if @report_card.update(report_card_params)
        format.html { redirect_to @report_card, notice: 'Report card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_cards/1
  # DELETE /report_cards/1.json
  def destroy
    @report_card.destroy
    respond_to do |format|
      format.html { redirect_to report_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_card
      @report_card = ReportCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_card_params
      params.require(:report_card).permit(:UID)
    end
end

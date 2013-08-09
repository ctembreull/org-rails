class DisabledPlayersController < ApplicationController
  before_action :set_disabled_player, only: [:show, :edit, :update, :destroy]

  # GET /disabled_players
  # GET /disabled_players.json
  def index
    @disabled_players = DisabledPlayer.all
  end

  # GET /disabled_players/1
  # GET /disabled_players/1.json
  def show
  end

  # GET /disabled_players/new
  def new
    @disabled_player = DisabledPlayer.new
  end

  # GET /disabled_players/1/edit
  def edit
  end

  # POST /disabled_players
  # POST /disabled_players.json
  def create
    @disabled_player = DisabledPlayer.new(disabled_player_params)

    respond_to do |format|
      if @disabled_player.save
        format.html { redirect_to @disabled_player, notice: 'Disabled player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disabled_player }
      else
        format.html { render action: 'new' }
        format.json { render json: @disabled_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disabled_players/1
  # PATCH/PUT /disabled_players/1.json
  def update
    respond_to do |format|
      if @disabled_player.update(disabled_player_params)
        format.html { redirect_to @disabled_player, notice: 'Disabled player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disabled_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disabled_players/1
  # DELETE /disabled_players/1.json
  def destroy
    @disabled_player.destroy
    respond_to do |format|
      format.html { redirect_to disabled_players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disabled_player
      @disabled_player = DisabledPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disabled_player_params
      params.require(:disabled_player).permit(:franchise_id, :player_id, :year, :length, :start_date, :end_date, :reason, :rehab)
    end
end

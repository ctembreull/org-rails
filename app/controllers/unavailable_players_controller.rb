class UnavailablePlayersController < ApplicationController
  before_action :set_unavailable_player, only: [:show, :edit, :update, :destroy]

  # GET /unavailable_players
  # GET /unavailable_players.json
  def index
    @unavailable_players = UnavailablePlayer.all
  end

  # GET /unavailable_players/1
  # GET /unavailable_players/1.json
  def show
  end

  # GET /unavailable_players/new
  def new
    @unavailable_player = UnavailablePlayer.new
  end

  # GET /unavailable_players/1/edit
  def edit
  end

  # POST /unavailable_players
  # POST /unavailable_players.json
  def create
    @unavailable_player = UnavailablePlayer.new(unavailable_player_params)

    respond_to do |format|
      if @unavailable_player.save
        format.html { redirect_to @unavailable_player, notice: 'Unavailable player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unavailable_player }
      else
        format.html { render action: 'new' }
        format.json { render json: @unavailable_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unavailable_players/1
  # PATCH/PUT /unavailable_players/1.json
  def update
    respond_to do |format|
      if @unavailable_player.update(unavailable_player_params)
        format.html { redirect_to @unavailable_player, notice: 'Unavailable player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unavailable_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unavailable_players/1
  # DELETE /unavailable_players/1.json
  def destroy
    @unavailable_player.destroy
    respond_to do |format|
      format.html { redirect_to unavailable_players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unavailable_player
      @unavailable_player = UnavailablePlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unavailable_player_params
      params.require(:unavailable_player).permit(:franchise_id, :player_id, :year, :length, :start_date, :end_date, :reason)
    end
end

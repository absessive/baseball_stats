class PlayersController < ApplicationController

  def index
    @players_grid = initialize_grid(Player, per_page: 25,
                                    order: 'players.average',
                                    order_direction: 'desc')
  end
end

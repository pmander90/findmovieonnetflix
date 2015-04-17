class PicksController < ApplicationController
	before_action :authenticate_user!
	def index
		@picks = current_user.picks.all
	end

	def show
		@pick = Pick.find(params[:id])
	end

	def new
		@pick = Pick.new
	end

	def edit
		@pick = Pick.find(params[:id])
	end

	def create 
		movie = infor(pick_params)
		@pick = current_user.picks.new(movie)
		if @pick
			redirect_to picks_path
		else
			render :new
		end
	end

	def update
		movie = infor(pick_params)
		@pick = Pick.find(params[:id])
		if @pick.update(movie)
			redirect_to pick_path
		else
			render :edit
		end
	end

	private

		def pick_params
			params.require(:pick).permit(:past)
		end

		def infor title
			title=title[:past].split.join("%20")
			response = HTTParty.get("http://netflixroulette.net/api/api.php?title=#{title}").parsed_response
		end

end

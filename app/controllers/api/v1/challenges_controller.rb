module Api
  module V1
    class ChallengesController < ApplicationController

      before_action :set_challenge, only: [:show, :update, :destroy]

      # GET /api/v1/challenges
      def index
        @challenges = Challenge.all
        render json: @challenges, status: :ok
      end

      # GET /api/v1/challenges/:id
      def show
        render json: @challenge, status: :ok
      end

      # POST /api/v1/challenges
      def create
        @challenge = Challenge.new(challenge_params)

        if @challenge.save
          render json: @challenge, status: :created
        else
          render json: @challenge.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/challenges/:id
      def update
        if @challenge.update(challenge_params)
          render json: @challenge, status: :ok
        else
          render json: @challenge.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/challenges/:id
      def destroy
        @challenge.destroy
        head :no_content 
      end


      private

      def set_challenge
        @challenge = Challenge.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Challenge not found" }, status: :not_found
      end

      
      def challenge_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end
      
    end
  end
end
module Api
  class PalacesController < ApplicationController
    before_action :load_resource

    def index
      palaces = Palace.order(created_at: :desc)
      render json: palaces
    end

    def create
      palace = Palace.new(palace_params)
      palace[:held_by] = "fdssf"
      if palace.save!
        render json: palace
      else
        render json: palace.errors
      end
    end

    private
      def load_resource
        case params[:action].to_sym
        when :update
          @palace = Palace.new(palace_params)
        end
      end

      def palace_params
        params.require(:palace).permit(:originalID, :name, :created_by, :group1, :group2, :group3)
      end
  end
end
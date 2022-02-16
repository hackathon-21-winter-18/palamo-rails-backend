module Api
  class PalacesController < ApplicationController
    # before_action :load_resource

    def index
      palaces = Palace.order(created_at: :desc)
      render json: palaces
    end

    def create
      @format = PalaceEmbededPin.new(format_params)
      palace, pins = @format.save
      render json: palace
    rescue => err
      render json: err
    end

    private
      def format_params
        # 配列は最後にかかないといけないらしい
        params.permit(
          :name,
          :created_by,
          :group1,
          :group2,
          :group3,
          embeded_pins: [:number, :x, :y, :word, :place, :situation, :group_number]
        )
      end
  
    # def create
    #   palace = Palace.new(palace_params)
    #   palace[:held_by] = "fdssf"
    #   puts palace[:embeded_pins]
    #   puts "aaaaaaaaaaaaaaaa"
    #   embeded_pin = EmbededPin.new(number: 2)
    #   puts embeded_pin
    #   # embeded_pins = EmbededPin.new(embeded_pins_params)
    #   palace.save!
    #   embeded_pin.save!
    #   # embeded_pins.save!

    #   render json: {data: palace}
    # rescue => err
    #   render json: err
    # end

    # private
    #   def load_resource
    #     case params[:action].to_sym
    #     when :update
    #       @palace = Palace.new(palace_params)
    #     end
    #   end

      def palace_params
        params.require(:palace).permit(
          :originalID,
          :name,
          :created_by,
          :group1,
          :group2,
          :group3,
          :embeded_pins
        )
      end

      def embeded_pins_params
        params.require(:palace).permit(embeded_pins: [:number])
      end
  end
end
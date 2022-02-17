module Api
  class PalacesController < ApplicationController
    # before_action :load_resource

    def index
      palaces = Palace.order(created_at: :desc)
      render json: palaces
    end

    def create
      @format = PalaceEmbededPin.new(format_params)
      @palace, @embeded_pins = @format.save
      render json: format_json
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
          embeded_pins: [
            :number,
            :x,
            :y,
            :word,
            :place,
            :situation,
            :group_number
          ]
        ).merge(held_by: session[:user][:id])
      end
      def format_json
        return {
          id: @palace.id,
          originalID: @palace.originalID,
          name: @palace.name,
          created_by: @palace.created_by,
          held_by: @palace.held_by,
          number_of_embeded_pins: @palace.number_of_embeded_pins,
          share: @palace.share,
          saved_count: @palace.saved_count,
          shared_at: @palace.shared_at,
          firstshared: @palace.firstshared,
          first_shared_at: @palace.firstshared_at,
          group1: @palace.group1,
          group2: @palace.group2,
          group3: @palace.group3,
          created_at: @palace.created_at,
          updated_at: @palace.updated_at,
          embeded_pins: @embeded_pins
        }
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

      # def palace_params
      #   params.require(:palace).permit(
      #     :originalID,
      #     :name,
      #     :created_by,
      #     :group1,
      #     :group2,
      #     :group3,
      #     :embeded_pins
      #   )
      # end

      # def embeded_pins_params
      #   params.require(:palace).permit(embeded_pins: [:number])
      # end
  end
end
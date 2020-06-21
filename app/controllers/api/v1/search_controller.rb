# frozen_string_literal: true

module Api
  module V1
    # search controller by rut or name
    class SearchController < ApplicationController
      def index
        @rut = params[:rut]
        @first_name = params[:first_name]
        @paternal = params[:paternal]
        @maternal = params[:maternal]
        if @rut
          search_by_rut
        elsif @first_name && @paternal || @first_name && @maternal
          search_by_name_last_name
        end
      end

      private

      def search_by_rut
        result = Person.by_rut(@rut).exclude_params
        render_result(result)
      end

      def search_by_name_last_name
        result = Person.by_complete_name(@first_name, @paternal, @maternal)
                       .exclude_params
        render_result(result)
      end

      def render_result(result)
        render json: result.empty? ? { msg: 'Search: Not found' } : { data: result }
      end

      def search_params
        params.permit(:rut, :first_name, :paternal, :maternal)
      end
    end
  end
end

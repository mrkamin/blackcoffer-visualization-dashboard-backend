class Api::DataEntriesController < ApplicationController
    def index
        @data_entries = DataEntry.all
        render json: @data_entries
      end
    
      def show
        @data_entry = DataEntry.find(params[:id])
        render json: @data_entry
      end
end

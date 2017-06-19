class BusinessesController < ApplicationController
helper_method :sort_column, :sort_direction

def index
  # byebug
  @businesses = Business.search(params[:search]).order(sort_column + " " + sort_direction)
  # @businesses = Business.all
  # @businesses = Business.all.paginate(:per_page => 50, :page => params[:page])
end

def import
Business.import(params[:file])
redirect_to root_url, notice: 'Products imported.'

end

def destroy
    Business.reset_pk_sequence
end

private

def sort_column
  Business.column_names.include?(params[:sort]) ? params[:sort] : "name"
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

end

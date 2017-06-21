class BusinessesController < ApplicationController

def index
  @searches = Search.all
  @search_initialize = Business.search(params[:q])
  @businesses = @search_initialize.result.paginate(:per_page => 50, :page => params[:page])
  @search_initialize.build_condition

  if !Search.find_by(query: request.fullpath).nil?
    @search = Search.find_by(query: request.fullpath)
  elsif params[:existing_search] != nil
    @search = Search.find(params[:existing_search])
    @search.update(query: request.fullpath)
  end
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

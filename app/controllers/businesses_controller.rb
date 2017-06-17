class BusinessesController < ApplicationController

def index
  byebug
  @businesses = Business.search(params[:search])
  # @businesses = Business.all
end

def import
Business.import(params[:file])
redirect_to root_url, notice: 'Products imported.'

end

def destroy
    Business.reset_pk_sequence
end

end

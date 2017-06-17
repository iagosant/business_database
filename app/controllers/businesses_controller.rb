class BusinessesController < ApplicationController

def index
  @businesses = Business.all
  byebug
end

def import
Business.import(params[:file])
redirect_to root_url, notice: 'Products imported.'

end

def destroy
    Business.reset_pk_sequence
end

end

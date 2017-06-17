class BusinessesController < ApplicationController

def index

end

def import
Business.import(params[:file])
redirect_to root_url, notice: 'Products imported.'

end

end

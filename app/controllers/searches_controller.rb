class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update]

  def new
    byebug
    @new_search = Search.new(:query => params[:path], :name => params[:searches][:name])
      respond_to do |format|
      if @new_search.save
        format.html { redirect_to(:back) }
      else
        format.html { redirect_to(:back) }
      end
    end
  end

  def destroy
    @search = Search.find(params[:id])
    @search.delete
    Search.reset_pk_sequence
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end

def edit
end

  def update
byebug
  end

  def show
    # byebug
    # session[:current_search] = Search.find(params[:id])
    # @search.query
    redirect_to @search.query
  end

private

  def set_search
   @search = Search.find(params[:id])
  end

end

class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_category, only: [:show,]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.paginate(page: params[:page], per_page: 30)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end
end

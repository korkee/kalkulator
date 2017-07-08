class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @meals = Meal.where(user_id: current_user.id)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.build(meal_params)

    respond_to do |format|
      if @meal.save
        @meal.products << Product.find(meal_params["product_ids"].reject!{|id| id.blank?})
        format.html { redirect_to meals_path, notice: 'Meal created' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produkties/1
  # DELETE /produkties/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:name, :description, :sort, product_ids: [])
    end
end

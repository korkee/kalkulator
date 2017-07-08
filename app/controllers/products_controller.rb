class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  # GET /produkties/1
  # GET /produkties/1.json
  def show
  end

  # GET /produkties/new
  def new
   @product = current_user.products.build

  end

  # GET /produkties/1/edit
  def edit
  end

  # POST /produkties
  # POST /produkties.json
  def create
    @product = current_user.products.build(products_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produkt  utworzony pomyślnie' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produkties/1
  # PATCH/PUT /produkties/1.json
  def update
    respond_to do |format|
      if @product.update(products_params)
        format.html { redirect_to @product, notice: 'Produkty was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produkties/1
  # DELETE /produkties/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produkty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_params
      params.require(:product).permit(:name, :calories, :carbohydrates, :protein, :fat, :weight)
    end
    def correct_user
     @product = current_user.products.find_by(id: params[:id])
     redirect_to products_path, notice: "Nie jesteś uprawniony do edycji tego produktu" if @product.nil?
    end
end

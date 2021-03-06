class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    respond_to do |format|
      format.html
      format.js { render status: :created, location: @category }
    end
    @category = Category.new
    @categories = Category.all
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.js {render layout: false}
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    
    respond_to do |format|
      if @category.update(category_params) && @category.privacy == true
        @sub_categories = SubCategory.where(category_id: @category.id)
        @sub_categories.each do |sub_category|
          sub_category.update(privacy: true)
        end
        format.html { redirect_to new_category_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      elsif @category.update(category_params) && @category.privacy == false
        @sub_categories = SubCategory.where(category_id: @category.id)
        @sub_categories.each do |sub_category|
          sub_category.update(privacy: false)
        end
        format.html { redirect_to new_category_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to new_category_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :privacy, :bookmark_id)
    end
end

class ApisController < ApplicationController
  before_action :set_api, only: [:show, :edit, :update, :destroy]

  # GET /apis
  # GET /apis.json
  def news
    @sub_categories = SubCategory.all
    @urls = Url.all
    @categories = Category.all
    @bookmarks = Bookmark.all
    @bookmarks_api = []
    
    

    @bookmarks.each do |bookmark|
      @bookmarks_api_inner_hash = {"Type" => "Bookmark"}
      @bookmarks_api_inner_hash.merge!("id" => bookmark.id)
      @bookmarks_api_inner_hash.merge!("Name" => bookmark.name)
      @bookmarks_api_inner_hash.merge!("Categories Count" => bookmark.categories.count)
     
      @bookmarks_api << (@bookmarks_api_inner_hash)
    end
    
   
    @categories.each do |category|
      @categories_inner_hash = {"Type" => "Category"}
      @categories_inner_hash.merge!("id" => category.id)
      @categories_inner_hash.merge!("Name" => category.name)
      @categories_inner_hash.merge!("Number of Sub Categories" => category.sub_categories.count)
      @categories_inner_hash.merge!("Number of Urls" => category.urls.count)
     
      @bookmarks_api << (@categories_inner_hash)
    end

    @sub_categories.each do |sub_category|
      @sub_categories_inner_hash = {"Type" => "Sub Category"}
      @sub_categories_inner_hash.merge!("id" => sub_category.id)
      @sub_categories_inner_hash.merge!("Name" => sub_category.name)
      @sub_categories_inner_hash.merge!("Number of Urls" => sub_category.urls.count)
     
      @bookmarks_api << (@sub_categories_inner_hash)
    end
    
    @finalapi = @bookmarks_api


   
    render :json => @finalapi

  end

  # GET /apis/1
  # GET /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to @api, notice: 'Api was successfully created.' }
        format.json { render :show, status: :created, location: @api }
      else
        format.html { render :new }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1
  # PATCH/PUT /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to @api, notice: 'Api was successfully updated.' }
        format.json { render :show, status: :ok, location: @api }
      else
        format.html { render :edit }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    respond_to do |format|
      format.html { redirect_to apis_url, notice: 'Api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_params
      params.fetch(:api, {})
    end

    def bookmark_params
      params.require(:bookmark).permit(:name)
    end

    def category_params
      params.require(:category).permit(:name, :privacy, :bookmark_id)
    end

    def sub_category_params
      params.require(:sub_category).permit(:name, :privacy, :category_id)
    end
    
    def url_params
      params.require(:url).permit(:url_name, :urlable_id, :urlable_type)
    end
end

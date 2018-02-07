class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
        @categories = Category.new(categories_params)
        if @categories.save
          flash[:notice] = 'Category Created'
            redirect_to categories_path
        else
            render new
        end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	# @category = Category.update_attributes(categories_params)
    if @category.update_attributes(categories_params)
        flash[:notice] = 'Category created'
        redirect_to category_path
    else
        render new
    end
  end

  def show
  	@category = Category.find(params[:id])
  end

   def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:delete] = 'Category deleted'
    redirect_to categories_path
  end

  private
  		def categories_params
            params.require(:category).permit(:name)
        end

end

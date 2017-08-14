class CategoriesController < ApplicationController

	before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index
		@category = Category.all.order("created_at DESC")
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(categories_params)

		if @category.save
			redirect_to @category 
		else
			render "New"
		end
	end

	def edit
	end

	def update
		if @category.update(categories_params)
			redirect_to @category 
		else
			render "Edit"
		end
	end

	def destroy
		@category.destroy
		redirect_to root_path
	end

	private

	def categories_params
		params.require(:category).permit(:name, :user_id)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end

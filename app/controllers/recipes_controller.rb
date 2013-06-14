class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
      @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to "/recipe/index"
    else
      render "recipes/new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to"recipes/index"
    else
      render :edit
    end
  end


  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

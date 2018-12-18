class DishesController < ApplicationController
  def index
    dishes=Dish.all
    render json: {status: 'SUCCESS', message:'Loaded Dishes', data:dishes}, status: :ok
  end

  def show
    dish=Dish.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded Dish', data:dish}, status: :ok
  end

  def create
    dish=Dish.new(dish_params)
    if dish.save
      render json: {status: 'SUCCESS', message:'The dish was saved', data:dish}, status: :ok
    else
        render json: {status: 'ERROR', message:'The dish was not saved', data:dish.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    dish=Dish.find(params[:id])
    dish.destroy
    render json: {status: 'SUCCESS', message:'The dish was deleted'}, status: :ok
  end

  def update
    dish=Dish.find(params[:id])
    if dish.update_attributes(dish_params)
      render json: {status: 'SUCCESS', message:'The dish was updated', data:dish}, status: :ok
    else
      render json: {status: 'ERROR', message:'The dish was not updated', data:dish.errors}, status: :unprocessable_entity
    end
  end

  private

  def dish_params
    params.permit(:name, :description)
  end
end

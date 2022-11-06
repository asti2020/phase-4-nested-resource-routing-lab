class ItemsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
      render json: item, include: :user
  end

  def create
    item = Item.find_by(id: params[:id])
    item.update(item_params).(user_id: params[:user_id])
    render json: item, include: :user_id
  end

private

  # def render_not_found_response(responce)
  #   render json: { error: "#{responce.model} not found" }, status: :not_found
  # end
      def item_params
        params.permit(:name, :description, :price)
      end
end

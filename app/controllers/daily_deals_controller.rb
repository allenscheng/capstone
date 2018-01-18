class DailyDealsController < ApplicationController

  def index2 
    deal = DailyDeal.all.order(:id => :asc)
    render json: deal.as_json 
  end

  def index
    deal = DailyDeal.all.order(:id => :asc)
    # render json: deal.as_json
    response = Unirest.get("http://api.walmartlabs.com/v1/trends?format=json&apiKey=#{ENV["WALMART_API_KEY"]}")
    result = response.body["items"]
    render json: [result, deal].as_json
  end

  def search 
    search_term = params[:search_term]
    response = Unirest.get("http://api.walmartlabs.com/v1/search?query=#{search_term}&format=json&apiKey=#{ENV["WALMART_API_KEY"]}")
    render json: response.body["items"]
  end

  def create
    deal = DailyDeal.new(
      user_id: current_user.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
      color: params[:color],
      product_link: params[:product_link]
      )
    if deal.save
      render json: {status: "New Deal successfully created!"}, status: :created 
    else
      render json: {status: deal.errors.full_messages}, status: :bad_request
    end
  end

  def update
    deal = Deal.find_by(id: params[:id])
    deal.name = params[:name] || deal.name
    deal.description = params[:description] || deal.description
    deal.price = params[:price] || deal.price 
    deal.color = params[:color] || deal.color
    deal.product_link = params[:prodcut_link] || deal.product_link
    render json: deal.as_json
    if deal.save 
      render json: deal.as_json
    else
      render json: {errors: deal.errors.full_messages}, status: :bad_request
    end
  end

  def destroy 
    deal = Deal.find_by(id: params[:id])
    deal.destroy 
    render json: {message: "The deal has been removed!"}
  end




end

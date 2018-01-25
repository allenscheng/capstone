class DailyDealsController < ApplicationController

  def index2 
    deal = DailyDeal.all.order(:id => :asc)
    render json: deal.as_json 
  end

  def index
    deal = DailyDeal.all.order(:id => :DESC)
    response = Unirest.get("http://api.walmartlabs.com/v1/trends?format=json&apiKey=#{ENV["WALMART_API_KEY"]}")
    result = response.body["items"]
    render json: [result, deal].as_json
  end

  def search 
    search_term = params[:search_term]
    response = Unirest.get("http://api.walmartlabs.com/v1/search?query=#{search_term}&numItems=20&format=json&apiKey=#{ENV["WALMART_API_KEY"]}")
    # pp response.body["items"][0]["productUrl"]
    render json: response.body["items"]
  end

  # def create
  #   deal = DailyDeal.new(
  #     user_id: current_user.id,
  #     name: params[:name],
  #     description: params[:description],
  #     msrp: params[:msrp],
  #     color: params[:color],
  #     product_link: params[:product_link],
  #     )
  #   if deal.save
  #     render json: {status: "New Deal successfully created!"}, status: :created 
  #   else
  #     render json: {status: deal.errors.full_messages}, status: :bad_request
  #   end
  # end

  def create_url
    #create a daily deal by using a url
    page = MetaInspector.new(params[:product_link])
    deal = DailyDeal.new( 
      user_id: current_user.id,
      name: params[:name],
      msrp: params[:msrp],
      product_link: page.url,
      image: page.images.best
      )
    if deal.save  
      render json: {status: "Successfully created a new wishlist item!"}
    else 
      render json: {errors: deal.errors.full_messages}, status: :bad_request
    end
  end

  def update
    deal = Deal.find_by(id: params[:id])
    deal.name = params[:name] || deal.name
    deal.description = params[:description] || deal.description
    deal.msrp = params[:msrp] || deal.msrp 
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

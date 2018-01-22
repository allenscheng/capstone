class WishListsController < ApplicationController

  require "pp"

  def index
    list = WishList.all.order(:id => :asc)
    render json: list.as_json 
  end

  def create
    page = MetaInspector.new(params[:product_link])
    # pp page.title 
    # pp page.url
    # pp page.images.best
    list = WishList.new( 
      user_id: current_user.id,
      name: page.title,
      product_link: page.url,
      image: page.images.best
      )
    if list.save  
      render json: {status: "Successfully created a new wishlist item!"}
    else 
      render json: {errors: list.errors.full_messages}, status: :bad_request
    end
  end

  def show
    list = WishList.find_by(:id, params[:id])
    render json: list.as_json 
  end

  def update
    list = WishList.find_by(:id, params[:id])
    list.product_link = params[:product_link] || list.product_link
  end

  def destroy
    list = WishList.find_by(:id, params[:id]) 
    list.destroy
    render json: {message: "Wishlist item has been removed!"}
  end

  def image 
    require "google/cloud/vision"
    require "google/cloud/storage"
    # Imports the Google Cloud client library
    # Your Google Cloud Platform project ID
    project_id = "capstone-189322"
    key_file = "/Users/Allen/Downloads/Capstone-131b4b8035f7.json"
    storage = Google::Cloud::Storage.new project: project_id, keyfile: key_file
    # Instantiates a client
    vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file
    # The name of the image file to annotate
    # file_name = "/Users/Allen/Downloads/cup.jpeg"
    # image_path = params[:product_link]
    image_path = "/Users/Allen/Downloads/cup.jpeg"
    image  = vision.image image_path
    web = image.web
    new_array = []
    index = 0
    web_length = web.pages_with_matching_images.length 
    web_length.times do
      new_array << web.pages_with_matching_images[index].grpc['url']
      index += 1 
    end

    render json: new_array
    # puts web.methods

    # Performs label detection on the image file
    # web = vision.image(file_name).labels
  end

end

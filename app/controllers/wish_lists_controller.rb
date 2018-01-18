class WishListsController < ApplicationController
  require "pp"
  def index
    list = WishList.all.order(:id => :asc)
    render json: list.as_json 
  end
  def create
    page = MetaInspector.new(params[:product_link])
    # pp page.url
    # pp page.images.best
    list = WishList.new( 
      user_id: current_user.id,
      name: page.title,
      product_link: page.url 
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
    images = []
    require "google/cloud/vision"
    require "google/cloud/storage"
    # Imports the Google Cloud client library
    # Your Google Cloud Platform project ID
    project_id = "capstone-189322"
    key_file = "/Users/Allen/Downloads/Capstone-df5d1819a886.json"
    storage = Google::Cloud::Storage.new project: project_id, keyfile: key_file
    storage.buckets.each do |bucket|
      puts bucket.name
    end
    # Instantiates a client
    vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file
    # The name of the image file to annotate
    file_name = "/Users/Allen/Downloads/cup.jpeg"
    image_path = "/Users/Allen/Downloads/cup.jpeg"

    # Performs label detection on the image file
    web = vision.image(file_name).labels
    image  = vision.image image_path
    web = image.web
    # web.entities.each do |entity|
    #   puts entity.description
    # end
    render json: web.full_matching_images
    # .each do |image|
    #   images << image.url
    # end
    # pp images
  # render json: images.as_json

  end
end

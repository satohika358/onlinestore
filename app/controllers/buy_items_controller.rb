class BuyItemsController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_buy_item, only: [:show, :edit, :update, :destroy]

  # GET /buy_items
  # GET /buy_items.json
  def index
    @buy_items = BuyItem.all
  end

  # GET /buy_items/1
  # GET /buy_items/1.json
  def show
  end

  # GET /buy_items/new
  def new
    @buy_item = BuyItem.new
  end

  # GET /buy_items/1/edit
  def edit
  end

  # POST /buy_items
  # POST /buy_items.json
  def create
    item = Item.find(params[:item_id])
    @buy_item = @cart.add_item(item)

    respond_to do |format|
      if @buy_item.save
        format.html { redirect_to store_index_url, notice: 'Buy item was successfully created.' }
        format.js { @current_item = @buy_item }
        format.json { render :show, status: :created, location: @buy_item }
      else
        format.html { render :new }
        format.json { render json: @buy_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /buy_items/1
  # PATCH/PUT /buy_items/1.json
  def update
    respond_to do |format|
      if @buy_item.update(buy_item_params)
        format.html { redirect_to @buy_item, notice: 'Buy item was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @buy_item }
      else
        format.html { render :edit }
        format.json { render json: @buy_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_items/1
  # DELETE /buy_items/1.json
  def destroy
    item = @cart.remove_item(@buy_item)
    if item == nil
      @buy_item.destroy
    else
      @buy_item = item
    end
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: 'Buy item was successfully destroyed.' }
      format.js { @current_item = @buy_item }
      format.json { head :no_content }
    end
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid cart'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_item
      @buy_item = BuyItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_item_params
      params.require(:buy_item).permit(:item_id, :cart_id)
    end
end

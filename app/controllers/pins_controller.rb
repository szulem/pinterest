class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :userpin]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
  
  def mypins
    @pins = current_user.pins.order("created_at DESC")
  end
  
  def userpin
    #@pins = current_user.pins
    @users = User.all
    @user = User.find(params[:user])
    @pin = @user.pins
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    
  end

  # GET /pins/new
  def new
    #pin = Pin.new
    @pin = current_user.pins.build
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    #@pin = Pin.new(pin_params)
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #upvote from user
  def upvote
    @pin.upvote_from current_user
    redirect_to :back
  end
  
  #downvote from user
  def downvote
    @pin.downvote_from current_user
    redirect_to :back
  end
  
  

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :name)
    end
    
    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "You can edit only your pins." if @pin.nil?
    end
end

class AlbumnsController < ApplicationController
  before_action :set_albumn, only: [:show, :edit, :update, :destroy]

  # GET /albumns
  # GET /albumns.json
  def index
    @albumns = Albumn.all
  end

  # GET /albumns/1
  # GET /albumns/1.json
  def show
     @albumn = Albumn.find(params[:id])
     

  end

  # GET /albumns/new
  def new
    @albumn = Albumn.new
  end

  # GET /albumns/1/edit
  def edit
  end

  # POST /albumns
  # POST /albumns.json
  def create
    @albumn = Albumn.new(albumn_params)

    respond_to do |format|
      if @albumn.save
        format.html { redirect_to @albumn, notice: 'Albumn was successfully created.' }
        format.json { render :show, status: :created, location: @albumn }
      else
        format.html { render :new }
        format.json { render json: @albumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albumns/1
  # PATCH/PUT /albumns/1.json
  def update
    respond_to do |format|
      if @albumn.update(albumn_params)
        format.html { redirect_to @albumn, notice: 'Albumn was successfully updated.' }
        format.json { render :show, status: :ok, location: @albumn }
      else
        format.html { render :edit }
        format.json { render json: @albumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albumns/1
  # DELETE /albumns/1.json
  def destroy
    @albumn.destroy
    respond_to do |format|
      format.html { redirect_to albumns_url, notice: 'Albumn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_albumn
      @albumn = Albumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def albumn_params
      params.require(:albumn).permit(:name, :photo_albumn)
    end
end

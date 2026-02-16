class PropertiesController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties or /properties.json
  def index
    @properties = Property.order(precio: :desc)
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
def create
  @property = Property.new(property_params)

  # 👇 esto sube la imagen a Cloudinary y guarda la URL en photo
  if params[:file].present?
    upload = Cloudinary::Uploader.upload(params[:file])
    @property.photo = upload["url"]
  end

  if @property.save
    redirect_to @property, notice: "Propiedad creada con éxito."
  else
    render :new, status: :unprocessable_entity
  end
end 


  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy!

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:direccion, :colonia, :cuartos, :banos, :extras, :precio, photos: [])
    end
end

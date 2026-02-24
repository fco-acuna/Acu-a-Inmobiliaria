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
    # Filtra y prepara los parámetros
    filtered_params = property_params
    
    # Maneja las fotos por separado
    photos_array = params[:property][:photos]
    if photos_array.present?
      # Filtra strings vacíos y objetos blank
      valid_photos = photos_array.select { |photo| photo.present? && photo.respond_to?(:tempfile) }
      filtered_params[:photos] = valid_photos
    else
      filtered_params.delete(:photos)
    end

    @property = Property.new(filtered_params)

    if @property.save
      redirect_to @property, notice: "Propiedad creada con éxito."
    else
      flash.now[:alert] = @property.errors.full_messages.join(", ")
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
    
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:direccion, :colonia, :cuartos, :banos, :extras, :precio)
    end
end

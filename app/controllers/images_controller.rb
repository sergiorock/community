class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.where user_id: current_user.id
  end

  def new
    # Muestra el formulario para crear una nueva imagen
    @image = Image.new #Creo un objeto vacío de tipo imagen. Sirve para cargar el form partial
  end

  def edit
  end

  def update
    @image.update image_params
    redirect_to @image
  end

  def create
    @image = current_user.images.new image_params
    # Se encarga de recibir toda la información que venga de nuestro formularioy hacer lo que querramos con ella.
    # En este caso esa información nos va a servir para crear una nueva imagen y almacenarla en la DB.
    #render plain: params[:image].inspect #Muestra si realmente recibimos los parámetros
    #@image = Image.new image_params #Creo un obejo Image (una nueva imagen) y lo guardo en la viariable @image recibiendo los parámetros específicados abajo.
    if @image.save # En este momento rails guarda la imagen en la DB.
      return redirect_to images_path #Después de crear la imagen, me redirecciona al pat de ella (show)
    end

    render :new #si no guarda la imagen en el paso anterior me redirije al fomr de create
  end

  def show
    #Busco la imagen por Id (set_image) Especifico el nombre del modelo, utilizo el metodo find, luego le paso como parametro el Id
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  #Parámetros fuertes
  def image_params
    params.require(:image).permit :description, :picture #Permite crear una imagen, pasandole solo como parámetro la description y una picture obviando los demas campos de la tabla images
  end

  def set_image
    @image = Image.find params[:id] #Busca la imagen por parámetro
  end

end

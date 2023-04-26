class WarehousesController < ApplicationController

  def show

    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end 

  def create
 
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description,
                                                       :address, :cep, :area)
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save()
      #flash[:notice] = "Galpão cadastrado com sucesso!"
      redirect_to root_path, notice: 'Galpão cadastrado com sucesso!'
    else 
      flash.now[:notice] = "Galpão não cadastrado."
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description,
                                                       :address, :cep, :area)
    if @warehouse.update(warehouse_params)
    redirect_to warehouse_path(@warehouse.id), notice: 'Galpão editado com sucesso'
    else 
      flash[:notice] = "Não foi possível atualizar o galpão"
      render 'edit' 
    end
  end
end
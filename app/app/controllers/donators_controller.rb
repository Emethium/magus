class DonatorsController < ApplicationController
  def new
    @donator = Donator.new
  end

  def create
    @donator = Donator.new(donator_params)
    if @donator.save
      flash[:success] = "O doador foi cadastrado com sucesso!"
      redirect_to @donator
    else
      flash[:success] = "Ehr, alguma coisa deu errado!"
      render 'new'
    end
  end

  def show
    @donator = Donator.find(params[:id])
  end

  def index
    @donators = Donator.all
  end

  private
    def donator_params
      params.require(:donator).permit(:name, :sex, :address, :phone, :bloodType,
                                      :rhFactor, :age)
    end

end

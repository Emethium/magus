class DonatorsController < ApplicationController
  def new
    @donator = Donator.new
  end

  def create
    @donator = Donator.new(full_donator_params)
    if @donator.save
      flash[:success] = "O doador foi cadastrado com sucesso!"
      redirect_to @donator
    else
      flash[:error] = "Ehr, alguma coisa deu errado!"
      puts @donator.errors.full_messages
      render 'new'
    end
  end

  def show
    @donator = Donator.find(params[:id])
  end

  def index_apt
    @donators = Donator.where("lastDonation <= ?", 3.months.ago)
  end

  def index_bloodo
    @donators = Donator.where("bloodType = ?", "0")
  end

  def index_blooda
    @donators = Donator.where("bloodType = ?", "A")
  end

  def index_bloodb
    @donators = Donator.where("bloodType = ?", "B")
  end

  def index_bloodab
    @donators = Donator.where("bloodType = ?", "AB")
  end

  def index
    @donators = Donator.all
    @donators = @donators.names(params[:name]) if params[:name].present?
    @donators = @donators.sexes(params[:sex]) if params[:sex].present?
    @donators = @donators.bloodTypes(params[:bloodType]) if params[:bloodType].present?
    @donators = @donators.rhFactors(params[:rhFactor]) if params[:rhFactor].present?
    @donators = @donators.cities(params[:city]) if params[:city].present?
  end

  def edit
    @donator = Donator.find(params[:id])
  end

  def mail_apt
    @donators = Donator.where("lastDonation <= ?", 3.months.ago)
  end

  def search
    @donators = Donator.all
    @donators = @donators.names(params[:name]) if params[:name].present?
    @donators = @donators.sexes(params[:sex]) if params[:sex].present?
    @donators = @donators.bloodTypes(params[:bloodType]) if params[:bloodType].present?
    @donators = @donators.rhFactors(params[:rhFactor]) if params[:rhFactor].present?
    @donators = @donators.cities(params[:city]) if params[:city].present?
  end

  def update
    @donator = Donator.find(params[:id])
    if @donator.update_attributes(full_donator_params)
      flash[:success] = "Cadastro atualizado com sucesso!"
      redirect_to @donator
    else
      flash[:error] = "Erh, algum erro ocorreu. Tente novamente!"
      render 'edit'
    end
  end

  private
    def donator_params
      params.require(:donator).permit(:name, :sex, :address, :phone, :bloodType,
                                      :rhFactor, :age)
    end

    def full_donator_params
      params.require(:donator).permit(:name, :sex, :address, :phone, :bloodType,
                                      :rhFactor, :age, :lastDonation, :city)
    end

end

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

  def index
    @donators = Donator.all
    @donators = @donators.names(params[:name]) if params[:name].present?
    @donators = @donators.sexes(params[:sex]) if params[:sex].present?
    @donators = @donators.bloodTypes(params[:bloodType]) if params[:bloodType].present?
    @donators = @donators.rhFactors(params[:rhFactor]) if params[:rhFactor].present?
    @donators = @donators.cities(params[:city]) if params[:city].present?
    @donators = @donators.apts(params[:apt]) if params[:apt].present?
  end

  def edit
    @donator = Donator.find(params[:id])
  end

  def mail_apt
    @donators = Donator.where("lastDonation <= ?", 3.months.ago)
  end

  def mail_donator
    @donators = Donator.all
    @donators = @donators.names(params[:name]) if params[:name].present?
    @donators = @donators.sexes(params[:sex]) if params[:sex].present?
    @donators = @donators.bloodTypes(params[:bloodType]) if params[:bloodType].present?
    @donators = @donators.rhFactors(params[:rhFactor]) if params[:rhFactor].present?
    @donators = @donators.cities(params[:city]) if params[:city].present?
    @donators = @donators.apts(params[:apt]) if params[:apt].present?

    @sms_models = SmsModel.all
  end

  def search

  end

  def lot_search

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

class DonationsController < ApplicationController
  def new
    @donation = Donation.new
    @donators = Donator.all
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:success] = "Nova doação cadastrada com sucesso!"
      redirect_to donations_path
    else
      flash[:error] = "Ehr, alguma coisa deu errado aqui. Tente novamente!"
      redirect_to new_donation_path
    end
  end

  def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
  end

  def edit
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
  end

  def update
    @donation = Donation.find(params[:id])
    if @donation.update_attributes(donation_params)
      flash[:success] = "Doação atualizado com sucesso!"
      redirect_to @donation
    else
      flash[:error] = "Erh, algum erro ocorreu. Tente novamente!"
      render 'edit'
    end
  end

  private
    def donation_params
      params.require(:donation).permit(:collectionDate, :donator_id)
    end
end

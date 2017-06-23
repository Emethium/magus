class SmsModelsController < ApplicationController
  def new
    @sms_model = SmsModel.new
    @maximum_length = SmsModel.validators_on(:content).first.options[:maximum]
  end

  def create
    @sms_model = SmsModel.new(sms_model_params)
    if @sms_model.save
      flash[:success] = "O seu novo modelo foi cadastrado com sucesso!"
      redirect_to models_path
    else
      flash[:error] = "Ehr, alguma coisa deu errado aqui. Tente novamente!"
      redirect_to newmodels_path
    end
  end

  def show
    @sms_model = SmsModel.find(params[:id])
  end

  def index
    @sms_models = SmsModel.all
  end

  def edit
    @sms_model = SmsModel.find(params[:id])
  end

  def update
    @sms_model = SmsModel.find(params[:id])
    if @sms_model.update_attributes(sms_model_params)
      flash[:success] = "Modelo atualizado com sucesso!"
      redirect_to @sms_model
    else
      flash[:error] = "Erh, algum erro ocorreu. Tente novamente!"
      render 'edit'
    end
  end

  private
    def sms_model_params
      params.require(:sms_model).permit(:name, :content)
    end

end

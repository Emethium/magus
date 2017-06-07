class SmsModelController < ApplicationController
  def new
    @sms_model = SmsModel.new
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
end

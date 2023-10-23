class Admin::VtuberInformationsController < ApplicationController
  def new
    @vtuber_information = VtuberInformation.new
    @vtuber_information.build_vtuber_community
  end

  def index
    @vtuber_informations = VtuberInformation.all.page(params[:page]).per(8)
  end

  def show
    @vtuber_information = VtuberInformation.find(params[:id])
  end

  def create
    @vtuber_information = VtuberInformation.new(vtuber_information_params)
    @vtuber_information.save
    VtuberCommunity.create(vtuber_information_id: @vtuber_information.id)
    redirect_to admin_vtuber_information_path(@vtuber_information), notice: "VTuber情報を追加しました"
  end

  def edit
    @vtuber_information = VtuberInformation.find(params[:id])
  end

  def destroy
    vtuber_information = VtuberInformation.find(params[:id])
    vtuber_information.destroy
    redirect_to admin_vtuber_informations_path, notice: "VTuber情報を削除しました"
  end

  def update
    @vtuber_information = VtuberInformation.find(params[:id])
    if @vtuber_information.update(vtuber_information_params)
      redirect_to admin_vtuber_information_path, notice: "VTuber情報の更新に成功しました。"
    else
      render :edit and return
    end
  end

  private

  def vtuber_information_params
    params.require(:vtuber_information).permit(:vtuber_name, :youtube_name, :twitter_name, :tag_name, :fan_name,
                                                :mark, :color, :height, :blood_type, :birthday, :first_delivery, :created_at, :updated_at, :image)
  end
end

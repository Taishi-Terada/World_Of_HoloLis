class Public::VtuberInformationsController < ApplicationController
  def index
    @vtuber_informations = VtuberInformation.all.page(params[:page]).per(8)
  end

  def show
    @vtuber_information = VtuberInformation.find(params[:id])
  end

  def search
    @section_title = "「#{params[:search]}」の検索結果"
     @vtuber_informations = if params[:search].present?
                              VtuberInformation.where(['vtuber_name LIKE ?', "%#{params[:search]}%"]).page(params[:page]).per(8)
                            else
                              VtuberInformation.none.page(params[:page]).per(8)
                            end
  end
end

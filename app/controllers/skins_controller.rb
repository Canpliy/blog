class SkinsController < ApplicationController
  def index
    @skins = Skin.all
  end

  def new
    @skin = Skin.new
  end

  def create
    @skin = Skin.new(skin_params)

    save_images(@skin)

    if @skin.save
      flash[:success] = "创建成功！"
      redirect_to skins_path
    else
      flash[:error] = "创建失败!"
      render :new
    end
  end

  def show
    skin = Skin.find(params[:id])

    template = IO.read(Rails.root.join("app/assets/stylesheets/skin/skin.css.erb"))

    erb = ERB.new(template)

    File.open(Rails.root.join("public/stylesheets/skin_compiling.css"), "w") do |file|
      file.puts(erb.result(binding))
    end

    flash[:success] = '皮肤更新成功，请刷新查看效果！'

    redirect_to root_path
  end

  def destroy
    skin = Skin.find(params[:id])

    if skin.destroy
      flash[:success] = "删除成功！"
    else
      flash[:error] = "删除失败！"
    end

    redirect_to skins_path
  end

  private

  def skin_params
    params.require(:skin).permit(:name, :background_color)
  end

  def save_images(skin)
    if params[:skin][:home_image]
      home_image_url = save_file(params[:skin][:home_image])
      skin.home_image = home_image_url
    end

    if params[:skin][:article_image]
      article_image_url = save_file(params[:skin][:article_image])
      skin.article_image = article_image_url
    end

    if params[:skin][:film_review_image]
      film_review_image_url = save_file(params[:skin][:film_review_image])
      skin.film_review_image = film_review_image_url
    end

    if params[:skin][:music_image]
      music_image_url = save_file(params[:skin][:music_image])
      skin.music_image = music_image_url
    end

    if params[:skin][:setting_image]
      setting_image_url = save_file(params[:skin][:setting_image])
      skin.setting_image = setting_image_url
    end

    if params[:skin][:skin_image]
      skin_image_url = save_file(params[:skin][:skin_image])
      skin.skin_image = skin_image_url
    end
  end
end
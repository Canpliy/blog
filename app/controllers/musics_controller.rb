class MusicsController < ApplicationController
  before_action :signed_in_user, expect: [:index, :show]

  def index
    @musics = Music.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)

    music_url = save_file(params[:music][:url])

    @music.url = music_url

    if @music.save
      @music.create_tags(params[:music][:tags])
      flash[:success] = "创建成功！"
      redirect_to musics_path
    else
      flash[:error] = "创建失败！"
      render :new
    end
  end

  def edit
    @music = Music.find(params[:id])
  end

  def update
    @music = Music.find(params[:id])

    @music.create_tags(params[:music][:tags])

    if @music.update_attributes(music_params)
      if params[:music][:url]
        music_url = save_file(params[:music][:url])
        @music.url = music_url
        @music.save
      end
      flash[:success] = "更新成功！"
      redirect_to musics_path
    else
      flash[:error] = "更新失败！"
      render :edit
    end
  end

  def destroy
    @music = Music.find(params[:id])

    if @music.destroy
      flash[:success] = "删除成功！"
    else
      flash[:error] = "删除失败！"
    end

    redirect_to musics_path
  end

  private

  def music_params
    params.require(:music).permit(:name, :singer)
  end
  
end
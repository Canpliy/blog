class UsersController < ApplicationController


  before_action :signed_in_user

  def show
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(user_params)
        flash.now[:success] = "成功修改！"

        format.html { redirect_to user_path }
        format.js
      else
      end
    end
  end

  def update_image
    image_io = params[:image]
    image_url = "person_image" + "/" + image_io.original_filename

    File.open(Rails.root.join("public", image_url), "wb") do |file|
      file.write(image_io.read)
    end

    img_url = "/" + image_url

    respond_to do |format|
      if current_user.update_attribute(:img_url, img_url)
        format.html { redirect_to user_path, notice: "修改成功！" }
        format.json { render json: current_user, status: :created }
      else
        format.html { redirect_to user_path, notice: "修改失败！" }
        format.json { render json: current_user.errors, status: 501 }
      end
    end
  end

  def update_password
    respond_to do |format|
      if current_user.authenticate(params[:password])
        current_user.password = params[:new_password]
        if current_user.password.blank?
          flash.now[:error] = "密码不能为空！"
        elsif current_user.save
          flash.now[:success] = "密码修改成功！"
        else
          flash.now[:error] = "未知错误！"
        end
      else
        flash.now[:error] = "密码错误!"
      end

      format.js
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :signature)
  end
end
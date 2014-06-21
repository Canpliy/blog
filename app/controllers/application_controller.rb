class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
    redirect_to signin_url, notice: "请登陆！" unless signed_in?
  end

  def save_file(io)
    url = generate_identifier(io.original_filename)
    File.open(Rails.root.join("public", url), "wb") do |file|
      file.write(io.read)
    end

    "/" + url
  end

  def generate_identifier(name)
    basename = File.basename(name, ".*")
    extname = File.extname(name)
    basename + (0..9).to_a.shuffle[0..7].join + extname
  end
end

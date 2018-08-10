class HomeController < ApplicationController
  def index
  	@cours_crypto = Cryptomonnaie.all
  end

  def post
  	# @cours_crypto = StartScrap.new("https://coinmarketcap.com/all/views/all/")
  	@cours_crypto = StartScrap.new(params['url_base'])
  	@cours_crypto.perform
  	redirect_to root_path
  end
end

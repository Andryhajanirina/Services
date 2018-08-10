class StartScrap
	require 'nokogiri'
	require 'open-uri'
	attr_accessor :url_base

	def initialize(url_base)
	#def initialize(url_base = "https://coinmarketcap.com/all/views/all/")
		@url_base = url_base
	end
	
	def get_cryptomoney(url_base)
	    page = Nokogiri::HTML(open(url_base))
	    cryptoname = page.css("a.currency-name-container")
	    cryptoprice = page.css("a.price")

	    tab_cryptoname = []
	    cryptoname.each do |name|
	        tab_cryptoname << name.text
	    end

	    tab_cryptoprice = []
	    cryptoprice.each do |price|
	        tab_cryptoprice << price.text
	    end

	    @resultat = Hash[tab_cryptoname.zip(tab_cryptoprice)]
	    return @resultat
	end

	def perform
		puts get_cryptomoney(@url_base)
		puts "======================="
		puts "Nombre total : #{get_cryptomoney(@url_base).count}"
		puts "Processus d'enregistrement : Veuillez patienter quelques minutes"
		save
		puts "======================="
		puts "Fin du script"
		puts "#{get_cryptomoney(@url_base).count} cryptomonnaie enregistrés"

	end

	def save
		@resultat.each do |key, value|
			Cryptomonnaie.create(name: key, price: value)
		end
	end
end
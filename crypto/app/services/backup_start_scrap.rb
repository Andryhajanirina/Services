class StartScrap
	require 'nokogiri'
	require 'open-uri'
	attr_accessor :url_site

	def initialize(url_site)
		@url_site = url_site
	end
	
	def get_all_the_cryptomoneys(page_url)

	    doc = Nokogiri::HTML(open(page_url))
	    @cours_cryptomonnnaies = []
	    tableau = doc.css("#currencies-all tbody tr") # recupere dans tableau tous les fichiers dans <tr> </tr>

	    percent = tableau.length
	    proceed = 0

	    for i in 0...tableau.length do # parcourt chaque fichier dans tableau
	        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ") # pusher chaque element deja filtré dans cours_cryptomonnai
	        @cours_cryptomonnnaies.push({ 
	            :name => x[2],
	            :price => x[5]
	        }) 
	        # puts cours_cryptomonnnaies
                proceed += 1
                system ("clear")
                puts "Voici le nombre total des entées à executer #{percent}"
                percentage = proceed * 100 / percent
                puts "Progression du scrapping: #{proceed}/#{percent} ..............  #{percentage}%"
	    end
	    return @cours_cryptomonnnaies
	end

	def perform
	    	puts get_all_the_cryptomoneys(@url_site)
	    	save
	    	puts "Fin du script"
	    	sleep 3600
	end

	def save
		Cryptomonnaie.delete_all
		@cours_cryptomonnnaies.each do |element|
			Cryptomonnaie.create(name: element[:name], price: element[:price])
		end
	end
end
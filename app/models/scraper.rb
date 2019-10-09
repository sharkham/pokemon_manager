class Scraper

  def self.scrape_list_page
    url = open("https://pokemondb.net/pokedex/all")
    index_page = Nokogiri::HTML(url)

    pokemon_scrape = index_page.css("table#pokedex td.cell-name a.ent-name").collect do |pokemon|
      pokemon.text
    end
  end

  def self.scrape_pokemon_page(name)
    #need a diff method for name and URL name?
    if name == "Nidoran\u2640"
      name = "Nidoran-f"
    elsif name == "Nidoran\u2642"
      name = "Nidoran-m"
    elsif name == "Farfetch'd"
      name = "Farfetchd"
    elsif name == "Mr. Mime"
      name = "Mr-Mime"
    elsif name == "Type: Null"
      name = "Type-Null"
    elsif name == "Tapu Koko"
      name = "Tapu-Koko"
    elsif name == "Tapu Lele"
      name = "Tapu-Lele"
    elsif name == "Tapu Bulu"
      name = "Tapu-Bulu"
    elsif name == "Tapu Fini"
      name = "Tapu-Fini"
    elsif name == "Mime Jr."
      name = "Mime-Jr"
    elsif name == "Flabébé"
      name = "Flabebe"
    end
    attribute_hash = {}

    url = open("https://pokemondb.net/pokedex/#{name}", 'User-Agent' => 'ruby')
    index_page = Nokogiri::HTML(url)

    #Description Scrape
    description_array = []
    description_scrape = index_page.css("table.vitals-table tr:first-of-type").each do |text|
      words = text.css("td.cell-med-text").text
      description_array << words
    end
    cleaned_up_array = description_array.delete_if {|w| w == ""}
    attribute_hash[:description] = cleaned_up_array[0]

    #Type Scrape
    types_array = []
    type_scrape = index_page.css("table.vitals-table tr:nth-of-type(2) td a.type-icon").each do |foo|
      type = foo.text
      types_array << type
    end

    #Type Formatting
    if types_array.length == 2 && types_array[0] != types_array[1]
      #add error handling here for if the things in types array are the same thing--one Pokémon has "Electric/Electric"
      types_string = "#{types_array[0]} / #{types_array[1]}"
    else
      types_string = "#{types_array[0]}"
    end

    attribute_hash[:type] = types_string

    #Number Scrape
    number_array = []
    number_scrape = index_page.css("table.vitals-table tr:first-of-type td strong").each do |num|
      number = num.text
      number_array << number
    end
    pokemon_number = number_array[0]
    attribute_hash[:number] = pokemon_number


    attribute_hash

  end
end

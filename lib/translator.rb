require "yaml"

def load_library(path)
  raw_library = YAML.load_file(path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  raw_library.each do |meaning,emoticons|
  	library["get_emoticon"][emoticons[0]] = emoticons[1]
  	library["get_meaning"][emoticons[1]] = meaning
	end
  library
end

def get_japanese_emoticon(path, emoticon)
	library = load_library(path)
	library["get_emoticon"].fetch(emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library["get_meaning"].fetch(emoticon, "Sorry, that emoticon was not found")
end
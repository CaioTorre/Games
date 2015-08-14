class Element
    @name = ""
    @reactsWith = {}
    @final = false
    def initialize(na, rw, fn)
        @name = na
        @reactsWith = rw
        @final = fn
    end
    def reactWith(element)
        return !@final && @reactsWith.has_key?(element) ? @reactsWith[element] : "No reaction"
    end
end

def split(rcv, char)
    splitted = Array.new((rcv.count(char)), "")
    curr = ""
    i = 0
    rcv.each_byte { |x|
        ana = x.chr
        if ana == char
            splitted[i] = curr
            i += 1
            curr = ""
        else
            curr << ana
        end
    }
    return splitted << curr
end

puts "Starting setup..."

water = Element.new("water", {"fire" => "alcohol", "air" => "steam", "stone" => "sand", "earth" => "swamp", "alcohol" => "vodka", "life" => "weeds", "bacteria" => "plankton", "snake" => "fish", "coal" => "oil", "flour" => "dough", "wood" => "boat", "cement" => "concrete"}, false)
fire = Element.new("fire", {"water" => "alcohol", "earth" => "lava", "air" => "energy", "dust" => "ash", "stone" => "metal", "sand" => "glass", "dinosaur" => "dragon", "human" => "corpse", "clay" => "bricks", "tree" => "coal", "dough" => "bread", "bird" => "phoenix", "grass" => "tobacco"}, false)
air = Element.new("air", {"water" => "steam", "earth" => "dust", "fire" => "energy", "energy" => "storm", "lava" => "stone", "egg" => "bird", "car" => "airplane", "worm" => "butterfly"}, false)
earth = Element.new("earth", {"fire" => "lava", "air" => "dust", "moss" => "grass", "tools" => "field", "egg" => "dinosaur", "lizard" => "beast", "seeds" => "tree", "water" => "swamp", "weeds" => "mushroom", "worm" => "beetle"}, false)

airplane = Element.new("airplane", {"" => ""}, true)
alcohol = Element.new("alcohol", {"water" => "vodka", "bread" => "beer", "human" => "alcoholic"}, false)
alcoholic = Element.new("alcoholic", {"" => ""}, true)
ash = Element.new("ash", {"life" => "ghost"}, false)
assassin = Element.new("assassin", {"" => ""}, true)
bacteria = Element.new("bacteria", {"swamp" => "worm", "water" => "plankton"}, false)
beast = Element.new("beast", {"vampire" => "werewolf", "cart" => "chariot", "fish" => "dolphin", "human" => "domesticated animal", "tools" => "wool", "hunter" => "meat", "weapons" => "blood"}, false)
beer = Element.new("beer", {"" => ""}, true)
beetle = Element.new("beetle", {"sand" => "scorpion"}, false)
bird = Element.new("bird", {"storm" => "thunderbird", "fire" => "phoenix", "hunter" => "feather"}, false)
blood = Element.new("blood", {"human" => "vampire"}, false)
book = Element.new("book", {"" => ""}, true)
boat = Element.new("boat", {"wood" => "ship"}, false)
bread = Element.new("bread", {"alcohol" => "beer"}, false)
bricks = Element.new("bricks", {"concrete" => "house"}, false)
butterfly = Element.new("butterfly", {"" => ""}, true)
car = Element.new("car", {"air" => "airplane"}, false)
cart = Element.new("cart", {"beast" => "chariot", "steam engine" => "locomotive", "oil" => "car"}, false)
cement = Element.new("cement", {"water" => "concrete"}, false)
ceramics = Element.new("ceramics", {"" => ""}, true)
chariot = Element.new("chariot", {"" => ""}, true)
cigarette = Element.new("cigarette", {"" => ""}, true)
clay = Element.new("clay", {"life" => "golem", "fire" => "bricks", "human" => "ceramics", "limestone" => "cement"}, false)
coal = Element.new("coal", {"boiler" => "steam engine", "water" => "oil"}, false)
concrete = Element.new("concrete", {"bricks" => "house"}, false)
corpse = Element.new("corpse", {"life" => "zombie", "zombie" => "ghoul"}, false)
dinosaur = Element.new("dinosaur", {"fire" => "dragon"}, false)
dolphin = Element.new("dolphin", {"" => ""}, true)
domesticated_animal = Element.new("domesticated animal", {"grass" => "milk"}, false)
dough = Element.new("dough", {"fire" => "bread"}, false)
dragon = Element.new("dragon", {"warrior" => "hero"}, false)
dust = Element.new("dust", {"fire" => "ash"}, false)
egg = Element.new("egg", {"air" => "bird", "earth" => "dinosaur", "sand" => "turtle", "swamp" => "lizard"}, false)
electricity = Element.new("electricity", {"" => ""}, true)
energy = Element.new("energy", {"air" => "storm", "metal" => "electricity", "human" => "wizard", "swamp" => "life", "wizard" => "demigod"}, false)
fabric = Element.new("fabric", {"human" => "clothes", "ship" => "frigate"}, false)
fern = Element.new("fern", {"" => ""}, true)
fertilizer = Element.new("fertilizer", {"limestone" => "saltpeter"}, false)
field = Element.new("field", {"seeds" => "wheat"}, false)
firearm = Element.new("firearm", {"" => ""}, true)
fish = Element.new("fish", {"beast" => "dolphin", "plankton" => "whale"}, false)
flour = Element.new("flour", {"water" => "dough"}, false)
ghost = Element.new("ghost", {"" => ""}, true)
ghoul = Element.new("ghoul", {"" => ""}, true)
glass = Element.new("glass", {"house" => "skyscraper"}, false)
golem = Element.new("golem", {"life" => "human"}, false)
grass = Element.new("grass", {"domesticated animal" => "fertilizer", "fire" => "tobacco", "swamp" => "reed"}, false)
gunpowder = Element.new("gunpowder", {"weapon" => "firearm"}, false)
hero = Element.new("hero", {"" => ""}, true)
house = Element.new("house", {"glass" => "skyscraper"}, false)
human = Element.new("human", {"blood" => "vampire", "fabric" => "clothes", "alcohol" => "alcoholic", "beast" => "domesticated animal", "clay" => "ceramics", "energy" => "wizard", "fire" => "corpse", "human" => "sex", "metal" => "tools", "stone" => "hut", "poisoned weapon" => "assassin"}, false)
hunter = Element.new("hunter", {"bird" => "meat", "beast" => "blood", "weapons" => "warrior"}, false)
hut = Element.new("hut", {"" => ""}, true)
lava = Element.new("lava", {"air" => "stone"}, false)
life = Element.new("life", {"clay" => "golem", "golem" => "human", "ash" => "ghost", "corpse" => "zombie", "sand" => "seeds", "stone" => "egg", "tree" => "treant", "swamp" => "bacteria", "water" => "weeds"}, false)
limestone = Element.new("limestone", {"clay" => "cement", "fertilizer" => "saltpeter"}, false)
lizard = Element.new("lizard", {"earth" => "beast"}, false)
locomotive = Element.new("locomotive", {"" => ""}, true)
meat = Element.new("meat", {"fire" => "steak"}, false)
metal = Element.new("metal", {"energy" => "electricity", "human" => "tools", "steam" => "boiler", "tools" => "weapons"}, false)
moss = Element.new("moss", {"earth" => "grass", "swamp" => "fern"}, false)
mushroom = Element.new("mushroom", {"" => ""}, true)
oil = Element.new("oil", {"cart" => "car"}, false)
palmtree = Element.new("palmtree", {"" => ""}, true)
paper = Element.new("paper", {"feather" => "book", "tobacco" => "cigarette"}, false)
phoenix = Element.new("phoenix", {"" => ""}, true)
plankton = Element.new("plankton", {"fish" => "whale", "stone" => "shell"}, false)
poison = Element.new("poison", {"weapon" => "poisoned weapon"}, false)
poisoned_weapon = Element.new("poisoned weapon", {"human" => "assassin"}, false)
reed = Element.new("reed", {"tools" => "paper"}, false)
saltpeter = Element.new("saltpeter", {"sulfur" => "gunpowder"}, false)
sand = Element.new("sand", {"beetle" => "scorpion", "fire" => "glass", "life" => "seeds", "egg" => "turtle", "tree" => "palmtree", "worm" => "snake", "swamp" => "clay"}, false)
scorpion = Element.new("scorpion", {"" => ""}, true)
seeds = Element.new("seeds", {"field" => "wheat", "earth" => "tree"}, false)
sex = Element.new("sex", {"" => ""}, true)
shell = Element.new("shell", {"stone" => "limestone"}, false)
ship = Element.new("ship", {"fabric" => "frigate", "steam engine" => "steamship"}, false)
skyscraper = Element.new("skyscraper", {"" => ""}, true)
snake = Element.new("snake", {"tools" => "poison", "water" => "fish"}, false)
steak = Element.new("steak", {"" => ""}, true)
steam = Element.new("steam", {"metal" => "boiler"}, false)
steamship = Element.new("steamship", {"" => ""}, true)
steam_engine = Element.new("steam engine", {"cart" => "locomotive", "ship" => "steamship"}, false)
stone = Element.new("stone", {"fire" => "metal", "human" => "hut", "life" => "egg", "shell" => "limestone", "plankton" => "shell", "water" => "sand", "wheat" => "flour"}, false)
storm = Element.new("storm", {"bird" => "thunderbird"}, false)
sulfur = Element.new("sulfur", {"saltpeter" => "gunpowder"}, false)
swamp = Element.new("swamp", {"bacteria" => "sulfur", "egg" => "lizard", "energy" => "life", "grass" => "reed", "life" => "bacteria", "moss" => "fern", "sand" => "clay", "weeds" => "moss"}, false)
thunderbird = Element.new("thunderbird", {"" => ""}, true)
tobacco = Element.new("tobacco", {"paper" => "cigarette"}, false)
tools = Element.new("tools", {"earth" => "field", "metal" => "weapons", "snake" => "poison", "reed" => "paper", "wool" => "fabric"}, false)
treant = Element.new("treant", {"" => ""}, true)
tree = Element.new("tree", {"life" => "treant", "sand" => "palmtree", "fire" => "ash", "tools" => "wood"}, false)
turtle = Element.new("turtle", {"" => ""}, true)
vampire = Element.new("vampire", {"beast" => "werewolf"}, false)
vodka = Element.new("vodka", {"" => ""}, true)
warrior = Element.new("warrior", {"dragon" => "hero"}, false)
weeds = Element.new("weeds", {"swamp" => "moss", "earth" => "mushroom"}, false)
werewolf = Element.new("werewolf", {"" => ""}, true)
whale = Element.new("whale", {"" => ""}, true)
wheat = Element.new("wheat", {"stone" => "flour"}, false)
wheel = Element.new("wheel", {"wood" => "cart"}, false)
wizard = Element.new("wizard", {"energy" => "demigod"}, false)
wood = Element.new("wood", {"boat" => "ship", "tools" => "wheel", "water" => "boat", "wheel" => "cart"}, false)
wool = Element.new("wool", {"tools" => "fabric"}, false)
worm = Element.new("worm", {"air" => "butterfly", "sand" => "snake", "earth" => "beetle"}, false)




allElements = {"water" => water, "air" => air, "fire" => fire, "earth" => earth, "airplane" => airplane, "alcohol" => alcohol, "alcoholic" => alcoholic, "ash" => ash, "assassin" => assassin, "bacteria" => bacteria, "beast" => beast, "beer" => beer, "beetle" => beetle, "bird" => bird, "blood" => blood, "book" => book, "boat" => boat, "bread" => bread, "bricks" => bricks, "butterfly" => butterfly, "car" => car, "cart" => cart, "cement" => cement, "ceramics" => ceramics, "chariot" => chariot, "cigarette" => cigarette, "clay" => clay, "coal" => coal, "concrete" => concrete, "corpse" => corpse, "dinosaur" => dinosaur, "dolphin" => dolphin, "domesticated animal" => domesticated_animal, "dough" => dough, "dragon" => dragon, "dust" => dust, "egg" => egg, "electricity" => electricity, "energy" => energy, "fabric" => fabric, "fern" => fern, "fertilizer" => fertilizer, "field" => field, "firearm" => firearm, "fish" => fish, "flour" => flour, "ghost" => ghost, "ghoul" => ghoul, "glass" => glass, "golem" => golem, "grass" => grass, "gunpowder" => gunpowder, "hero" => hero, "house" => house, "human" => human, "hunter" => hunter, "hut" => hut, "lava" => lava, "life" => life, "limestone" => limestone, "lizard" => lizard, "locomotive" => locomotive, "meat" => meat, "metal" => metal, "moss" => moss, "mushroom" => mushroom, "oil" => oil, "palmtree" => palmtree, "paper" => paper, "phoenix" => phoenix, "plankton" => plankton, "poison" => poison, "poisoned weapon" => poisoned_weapon, "reed" => reed, "saltpeter" => saltpeter, "sand" => sand, "scorpion" => scorpion, "seeds" => seeds, "sex" => sex, "shell" => shell, "ship" => ship, "skyscraper" => skyscraper, "snake" => snake, "steak" => steak, "steam" => steam, "steamship" => steamship, "steam engine" => steam_engine, "stone" => stone, "storm" => storm, "sulfur" => sulfur, "swamp" => swamp, "thunderbird" => thunderbird, "tobacoo" => tobacco, "tools" => tools, "treant" => treant, "tree" => tree, "turtle" => turtle, "vampire" => vampire, "vodka" => vodka, "warrior" => warrior, "weeds" => weeds, "werewolf" => werewolf, "whale" => whale, "wheat" => wheat, "wheel" => wheel, "wizard" => wizard, "wood" => wood, "wool" => wool, "worm" => worm}
enabled = ["water", "air", "fire", "earth"]

#, "" => ""
# = Element.new("", {"" => ""})
#, "" => 

#Dir.chdir("C:/Users/Owner/Documents/GitHub/Games") # PC VERSION
#file = File.open("saves/saved.txt", "a+") # PC VERSION
vNum = 1.1
puts "Finished setup!"
didCongratulate = false
puts "Welcome to Text Alchemy! If you're new to this type of game, type \"help\" or \"h\" (without the \"s) to receive a brief lesson on how to play"
puts "As of version " + vNum.to_s + ", there are " + allElements.length.to_s + " elements to discover"
puts "Made by CaioTorre"
puts
while true
    #enabled.each {|x| file.syswrite((x + "\n"))} if File.zero?(file) # PC VERSION
    #enabled = [] # PC VERSION
    #read = IO.readlines("saves/saved.txt") # PC VERSION
    #read.each {|x| enabled.push(x.chomp)} # PC VERSION
    print "Reacting "
    rec = gets.chomp.downcase
    inp = ""
    unknown = [" ", ",", "\""]
      rec.each_char { |x|
            inp << x unless unknown.include?(x)
      }
    if inp.include?("+") or inp.include?(".")
        inp = inp.include?("+") ? split(inp, "+") : split(inp, ".")
        if (enabled.include?(inp[0]) && enabled.include?(inp[1]) && inp.length == 2)
            out = allElements[inp[0]].reactWith(inp[1])
            print "Output: " + out
            puts (!enabled.include?(out) && out != "No reaction") ? " --- NEW REACTION! ---" : ""
            #file.syswrite((out + "\n")) unless (out == "No reaction" || enabled.include?(out)) # PC VERSION
            enabled << out unless (out == "No reaction" || enabled.include?(out))
        else
            puts inp.length != 2 ? "Wrong number of elements" : ("Unknown element " + (enabled.include?(inp[0]) ? "2" : "1"))
                  puts "Look out for spaces in your expression!" if inp.include?(" ")
        end
        puts "You found all the elements! For now, you can reset the game by editing saves/saved.txt to only display the four starters, or wait for the next update, with even more elements" if (enabled.length == allElements.length && !didCongratulate)
        didCongratulate = true if (enabled.length == allElements.length && !didCongratulate)
    #elsif (inp.include?("load=")) #PC VERSION
        #loadNum = split(inp, "=")[1] #PC VERSION
    else
        case inp
        when "list", "l"
            puts "Enabled elements: " + enabled.join(", ") + " (" + enabled.length.to_s + "/" + allElements.length.to_s + ")"
        #when "reset"
            #File.delete(file)
        when "quit", "q"
            break
        when "help", "h"
            puts "\n --//-- \n To see a list of your available elements, type \"list\" or \"l\" (without the \"s)"
            puts "Choose two elements from the list to combine, and then type them as \"element1+element2\" or \"element1.element2\" (without the \"s). Note the plus sign (+) and the dot (.)!"
            puts "If your combination successfully creates an element, you'll receive a notice, along with a \"--- NEW REACTION ---\" message if you've never made the resulting element (meaning it's a brand new element for you to use"
            puts "Your new element will be added to the element list, and it's now available to use in new combinations"
            puts "Use \"quit\" or \"q\" to quit the game"
            puts "Be creative, and good luck finding all " + allElements.length.to_s + " elements!"
        else
            puts "Unknown command"
        end
    end
    puts "--//--"
    puts
end
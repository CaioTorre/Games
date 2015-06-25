class Element
	@name = ""
	@reactsWith = {}
	def initialize(na, rw)
		@name = na
		@reactsWith = rw
	end
	def reactWith(element)
		if @reactsWith.has_key?(element)
			return @reactsWith[element]
		else
			return "No reaction"
		end
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

water = Element.new("water", {"fire" => "alcohol", "air" => "steam"})
fire = Element.new("fire", {"water" => "alcohol", "earth" => "lava"})
air = Element.new("air", {"water" => "steam", "earth" => "dust"})
earth = Element.new("earth", {"fire" => "lava", "air" => "dust"})

#allElements = {"water" => water, "air" => air, "fire" => fire, "earth" => earth, "lava" => lava, "dust" => dust, "energy" => energy, "alcohol" => alcohol}
allElements = {"water" => water, "air" => air, "fire" => fire, "earth" => earth}
enabled = ["water", "air", "fire", "earth"]

puts "Doodle God"
puts
while true
	print "Reacting "
	inp = gets.chomp.downcase
	if inp.include?("+")
		inp = split(inp, "+")
		if (enabled.include?(inp[0]) && enabled.include?(inp[1]) && inp.length == 2)
			out = allElements[inp[0]].reactWith(inp[1])
			puts "Output: " + out
			enabled << out unless (out == "No reaction" || enabled.include?(out))
		else	
			if (inp.length != 2)
				puts "Wrong number of elements"
			elsif (enabled.include?(inp[0]))
				puts "Unkonwn element 2"
			else
				puts "Unknown element 1"
			end
		end
	elsif (inp == "list")
		puts "Enabled elements: " + enabled.join(", ")
	end
	puts "--//--"
	puts
end
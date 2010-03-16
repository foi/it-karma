require "nokogiri"
require "open-uri"

#color of 
$moon_color = ""

def get_astro
	html = Nokogiri::HTML(open("http://www.astro.com/astro-databank/Main_Page"))
	h = html.search('td.txt8p')
	h_s = html.search('table[align=right] tr td img')
	signs = [] #links of icos signs from host
	pl = [] #links of icos planets from host
	natal = {}
	n, o = 0, 0
	for i in 0..(h_s.size)
		if (i&1).zero?
			pl[o] = h_s.at(i)
			o += 1
		else
			signs[n] = h_s.at(i)
			n += 1
		end
	end
	(signs.push).delete nil and (pl.push.push).delete nil
	planets = [ :sun, :moon, :mercury, :venus, :mars, :jupiter, :saturn, :uranus, :neptune, :pluto, :truenode, :chiron ] 
	positions = (1..(h.size - 2)).to_a - [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
	for i in 0..(planets.size - 1)
	  natal[planets[i]] = ['', '', '']  # [1] = grad, [2] = ico of sign, [3] = ico of planet
	end
	n, o, s = 0, 0, 0
	for i in positions
	  natal[planets[n]][0] << "°" if o == 1
	  natal[planets[n]][0] += h.at(i).content
		if o == 1
			natal[planets[n]][1] = signs[s] and natal[planets[n]][2] = pl[s]
			s += 1
		end
		o += 1
		if o == 2
			o = 0 and n += 1
		end
	end
	
	case natal[:moon][1].values.last
		when "Aries"
			$moon_color = "#FF0000"
		when "Taurus"
			$moon_color = "#7FFF8C"
		when "Gemini"
			$moon_color = "#FFD800"
		when "Cancer"
			$moon_color = "#93FFB4"
		when "Leo"
			$moon_color = "#FF7C00"
		when "Virgo"
			$moon_color = "#C0C0C0"
	  when "Libra"
		  $moon_color = "#DAFF7F"
		when "Scorpio"
			$moon_color = "#FF307F"
		when "Sagittarius"
			$moon_color = "#49ADFF"
		when "Capricorn"
			$moon_color = "#BC9A00"
		when "Aquarius"
			$moon_color = "#A0E5FF"
		else 
			$moon_color = "#E47AFF"
	end

	@astro_string = ""

	for planet in planets
	  @astro_string << "#{natal[planet][2]}" << "[#{natal[planet][1]}]" << "#{natal[planet][0]}"
	  @astro_string << "<br />" if planet != :chiron
	end
	 @astro_string
end
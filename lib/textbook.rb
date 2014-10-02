class Textbook
	def initialize(file)
		@file = file 
		
	end

	def insert(page)
		if File.read(@file) != ""
			File.open(@file, 'a') do |f|
				f << "\n"
			end
		end
		File.open(@file, 'a') do |f|
			f << page.to_s 
		end
	end

	def to_s
		File.read(@file)
	end
end

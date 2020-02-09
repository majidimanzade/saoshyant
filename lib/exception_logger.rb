module Saoshyant
	class ExceptionLogger
		def self.log(msg)
			Logger.new("#{Rails.root}/log/saoshyant.log").debug msg
		end
	end
end
module Saoshyant
	class JsonExceptionHandeler

		@@exception_klasses = {}

		def self.customize(exception_klass, code, log = false)
			validate_arguments code, log
			return if @@exception_klasses.key?(exception_klass)

			@@exception_klasses.merge!(exception_klass => {code: code, log: log})
		end

		private
		def self.code_status exception
			@@exception_klasses.key?(exception.class) ? @@exception_klasses[exception.class][:code] : DEFAULT_ERROR_CODE
		end

		def self.log_status exception
			@@exception_klasses.key?(exception.class) ? @@exception_klasses[exception.class][:log] : false
		end

		def self.validate_arguments code, log
			raise "Invalid code status" unless code.kind_of?(Integer)
			raise "Invalid log status, it should be Boolean" unless !!log == log
		end
	end
end
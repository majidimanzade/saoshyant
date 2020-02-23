require 'rails'
require 'exception_logger'
require 'exception_handler'

module Saoshyant
	extend ActiveSupport::Concern
	include ActiveSupport::Rescuable

	@@exception_klasses = {}

	included do
		rescue_from Exception, with: :execute_exception
	end

	def saoshyant_option(exception_klass, code, log = false)
		Saoshyant::ExceptionHandler.validate_arguments(code, log)
		return if @@exception_klasses.key?(exception_klass)

		@@exception_klasses.merge!(exception_klass => {code: code, log: log})
	end

	def execute_exception ex
		code = Saoshyant::ExceptionHandler.code_status ex, @@exception_klasses
		log = Saoshyant::ExceptionHandler.log_status ex, @@exception_klasses

		Saoshyant::ExceptionLogger.log(ex.message) if log == true
		$saoshyant_response.call(code, ex.message, ex.class.inspect)
	end
end
require 'rails'
require 'exception_logger'
require 'json_exception_handeler'

module Saoshyant
	extend ActiveSupport::Concern
	@@exception_klasses = {}

	DEFAULT_ERROR_CODE = 500
	included do
		rescue_from Exception, with: :render_exception
	end

	def saoshyant_option(exception_klass, code, log = false)
		Saoshyant::JsonExceptionHandeler.validate_arguments(code, log)
		return if @@exception_klasses.key?(exception_klass)

		@@exception_klasses.merge!(exception_klass => {code: code, log: log})
	end

	def render_exception ex
		code = Saoshyant::JsonExceptionHandeler.code_status ex, @@exception_klasses
		log = Saoshyant::JsonExceptionHandeler.log_status ex, @@exception_klasses

		Saoshyant::ExceptionLogger.log(ex.message) if log == true
		$saoshyant_response.call(code, ex.message, ex.class.inspect)
	end
end
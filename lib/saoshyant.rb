require 'rails'
require 'exception_logger'
require 'json_exception_handeler'

module Saoshyant
	extend ActiveSupport::Concern

	DEFAULT_ERROR_CODE = 500
	included do
		rescue_from Exception, with: :render_exception
	end

	def render_exception ex
		code = Saoshyant::JsonExceptionHandeler.code_status ex
		log = Saoshyant::JsonExceptionHandeler.log_status ex

		Saoshyant::ExceptionLogger.log(ex.message) if log == true
		render json: {status: 'error', :message => ex.message, :exception_type => ex.class.inspect}, status: code
	end
end
require 'rails'
require 'exception_logger'

module Saoshyant
	extend ActiveSupport::Concern

	DEFAULT_ERROR_CODE = 500
	included do
		rescue_from Exception, with: :render_exception
	end

	def render_exception exception
		code = exception.respond_to?(:code) ? exception&.code : DEFAULT_ERROR_CODE
		log = exception.respond_to?(:log)

		Saoshyant::MajidLogger.log(exception.message) if log == true
		render json: {:message => exception.message}, status: code
	end
end
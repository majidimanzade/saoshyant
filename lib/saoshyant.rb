require 'rails'

class Saoshyant
	extend ActiveSupport::Concern

	DEFAULT_ERROR_CODE = 500
	included do
		rescue_from Exception, with: :render_exception
	end
	def hi
		'why not'
		MajidLogger::sayhi
	end
	def render_exception exception
		code = exception.respond_to?(:code) ? exception&.code : DEFAULT_ERROR_CODE
		log = exception.respond_to?(:log)

		Saoshyant::MajidLogger.log(exception.message) if log == true
		render json: {:message => exception.message}, status: code
	end
end

module Saoshyant::MajidLogger
	def sayhi
		'hi'
	end
	def log(msg)
		Logger.new("#{Rails.root}/log/saoshyant.log").debug msg
	end
end
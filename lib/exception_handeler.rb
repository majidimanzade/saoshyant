module Saoshyant
	class ExceptionHandeler
		extend ActiveSupport::Concern

		DEFAULT_ERROR_CODE = 500
		included do
			rescue_from Exception, with: :render_exception
		end

		def render_exception exception
			code = exception.respond_to?(:code) ? exception&.code : DEFAULT_ERROR_CODE
			log = exception.respond_to?(:log)

			Saoshyant::ExceptionLogger.log(exception.message) if log == true
			render json: {:message => exception.message}, status: code
		end
	end
end
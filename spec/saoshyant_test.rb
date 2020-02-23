require 'spec_helper'
include Saoshyant

describe Saoshyant do
	describe 'JsonExceptionHandeler' do
		it 'expect get error for invalid code status' do
			expect{ saoshyant_option(NameError, '200', false) }.to raise_error(RuntimeError)
		end

		it 'expect get error for invalid log status' do
			expect{ saoshyant_option(NameError, 203, 'true') }.to raise_error(RuntimeError)
		end
	end
end

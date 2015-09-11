require_relative '../../../tests/spec_helper'
require_relative '../../../Behavioral/ChainOfResponsibility/chain_of_responsibility'

describe ChainOfResponsibility do
  it 'returns output test on stdout from the logger debbug' do
    chain = ChainOfResponsibility.new.create_chain
    output =
      capture_stdout { chain.message('Entering function y.', Logger::DEBUG) }
    output.should include 'Sending to stdout: Entering function y.'
    output =
      capture_stdout { chain.message('Step1 completed.', Logger::NOTICE) }
    output.should include 'Sending via e-mail: Step1 completed.'
    output =
      capture_stdout { chain.message('An error has occured.', Logger::ERR) }
    output.should include 'Sending to stdout: An error has occured'
  end
end

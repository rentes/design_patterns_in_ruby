require_relative '../../../spec/spec_helper'
require_relative '../../../Behavioral/Chain of Responsibility/chain_of_responsibility'

describe ChainOfResponsibility, '#message_from_debug_logger' do
  it 'returns \'output test.\' on stdout from the logger debug' do
    chain = ChainOfResponsibility.new.create_chain
    output = capture_stdout { chain.message('Entering function y.', Logger::DEBUG) }
    output.should include 'Sending to stdout: Entering function y.'
  end
end
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "SeeFusion listening" do

  it "is listening on port 8999" do
    expect(port(8999)).to be_listening
  end

end
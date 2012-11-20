require File.expand_path('../support/helpers', __FILE__)

require 'cfoundry'

describe 'cloudfoundry-cloud_controller::server' do
  include Helpers::CFCloudController

  before do
    sleep 7 # give the server some time to start up
  end

  it 'starts a cloud_controller that accepts connections' do
    client.info.wont_be_nil
  end

  it 'starts a cloud_controller that allows registration' do
    user = client.register("test-#{Time.now.to_i}-register@example.com", "password")
    user.wont_be_nil
  end

  it 'starts a cloud_controller that allows login' do
    test_user = create_user
    user = client.login(:username => test_user, :password => "password")
    user.wont_be_nil
  end

  it 'starts a cloud_controller with no frameworks' do
    test_user = create_user
    user = client.login(:username => test_user, :password => "password")
    client.frameworks.must_equal []
  end

  it 'starts a cloud_controller with no services' do
    test_user = create_user
    user = client.login(:username => test_user, :password => "password")
    client.services.must_equal []
  end

protected
  def client
    CFoundry::V1::Client.new("http://#{node['ipaddress']}:9022")
  end

  def create_user
    test_user = "test-#{Time.now.to_i}-#{Random.rand(100)}@example.com"
    client.register(test_user, "password")
    test_user
  end
end

require File.expand_path('../support/helpers', __FILE__)

describe 'cloudfoundry-cloud_controller::server' do
  include Helpers::CFCloudControllerTest

  describe 'with a Ruby runtime' do
    it 'creates a valid runtimes file' do
      file("/etc/cloudfoundry/runtimes.yml").must_exist # .with(:owner, 'cloudfoundry')
      YAML.load_file('/etc/cloudfoundry/runtimes.yml')
    end

    it 'creates a config file with the expected content' do
      config = YAML.load_file('/etc/cloudfoundry/runtimes.yml')
      config.class.must_equal           Hash
      config.keys.must_equal            [ "ruby19" ]
      config["ruby19"].class.must_equal Hash
    end

    it 'creates valid framework files' do
      file("/var/vcap/data/cloud_controller/staging_manifests/rails3.yml").must_exist # .with(:owner, 'cloudfoundry')
      YAML.load_file('/var/vcap/data/cloud_controller/staging_manifests/rails3.yml')

      file("/var/vcap/data/cloud_controller/staging_manifests/sinatra.yml").must_exist # .with(:owner, 'cloudfoundry')
      YAML.load_file('/var/vcap/data/cloud_controller/staging_manifests/sinatra.yml')
    end

    it 'creates a rails3 config file with the expected content' do
      config = YAML.load_file('/var/vcap/data/cloud_controller/staging_manifests/rails3.yml')
      config['name'].must_equal 'rails3'
      config['runtimes'].must_equal [{ 'ruby19' => { 'default' => false } }]
    end
  end
end

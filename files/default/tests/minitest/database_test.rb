require File.expand_path('../support/helpers', __FILE__)

require 'pg'

describe 'cloudfoundry-cloud_controller::database' do

  it 'creates a cloudfoundry user' do
    db = connect('template1', 'cloudfoundry', 'cloudfoundry')
    db.wont_be_nil
  end

  it 'creates a cloud_controller database' do
    db = connect('template1', 'cloudfoundry', 'cloudfoundry')
    db.query("select * from pg_database where datname = 'cloud_controller'").num_tuples.must_equal 1
  end

protected
  def connect(dbname, user, password)
    @db ||= ::PGconn.new(
      :host => '127.0.0.1',
      :port => 5432,
      :dbname => dbname,
      :user => user,
      :password => password
    )
  end
end

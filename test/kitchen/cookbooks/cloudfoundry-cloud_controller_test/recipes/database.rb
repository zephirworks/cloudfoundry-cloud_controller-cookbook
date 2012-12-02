node.set['postgresql']['password']['postgres'] = 'test-password'

include_recipe "postgresql::server"

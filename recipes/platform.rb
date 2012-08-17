# Setup platform.yml staging manifest

template File.join(node['cloudfoundry']['staging_manifests_dir'], "platform.yml") do
  source "platform.yml.erb"
  owner  node['cloudfoundry']['user']
  mode   "0644"
end

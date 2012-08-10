# Setup platform.yml staging manifest

template File.join(node['cloudfoundry_common']['staging_manifests_dir'], "platform.yml") do
  source "platform.yml.erb"
  owner  node['cloudfoundry_common']['user']
  mode   "0644"
end

def is_pg_buggy?(node)
  return false if node['platform_version'].to_f < 12.04
  RbConfig::CONFIG['bindir'] =~ %r!/opt/(opscode|chef)/embedded/bin!
end


script 'install_dashing' do
  interpreter 'bash'
  user 'root'
  options = if (node["undef-dashing"]["version"] == "") then "" else "--version '#{node["undef-dashing"]["version"]}'" end
  code <<-EOH

  # Quit on error
  set -e

  #{node["undef-dashing"]["ruby_env"]}

  if ! gem spec dashing > /dev/null 2>&1; then
    gem install #{options} dashing
  fi

    EOH
end


template node['undef-dashing']['start_script'] do
  source 'dashing-service.sh.erb'
  mode 0755
  owner 'root'
  group 'root'
end


# Create user/group to run dashboards
group node["undef-dashing"]["group"]

user node["undef-dashing"]["user"] do
  group node["undef-dashing"]["group"]
  system true
end

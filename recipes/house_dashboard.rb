

d_dir = '/srv/house_dashboard'


directory d_dir do
  recursive true
end

git d_dir do
  repository 'https://github.com/ampledata/house_dashboard.git'
end

undef_dashing_dashboard d_dir do
  action :restart
  port 9090
end

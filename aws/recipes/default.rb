package 'python-pip' do
  action :install
end

execute 'pip' do
  command 'pip install awscli'
  user 'deploy'
end
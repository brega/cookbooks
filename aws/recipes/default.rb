package 'python-pip' do
  action :install
  user :root
end

execute 'pip' do
  command 'pip install awscli'
  user 'deploy'
end
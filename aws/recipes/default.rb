ENV['AWS_ACCESS_KEY_ID'] = node[:aws_access][:access_key]
ENV['AWS_SECRET_ACCESS_KEY'] = node[:aws_access][:secret_key]

bash "env_test" do
  code<<-EOF
  echo $AWS_ACCESS_KEY_ID
  echo $AWS_SECRET_ACCESS_KEY
EOF
end

package 'python-pip' do
  action :install
end

execute 'pip' do
  command 'pip install awscli'
  user 'root'
end
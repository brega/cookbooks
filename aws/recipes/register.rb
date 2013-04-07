include_recipe 'aws'

execute 'register' do
  command "aws --region #{node[:opsworks][:instance][:region]} elb register-instances-with-load-balancer --load-balancer-name lxtest-elb --instances '{\"instance_id\": \"#{node[:opsworks][:instance][:aws_instance_id]}\"}'"
  user 'deploy'
end

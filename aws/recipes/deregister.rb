include_recipe 'aws'

execute 'deregister' do
  command "aws --region #{node[:opsworks][:instance][:region]} elb deregister-instances-from-load-balancer --load-balancer-name lxtest-elb --instances '{\"instance_id\":\"#{node[:opsworks][:instance][:aws_instance_id]}\"}'"
  user 'deploy'
end

Chef::Log.info("Starting Rails DJ workers")

node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]

  execute "delayed_job start" do
    cwd deploy[:current_path]
    command "script/delayed_job start"
    action :run
  end
end

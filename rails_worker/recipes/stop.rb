Chef::Log.info("Starting Rails DJ workers")

node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]

  execute "delayed_job stop" do
    cwd deploy[:current_path]
    command "script/delayed_job stop"
    action :run
  end
end

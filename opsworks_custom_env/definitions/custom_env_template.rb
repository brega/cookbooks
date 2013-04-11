define :custom_env_template, app_name: nil, release_path: nil do
  app_name = params[:app_name]
  release_path = params[:release_path]
  env = node[:custom_env][app_name] rescue {}
  
  template "#{release_path}/config/application.yml" do
    cookbook 'opsworks_custom_env'
    source "application.yml.erb"
    owner node[:deploy][app_name][:user]
    group node[:deploy][app_name][:group]
    mode "0660"
    variables :env => env

    only_if { File.exists?("#{release_path}/config") }
  end
end

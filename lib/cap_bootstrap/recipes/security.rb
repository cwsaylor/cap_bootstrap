Capistrano::Configuration.instance(:must_exist).load do
  namespace :security do
    desc "Setup a firewall with UFW"
    task :setup_firewall, roles: :web do
      run "#{sudo} apt-get -y install ufw"
      run "#{sudo} ufw default deny"
      run "#{sudo} ufw allow 22/tcp"
      run "#{sudo} ufw allow 80/tcp"
      run "#{sudo} ufw allow 443/tcp"
      run "#{sudo} ufw --force enable"
    end
  end
end
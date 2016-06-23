# Values used only on the dev servers
default_branch: 'master'
domain_prefix: 'dev.'
banner_message: 'This is a development site with experimental features. Do not rely on it.'
grantnav:
  piwik:
    url: '//mon.opendataservices.coop/piwik/'
    site_id: '6'
cove:
  piwik:
    url: '//mon.opendataservices.coop/piwik/'
    site_id: '1' 
    dimension_map: 'file_type=2,page_type=3,form_name=4,language=5,exit_language=6'
  ocds_redirect: False
  larger_uwsgi_limits: True
  uwsgi_as_limit: 1800
automatic_reboot: 'true'
extra_cove_branches: # [] # remove the [] (empty list) if you re-add some values below
  - name: release-201604
    uwsgi_port: 3032
  - name: release-201606
    uwsgi_port: 3038
# Add a new branch with the name of the branch, and increment the port number.
# Currently adding a new port number requires a manual uwsgi restart (ie. the
# reload in highstate will fail, so you will need to ssh and run "service uwsgi
# restart" instead)
#
# To set these up from scratch (e.g. if you've
# removed one) you can run these commands on the
# server: (and then the salt state)
# $ rm /etc/uwsgi/apps-enabled/cove-*.ini
# $ rm /etc/apache2/sites-available/cove-*.conf
# $ rm /etc/apache2/sites-enabled/cove-*.conf
# $ killall uwsgi

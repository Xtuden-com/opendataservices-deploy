# Values used only on the Cove OCDS server
default_branch: 'master'
cove:
  app: cove_project
  uwsgi_port: 3032  # Can't use default 3031 on Ubuntu 18 till https://github.com/unbit/uwsgi/issues/1491 is fixed
  piwik:
    url: '//mon.opendataservices.coop/piwik/'
    site_id: '99999999999999999999999999999999'  # TODO
  giturl: 'https://github.com/openownership/cove-bods.git'
  allowedhosts: '.default.opendataservices.uk0.bigv.io'
  ocds_redirect: False
  larger_uwsgi_limits: True
  # Note: these values supersede the much smaller values in live_pillar.sls
  uwsgi_as_limit: 12000
  uwsgi_harakiri: 1800
# This is empty as we don't use extra_cove_branches on this server.
# Instead just change the default_branch above (that means there can only be one, but that's fine for now)
extra_cove_branches: []

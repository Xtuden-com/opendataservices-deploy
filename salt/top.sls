# top.sls defines which states should be installed onto which servers
# and is used by the state.highstate command (see README)

base:
  # Install our core sls onto all servers
  '*':
    - core

  # LIVE

  'live2':
    - ocds-docs-live
    - ocds-legacy
    - opendataservices-website
    - icinga2-satellite

  'live3':
    - icinga2-satellite
    - os4d
    - travis-secret-files

  'cove*live*':
    - cove
    - icinga2-satellite

  'grantnav-live*':
    - grantnav
    - icinga2-satellite

  'data-360-live':
    - registry360
    #- icinga2-satellite

  'involve':
    - survey-tool-live
    - icinga2-satellite

  'org-ids':
    - org-ids
    - icinga2-satellite

  # STAGING

  'cove-staging':
    - cove
    - icinga2-satellite

  # DEVELOPMENT

  'dev3':
    - ocds-docs-dev
    - opendataservices-website
    - temp
    - icinga2-satellite

  'dev4':
    - org-ids
    - icinga2-satellite
    - os4d
    - registry360

  'cove*dev*':
    - cove
    - icinga2-satellite

  'cove-dev*':
     - cove_dev_other_schemas
     - cove_dev_redirects

  'grantnav-dev*':
    - grantnav
    - djangodebug
    - icinga2-satellite

  'ocdsdata*':
    - ocdsdata

  # MONITORING

  'mon*':
    - icinga2-master
    - piwik

  # OTHERS

  'snapshotter':
    - icinga2-satellite

  'backups':
    - icinga2-satellite
    - backups

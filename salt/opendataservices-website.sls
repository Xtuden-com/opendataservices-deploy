# This is a salt formula to set up the opendataservices website
# ie. http://opendataservices.coop

{% from 'lib.sls' import createuser, apache, planio_keys %}

include:
  - core
  - apache
{% if 'https' in pillar.opendataservices_website and pillar.opendataservices_website.https %}  - letsencrypt{% endif %}

rewrite:
  apache_module.enabled

# Create a user for this piece of work, see lib.sls for more info
{% set user = 'opendataservices' %}
{{ createuser(user) }}
{{ planio_keys(user) }}


# Download the repository (all static HTML)
git@opendataservices.plan.io:standardsupport-co-op.website.git:
  git.latest:
    - rev: {{ pillar.default_branch }}
    - target: /home/{{ user }}/website/
    - user: {{ user }}
    - submodules: True
    - force_fetch: True
    - force_reset: True
    - require:
      - pkg: git
      - ssh_known_hosts: {{ user }}-opendataservices.plan.io

# Set up the Apache config using macro
{{ apache('opendataservices-website.conf','','','',pillar.opendataservices_website.servername,pillar.opendataservices_website.serveraliases,pillar.opendataservices_website.https) }}

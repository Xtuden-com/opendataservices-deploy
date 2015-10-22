influxdb:
  pkg.installed:
    - sources:
      - influxdb: http://influxdb.s3.amazonaws.com/influxdb_0.9.4.2_amd64.deb

grafana:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/grafana/stable/debian/ wheezy main
    - key_url: https://packagecloud.io/gpg.key 
    - require_in:
      pkg: grafana
  pkg.installed:
    - pkgs:
      - grafana
    - refresh: True

  file.append:
    - name: /etc/grafana/grafana.ini
    - text: "admin_password = {{ pillar.grafana.admin.password }}"


# ufw

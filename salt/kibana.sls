# Salt formula for setting up kibana
kibana-base:
  archive.extracted:
    - name: /opt/
    - source: https://download.elastic.co/kibana/kibana/kibana-4.1.2-linux-x64.tar.gz
    - source_hash: sha1=45e67114f7dac4ccac8118bf98ee8f6362c7a6a1
    - archive_format: tar
    - if_missing: /opt/kibana-4.1.2-linux-x64/

  # Ensure kibana only listens on localhost
  file.append:
    - name: /opt/kibana-4.1.2-linux-x64/config/kibana.yml
    - text: "host: 127.0.0.1"

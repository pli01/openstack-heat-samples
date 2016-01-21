This directory contains sample shell scripts used in heat SoftwareConfig or UserData resource.

Scripts 
 - can be tested and used standalone with parmeters whithout heat
 - accept parameters through ENV variables 
    ex: 
      export foo=myvalue 
      use in the script ($foo)

 - in heat, use it as follow
   config_deployment:
    type: OS::Heat::SoftwareConfig
    properties:
      config:
       str_replace:
         params:
           $foo: 'foofoo'
           $bar: 'babar'
         template:
           get_file: ../config-scripts/script-config.sh

OR

   web_deployment:
    type: OS::Heat::CloudConfig
    properties:
      cloud_config:
        write_files:
        - path: /root/script-install-apache.sh
          content:
            str_replace:
              params:
                $public_ip$: { get_attr: [Instance1_floating_ip, floating_ip_address] }
              template: |
                 get_file: ../config-scripts/script-install-apache.sh
          owner: root:root
          permissions: '0755'
        runcmd:
          - /root/script-install-apache.sh


# ovh-pca-rsync

Simple script to upload to OVH Public Cloud Archive containers

# config

- go to OVH's cloud manager website
- create a cloud account if not already done
- create an openstack password if not already done
- create some cold storage containers if not already done
- get the openstack configuration script if not already available
- import your sending host's public ssh keys to OVH interface if not already done

# run

    ovh-pca-rsync.sh CONFIG DC CONTAINER SOURCES

where :

- CONFIG is the OpenStack configuration file (retrieved from OVH)
- DC is the datacenter where your container is
- CONTAINER is the container name
- SOURCES are all your files to be rsync'ed

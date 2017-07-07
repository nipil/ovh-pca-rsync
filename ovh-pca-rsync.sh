#!/bin/bash
##############################################################################
[[ $# -ge 4 ]] || { 2>&1 echo "Usage : $0 openstackconfigscript datacenter containername sources..." ; exit 1 ; }
##############################################################################
OPENSTACK_CONFIG="${1}"
shift
DATACENTER="${1}"
shift
CONTAINER="${1}"
shift
##############################################################################
case "${DATACENTER}" in
sbg1)
  ;;
bhs1)
  ;;
gra1)
  ;;
*)
  2>&1 echo "Invalid datacenter ${DATACENTER}"
  exit 1
  ;;
esac
##############################################################################
[[ -n ${CONTAINER} ]] || { 2>&1 echo "No container name provided"; exit 1 ; }
##############################################################################
[[ -f ${OPENSTACK_CONFIG} ]] || { 2>&1 echo "Credentials file ${OPENSTACK_CONFIG} not found"; exit 1 ; }
. ${OPENSTACK_CONFIG}
##############################################################################
export SSHPASS="${OS_TENANT_NAME}.${OS_USERNAME}.${OS_PASSWORD}"
sshpass -e \
  rsync -av "${@}" \
    pca@gateways.storage.${DATACENTER}.cloud.ovh.net:"${CONTAINER}"/

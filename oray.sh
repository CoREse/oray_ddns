#!/bin/bash
#--------------------------------------------------------------------------------
export PATH=/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin
WORKDIR="$(dirname "$0")"

export WORKDIR

cd "${WORKDIR}" || exit 1
#--------------------------------------------------------------------------------

. ./etc/secret || exit 1
. ./etc/config || exit 1

update_ddns() {
    local myip=$( curl -s http://ddns.oray.com/checkip | grep -oE  "([[:digit:]]+\.*)+")
    local url=
    local res=

    echo -n "$( date +"%F %T" ) "

    if [[ $? -eq 0 ]] ; then
        echo "get ip success."
    else
        echo "get ip fail."
    fi 
    
    url="http://${username}:${password}@${server}/ph/update?hostname=${my_domain}&myip=${myip}"
    res=$( curl -m 5 -s "${url}" )
    
    echo -n "$( date +"%F %T" ) "

    if [[ $? -eq 0 ]] ; then
        echo "${res}, update success."
    else
        echo "update fail."
    fi
}

#--------------------------------------------------------------------------------

update_ddns >> $logfile 2>&1

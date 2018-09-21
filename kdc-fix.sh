#!/bin/sh

# Modify the krbtgt principal to be renewable before ambari start

REALM=$(grep default_realm /etc/krb5.conf | awk '{ print $3 }')
kadmin.local -q "modprinc -maxlife 1days -maxrenewlife 7days +allow_renewable krbtgt/$REALM@$REALM"

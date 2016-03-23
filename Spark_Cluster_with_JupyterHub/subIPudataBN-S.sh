IP=$1
nova list | grep ${IP} >/dev/null 2>&1
if [ $? -eq 0 ]; then
  cat udataNB-S.txt | grep $IP >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    sed -i "s/^\(.*SPARK_MASTER_IP=\)\".*\"$/\1\"${IP}\"/" udataNB-S.txt
  fi
else
  echo "Error: No local IP address master in nova list"
  exit ${BAD_EXIT:-1}
fi
echo -n "Substitution success or udataNB-S.txt OK"
exit ${GOOD_EXIT:-0}


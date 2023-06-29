#!/bin/sh

function db_set {
  echo "$1,$2" >> database
}

function db_get {
  value=$(grep "^$1," database | sed -e "s/^$1,//" | tail -n 1)
  echo $value
}


if [ $# -eq 2 ]
then
$(db_set $1 $2)
fi
if [ $# -eq 1 ]
then
value=$(db_get $1)
echo "$value"
fi

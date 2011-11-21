#!/bin/bash

tagstat=$(herbstclient tag_status)

# get current tag
for t in {1..9} ; do
    case "$tagstat" in
           *"#$t"*)
                curtag=$t;;
    esac
done

# change to previous tag 
### comment this for scrotwm-like behaviour (only switch to busy tags)###
prevtag=$(($curtag-1))
herbstclient use  $prevtag



#function checkbusy()
#{
#    case "$tagstat" in
#        *':'$prevtag*)
#            busy=1
#        ;;
#        *)
#            busy=2
#        ;;
#    esac
#}

# determine if previous tag is busy
### uncomment this for scrotwm-like behaviour (only switch to busy tags)###
#if [[ "$tagstat" == *':'* ]]; then
#    busy=2
#    prevtag=$curtag
#    while [ $busy != 1 ] && (( 1 <= $prevtag )); do
#        prevtag=$(($prevtag-1))
#        checkbusy
#    done
#    herbstclient use $prevtag
#else
#    echo "lol"
#    exit
#fi


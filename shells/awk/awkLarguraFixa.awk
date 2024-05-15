#!/usr/bin/env -S awk -f
#BEGIN {
#    FIELDWIDTHS="6 50:21 50:21 50:13"
#    FS=","
#}

#NR > 2 {
#    print $1"|"$2"|"$3"|"$4"|"
#}

BEGIN {
    RS=""
    FS="\n"
}

{
    print "NOME :",$1
    print "IDADE:",$2
    print "CARGO:",$3
    print "RENDA:",$4
    print ""
}


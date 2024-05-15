#!/usr/bin/env -S awk -f
#João da Silva,Av. das Flores, 134,Jd. das Flores,Osasco,SP

# "abcdefghij"

BEGIN {
    FS = ""
}
{
    for (n = 1; n <= NF; n++)
        print "O campo",n,"é",$n
}

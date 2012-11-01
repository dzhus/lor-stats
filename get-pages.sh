#!/bin/bash

OUTFILE=output

CATEGORIES="
Linux_General
Linux.org.ru_server
KDE GNOME
Документация OpenSource
Mozilla RedHat Java
GNU's_Not_Unix
Security
Linux_в_России
Коммерческое_ПО
Linux_kernel Hardware_and_Drivers
BSD Debian OpenOffice_(StarOffice)
PDA Игры SCO Кластеры Apple Ubuntu_Linux Slackware"

rm $OUTFILE

echo -n 'Год-месяц' >> $OUTFILE
for cat in ${CATEGORIES}
do
    echo -n '	'$(echo ${cat} | sed -e 's/_/ /g') >> $OUTFILE
done

for year in 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007
do
    for month in 1 2 3 4 5 6 7 8 9 10 11 12
    do
        name="view-news.jsp?year=$year&month=$month&section=1"
        parsed_name="$year-$month"
#        wget http://www.linux.org.ru/$name > /dev/null
#        recode koi8-r..utf-8 $name
#        tidy --force-output 1 -asxml -utf8 -o $parsed_name $name 2> /dev/null
        xsltproc extract-news.xsl ${parsed_name} > tmp
        echo >> $OUTFILE
        echo -n $parsed_name >> $OUTFILE
        for cat in ${CATEGORIES}
        do
            cat=$(echo ${cat} | sed -e 's/_/ /g')
            echo -n '	'`grep "^[ ]*$cat" tmp | wc -l` >> $OUTFILE
        done
        rm $name  tmp
    done
done

echo >> $OUTFILE
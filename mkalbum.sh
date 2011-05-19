# World's simplest photo album generator. 
# Matt Snodderly. -- mds@area51a.net
# Example output: http://area51a.net/pics/airshow

[ ! -e thumbnails ] &&  mkdir thumbnails
echo '<HTML><HEAD><TITLE>'$@'</TITLE></HEAD><BODY><CENTER>'
echo '<h1>'$@'</h1>'
for i in *{jpg,JPG};
do
	n=`echo $i | sed -e 's/\..*//g'`
	if  [ -e $i -a ! -e thumbnails\/$n-sml.jpg  ] ; then
		convert $i -size 480x480 -unsharp 0x.5 -bordercolor black -border 2 -thumbnail 240x240  thumbnails\/$n-sml.jpg 
	fi 
	[ -e $i ] && echo '<a href="'$i'"><img src="thumbnails/'$n-sml.jpg'" style="margin:15px; border: 2px black solid;"/></a>'
done
echo '</CENTER>'
echo created: `date  +"%A %b %d %Y"`
echo '</BODY></HTML>'

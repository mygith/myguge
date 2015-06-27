#!/usr/bin/perl
use strict;
use warnings;
#过滤关键词
my @hateip=qw(
adwords
book
calendar
cn
checkout	
gtv0
facebook
finance
flickr
photo
ggpht
gvt0
ixquick
picasa
pack
youtube
ytimg
doubleclick
googlesyndication
googleadservices
music
video
steam
twitter
yahoo
);
my $strTmp="";
open(HOSTS,"hosts");
while(<HOSTS>){
	foreach my $ip (@hateip){
		if(/$ip/){
			#print “$ip\n";
			$_=~ s/^\w*$_//g;
			next;
		}
	}
	$strTmp=$strTmp.$_;
}
open(HOSTS,"> hosts");
print HOSTS $strTmp;
close HOSTS;

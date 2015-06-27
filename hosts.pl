open(IP,"ip");
open(HST,"> hosts");
while(<IP>){
	my $ip1=$_;
	$ip1=~s/\n//g;
	open(T,"ping $ip1 -c5 -q |");
	while(<T>){
		if(/.*\/(.+)\/.*\/.*/ && $1){
			$all{$ip1} = $1;
		}
	}
	close(T);
}
close(IP);
@YM=qw(
www.google.com
google.com
scholar.google.com
);
foreach my $key (sort  { $all{$b} <=> $all{$a} } keys %all){
	foreach my $ym (@YM){
		print HST $key." ".$ym."\n";
	}
}

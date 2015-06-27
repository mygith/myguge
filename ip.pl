#查询ip
use LWP::Simple;
use HTML::LinkExtor;

$html = get("http://www.itechzero.com/google-mirror-sites-collect.html");

open(IP,"> ip");

$link_extor = HTML::LinkExtor->new(\&handle_links);

$link_extor->parse($html);

sub handle_links
{
    ($tag, %links) = @_;

    if ($tag eq 'a') {

        foreach $key (keys %links) {
			
            if ($key eq 'href' && $links{$key} ~~ /\d{1,3}\.\d{1,3}/) {
				        $links{$key}=~ s/(http:\/\/|\/$)//g;
                say IP "$links{$key}";

            }

        }
    }
}

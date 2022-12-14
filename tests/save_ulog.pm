# Summary: save journal log 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';
use Mojo::File qw(path);
use Logging 'save_ulog';

sub run {

    my ($out, $filename) = @_;
    $out = system("journalctl --no-pager -axb -o short-precise");
    $filename = 'test.log';
    save_ulog($out, $filename);
    print "Writing to $filename successfully!\n" if -e path("ulogs/$filename");
}

1;


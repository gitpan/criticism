##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-0.04/t/00_compile.t $
#    $Date: 2006-11-05 20:06:19 -0800 (Sun, 05 Nov 2006) $
#   $Author: thaljef $
# $Revision: 174 $
##################################################################

use strict;
use warnings;
use Test::More tests => 8;

use_ok('criticism');
can_ok('criticism', 'import');

#-----------------------------------------------------------------------------

my @moods = qw( gentle stern harsh cruel brutal );
for my $mood ( @moods ) {
    use_ok('criticism', $mood);
}

#-----------------------------------------------------------------------------

eval { criticism->import( 'foo' ) };
like($@, qr/"foo" criticism/m, 'invalid mood');

#-----------------------------------------------------------------------------

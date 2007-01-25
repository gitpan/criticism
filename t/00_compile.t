##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-1.01/t/00_compile.t $
#    $Date: 2007-01-24 22:37:04 -0800 (Wed, 24 Jan 2007) $
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

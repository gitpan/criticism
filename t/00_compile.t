##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/t/00_compile.t $
#    $Date: 2006-01-14 20:51:09 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 174 $
##################################################################

use strict;
use warnings;
use Test::More tests => 8;

use_ok('criticism');
can_ok('criticism', 'import');
my @moods = qw( gentle stern harsh cruel brutal );
for ( @moods ) { use_ok('criticism', $_) }
eval qq{ use criticism 'foo'; }; ## no critic
ok($@, 'invalid mood');
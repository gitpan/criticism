##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/t/99_pod_coverage.t $
#    $Date: 2006-01-14 20:51:09 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 210 $
##################################################################

use strict;
use warnings;
use Test::More;

eval 'use Test::Pod::Coverage 1.04';
plan skip_all => 'Test::Pod::Coverage 1.00 requried to test POD' if $@;
all_pod_coverage_ok();

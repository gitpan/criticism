##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-0.04/t/99_pod_coverage.t $
#    $Date: 2006-11-05 20:06:19 -0800 (Sun, 05 Nov 2006) $
#   $Author: thaljef $
# $Revision: 210 $
##################################################################

use strict;
use warnings;
use Test::More;

eval 'use Test::Pod::Coverage 1.04';
plan skip_all => 'Test::Pod::Coverage 1.00 requried to test POD' if $@;
all_pod_coverage_ok();

##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/t/98_pod_syntax.t $
#    $Date: 2006-01-14 20:51:09 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 174 $
##################################################################

use strict;
use warnings;
use Test::More;

eval 'use Test::Pod 1.00';
plan skip_all => 'Test::Pod 1.00 required for testing POD' if $@;
all_pod_files_ok();
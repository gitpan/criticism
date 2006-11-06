##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-0.04/t/98_pod_syntax.t $
#    $Date: 2006-11-05 20:06:19 -0800 (Sun, 05 Nov 2006) $
#   $Author: thaljef $
# $Revision: 174 $
##################################################################

use strict;
use warnings;
use Test::More;

eval 'use Test::Pod 1.00';
plan skip_all => 'Test::Pod 1.00 required for testing POD' if $@;
all_pod_files_ok();
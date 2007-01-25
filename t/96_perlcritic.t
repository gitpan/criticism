###############################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-1.01/t/96_perlcritic.t $
#     $Date: 2007-01-24 22:37:04 -0800 (Wed, 24 Jan 2007) $
#   $Author: thaljef $
# $Revision: 1188 $
###############################################################################

use strict;
use warnings;
use File::Spec;
use Test::More;
use English qw(-no_match_vars);

#-----------------------------------------------------------------------------

if ( not $ENV{TEST_AUTHOR} ) {
    my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
    plan( skip_all => $msg );
}

eval { require Test::Perl::Critic; };

if ( $EVAL_ERROR ) {
   my $msg = 'Test::Perl::Critic required to criticise code';
   plan( skip_all => $msg );
}

#-----------------------------------------------------------------------------

my $rcfile = File::Spec->catfile( 't', 'perlcriticrc' );
Test::Perl::Critic->import( -profile => $rcfile );
all_critic_ok();

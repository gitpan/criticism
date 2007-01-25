##################################################################
#     $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-1.01/t/01_basic.t $
#    $Date: 2007-01-24 22:37:04 -0800 (Wed, 24 Jan 2007) $
#   $Author: thaljef $
# $Revision: 1188 $
##################################################################

use strict;
use warnings;
use Test::More tests => 9;

require criticism;
my $DEFAULT_VERBOSE = "%m at %f line %l.\n";

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 5, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args();
    is_deeply( \%got, \%expected, 'no args');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 5, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( 'gentle' );
    is_deeply( \%got, \%expected, 'args: gentle');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 4, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( 'stern' );
    is_deeply( \%got, \%expected, 'args: stern');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 3, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( 'harsh' );
    is_deeply( \%got, \%expected, 'args: harsh');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 2, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( 'cruel' );
    is_deeply( \%got, \%expected, 'args: cruel');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 1, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( 'brutal' );
    is_deeply( \%got, \%expected, 'args: brutal');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 2, -verbose => $DEFAULT_VERBOSE);
    my %got = criticism::_make_pc_args( -severity => 2 );
    is_deeply( \%got, \%expected, 'args: severity only');
}


#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 2, -verbose => '%f: %p');
    my %got = criticism::_make_pc_args( %expected );
    is_deeply( \%got, \%expected, 'args: severity + verbose');
}

#-----------------------------------------------------------------------------

{
    my %expected = (-severity => 2, -verbose => '%f: %p', -theme => 'foo');
    my %got = criticism::_make_pc_args( %expected );
    is_deeply( \%got, \%expected, 'args: many');
}

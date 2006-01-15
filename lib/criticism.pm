#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/lib/criticism.pm $
#     $Date: 2006-01-14 21:10:27 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 203 $
########################################################################

package criticism;

use strict;
use warnings;
use Perl::Critic;
use Carp;

our $VERSION = 0.01;
$VERSION = eval "$VERSION";  ## no critic

#-----------------------------------------------------------------------------

my %severity_of = (
    gentle => 5,
    stern  => 4,
    harsh  => 3,
    cruel  => 2,
    brutal => 1,
);

#-----------------------------------------------------------------------------

sub import {
    my ($pkg, $mood) = @_;

    if (defined $mood && ! exists $severity_of{$mood} ){
        my @moods = sort {$severity_of{$b} <=> $severity_of{$a}} keys %severity_of;
        croak qq{'$mood' criticsm not supported.  Choose from: @moods};
    }

    my $file = caller;
    return 1 if ! -f $file;

    my $sev          = $severity_of{$mood || 'gentle'};
    my $critic       = Perl::Critic->new( -severity => $sev );
    my @violations   = $critic->critique($file);
    if (@violations) { warn @violations };
    return @violations ? 0 : 1;
}

1;

__END__

#-----------------------------------------------------------------------------

=pod

=head1 NAME

criticism - Perl pragma to enforce coding standards

=head1 SYNOPSIS

  use criticism;

  use criticism 'stern';
  use criticism 'harsh';
  use criticism 'cruel';
  use criticism 'brutal';

=head1 DESCRIPTION

This pragma runs your file through L<Perl::Critic> before every
execution.  In practice, this isn't really feasible because it adds a
great deal of overhead at start-up.  Unless you really don't mind the
wait, you're probably better off using the L<perlcritic> command-line
or L<Test::Perl::Critic>.

=head1 AUTHOR

Jeffrey Ryan Thalhammer <thaljef@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2006 Jeffrey Ryan Thalhammer.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

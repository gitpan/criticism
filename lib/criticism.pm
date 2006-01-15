#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/lib/criticism.pm $
#     $Date: 2006-01-14 23:04:45 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 203 $
########################################################################

package criticism;

use strict;
use warnings;
use Perl::Critic;
use Perl::Critic::Violation;
use Carp;

our $VERSION = 0.02;
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
        my @moods = sort { $severity_of{$b} <=> $severity_of{$a} }
            keys %severity_of;
        croak qq{'$mood' criticsm not supported.  Choose from: @moods};
    }

    my $file = (caller)[1];
    return 1 if ! -f $file;

    my $sev          = $severity_of{$mood || 'gentle'};
    my $critic       = Perl::Critic->new( -severity => $sev );
    my @violations   = $critic->critique($file);

    if (@violations) {
        local $Perl::Critic::Violation::FORMAT
            = "$file: %m at line %l, column %c. %e.\n";
        warn @violations;
    }

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

  use criticism 'gentle';
  use criticism 'stern';
  use criticism 'harsh';
  use criticism 'cruel';
  use criticism 'brutal';

=head1 DESCRIPTION

This pragma runs your file through L<Perl::Critic> before every
execution.  In practice, this isn't always feasible because it adds a
great deal of overhead at start-up.  Unless you really don't mind the
wait, you're probably better off using the L<perlcritic> command-line
or L<Test::Perl::Critic>.

For scripts, you can manually load the C<criticism> pragma at the
command-line like this:

  perl -Mcriticism=cruel your_script.pl

Or if you only want to run L<Perl::Critic> during development and you
have not installed Perl::Critic in your production environment, try
this:

  eval {
      require criticism;
      criticism->import( 'cruel' );
  };

=head1 CONFIGURATION

The import argument is a named equivalent to the numeric severity
levels in Perl::Critic.  For example, C<use criticism 'gentle';>
reports only the most dangerous violations.  On the other hand, C<use
criticism 'brutal';> reports B<every> violation.  If the import
argument is not defined, it defaults to C<'gentle'>.

The C<criticsm> pragma will obey whatever configurations you have set
in your F<.perlcriticrc> file.  See L<Perl::Critic/"CONFIGURATION">
for more details.

=head1 NOTES

The C<criticism> pragma will apply to the whole file, so it is not
affected by scope boundaries and C<use>-ing it mutliple times will
just cause it to reprocess the same file.  There isn't a reciprocal
C<no criticism> pragma.  However, L<Perl::Critic> does support a
pseudo-pragma that directs it to overlook certain lines or blocks of
code.  See L<Perl::Critic/"BENDING THE RULES"> for more details.

=head1 AUTHOR

Jeffrey Ryan Thalhammer <thaljef@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2006 Jeffrey Ryan Thalhammer.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/lib/criticism.pm $
#     $Date: 2006-01-21 22:21:36 -0800 (Sat, 21 Jan 2006) $
#   $Author: thaljef $
# $Revision: 203 $
########################################################################

package criticism;

use strict;
use warnings;
use English qw(-no_match_vars);
use Carp;

our $VERSION = 0.03;
$VERSION = eval $VERSION;  ## no critic

#-----------------------------------------------------------------------------

my %severity_of = (
    gentle => 5,
    stern  => 4,
    harsh  => 3,
    cruel  => 2,
    brutal => 1,
);

my $default_mood = 'gentle';

#-----------------------------------------------------------------------------

sub import {

    my ($pkg, $mood) = @_;
    $mood ||= $default_mood;

    if (! exists $severity_of{$mood} ){
        my @moods = keys %severity_of;
        @moods = sort { $severity_of{$b} <=> $severity_of{$a} } @moods;
        croak qq{'$mood' criticsm not supported.  Choose from: @moods};
    }

    my $file = (caller)[1];
    return 1 if ! -f $file;
    my @violations = ();

    eval {
        require Perl::Critic;
        require Perl::Critic::Violation;
	my $sev     = $severity_of{$mood};
        my $critic  = Perl::Critic->new( -severity => $sev );
        @violations = $critic->critique($file);

        if (@violations) {
            ## no critic
            no warnings 'once';
            my $format = "$file: %m at line %l, column %c. %e.\n";
            local $Perl::Critic::Violation::FORMAT = $format;
            warn @violations;
        }
    };

    if ( $EVAL_ERROR && ($ENV{DEBUG} || $PERLDB) ) {
        carp qq{'criticism' failed to load: $EVAL_ERROR};
        return;
    }

    return @violations ? 0 : 1;
}


1;

__END__

#-----------------------------------------------------------------------------

=pod

=head1 NAME

criticism - Perl pragma to enforce coding standards and best-practices

=head1 SYNOPSIS

  use criticism;

  use criticism 'gentle';
  use criticism 'stern';
  use criticism 'harsh';
  use criticism 'cruel';
  use criticism 'brutal';

=head1 DESCRIPTION

This pragma enforces coding standards and promotes best-practices by
running your file through L<Perl::Critic> before every execution.  In
a production system, this usually isn't feasible because it adds a lot
of overhead at start-up.  If you have a separate development
environment, you can effectively bypass the C<criticism> pragma by not
installing L<Perl::Critic> in the production environment.  If
L<Perl::Critic> can't be loaded, then C<criticism> just fails
silently.

Alternatively, the C<perlcritic> command-line (which is distributed
with L<Perl::Critic>) can be used to analyze your files on-demand and
has some additional configuration features.  And L<Test::Perl::Critic>
provides a nice interface for analyzing files during the build
process.

=head1 CONFIGURATION

The import argument is a named equivalent to the numeric severity
levels in L<Perl::Critic>.  For example, C<use criticism 'gentle';>
reports only the most dangerous violations.  On the other hand, C<use
criticism 'brutal';> reports B<every> violation.  If the import
argument is not defined, it defaults to C<'gentle'>.

The C<criticism> pragma will obey whatever configurations you have set
in your F<.perlcriticrc> file.  See L<Perl::Critic/"CONFIGURATION">
for more details.

=head1 DIAGNOSTICS

Usually, the C<criticism> pragma fails silently.  But if you set the
C<DEBUG> environment variable to a true value or run your program
under the Perl debugger, you will get a warning when C<criticism>
fails to load L<Perl::Critic>.

=head1 NOTES

The C<criticism> pragma applies to the entire file, so it is not
affected by scope or package boundaries and C<use>-ing it multiple
times will just cause it to repeatedly process the same file.  There
isn't a reciprocal C<no criticism> pragma.  However, L<Perl::Critic>
does support a pseudo-pragma that directs it to overlook certain lines
or blocks of code.  See L<Perl::Critic/"BENDING THE RULES"> for more
details.

=head1 AUTHOR

Jeffrey Ryan Thalhammer <thaljef@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2006 Jeffrey Ryan Thalhammer.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

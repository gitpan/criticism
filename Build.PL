#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/Build.PL $
#     $Date: 2006-01-14 20:55:15 -0800 (Sat, 14 Jan 2006) $
#   $Author: thaljef $
# $Revision: 206 $
########################################################################

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name    => 'criticism',
    dist_author    => 'Jeffrey Thalhammer <thaljef@cpan.org>',
    dist_abstract  => 'Perl Pragma to enforce coding standards',
    requires       => {'Perl::Critic' => 0.13_01},
    build_requires => {'Test::More'   => 0},
    license        => 'perl',
);

$builder->create_build_script();

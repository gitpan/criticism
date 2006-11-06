#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-0.04/Build.PL $
#     $Date: 2006-11-05 20:06:19 -0800 (Sun, 05 Nov 2006) $
#   $Author: thaljef $
# $Revision: 206 $
########################################################################

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name    => 'criticism',
    dist_author    => 'Jeffrey Thalhammer <thaljef@cpan.org>',
    dist_abstract  => 'Perl pragma to enforce coding standards and best-practices',
    requires       => {'Perl::Critic' => 0.21},
    build_requires => {'Test::More'   => 0},
    license        => 'perl',
);

$builder->create_build_script();

#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-1.01/Build.PL $
#     $Date: 2007-01-24 22:37:04 -0800 (Wed, 24 Jan 2007) $
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

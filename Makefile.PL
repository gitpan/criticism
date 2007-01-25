#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-1.01/Makefile.PL $
#     $Date: 2007-01-24 22:37:04 -0800 (Wed, 24 Jan 2007) $
#   $Author: thaljef $
# $Revision: 206 $
########################################################################

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile (
    NAME           => 'criticism',
    AUTHOR         => 'Jeffrey Thalhammer <thaljef@cpan.org>',
    ABSTRACT_FROM  => 'lib/criticism.pm',
    VERSION_FROM   => 'lib/criticism.pm',
    PREREQ_PM      => {'Perl::Critic' => 0.21,
                       'Test::More'   => 0,
                      },
    PL_FILES       => {},
);

#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/tags/criticism-0.04/Makefile.PL $
#     $Date: 2006-11-05 20:06:19 -0800 (Sun, 05 Nov 2006) $
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

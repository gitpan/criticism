#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/criticism/Makefile.PL $
#     $Date: 2006-01-14 20:55:15 -0800 (Sat, 14 Jan 2006) $
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
    PREREQ_PM      => {'Perl::Critic' => 0.13_01},
    PL_FILES       => {},
);


use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.


if ($^O =~ /win/i) {
  $ProToolkitIncludeDir = ' -Id:/ptc-apps/protk23-2002270/protoolkit/includes ';
  $ProToolkitDefines = ' -DPROE_BUILD  -DPRO_MACHINE=19 -DPRO_OS=3 -DSOLARIS ';
  $ProToolkitDefines = ' -DPRO_MACHINE=29 -DPRO_OS=4 -Dhypot=_hypot '
                       . ' -DMSB_LEFT -Dfar=ptc_far -Dhuge=p_huge ' 
                       . ' -Dnear=p_near -c -W2 -G4 -D_X86_=1 ' 
                       . ' -D_WSTDIO_DEFINED ';
  $ExtraLibs = '../properl/properlexe.lib';
  # $ExtraLibs = '../properl/properldll.lib';
  $OtherLDFlags = ' -force /NODEFAULTLIB:libcmd.lib /subsystem:console /debug:none '
                  . ' /debugtype:coff /machine:i386 ';
}
else {
  $ProToolkitIncludeDir = '-I/home/mcm/sw/protk23-2002140/protoolkit/includes ';
  $ProToolkitDefines = ' -DPROE_BUILD  -DPRO_MACHINE=19 -DPRO_OS=3 -DSOLARIS ';
  $ExtraLibs = '';
  $OtherLDFlags = '';
}


WriteMakefile(


    'NAME'		=> 'CAD::ProEngineer',


    # finds $VERSION
    #
    'VERSION_FROM'	=> 'ProEngineer.pm', 


    # e.g., Module::Name => 1.1
    #
    'PREREQ_PM'		=> {},


    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'ProEngineer.pm', # retrieve abstract from module
       AUTHOR     => 'Marc Mettes <marcs_perl@yahoo.com>') : ()),


    # e.g., '-lm'
    #
    'LIBS' => [ $ExtraLibs . ' ' ],


    # e.g., '-DHAVE_SOMETHING'
    #
    'DEFINE'		=> $ProToolkitDefines . ' ',


    # Insert -I. if you add *.h files later: e.g., '-I/usr/include/other'
    #
    'INC'		=> $ProToolkitIncludeDir . ' ',


    # Un-comment this if you add C files to link with later:
    #
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too


    # Other stuff
    #
    'dynamic_lib' => {
        OTHERLDFLAGS => $OtherLDFlags,
    }


);


package Graph::Writer::DSM::Test;
use base qw(Test::Class);
use Test::TempDir;
use File::Path qw(rmtree);

INIT { Test::Class->runtests }

our $TEMP_DIR;
our $OLDPWD;

sub startup : Test(startup) {
  $OLDPWD = $ENV{PWD};
  $TEMP_DIR = temp_root;
  chdir $TEMP_DIR;
}

sub shutdown : Test(shutdown) {
  chdir $OLDPWD;
  rmtree $TEMP_DIR;
}

use Module::Install::Can;
sub can_run {
  Module::Install::Can->can_run($_[1]);
}

1;

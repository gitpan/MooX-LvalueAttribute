
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::Most" => 0,
    "Test::Pretty" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Provides Lvalue accessors to Moo class attributes",
  "dist_author" => [
    "Damien \"dams\" Krotkine"
  ],
  "dist_name" => "MooX-LvalueAttribute",
  "dist_version" => "0.10",
  "license" => "perl",
  "module_name" => "MooX::LvalueAttribute",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Hash::Util::FieldHash::Compat" => 0,
    "Moo" => "1.000008",
    "Variable::Magic" => "0.52",
    "strictures" => 1
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;

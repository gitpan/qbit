
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Pragma qbit",
  "AUTHOR" => "Sergei Svistunov <sergei-svistunov\@yandex.ru>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "qbit",
  "EXE_FILES" => [],
  "LICENSE" => "gpl",
  "NAME" => "qbit",
  "PREREQ_PM" => {
    "Clone" => 0,
    "Data::Dumper" => 0,
    "Date::Calc" => 0,
    "Exception" => 0,
    "Exporter" => 0,
    "HTML::Entities" => 0,
    "JSON::XS" => 0,
    "Locale::Messages" => 0,
    "Net::LibIDN" => 0,
    "POSIX" => 0,
    "Scalar::Util" => 0,
    "Time::Local" => 0,
    "URI::Escape" => 0,
    "base" => 0,
    "open" => 0,
    "overload" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Exception::Test" => 0,
    "File::Temp" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.7",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




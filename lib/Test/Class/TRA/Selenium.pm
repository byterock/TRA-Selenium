
$Test::Class::TRA::Selenium::VERSION = '0.0000.000001'; #vvery vvery beta
{ package  #Test::Class::TRA::Selenium
  Test::Class::TRA::Selenium;
  use Test::Class::Rig();
  use Test::WWW::Selenium       ];
  use Exporter ();
  @ISA = qw(Exporter Test::WWW::Selenium );
  $trdrh = undef;	# holds driver handle once initialized
  sub agent {
    return $trarh if $trarh;
    my($class, $attr) = @_;
    $class .= "::tra";
    # not a 'my' since we use it above to prevent multiple drivers
    $trarh = Test::Class::Rig::_new_trarh($class,"Test::WWW::Selenium", {
        'Name' => 'Selenium',
        'Version' => $VERSION,
        'Err'    => \my $err,
        'Errstr' => \my $errstr,
        'Attribution' => "TRA::Selenium $VERSION using Test::Class::Rig by John Scoles",
        });
    return $trarh;
  }
{ package  #Test::Class::TRA::Selenium::tra
  Test::Class::TRA::Selenium::tra;
  sub load_agent {
    my $self = shift;
    my ($attr)= @_;
    $attr = {$attr};
    my $agent  = Test::Class::Rig::rig::_new_agent($self,$attr);
    return $agent;
  }
  sub ping {
    warn("this is tra ping 'Test::Class::TRA::Selenium::tra'\n")
  }
} #Test::Class::TRA::Selenium::tra
} #Test::Class::TRA::Selenium;
1;
__END__

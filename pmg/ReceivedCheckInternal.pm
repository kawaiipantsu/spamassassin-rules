package ReceivedCheckInternal;
1;

use strict;

use Mail::SpamAssassin;
use Mail::SpamAssassin::Plugin;
our @ISA = qw(Mail::SpamAssassin::Plugin);


sub new {
        my ($class, $mailsa) = @_;
        $class = ref($class) || $class;
        my $self = $class->SUPER::new( $mailsa );
        bless ($self, $class);
        $self->register_eval_rule ( 'check_for_received_check_internal' );

        return $self;
}


# Los pescadores más profesionales suelen dar nombres claramente relacionados con la institución sobre la cual están enviando correos
sub check_for_received_check_internal {
        my ($self, $msg) = @_;

        my $relay = $msg->get( 'Received' );
        #my $direccion = $msg->get( 'To:addr' );

        #if ( $relay eq "" &&  $direccion =~ m/^[a-z]+[0-9]*\@salud\.gob\.sv/){
        #    Mail::SpamAssassin::Plugin::dbg( "ReceivedCheckInternal:  El envío no ha salido de nuestro servidor" . $relay) ;
        #    return 1;
        #}else{
        #    Mail::SpamAssassin::Plugin::dbg( "ReceivedCheckInternal: Esta no es confiable " . $relay) ;
        #}

        my @confiables = ['190.86.223.2', '10.10.20.2', '10.10.20.22'];
        
        Mail::SpamAssassin::Plugin::dbg( "ReceivedCheckInternal: $relay") ;
        while ($relay =~ /(([0-9]{1,3}+\.){3}[0-9]+)/g){
            if ($1 !~~ @confiables){
                Mail::SpamAssassin::Plugin::dbg( "ReceivedCheckInternal: $1 no es una dirección confiable" ) ;
                return 1;
            }else{
                Mail::SpamAssassin::Plugin::dbg( "ReceivedCheckInternal: Esta dirección es confiable $1") ;
            }
        }

        return 0;
}


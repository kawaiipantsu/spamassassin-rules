package ReturnPathMismatch;
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
        $self->register_eval_rule ( 'check_for_return_path_mismatch' );
        
        return $self;
}


# Los pescadores más profesionales suelen dar nombres claramente relacionados con la institución sobre la cual están enviando correos
sub check_for_return_path_mismatch {
        my ($self, $msg) = @_;

        my $direccion = $msg->get( 'From:addr' );
        $direccion =~ s/^\s+|\s+$//g;

        my $retorno = $msg->get('return-path') ;
        $retorno =~ s/^(\s+|\<)|(\s+|\>)$//g;

        Mail::SpamAssassin::Plugin::dbg( "ReturnPathMismatch: From $direccion" );
        Mail::SpamAssassin::Plugin::dbg( "ReturnPathMismatch: Retorno $retorno" );
        
        # Todo: una cuenta tipo "Info" debería devolver algún puntaje        
        if ( ($direccion ~~ m/^[a-z]+[0-9]*\@salud\.gob\.sv/) && ($direccion ne $retorno) ){
            Mail::SpamAssassin::Plugin::dbg( "ReturnPathMismatch: Somos alguna especie de spammer" );
            return 1
        }
            
        return 0;
}

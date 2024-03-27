package FromMinsalInvalido;
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
        $self->register_eval_rule ( 'check_for_from_minsal_invalido' );
        
        return $self;
}


# Los pescadores más profesionales suelen dar nombres claramente relacionados con la institución sobre la cual están enviando correos
sub check_for_from_minsal_invalido {
        my ($self, $msg) = @_;

        my $direccion = $msg->get( 'From:addr' );

        my $remitente = $msg->get('From:name') ;
        
        Mail::SpamAssassin::Plugin::dbg( "FromMinsalInvalido: From $direccion" );
        Mail::SpamAssassin::Plugin::dbg( "FromMinsalInvalido: Nombre $remitente" );
        
        # Todo: una cuenta tipo "Info" debería devolver algún puntaje        
        if (( $remitente =~ m/(ADMIN|POSTMASTER|AYUDA|IT\sOFFICE|WEBMASTER|WEBMAIL|ZIMBRA|HELP|AYUDA|CORREO|MAIL|DESK|MINSAL|SISTEMA|SEGURIDAD|MINISTERIO\sDE\sSALUD|SEGURIDAD|SOPORTE|GOB\sSV|GOB)/i ) && ($direccion !~ m/^[a-z]+[0-9]*\@salud\.gob\.sv/) ){
            Mail::SpamAssassin::Plugin::dbg( "FromMinsalInvalida: Somos alguna especie de spammer" );
            return 1
        }
            
        return 0;
}

package FromTooShortSender;
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
        $self->register_eval_rule ( 'check_for_from_too_short_sender' );
        
        return $self;
}


# Andan que no quieren poner un nombre. Mirá, que menos de tres es bastante imposible nombrar a un usuario
sub check_for_from_too_short_sender {
        my ($self, $msg) = @_;

        my $remitente = $msg->get('From:name') ;

        Mail::SpamAssassin::Plugin::dbg( "FromTooShortSender: Nombre $remitente" );
        
        if ( length(Encode::encode_utf8($remitente)) < 4) {
            Mail::SpamAssassin::Plugin::dbg( "FromTooShortSender: Es un nombre demasiado corto para ser real" );
            return 1
        }
            
        return 0;
}

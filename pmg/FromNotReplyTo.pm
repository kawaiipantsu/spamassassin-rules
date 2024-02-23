package FromNotReplyTo;
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
        $self->register_eval_rule ( 'check_for_from_not_reply_to' );
        
        return $self;
}


# Often spam uses different From: and Reply-To:
# while most legitimate e-mails does not.
sub check_for_from_not_reply_to {
        my ($self, $msg) = @_;

        my $from = $msg->get( 'From:addr' );
        my $replyTo = $msg->get( 'Reply-To:addr' );

        #Mail::SpamAssassin::Plugin::dbg( "FromNotReplyTo: Comparing '$from'/'$replyTo" );

        if ( $from ne '' && $replyTo ne '' && $from ne $replyTo ) {
                return 1;
        }

        return 0;
}

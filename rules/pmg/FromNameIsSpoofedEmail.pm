##################
# Detect the presence of an email in place of the name inside of Mime From header. Triggers only in case email is detected and differs from the value of name.
# Eg: "spoofed@email.example" <real@sender.example>
# By Peter Vilhan & Martin Galik @ VNET a.s.
##################

package FromNameIsSpoofedEmail;
use Mail::SpamAssassin::Plugin;
use Email::Valid;

our @ISA = qw(Mail::SpamAssassin::Plugin);

sub new {
    my ( $class, $mailsa ) = @_;

    # the usual perlobj boilerplate to create a subclass object
    $class = ref($class) || $class;
    my $self = $class->SUPER::new($mailsa);
    bless( $self, $class );

    # then register an eval rule, if desired...
    $self->register_eval_rule("check_for_from_name_is_not_spoofed_email");

    # and return the new plugin object
    return $self;
}

sub check_for_from_name_is_not_spoofed_email {
    my ( $self, $msg ) = @_;
    my $check_from_name = lc( $msg->get('From:name'));
    my $check_from_name_is_email = (Email::Valid->address($check_from_name) ? 1 : 0);

    if ($check_from_name_is_email){
	my $check_from_addr    = lc( $msg->get('From:addr') );
	my $check_from_addr_is_email = (Email::Valid->address($check_from_addr) ? 1 : 0);

	if ($check_from_addr_is_email && $check_from_name ne $check_from_addr){
		Mail::SpamAssassin::Plugin::dbg("FromNameIsSpoofedEmail: Email addresses differs '$check_from_name'/'$check_from_addr'!");
		return 1;
	}
		Mail::SpamAssassin::Plugin::dbg("FromNameIsSpoofedEmail: Email addresses passed the check '$check_from_name'/'$check_from_addr'!");	
    }

    return 0;
}

# This ;1 is important
1;

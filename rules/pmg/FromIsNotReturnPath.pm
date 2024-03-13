##################
# Compare Return-Path to Mime From header
# Supports SRS schemes and newsletters too
# By Peter Vilhan & Martin Galik @ VNET a.s.
##################

package FromIsNotReturnPath;
use Mail::SpamAssassin::Plugin;
use Email::Address;

our @ISA = qw(Mail::SpamAssassin::Plugin);

sub new {
    my ( $class, $mailsa ) = @_;

    # the usual perlobj boilerplate to create a subclass object
    $class = ref($class) || $class;
    my $self = $class->SUPER::new($mailsa);
    bless( $self, $class );

    # then register an eval rule, if desired...
    $self->register_eval_rule("check_for_from_is_not_return_path");

    # and return the new plugin object
    return $self;
}

sub check_for_from_is_not_return_path {
    my ( $self, $msg ) = @_;
    my $check_from_addr    = lc( $msg->get('From:addr') );
    my ($check_from_addr_domainA) = Email::Address->parse($check_from_addr);
    my $check_from_addr_domain = $check_from_addr_domainA->host;

    my $check_returnPath = lc( $msg->get('Return-Path:addr') );
    my ($check_returnPath_domainA) = Email::Address->parse($check_returnPath);
    my $check_returnPath_domain = $check_returnPath_domainA->host;
    my $check_to	= lc( $msg->get('To:addr') );


    # check if srs0 or srs1 was used. Supported delimiters +-=
	my $srstype = substr($check_returnPath, 4-1, 1);
        if (substr($check_returnPath, 1-1, 3) eq "srs"){
                my $splitter = substr($check_returnPath, 5-1, 1);
                if ( $srstype == "0") {
                        my @data = split(quotemeta($splitter), $check_returnPath);
                        $check_returnPath_domain = $data[3];
                }
                elsif ( $srstype == "1") {

                        my @data = split(quotemeta($splitter), $check_returnPath);
                        my $tmp = $data[3];
                        my $splitter2;
                        my @data2;
                        if($tmp eq ""){
                           my @tmp2 = split(quotemeta($splitter.$splitter), $check_returnPath);
                           $tmp = $tmp2[1];
                           $splitter2 = $splitter;
                           @data2 = split(quotemeta($splitter2), $tmp);
                           $check_returnPath_domain = $data2[2];

                        }
                        else {
                                $splitter2 = substr($tmp, 1-1, 1);
                                @data2 = split(quotemeta($splitter2), $tmp);
                                $check_returnPath_domain = $data2[3];

                        }
                }
        } elsif(substr($check_returnPath, 1-1, 6) eq "bounce" || length($msg->get('List-Unsubscribe')) gt 4){
		#allow bounces from 3rd party servers
		Mail::SpamAssassin::Plugin::dbg(
		        "FromIsNotReturnPath: Allowing newsletter from '$check_from_addr_domain'/'$check_returnPath' while heading to '$check_to'");

		return 0;
	}

    #
    #1, compare returnPath_domain to Mime From domain
    #
	if ($check_from_addr_domain ne '' && $check_returnPath_domain ne '' && $check_from_addr_domain ne $check_returnPath_domain ){
	    Mail::SpamAssassin::Plugin::dbg(
	        "FromIsNotReturnPath: Comparison failed for '$check_from_addr_domain'/'$check_returnPath_domain' while heading to '$check_to'");
	        return 1;
	}

	Mail::SpamAssassin::Plugin::dbg(
        "FromIsNotReturnPath: Domains check passed for '$check_from_addr_domain'/'$check_returnPath_domain' while heading to '$check_to'");
	return 0;
}

# This ;1 is important
1;

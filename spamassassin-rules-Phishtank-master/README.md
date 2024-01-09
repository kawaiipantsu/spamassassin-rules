# ᵔᴥᵔ SpamAssassin - My Custom Rules!

[![Twitter Follow](https://img.shields.io/twitter/follow/davidbl.svg?style=social&label=Follow)](https://twitter.com/davidbl) [![GitHub issues](https://img.shields.io/github/issues/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/issues) [![GitHub closed issues](https://img.shields.io/github/issues-closed/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/issues) [![GitHub license](https://img.shields.io/github/license/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/blob/master/LICENSE) [![GitHub forks](https://img.shields.io/github/forks/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/network) [![GitHub stars](https://img.shields.io/github/stars/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/stargazers)

> I use Spamassassin together with Amavisd and much more to support my Postfix SMTP server in fighting spam, phishing and viruses. Want to know more? - Let me know! ʘ‿ʘ

[![Apache SpamAssassin (tm)](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/SpamAssassin_logo.png/1023px-SpamAssassin_logo.png "Apache SpamAssassin (tm)")](https://spamassassin.apache.org)

# Table of Contents

 * [Spamassassin - What is it?](#spamassassin---what-is-it)
 * [Install Custom Rules](#install-custom-rules)
   * [Where do i put them?](#where-do-i-put-them)
   * [Activating the new rules](#activating-the-new-rules)
     * [Known paths, maybe one of these is what you use ?](#)
     * [Adding rules globally](#)
     * [Adding rules for individual users (User Pref)](#)
 * [My Custom Rules](#my-custom-rules)
   * [Local Rules](#local-rules)
   * [PhishTank Rules](#phishtank-rules)
 * [Documentation](#documentation)

## Spamassassin - What is it?

Apsamasassin is actually maintained by Apache now, this is great news as we know thye will maintain it for a very long time then. SpamAssassin is the #1 Open Source anti-spam platform giving system administrators a filter to classify email and block spam (unsolicited bulk email). It uses a robust scoring framework and plug-ins to integrate a wide range of advanced heuristic and statistical analysis tests on email headers and body text including text analysis, Bayesian filtering, DNS blocklists, and collaborative filtering databases.

> So keywords here are "scoring framwork". Keep this in mind, it will help you understand why my rules do as they do.

So basically Spamassassin ends up giving your email a score derived from a bunch of rules. This is the gist of the hole system. What you then do is to tell Spamassassin and/or underlaying filters/daemons like Amavisd to mark the mail as spam or etc. quarantine it or bounce it based on that score. I'm personally using Amavisd so all of my "what to do with the score" is handled by Amavisd. All i do is to pipe the mail to the spamassassin script/service and it then scans the mail letting amavisd handle the rest.

## Install custom rules

Overview on all custom rules and some basic information on how to install them and how to use them. By default spamassassin and amavis if setup propperly will automatically include all *.cf files under /etc/spamassassin.

### Where do i put them?

You can add custom rules to SpamAssassin in two ways. One way is to install the rules globally in a "global pref" path and the other way is to have the rules only apply for a specific user in a "user pref" path.

I only use rules added globally as mine is a dedicated SMTP server to i want this to apply to all services using Spamassassin.
But i will show you how to do both. Please note that path's may be different on your system. It all depends on what Spamassassin is configured with.

### Activating the new rules

Let's get going!

#### Known paths, maybe one of these is what you use ?

Again, this is just some of the known places to look. It will vary from installation to installation.
So you can't expect that the paths listed below is correct but in most cases one of them will be the right one :)

Note, the last 3 paths are all private aka "user pref" paths so most likely not what you want.

	/etc/spamassassin/
	or
	/etc/mail/spamassassin/
	or
	/var/lib/amavis/.spamassassin/
	or
	/var/spool/amavis/.spamassassin
	or
	/root/.spamassassin

#### Adding rules globally

Locate where you lcoal.cf file is, again check some of the paths above.
In my case it's located here: /etc/spamassassin/

This is also where you place your custom rules.
All rules must end with:

	.cf

I usually name mine "local-ruleinfo.cf". So that i know it's a local rule and what it does.

#### Adding rules for individual users (User Pref)

Locate where you lcoal.cf file is, again check some of the paths above.
In my case it's located here: /etc/spamassassin/

Edit the file local.cf and make sure that the following is enabled, it's on by default but just to make sure!

	cd /etc/spamassassin/	
	$EDITOR local.cf
	
	# Add this line to it if not there.
        allow_local_rules 1

Now you should be able to add custom-rules.cf files to your own User_Pref path.
Check the paths above to see what they might look like. In most cases they will be located inside your own $HOME dir.

So check out the following path first

	cd ~/.spamassassin

Put your custom rules here if it exists.
All rules must end with:

	.cf

I usually name mine "local-ruleinfo.cf". So that i know it's a local rule and what it does.

## My Custom Rules

> My custom rules may not all be of use to you. But if you live in the EU i would recommend to just use them all as nothing would break. What i mean by that is i might block or blacklist things that makes no sense if you don't live inside EU. So the scores wont work correctly when i'm whitelisting etc. In most cases, you can just change it or let me know and i will add your changes so it also suits your setup!

### Local Rules

These rules are more specific, things i might have encountered on my mail server that i explicitly wanted to block

### PhishTank Rules

These are the new PhishTank rules - Using the public database from phishtank.com i build rules and if they ever publish unvalidated and offine databases then i'm prepared for it. But basicly this will match any KNOWN web URL from Phishtank in TEXT body or HTML URI tags.

Please note there is over 25000+ so i have split it up into age as well. If you take the no more than 7 days old rules you are down to only 1500 or so.

## Documentation

This is just links to external reference sites and how-to and guides that i have found over the years. I have also included links to the official documentation just to make sure that you start at the right place before venturing out into the custom guides :) Also i don't really check up on the links, so some might be dead and or not working correctly! You are more than welcome to notify me if you think a link needs to be removed.

> Official documentation by Apache Software Foundation (tm)

 * [Apache SpamAssassin / Docs](https://spamassassin.apache.org/doc.html)
 * [Apache SpamAssassin / Wiki](http://wiki.apache.org/spamassassin/)
 * [Apache SpamAssassin / Writing rules](https://wiki.apache.org/spamassassin/WritingRules)
 * [Apache SpamAssassin / Rules](https://wiki.apache.org/spamassassin/SpamAssassinRules)
 * [Apache SpamAssassin / Install](http://svn.apache.org/repos/asf/spamassassin/branches/3.4/INSTALL)
 * [Apache SpamAssassin / Issues](http://issues.apache.org/SpamAssassin/)

> Un-official documentation, guides and how-to's

 * [O'Reilly Commons - SpamAssassin Rules](http://commons.oreilly.com/wiki/index.php/SpamAssassin/SpamAssassin_Rules)
 * [SpamAssassin cookbook](http://johnbokma.com/spam/spamassassin-cookbook.html)
 * [RFC-2822 - Internet Message Format](https://tools.ietf.org/html/rfc2822)

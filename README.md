# ᵔᴥᵔ SpamAssassin - My Custom Rules!

[![Twitter Follow](https://img.shields.io/twitter/follow/davidbl.svg?style=social&label=Follow)](https://twitter.com/davidbl) [![GitHub issues](https://img.shields.io/github/issues/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/issues) [![GitHub closed issues](https://img.shields.io/github/issues-closed/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/issues) [![GitHub license](https://img.shields.io/github/license/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/blob/master/LICENSE) [![GitHub forks](https://img.shields.io/github/forks/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/network) [![GitHub stars](https://img.shields.io/github/stars/kawaiipantsu/spamassassin-rules.svg)](https://github.com/kawaiipantsu/spamassassin-rules/stargazers)

> I use Spamassassin together with Amavisd and much more to support my Postfix SMTP server in fighting spam, phishing and viruses. Want to know more? - Let me know! ʘ‿ʘ

[![Apache SpamAssassin (tm)](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/SpamAssassin_logo.png/1023px-SpamAssassin_logo.png "Apache SpamAssassin (tm)")](https://spamassassin.apache.org)

# Table of Contents

 * [Spamassassin - What is it?](#spamassassin---what-is-it)
 * [Custom Rules](#custom-rules)
   * [Where do i put them?](#where-do-i-put-them)
   * [Activating the new rules](#activating--the--new--rules)
   * [Overview on custom rules](#overview-on-custom-rules)
     * [Rule #01](#)
     * [Rule #02](#)
     * [Rule #03](#)
 * [Documentation](#documentation)

## Spamassassin - What is it?

Apsamasassin is actually maintained by Apache now, this is great news as we know thye will maintain it for a very long time then. SpamAssassin is the #1 Open Source anti-spam platform giving system administrators a filter to classify email and block spam (unsolicited bulk email). It uses a robust scoring framework and plug-ins to integrate a wide range of advanced heuristic and statistical analysis tests on email headers and body text including text analysis, Bayesian filtering, DNS blocklists, and collaborative filtering databases.

> So keywords here are "scoring framwork". Keep this in mind, it will help you understand why my rules do as they do.

So basically Spamassassin ends up giving your email a score derived from a bunch of rules. This is the gist of the hole system. What you then do is to tell Spamassassin and/or underlaying filters/daemons like Amavisd to mark the mail as spam or etc. quarantine it or bounce it. I'm personally using Amavisd so all of my "what to do with the score" is handled by Amavisd. All i do is to pipe the mail to the spamassassin script/service and it then scans the mail letting amavisd handle the rest.

## Custom rules

Overview on all custom rules and some basic information on how to install them and how to use them. By default spamassassin and amavis if setup propperly will automatically include all *.cf files under /etc/spamassassin.

### Where do i put them?

### Activating the new rules

	/etc/mail/spamassassin/local.cf
	allow_local_rules 1

### Overview on custom rules

> My custom rules may not all be of use to you. But if you live in the EU i would recommend to just use them all as nothing would break. What i mean by that is i might block or blacklist things that makes no sense if you don't live inside EU. So the scores wont work correctly when i'm whitelisting etc. In most cases, you can just change it or let me know and i will add your changes so it also suits your setup!

Just testing how to show the rules, this is just temporarily...

#### Rule #01

#### Rule #02

#### Rule #03

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

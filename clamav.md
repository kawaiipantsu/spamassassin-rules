cd /var/lib/pmg/templates/
nano freshclam.conf.in


ClamAV Unofficial Sign Database Repository



# Custom Database Clamav With token (register for free https://www.securiteinfo.com/clients/customers/account ) 
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfo.hdb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfo.ign2
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/javascript.ndb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/spam_marketing.ndb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfohtml.hdb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfoascii.hdb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfoandroid.hdb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfoold.hdb
DatabaseCustomURL https://www.securiteinfo.com/get/signatures/bdfb9cec50311d4cc8832695f1431b92d2e7dfd91836f01127745b1d6010cbb2e5f31623eb2e2d9235416fd1c8969089d4cf88a796bf56ffa4a63fded3fd9f69/securiteinfopdf.hdb

# Malware
DatabaseCustomURL https://cdn.malware.expert/malware.expert.ndb
DatabaseCustomURL https://cdn.malware.expert/malware.expert.hdb
DatabaseCustomURL https://cdn.malware.expert/malware.expert.ldb
DatabaseCustomURL https://cdn.malware.expert/malware.expert.fp

# Sanesecurity + Foxhole
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/MiscreantPunch099-INFO-Low.ldb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/MiscreantPunch099-Low.ldb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/Sanesecurity_BlackEnergy.yara
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/Sanesecurity_sigtest.yara
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/Sanesecurity_spam.yara
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/badmacro.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/blurl.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_cracked_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_malware_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_malware_attach.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_phishing_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/crdfam.clamav.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/doppelstern-phishtank.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/doppelstern.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/doppelstern.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_all.cdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_all.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_filename.cdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_generic.cdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_js.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/foxhole_mail.cdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/hackingteam.hsb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/junk.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/jurlbl.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/jurlbla.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/lott.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/malwarehash.hsb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/phish.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/phishtank.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/porcupine.hsb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/porcupine.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/rogue.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/scam.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/scamnailer.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/shelter.ldb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/sigwhitelist.ign2
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/spam.ldb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/spamattach.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/spamimg.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/spear.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/spearl.ndb

# winnow
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow.attachments.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow.complex.patterns.ldb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_bad_cw.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_extended_malware.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_extended_malware_links.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_malware.hdb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_phish_complete.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_phish_complete_url.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/winnow_spam_complete.ndb

# bofhland
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_cracked_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_malware_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_phishing_URL.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/bofhland_malware_attach.hdb


# Porcupine
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/porcupine.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/phishtank.ndb
DatabaseCustomURL https://mirror.ihost.md/clamav/sanesecurity/porcupine.hsb

#maldet
DatabaseCustomURL https://www.rfxn.com/downloads/rfxn.ndb
DatabaseCustomURL https://www.rfxn.com/downloads/rfxn.hdb
DatabaseCustomURL https://urlhaus.abuse.ch/downloads/urlhaus.ndb

#interserver
DatabaseCustomURL http://rbl.interserver.net/interserver256.hdb
DatabaseCustomURL http://rbl.interserver.net/interservertopline.db
DatabaseCustomURL http://rbl.interserver.net/shell.ldb
DatabaseCustomURL http://rbl.interserver.net/whitelist.fp

cd /tmp; pmgconfig sync --restart 1

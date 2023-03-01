#!/bin/bash

DUMPPATH=/dumptools
cd "$DUMPPATH"
MYPATH=`pwd`
arg_source_password="asdf123"
arg_target_password="asdf123"

    if [ -z "$arg_source_password" ] && [ -z "$arg_target_password" ] ; then
        echo WARNING: Both source and target RDBMSes passwords are empty. You should edit this file to set them.
        exit 1
    fi
    if [ -f $MYPATH/bulk_copy_errors.log ] ; then
    rm $MYPATH/bulk_copy_errors.log
fi
if [ -f /tmp/phpbb_acl_groups.txt ];
then
   rm /tmp/phpbb_acl_groups.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_acl_groups.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_acl_options.txt ];
then
   rm /tmp/phpbb_acl_options.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_acl_options.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_acl_roles.txt ];
then
   rm /tmp/phpbb_acl_roles.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_acl_roles.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_acl_roles_data.txt ];
then
   rm /tmp/phpbb_acl_roles_data.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_acl_roles_data.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_acl_users.txt ];
then
   rm /tmp/phpbb_acl_users.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_acl_users.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_attachments.txt ];
then
   rm /tmp/phpbb_attachments.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_attachments.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_banlist.txt ];
then
   rm /tmp/phpbb_banlist.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_banlist.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_bbcodes.txt ];
then
   rm /tmp/phpbb_bbcodes.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_bbcodes.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_bookmarks.txt ];
then
   rm /tmp/phpbb_bookmarks.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_bookmarks.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_bots.txt ];
then
   rm /tmp/phpbb_bots.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_bots.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_captcha_answers.txt ];
then
   rm /tmp/phpbb_captcha_answers.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_captcha_answers.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_captcha_questions.txt ];
then
   rm /tmp/phpbb_captcha_questions.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_captcha_questions.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_config.txt ];
then
   rm /tmp/phpbb_config.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_config.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_config_text.txt ];
then
   rm /tmp/phpbb_config_text.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_config_text.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_confirm.txt ];
then
   rm /tmp/phpbb_confirm.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_confirm.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_disallow.txt ];
then
   rm /tmp/phpbb_disallow.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_disallow.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_drafts.txt ];
then
   rm /tmp/phpbb_drafts.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_drafts.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_ext.txt ];
then
   rm /tmp/phpbb_ext.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_ext.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_extension_groups.txt ];
then
   rm /tmp/phpbb_extension_groups.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_extension_groups.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_extensions.txt ];
then
   rm /tmp/phpbb_extensions.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_extensions.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_forums.txt ];
then
   rm /tmp/phpbb_forums.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_forums.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_forums_access.txt ];
then
   rm /tmp/phpbb_forums_access.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_forums_access.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_forums_track.txt ];
then
   rm /tmp/phpbb_forums_track.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_forums_track.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_forums_watch.txt ];
then
   rm /tmp/phpbb_forums_watch.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_forums_watch.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_groups.txt ];
then
   rm /tmp/phpbb_groups.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_groups.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_icons.txt ];
then
   rm /tmp/phpbb_icons.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_icons.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_lang.txt ];
then
   rm /tmp/phpbb_lang.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_lang.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_log.txt ];
then
   rm /tmp/phpbb_log.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_log.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_login_attempts.txt ];
then
   rm /tmp/phpbb_login_attempts.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_login_attempts.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_migrations.txt ];
then
   rm /tmp/phpbb_migrations.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_migrations.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_moderator_cache.txt ];
then
   rm /tmp/phpbb_moderator_cache.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_moderator_cache.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_modules.txt ];
then
   rm /tmp/phpbb_modules.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_modules.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_notification_types.txt ];
then
   rm /tmp/phpbb_notification_types.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_notification_types.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_notifications.txt ];
then
   rm /tmp/phpbb_notifications.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_notifications.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_oauth_accounts.txt ];
then
   rm /tmp/phpbb_oauth_accounts.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_oauth_accounts.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_oauth_states.txt ];
then
   rm /tmp/phpbb_oauth_states.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_oauth_states.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_oauth_tokens.txt ];
then
   rm /tmp/phpbb_oauth_tokens.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_oauth_tokens.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_poll_options.txt ];
then
   rm /tmp/phpbb_poll_options.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_poll_options.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_poll_votes.txt ];
then
   rm /tmp/phpbb_poll_votes.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_poll_votes.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_posts.txt ];
then
   rm /tmp/phpbb_posts.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_posts.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_privmsgs.txt ];
then
   rm /tmp/phpbb_privmsgs.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_privmsgs.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_privmsgs_folder.txt ];
then
   rm /tmp/phpbb_privmsgs_folder.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_privmsgs_folder.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_privmsgs_rules.txt ];
then
   rm /tmp/phpbb_privmsgs_rules.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_privmsgs_rules.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_privmsgs_to.txt ];
then
   rm /tmp/phpbb_privmsgs_to.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_privmsgs_to.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_profile_fields.txt ];
then
   rm /tmp/phpbb_profile_fields.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_profile_fields.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_profile_fields_data.txt ];
then
   rm /tmp/phpbb_profile_fields_data.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_profile_fields_data.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_profile_fields_lang.txt ];
then
   rm /tmp/phpbb_profile_fields_lang.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_profile_fields_lang.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_profile_lang.txt ];
then
   rm /tmp/phpbb_profile_lang.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_profile_lang.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_qa_confirm.txt ];
then
   rm /tmp/phpbb_qa_confirm.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_qa_confirm.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_ranks.txt ];
then
   rm /tmp/phpbb_ranks.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_ranks.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_reports.txt ];
then
   rm /tmp/phpbb_reports.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_reports.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_reports_reasons.txt ];
then
   rm /tmp/phpbb_reports_reasons.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_reports_reasons.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_search_results.txt ];
then
   rm /tmp/phpbb_search_results.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_search_results.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_search_wordlist.txt ];
then
   rm /tmp/phpbb_search_wordlist.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_search_wordlist.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_search_wordmatch.txt ];
then
   rm /tmp/phpbb_search_wordmatch.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_search_wordmatch.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_sessions.txt ];
then
   rm /tmp/phpbb_sessions.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_sessions.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_sessions_keys.txt ];
then
   rm /tmp/phpbb_sessions_keys.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_sessions_keys.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_sitelist.txt ];
then
   rm /tmp/phpbb_sitelist.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_sitelist.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_smilies.txt ];
then
   rm /tmp/phpbb_smilies.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_smilies.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_styles.txt ];
then
   rm /tmp/phpbb_styles.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_styles.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_teampage.txt ];
then
   rm /tmp/phpbb_teampage.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_teampage.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_topics.txt ];
then
   rm /tmp/phpbb_topics.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_topics.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_topics_posted.txt ];
then
   rm /tmp/phpbb_topics_posted.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_topics_posted.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_topics_track.txt ];
then
   rm /tmp/phpbb_topics_track.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_topics_track.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_topics_watch.txt ];
then
   rm /tmp/phpbb_topics_watch.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_topics_watch.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_user_group.txt ];
then
   rm /tmp/phpbb_user_group.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_user_group.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_user_notifications.txt ];
then
   rm /tmp/phpbb_user_notifications.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_user_notifications.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_users.txt ];
then
   rm /tmp/phpbb_users.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_users.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_warnings.txt ];
then
   rm /tmp/phpbb_warnings.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_warnings.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_words.txt ];
then
   rm /tmp/phpbb_words.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_words.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
if [ -f /tmp/phpbb_zebra.txt ];
then
   rm /tmp/phpbb_zebra.txt 2> /dev/null
   if [ $? -ne 0 ];then
       echo "File /tmp/phpbb_zebra.txt already exists. You should remove file before running this script."
       exit 1
   fi
fi
pushd /tmp
echo [0 %] Creating directory dump_phpbb
mkdir dump_phpbb
pushd dump_phpbb
echo "SET SESSION UNIQUE_CHECKS=0;" > import_phpbb.sql
echo "SET SESSION FOREIGN_KEY_CHECKS=0;" >> import_phpbb.sql
echo "use phpbb;" >> import_phpbb.sql
echo [1 %] Start dumping tables
psql -U postgres -d phpbb -c "COPY phpbb_acl_groups TO stdout DELIMITER ',';" > phpbb_acl_groups.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_acl_groups.csv' INTO TABLE phpbb_acl_groups FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [2 %] Dumped table phpbb_acl_groups
psql -U postgres -d phpbb -c "COPY phpbb_acl_options TO stdout DELIMITER ',';" > phpbb_acl_options.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_acl_options.csv' INTO TABLE phpbb_acl_options FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [4 %] Dumped table phpbb_acl_options
psql -U postgres -d phpbb -c "COPY phpbb_acl_roles TO stdout DELIMITER ',';" > phpbb_acl_roles.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_acl_roles.csv' INTO TABLE phpbb_acl_roles FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [5 %] Dumped table phpbb_acl_roles
psql -U postgres -d phpbb -c "COPY phpbb_acl_roles_data TO stdout DELIMITER ',';" > phpbb_acl_roles_data.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_acl_roles_data.csv' INTO TABLE phpbb_acl_roles_data FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [6 %] Dumped table phpbb_acl_roles_data
psql -U postgres -d phpbb -c "COPY phpbb_acl_users TO stdout DELIMITER ',';" > phpbb_acl_users.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_acl_users.csv' INTO TABLE phpbb_acl_users FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [8 %] Dumped table phpbb_acl_users
psql -U postgres -d phpbb -c "COPY phpbb_attachments TO stdout DELIMITER ',';" > phpbb_attachments.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_attachments.csv' INTO TABLE phpbb_attachments FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [9 %] Dumped table phpbb_attachments
psql -U postgres -d phpbb -c "COPY phpbb_banlist TO stdout DELIMITER ',';" > phpbb_banlist.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_banlist.csv' INTO TABLE phpbb_banlist FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [10 %] Dumped table phpbb_banlist
psql -U postgres -d phpbb -c "COPY phpbb_bbcodes TO stdout DELIMITER ',';" > phpbb_bbcodes.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_bbcodes.csv' INTO TABLE phpbb_bbcodes FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [12 %] Dumped table phpbb_bbcodes
psql -U postgres -d phpbb -c "COPY phpbb_bookmarks TO stdout DELIMITER ',';" > phpbb_bookmarks.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_bookmarks.csv' INTO TABLE phpbb_bookmarks FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [13 %] Dumped table phpbb_bookmarks
psql -U postgres -d phpbb -c "COPY phpbb_bots TO stdout DELIMITER ',';" > phpbb_bots.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_bots.csv' INTO TABLE phpbb_bots FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [14 %] Dumped table phpbb_bots
psql -U postgres -d phpbb -c "COPY phpbb_captcha_answers TO stdout DELIMITER ',';" > phpbb_captcha_answers.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_captcha_answers.csv' INTO TABLE phpbb_captcha_answers FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [16 %] Dumped table phpbb_captcha_answers
psql -U postgres -d phpbb -c "COPY phpbb_captcha_questions TO stdout DELIMITER ',';" > phpbb_captcha_questions.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_captcha_questions.csv' INTO TABLE phpbb_captcha_questions FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [17 %] Dumped table phpbb_captcha_questions
psql -U postgres -d phpbb -c "COPY phpbb_config TO stdout DELIMITER ',';" > phpbb_config.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_config.csv' INTO TABLE phpbb_config FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [18 %] Dumped table phpbb_config
psql -U postgres -d phpbb -c "COPY phpbb_config_text TO stdout DELIMITER ',';" > phpbb_config_text.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_config_text.csv' INTO TABLE phpbb_config_text FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [20 %] Dumped table phpbb_config_text
psql -U postgres -d phpbb -c "COPY phpbb_confirm TO stdout DELIMITER ',';" > phpbb_confirm.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_confirm.csv' INTO TABLE phpbb_confirm FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [21 %] Dumped table phpbb_confirm
psql -U postgres -d phpbb -c "COPY phpbb_disallow TO stdout DELIMITER ',';" > phpbb_disallow.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_disallow.csv' INTO TABLE phpbb_disallow FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [22 %] Dumped table phpbb_disallow
psql -U postgres -d phpbb -c "COPY phpbb_drafts TO stdout DELIMITER ',';" > phpbb_drafts.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_drafts.csv' INTO TABLE phpbb_drafts FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [24 %] Dumped table phpbb_drafts
psql -U postgres -d phpbb -c "COPY phpbb_ext TO stdout DELIMITER ',';" > phpbb_ext.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_ext.csv' INTO TABLE phpbb_ext FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [25 %] Dumped table phpbb_ext
psql -U postgres -d phpbb -c "COPY phpbb_extension_groups TO stdout DELIMITER ',';" > phpbb_extension_groups.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_extension_groups.csv' INTO TABLE phpbb_extension_groups FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [27 %] Dumped table phpbb_extension_groups
psql -U postgres -d phpbb -c "COPY phpbb_extensions TO stdout DELIMITER ',';" > phpbb_extensions.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_extensions.csv' INTO TABLE phpbb_extensions FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [28 %] Dumped table phpbb_extensions
psql -U postgres -d phpbb -c "COPY phpbb_forums TO stdout DELIMITER ',';" > phpbb_forums.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_forums.csv' INTO TABLE phpbb_forums FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [29 %] Dumped table phpbb_forums
psql -U postgres -d phpbb -c "COPY phpbb_forums_access TO stdout DELIMITER ',';" > phpbb_forums_access.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_forums_access.csv' INTO TABLE phpbb_forums_access FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [31 %] Dumped table phpbb_forums_access
psql -U postgres -d phpbb -c "COPY phpbb_forums_track TO stdout DELIMITER ',';" > phpbb_forums_track.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_forums_track.csv' INTO TABLE phpbb_forums_track FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [32 %] Dumped table phpbb_forums_track
psql -U postgres -d phpbb -c "COPY phpbb_forums_watch TO stdout DELIMITER ',';" > phpbb_forums_watch.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_forums_watch.csv' INTO TABLE phpbb_forums_watch FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [33 %] Dumped table phpbb_forums_watch
psql -U postgres -d phpbb -c "COPY phpbb_groups TO stdout DELIMITER ',';" > phpbb_groups.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_groups.csv' INTO TABLE phpbb_groups FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [35 %] Dumped table phpbb_groups
psql -U postgres -d phpbb -c "COPY phpbb_icons TO stdout DELIMITER ',';" > phpbb_icons.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_icons.csv' INTO TABLE phpbb_icons FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [36 %] Dumped table phpbb_icons
psql -U postgres -d phpbb -c "COPY phpbb_lang TO stdout DELIMITER ',';" > phpbb_lang.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_lang.csv' INTO TABLE phpbb_lang FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [37 %] Dumped table phpbb_lang
psql -U postgres -d phpbb -c "COPY phpbb_log TO stdout DELIMITER ',';" > phpbb_log.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_log.csv' INTO TABLE phpbb_log FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [39 %] Dumped table phpbb_log
psql -U postgres -d phpbb -c "COPY phpbb_login_attempts TO stdout DELIMITER ',';" > phpbb_login_attempts.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_login_attempts.csv' INTO TABLE phpbb_login_attempts FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [40 %] Dumped table phpbb_login_attempts
psql -U postgres -d phpbb -c "COPY phpbb_migrations TO stdout DELIMITER ',';" > phpbb_migrations.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_migrations.csv' INTO TABLE phpbb_migrations FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [41 %] Dumped table phpbb_migrations
psql -U postgres -d phpbb -c "COPY phpbb_moderator_cache TO stdout DELIMITER ',';" > phpbb_moderator_cache.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_moderator_cache.csv' INTO TABLE phpbb_moderator_cache FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [43 %] Dumped table phpbb_moderator_cache
psql -U postgres -d phpbb -c "COPY phpbb_modules TO stdout DELIMITER ',';" > phpbb_modules.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_modules.csv' INTO TABLE phpbb_modules FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [44 %] Dumped table phpbb_modules
psql -U postgres -d phpbb -c "COPY phpbb_notification_types TO stdout DELIMITER ',';" > phpbb_notification_types.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_notification_types.csv' INTO TABLE phpbb_notification_types FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [45 %] Dumped table phpbb_notification_types
psql -U postgres -d phpbb -c "COPY phpbb_notifications TO stdout DELIMITER ',';" > phpbb_notifications.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_notifications.csv' INTO TABLE phpbb_notifications FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [47 %] Dumped table phpbb_notifications
psql -U postgres -d phpbb -c "COPY phpbb_oauth_accounts TO stdout DELIMITER ',';" > phpbb_oauth_accounts.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_oauth_accounts.csv' INTO TABLE phpbb_oauth_accounts FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [48 %] Dumped table phpbb_oauth_accounts
psql -U postgres -d phpbb -c "COPY phpbb_oauth_states TO stdout DELIMITER ',';" > phpbb_oauth_states.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_oauth_states.csv' INTO TABLE phpbb_oauth_states FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [50 %] Dumped table phpbb_oauth_states
psql -U postgres -d phpbb -c "COPY phpbb_oauth_tokens TO stdout DELIMITER ',';" > phpbb_oauth_tokens.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_oauth_tokens.csv' INTO TABLE phpbb_oauth_tokens FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [51 %] Dumped table phpbb_oauth_tokens
psql -U postgres -d phpbb -c "COPY phpbb_poll_options TO stdout DELIMITER ',';" > phpbb_poll_options.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_poll_options.csv' INTO TABLE phpbb_poll_options FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [52 %] Dumped table phpbb_poll_options
psql -U postgres -d phpbb -c "COPY phpbb_poll_votes TO stdout DELIMITER ',';" > phpbb_poll_votes.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_poll_votes.csv' INTO TABLE phpbb_poll_votes FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [54 %] Dumped table phpbb_poll_votes
psql -U postgres -d phpbb -c "COPY phpbb_posts TO stdout DELIMITER ',';" > phpbb_posts.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_posts.csv' INTO TABLE phpbb_posts FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [55 %] Dumped table phpbb_posts
psql -U postgres -d phpbb -c "COPY phpbb_privmsgs TO stdout DELIMITER ',';" > phpbb_privmsgs.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_privmsgs.csv' INTO TABLE phpbb_privmsgs FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [56 %] Dumped table phpbb_privmsgs
psql -U postgres -d phpbb -c "COPY phpbb_privmsgs_folder TO stdout DELIMITER ',';" > phpbb_privmsgs_folder.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_privmsgs_folder.csv' INTO TABLE phpbb_privmsgs_folder FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [58 %] Dumped table phpbb_privmsgs_folder
psql -U postgres -d phpbb -c "COPY phpbb_privmsgs_rules TO stdout DELIMITER ',';" > phpbb_privmsgs_rules.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_privmsgs_rules.csv' INTO TABLE phpbb_privmsgs_rules FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [59 %] Dumped table phpbb_privmsgs_rules
psql -U postgres -d phpbb -c "COPY phpbb_privmsgs_to TO stdout DELIMITER ',';" > phpbb_privmsgs_to.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_privmsgs_to.csv' INTO TABLE phpbb_privmsgs_to FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [60 %] Dumped table phpbb_privmsgs_to
psql -U postgres -d phpbb -c "COPY phpbb_profile_fields TO stdout DELIMITER ',';" > phpbb_profile_fields.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_profile_fields.csv' INTO TABLE phpbb_profile_fields FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [62 %] Dumped table phpbb_profile_fields
psql -U postgres -d phpbb -c "COPY phpbb_profile_fields_data TO stdout DELIMITER ',';" > phpbb_profile_fields_data.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_profile_fields_data.csv' INTO TABLE phpbb_profile_fields_data FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [63 %] Dumped table phpbb_profile_fields_data
psql -U postgres -d phpbb -c "COPY phpbb_profile_fields_lang TO stdout DELIMITER ',';" > phpbb_profile_fields_lang.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_profile_fields_lang.csv' INTO TABLE phpbb_profile_fields_lang FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [64 %] Dumped table phpbb_profile_fields_lang
psql -U postgres -d phpbb -c "COPY phpbb_profile_lang TO stdout DELIMITER ',';" > phpbb_profile_lang.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_profile_lang.csv' INTO TABLE phpbb_profile_lang FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [66 %] Dumped table phpbb_profile_lang
psql -U postgres -d phpbb -c "COPY phpbb_qa_confirm TO stdout DELIMITER ',';" > phpbb_qa_confirm.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_qa_confirm.csv' INTO TABLE phpbb_qa_confirm FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [67 %] Dumped table phpbb_qa_confirm
psql -U postgres -d phpbb -c "COPY phpbb_ranks TO stdout DELIMITER ',';" > phpbb_ranks.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_ranks.csv' INTO TABLE phpbb_ranks FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [68 %] Dumped table phpbb_ranks
psql -U postgres -d phpbb -c "COPY phpbb_reports TO stdout DELIMITER ',';" > phpbb_reports.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_reports.csv' INTO TABLE phpbb_reports FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [70 %] Dumped table phpbb_reports
psql -U postgres -d phpbb -c "COPY phpbb_reports_reasons TO stdout DELIMITER ',';" > phpbb_reports_reasons.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_reports_reasons.csv' INTO TABLE phpbb_reports_reasons FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [71 %] Dumped table phpbb_reports_reasons
# psql -U postgres -d phpbb -c "COPY phpbb_search_results TO stdout DELIMITER ',';" > phpbb_search_results.csv 2>> $MYPATH/bulk_copy_errors.log
# if [ $? -ne 0 ];then
#    echo Script has failed. See the log file for details.
#    exit 1
# fi
# echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_search_results.csv' INTO TABLE phpbb_search_results FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
# echo [72 %] Dumped table phpbb_search_results
# psql -U postgres -d phpbb -c "COPY phpbb_search_wordlist TO stdout DELIMITER ',';" > phpbb_search_wordlist.csv 2>> $MYPATH/bulk_copy_errors.log
# if [ $? -ne 0 ];then
#    echo Script has failed. See the log file for details.
#    exit 1
# fi
# echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_search_wordlist.csv' INTO TABLE phpbb_search_wordlist FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
# echo [74 %] Dumped table phpbb_search_wordlist
# psql -U postgres -d phpbb -c "COPY phpbb_search_wordmatch TO stdout DELIMITER ',';" > phpbb_search_wordmatch.csv 2>> $MYPATH/bulk_copy_errors.log
# if [ $? -ne 0 ];then
#    echo Script has failed. See the log file for details.
#    exit 1
# fi
# echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_search_wordmatch.csv' INTO TABLE phpbb_search_wordmatch FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
# echo [75 %] Dumped table phpbb_search_wordmatch
# psql -U postgres -d phpbb -c "COPY phpbb_sessions TO stdout DELIMITER ',';" > phpbb_sessions.csv 2>> $MYPATH/bulk_copy_errors.log
# if [ $? -ne 0 ];then
#    echo Script has failed. See the log file for details.
#    exit 1
# fi
# echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_sessions.csv' INTO TABLE phpbb_sessions FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
# echo [77 %] Dumped table phpbb_sessions
# psql -U postgres -d phpbb -c "COPY phpbb_sessions_keys TO stdout DELIMITER ',';" > phpbb_sessions_keys.csv 2>> $MYPATH/bulk_copy_errors.log
# if [ $? -ne 0 ];then
#    echo Script has failed. See the log file for details.
#    exit 1
# fi
# echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_sessions_keys.csv' INTO TABLE phpbb_sessions_keys FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
# echo [78 %] Dumped table phpbb_sessions_keys
psql -U postgres -d phpbb -c "COPY phpbb_sitelist TO stdout DELIMITER ',';" > phpbb_sitelist.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_sitelist.csv' INTO TABLE phpbb_sitelist FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [79 %] Dumped table phpbb_sitelist
psql -U postgres -d phpbb -c "COPY phpbb_smilies TO stdout DELIMITER ',';" > phpbb_smilies.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_smilies.csv' INTO TABLE phpbb_smilies FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [81 %] Dumped table phpbb_smilies
psql -U postgres -d phpbb -c "COPY phpbb_styles TO stdout DELIMITER ',';" > phpbb_styles.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_styles.csv' INTO TABLE phpbb_styles FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [82 %] Dumped table phpbb_styles
psql -U postgres -d phpbb -c "COPY phpbb_teampage TO stdout DELIMITER ',';" > phpbb_teampage.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_teampage.csv' INTO TABLE phpbb_teampage FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [83 %] Dumped table phpbb_teampage
psql -U postgres -d phpbb -c "COPY phpbb_topics TO stdout DELIMITER ',';" > phpbb_topics.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_topics.csv' INTO TABLE phpbb_topics FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [85 %] Dumped table phpbb_topics
psql -U postgres -d phpbb -c "COPY phpbb_topics_posted TO stdout DELIMITER ',';" > phpbb_topics_posted.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_topics_posted.csv' INTO TABLE phpbb_topics_posted FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [86 %] Dumped table phpbb_topics_posted
psql -U postgres -d phpbb -c "COPY phpbb_topics_track TO stdout DELIMITER ',';" > phpbb_topics_track.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_topics_track.csv' INTO TABLE phpbb_topics_track FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [87 %] Dumped table phpbb_topics_track
psql -U postgres -d phpbb -c "COPY phpbb_topics_watch TO stdout DELIMITER ',';" > phpbb_topics_watch.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_topics_watch.csv' INTO TABLE phpbb_topics_watch FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [89 %] Dumped table phpbb_topics_watch
psql -U postgres -d phpbb -c "COPY phpbb_user_group TO stdout DELIMITER ',';" > phpbb_user_group.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_user_group.csv' INTO TABLE phpbb_user_group FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [90 %] Dumped table phpbb_user_group
psql -U postgres -d phpbb -c "COPY phpbb_user_notifications TO stdout DELIMITER ',';" > phpbb_user_notifications.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_user_notifications.csv' INTO TABLE phpbb_user_notifications FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [91 %] Dumped table phpbb_user_notifications
psql -U postgres -d phpbb -c "COPY phpbb_users TO stdout DELIMITER ',';" > phpbb_users.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_users.csv' INTO TABLE phpbb_users FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [93 %] Dumped table phpbb_users
psql -U postgres -d phpbb -c "COPY phpbb_warnings TO stdout DELIMITER ',';" > phpbb_warnings.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_warnings.csv' INTO TABLE phpbb_warnings FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [94 %] Dumped table phpbb_warnings
psql -U postgres -d phpbb -c "COPY phpbb_words TO stdout DELIMITER ',';" > phpbb_words.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_words.csv' INTO TABLE phpbb_words FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [95 %] Dumped table phpbb_words
psql -U postgres -d phpbb -c "COPY phpbb_zebra TO stdout DELIMITER ',';" > phpbb_zebra.csv 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo "LOAD DATA INFILE 'phpbb_#####_import/phpbb_zebra.csv' INTO TABLE phpbb_zebra FIELDS TERMINATED BY ',' ENCLOSED BY '';" >> import_phpbb.sql
echo [97 %] Dumped table phpbb_zebra
touch import_phpbb.sh
chmod +x import_phpbb.sh
echo "#!/bin/bash" >> import_phpbb.sh
echo "cd ${DUMPPATH}/dump_phpbb" >> import_phpbb.sh
echo "MYPATH=\`pwd\`" >> import_phpbb.sh
echo "if [ -f \$MYPATH/import_errors.log ] ; then" >> import_phpbb.sh
echo "    rm \$MYPATH/import_errors.log" >> import_phpbb.sh
echo "fi" >> import_phpbb.sh
echo "TARGET_DIR=\`MYSQL_PWD=$arg_target_password mysql -h127.0.0.1 -P3306 -uroot -s -N information_schema -e 'SELECT Variable_Value FROM GLOBAL_VARIABLES WHERE Variable_Name = \"datadir\"'\` 2>> \$MYPATH/import_errors.log" >> import_phpbb.sh
echo "if [ \$? -ne 0 ];then" >> import_phpbb.sh
echo "   echo Script has failed. See the log file for details." >> import_phpbb.sh
echo "   exit 1" >> import_phpbb.sh
echo "fi" >> import_phpbb.sh
echo "pushd \$TARGET_DIR" >> import_phpbb.sh
echo "mkdir phpbb_#####_import" >> import_phpbb.sh
echo "cp \$MYPATH/*.csv phpbb_#####_import/ 2>> \$MYPATH/import_errors.log" >> import_phpbb.sh
echo "if [ \$? -ne 0 ];then" >> import_phpbb.sh
echo "   echo Script has failed. See the log file for details." >> import_phpbb.sh
echo "   exit 1" >> import_phpbb.sh
echo "fi" >> import_phpbb.sh
echo "cp \$MYPATH/*.sql phpbb_#####_import/ 2>> \$MYPATH/import_errors.log" >> import_phpbb.sh
echo "if [ \$? -ne 0 ];then" >> import_phpbb.sh
echo "   echo Script has failed. See the log file for details." >> import_phpbb.sh
echo "   exit 1" >> import_phpbb.sh
echo "fi" >> import_phpbb.sh
echo "echo Started load data. Please wait." >> import_phpbb.sh
echo "MYSQL_PWD=$arg_target_password mysql -h127.0.0.1 -P3306 -uroot < phpbb_#####_import/import_phpbb.sql 2>> \$MYPATH/import_errors.log" >> import_phpbb.sh
echo "if [ \$? -ne 0 ];then" >> import_phpbb.sh
echo "   echo Script has failed. See the log file for details." >> import_phpbb.sh
echo "   exit 1" >> import_phpbb.sh
echo "fi" >> import_phpbb.sh
echo "echo Finished load data" >> import_phpbb.sh
echo "rm -rf phpbb_#####_import" >> import_phpbb.sh
echo "popd" >> import_phpbb.sh
echo [98 %] Generated import script import_phpbb.sh
popd
zip -r dump_phpbb.zip dump_phpbb 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
echo [100 %] Zipped all files to dump_phpbb.zip file
rm -rf dump_phpbb
cp dump_phpbb.zip $MYPATH 2>> $MYPATH/bulk_copy_errors.log
if [ $? -ne 0 ];then
   echo Script has failed. See the log file for details.
   exit 1
fi
popd
echo Now you can copy $MYPATH/dump_phpbb.zip file to the target server, unzip it and run the import script.
read -p "Press [Enter] key to continue..."
-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: phpbb
-- Source Schemata: phpbb
-- Created: Tue Feb 28 18:48:47 2023
-- Workbench Version: 8.0.32
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema phpbb
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `phpbb` ;
CREATE SCHEMA IF NOT EXISTS `phpbb` ;

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_acl_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_acl_groups` (
  `group_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `auth_option_id` INT NOT NULL DEFAULT 0,
  `auth_role_id` INT NOT NULL DEFAULT 0,
  `auth_setting` SMALLINT NOT NULL,
  INDEX `phpbb_acl_groups_auth_opt_id` (`auth_option_id` ASC) VISIBLE,
  INDEX `phpbb_acl_groups_auth_role_id` (`auth_role_id` ASC) VISIBLE,
  INDEX `phpbb_acl_groups_group_id` (`group_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_acl_options
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_acl_options` (
  `auth_option_id` INT NOT NULL AUTO_INCREMENT,
  `auth_option` VARCHAR(50) NOT NULL DEFAULT '',
  `is_global` SMALLINT NOT NULL,
  `is_local` SMALLINT NOT NULL,
  `founder_only` SMALLINT NOT NULL,
  PRIMARY KEY (`auth_option_id`),
  UNIQUE INDEX `phpbb_acl_options_auth_option` (`auth_option` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_acl_roles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_acl_roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(255) NOT NULL DEFAULT '',
  `role_description` VARCHAR(4000) NOT NULL DEFAULT '',
  `role_type` VARCHAR(10) NOT NULL DEFAULT '',
  `role_order` SMALLINT NOT NULL,
  PRIMARY KEY (`role_id`),
  INDEX `phpbb_acl_roles_role_order` (`role_order` ASC) VISIBLE,
  INDEX `phpbb_acl_roles_role_type` (`role_type` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_acl_roles_data
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_acl_roles_data` (
  `role_id` INT NOT NULL DEFAULT 0,
  `auth_option_id` INT NOT NULL DEFAULT 0,
  `auth_setting` SMALLINT NOT NULL,
  PRIMARY KEY (`role_id`, `auth_option_id`),
  INDEX `phpbb_acl_roles_data_ath_op_id` (`auth_option_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_acl_users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_acl_users` (
  `user_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `auth_option_id` INT NOT NULL DEFAULT 0,
  `auth_role_id` INT NOT NULL DEFAULT 0,
  `auth_setting` SMALLINT NOT NULL,
  INDEX `phpbb_acl_users_auth_option_id` (`auth_option_id` ASC) VISIBLE,
  INDEX `phpbb_acl_users_auth_role_id` (`auth_role_id` ASC) VISIBLE,
  INDEX `phpbb_acl_users_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_attachments
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_attachments` (
  `attach_id` INT NOT NULL AUTO_INCREMENT,
  `post_msg_id` INT NOT NULL DEFAULT 0,
  `topic_id` INT NOT NULL DEFAULT 0,
  `in_message` SMALLINT NOT NULL,
  `poster_id` INT NOT NULL DEFAULT 0,
  `is_orphan` SMALLINT NOT NULL,
  `physical_filename` VARCHAR(255) NOT NULL DEFAULT '',
  `real_filename` VARCHAR(255) NOT NULL DEFAULT '',
  `download_count` INT NOT NULL DEFAULT 0,
  `attach_comment` VARCHAR(4000) NOT NULL DEFAULT '',
  `extension` VARCHAR(100) NOT NULL DEFAULT '',
  `mimetype` VARCHAR(100) NOT NULL DEFAULT '',
  `filesize` INT NOT NULL DEFAULT 0,
  `filetime` INT NOT NULL DEFAULT 0,
  `thumbnail` SMALLINT NOT NULL,
  PRIMARY KEY (`attach_id`),
  INDEX `phpbb_attachments_filetime` (`filetime` ASC) VISIBLE,
  INDEX `phpbb_attachments_is_orphan` (`is_orphan` ASC) VISIBLE,
  INDEX `phpbb_attachments_post_msg_id` (`post_msg_id` ASC) VISIBLE,
  INDEX `phpbb_attachments_poster_id` (`poster_id` ASC) VISIBLE,
  INDEX `phpbb_attachments_topic_id` (`topic_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_banlist
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_banlist` (
  `ban_id` INT NOT NULL AUTO_INCREMENT,
  `ban_userid` INT NOT NULL DEFAULT 0,
  `ban_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `ban_email` VARCHAR(100) NOT NULL DEFAULT '',
  `ban_start` INT NOT NULL DEFAULT 0,
  `ban_end` INT NOT NULL DEFAULT 0,
  `ban_exclude` SMALLINT NOT NULL,
  `ban_reason` VARCHAR(255) NOT NULL DEFAULT '',
  `ban_give_reason` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  INDEX `phpbb_banlist_ban_email` (`ban_email` ASC, `ban_exclude` ASC) VISIBLE,
  INDEX `phpbb_banlist_ban_end` (`ban_end` ASC) VISIBLE,
  INDEX `phpbb_banlist_ban_ip` (`ban_ip` ASC, `ban_exclude` ASC) VISIBLE,
  INDEX `phpbb_banlist_ban_user` (`ban_userid` ASC, `ban_exclude` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_bbcodes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_bbcodes` (
  `bbcode_id` SMALLINT NOT NULL,
  `bbcode_tag` VARCHAR(16) NOT NULL DEFAULT '',
  `bbcode_helpline` VARCHAR(255) NOT NULL DEFAULT '',
  `display_on_posting` SMALLINT NOT NULL,
  `bbcode_match` VARCHAR(4000) NOT NULL DEFAULT '',
  `bbcode_tpl` LONGTEXT NOT NULL DEFAULT (''),
  `first_pass_match` LONGTEXT NOT NULL DEFAULT (''),
  `first_pass_replace` LONGTEXT NOT NULL DEFAULT (''),
  `second_pass_match` LONGTEXT NOT NULL DEFAULT (''),
  `second_pass_replace` LONGTEXT NOT NULL DEFAULT (''),
  PRIMARY KEY (`bbcode_id`),
  INDEX `phpbb_bbcodes_display_on_post` (`display_on_posting` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_bookmarks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_bookmarks` (
  `topic_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`, `user_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_bots
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_bots` (
  `bot_id` INT NOT NULL AUTO_INCREMENT,
  `bot_active` SMALLINT NOT NULL,
  `bot_name` VARCHAR(255) NOT NULL DEFAULT '',
  `user_id` INT NOT NULL DEFAULT 0,
  `bot_agent` VARCHAR(255) NOT NULL DEFAULT '',
  `bot_ip` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  INDEX `phpbb_bots_bot_active` (`bot_active` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_captcha_answers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_captcha_answers` (
  `question_id` INT NOT NULL DEFAULT 0,
  `answer_text` VARCHAR(255) NOT NULL DEFAULT '',
  INDEX `phpbb_captcha_answers_qid` (`question_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_captcha_questions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_captcha_questions` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `strict` SMALLINT NOT NULL,
  `lang_id` INT NOT NULL DEFAULT 0,
  `lang_iso` VARCHAR(30) NOT NULL DEFAULT '',
  `question_text` VARCHAR(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`question_id`),
  INDEX `phpbb_captcha_questions_lang` (`lang_iso` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_config` (
  `config_name` VARCHAR(255) NOT NULL DEFAULT '',
  `config_value` VARCHAR(255) NOT NULL DEFAULT '',
  `is_dynamic` SMALLINT NOT NULL,
  PRIMARY KEY (`config_name`),
  INDEX `phpbb_config_is_dynamic` (`is_dynamic` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_config_text
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_config_text` (
  `config_name` VARCHAR(255) NOT NULL DEFAULT '',
  `config_value` LONGTEXT NOT NULL DEFAULT (''),
  PRIMARY KEY (`config_name`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_confirm
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_confirm` (
  `confirm_id` CHAR(32) NOT NULL DEFAULT '',
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  `confirm_type` SMALLINT NOT NULL,
  `code` VARCHAR(8) NOT NULL DEFAULT '',
  `seed` INT NOT NULL DEFAULT 0,
  `attempts` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`session_id`, `confirm_id`),
  INDEX `phpbb_confirm_confirm_type` (`confirm_type` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_disallow
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_disallow` (
  `disallow_id` INT NOT NULL AUTO_INCREMENT,
  `disallow_username` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_drafts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_drafts` (
  `draft_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT 0,
  `topic_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `save_time` INT NOT NULL DEFAULT 0,
  `draft_subject` VARCHAR(255) NOT NULL DEFAULT '',
  `draft_message` LONGTEXT NOT NULL DEFAULT (''),
  PRIMARY KEY (`draft_id`),
  INDEX `phpbb_drafts_save_time` (`save_time` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_ext
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_ext` (
  `ext_name` VARCHAR(255) NOT NULL DEFAULT '',
  `ext_active` SMALLINT NOT NULL,
  `ext_state` VARCHAR(8000) NOT NULL DEFAULT '',
  UNIQUE INDEX `phpbb_ext_ext_name` (`ext_name` ASC));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_extension_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_extension_groups` (
  `group_id` INT NOT NULL AUTO_INCREMENT,
  `group_name` VARCHAR(255) NOT NULL DEFAULT '',
  `cat_id` SMALLINT NOT NULL,
  `allow_group` SMALLINT NOT NULL,
  `download_mode` SMALLINT NOT NULL,
  `upload_icon` VARCHAR(255) NOT NULL DEFAULT '',
  `max_filesize` INT NOT NULL DEFAULT 0,
  `allowed_forums` VARCHAR(8000) NOT NULL DEFAULT '',
  `allow_in_pm` SMALLINT NOT NULL,
  PRIMARY KEY (`group_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_extensions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_extensions` (
  `extension_id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL DEFAULT 0,
  `extension` VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_forums
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_forums` (
  `forum_id` INT NOT NULL AUTO_INCREMENT,
  `parent_id` INT NOT NULL DEFAULT 0,
  `left_id` INT NOT NULL DEFAULT 0,
  `right_id` INT NOT NULL DEFAULT 0,
  `forum_parents` LONGTEXT NOT NULL DEFAULT (''),
  `forum_name` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_desc` VARCHAR(4000) NOT NULL DEFAULT '',
  `forum_desc_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_desc_options` INT NOT NULL DEFAULT 7,
  `forum_desc_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `forum_link` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_password` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_style` INT NOT NULL DEFAULT 0,
  `forum_image` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_rules` VARCHAR(4000) NOT NULL DEFAULT '',
  `forum_rules_link` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_rules_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_rules_options` INT NOT NULL DEFAULT 7,
  `forum_rules_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `forum_topics_per_page` SMALLINT NOT NULL,
  `forum_type` SMALLINT NOT NULL,
  `forum_status` SMALLINT NOT NULL,
  `forum_last_post_id` INT NOT NULL DEFAULT 0,
  `forum_last_poster_id` INT NOT NULL DEFAULT 0,
  `forum_last_post_subject` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_last_post_time` INT NOT NULL DEFAULT 0,
  `forum_last_poster_name` VARCHAR(255) NOT NULL DEFAULT '',
  `forum_last_poster_colour` VARCHAR(6) NOT NULL DEFAULT '',
  `forum_flags` SMALLINT NOT NULL,
  `display_on_index` SMALLINT NOT NULL,
  `enable_indexing` SMALLINT NOT NULL,
  `enable_icons` SMALLINT NOT NULL,
  `enable_prune` SMALLINT NOT NULL,
  `prune_next` INT NOT NULL DEFAULT 0,
  `prune_days` INT NOT NULL DEFAULT 0,
  `prune_viewed` INT NOT NULL DEFAULT 0,
  `prune_freq` INT NOT NULL DEFAULT 0,
  `display_subforum_list` SMALLINT NOT NULL,
  `forum_options` INT NOT NULL DEFAULT 0,
  `forum_posts_approved` INT NOT NULL DEFAULT 0,
  `forum_posts_unapproved` INT NOT NULL DEFAULT 0,
  `forum_posts_softdeleted` INT NOT NULL DEFAULT 0,
  `forum_topics_approved` INT NOT NULL DEFAULT 0,
  `forum_topics_unapproved` INT NOT NULL DEFAULT 0,
  `forum_topics_softdeleted` INT NOT NULL DEFAULT 0,
  `enable_shadow_prune` SMALLINT NOT NULL,
  `prune_shadow_days` INT NOT NULL DEFAULT 7,
  `prune_shadow_freq` INT NOT NULL DEFAULT 1,
  `prune_shadow_next` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`forum_id`),
  INDEX `phpbb_forums_forum_lastpost_id` (`forum_last_post_id` ASC) VISIBLE,
  INDEX `phpbb_forums_left_right_id` (`left_id` ASC, `right_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_forums_access
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_forums_access` (
  `forum_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`, `user_id`, `session_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_forums_track
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_forums_track` (
  `user_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `mark_time` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `forum_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_forums_watch
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_forums_watch` (
  `forum_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `notify_status` SMALLINT NOT NULL,
  INDEX `phpbb_forums_watch_forum_id` (`forum_id` ASC) VISIBLE,
  INDEX `phpbb_forums_watch_notify_stat` (`notify_status` ASC) VISIBLE,
  INDEX `phpbb_forums_watch_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_groups` (
  `group_id` INT NOT NULL AUTO_INCREMENT,
  `group_type` SMALLINT NOT NULL,
  `group_founder_manage` SMALLINT NOT NULL,
  `group_skip_auth` SMALLINT NOT NULL,
  `group_name` VARCHAR(255) NOT NULL DEFAULT '',
  `group_desc` VARCHAR(4000) NOT NULL DEFAULT '',
  `group_desc_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `group_desc_options` INT NOT NULL DEFAULT 7,
  `group_desc_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `group_display` SMALLINT NOT NULL,
  `group_avatar` VARCHAR(255) NOT NULL DEFAULT '',
  `group_avatar_type` VARCHAR(255) NOT NULL DEFAULT '',
  `group_avatar_width` SMALLINT NOT NULL,
  `group_avatar_height` SMALLINT NOT NULL,
  `group_rank` INT NOT NULL DEFAULT 0,
  `group_colour` VARCHAR(6) NOT NULL DEFAULT '',
  `group_sig_chars` INT NOT NULL DEFAULT 0,
  `group_receive_pm` SMALLINT NOT NULL,
  `group_message_limit` INT NOT NULL DEFAULT 0,
  `group_legend` INT NOT NULL DEFAULT 0,
  `group_max_recipients` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  INDEX `phpbb_groups_group_legend_name` (`group_name` ASC, `group_legend` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_icons
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_icons` (
  `icons_id` INT NOT NULL AUTO_INCREMENT,
  `icons_url` VARCHAR(255) NOT NULL DEFAULT '',
  `icons_width` SMALLINT NOT NULL,
  `icons_height` SMALLINT NOT NULL,
  `icons_alt` VARCHAR(255) NOT NULL DEFAULT '',
  `icons_order` INT NOT NULL DEFAULT 0,
  `display_on_posting` SMALLINT NOT NULL,
  PRIMARY KEY (`icons_id`),
  INDEX `phpbb_icons_display_on_posting` (`display_on_posting` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_lang
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_lang` (
  `lang_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `lang_iso` VARCHAR(30) NOT NULL DEFAULT '',
  `lang_dir` VARCHAR(30) NOT NULL DEFAULT '',
  `lang_english_name` VARCHAR(100) NOT NULL DEFAULT '',
  `lang_local_name` VARCHAR(255) NOT NULL DEFAULT '',
  `lang_author` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  INDEX `phpbb_lang_lang_iso` (`lang_iso` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_log` (
  `log_id` INT NOT NULL AUTO_INCREMENT,
  `log_type` SMALLINT NOT NULL,
  `user_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `topic_id` INT NOT NULL DEFAULT 0,
  `post_id` INT NOT NULL DEFAULT 0,
  `reportee_id` INT NOT NULL DEFAULT 0,
  `log_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `log_time` INT NOT NULL DEFAULT 0,
  `log_operation` VARCHAR(4000) NOT NULL DEFAULT '',
  `log_data` LONGTEXT NOT NULL DEFAULT (''),
  PRIMARY KEY (`log_id`),
  INDEX `phpbb_log_forum_id` (`forum_id` ASC) VISIBLE,
  INDEX `phpbb_log_log_time` (`log_time` ASC) VISIBLE,
  INDEX `phpbb_log_log_type` (`log_type` ASC) VISIBLE,
  INDEX `phpbb_log_reportee_id` (`reportee_id` ASC) VISIBLE,
  INDEX `phpbb_log_topic_id` (`topic_id` ASC) VISIBLE,
  INDEX `phpbb_log_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_login_attempts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_login_attempts` (
  `attempt_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `attempt_browser` VARCHAR(150) NOT NULL DEFAULT '',
  `attempt_forwarded_for` VARCHAR(255) NOT NULL DEFAULT '',
  `attempt_time` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `username` VARCHAR(255) NOT NULL DEFAULT '0',
  `username_clean` VARCHAR(255) NOT NULL DEFAULT '0',
  INDEX `phpbb_login_attempts_att_for` (`attempt_forwarded_for` ASC, `attempt_time` ASC) VISIBLE,
  INDEX `phpbb_login_attempts_att_ip` (`attempt_ip` ASC, `attempt_time` ASC) VISIBLE,
  INDEX `phpbb_login_attempts_att_time` (`attempt_time` ASC) VISIBLE,
  INDEX `phpbb_login_attempts_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_migrations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_migrations` (
  `migration_name` VARCHAR(255) NOT NULL DEFAULT '',
  `migration_depends_on` VARCHAR(8000) NOT NULL DEFAULT '',
  `migration_schema_done` SMALLINT NOT NULL,
  `migration_data_done` SMALLINT NOT NULL,
  `migration_data_state` VARCHAR(8000) NOT NULL DEFAULT '',
  `migration_start_time` INT NOT NULL DEFAULT 0,
  `migration_end_time` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`migration_name`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_moderator_cache
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_moderator_cache` (
  `forum_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `username` VARCHAR(255) NOT NULL DEFAULT '',
  `group_id` INT NOT NULL DEFAULT 0,
  `group_name` VARCHAR(255) NOT NULL DEFAULT '',
  `display_on_index` SMALLINT NOT NULL,
  INDEX `phpbb_moderator_cache_disp_idx` (`display_on_index` ASC) VISIBLE,
  INDEX `phpbb_moderator_cache_forum_id` (`forum_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_modules
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_modules` (
  `module_id` INT NOT NULL AUTO_INCREMENT,
  `module_enabled` SMALLINT NOT NULL,
  `module_display` SMALLINT NOT NULL,
  `module_basename` VARCHAR(255) NOT NULL DEFAULT '',
  `module_class` VARCHAR(10) NOT NULL DEFAULT '',
  `parent_id` INT NOT NULL DEFAULT 0,
  `left_id` INT NOT NULL DEFAULT 0,
  `right_id` INT NOT NULL DEFAULT 0,
  `module_langname` VARCHAR(255) NOT NULL DEFAULT '',
  `module_mode` VARCHAR(255) NOT NULL DEFAULT '',
  `module_auth` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  INDEX `phpbb_modules_class_left_id` (`module_class` ASC, `left_id` ASC) VISIBLE,
  INDEX `phpbb_modules_left_right_id` (`left_id` ASC, `right_id` ASC) VISIBLE,
  INDEX `phpbb_modules_module_enabled` (`module_enabled` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_notification_types
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_notification_types` (
  `notification_type_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `notification_type_name` VARCHAR(255) NOT NULL DEFAULT '',
  `notification_type_enabled` SMALLINT NOT NULL,
  PRIMARY KEY (`notification_type_id`),
  UNIQUE INDEX `phpbb_notification_types_type` (`notification_type_name` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_notifications
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_notifications` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `notification_type_id` SMALLINT NOT NULL,
  `item_id` INT NOT NULL DEFAULT 0,
  `item_parent_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `notification_read` SMALLINT NOT NULL,
  `notification_time` INT NOT NULL DEFAULT 1,
  `notification_data` VARCHAR(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`notification_id`),
  INDEX `phpbb_notifications_item_ident` (`notification_type_id` ASC, `item_id` ASC) VISIBLE,
  INDEX `phpbb_notifications_user` (`user_id` ASC, `notification_read` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_oauth_accounts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_oauth_accounts` (
  `user_id` INT NOT NULL DEFAULT 0,
  `provider` VARCHAR(255) NOT NULL DEFAULT '',
  `oauth_provider_id` VARCHAR(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`, `provider`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_oauth_states
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_oauth_states` (
  `user_id` INT NOT NULL DEFAULT 0,
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  `provider` VARCHAR(255) NOT NULL DEFAULT '',
  `oauth_state` VARCHAR(255) NOT NULL DEFAULT '',
  INDEX `phpbb_oauth_states_provider` (`provider` ASC) VISIBLE,
  INDEX `phpbb_oauth_states_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_oauth_tokens
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_oauth_tokens` (
  `user_id` INT NOT NULL DEFAULT 0,
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  `provider` VARCHAR(255) NOT NULL DEFAULT '',
  `oauth_token` LONGTEXT NOT NULL DEFAULT (''),
  INDEX `phpbb_oauth_tokens_provider` (`provider` ASC) VISIBLE,
  INDEX `phpbb_oauth_tokens_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_poll_options
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_poll_options` (
  `poll_option_id` SMALLINT NOT NULL,
  `topic_id` INT NOT NULL DEFAULT 0,
  `poll_option_text` VARCHAR(4000) NOT NULL DEFAULT '',
  `poll_option_total` INT NOT NULL DEFAULT 0,
  INDEX `phpbb_poll_options_poll_opt_id` (`poll_option_id` ASC) VISIBLE,
  INDEX `phpbb_poll_options_topic_id` (`topic_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_poll_votes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_poll_votes` (
  `topic_id` INT NOT NULL DEFAULT 0,
  `poll_option_id` SMALLINT NOT NULL,
  `vote_user_id` INT NOT NULL DEFAULT 0,
  `vote_user_ip` VARCHAR(40) NOT NULL DEFAULT '',
  INDEX `phpbb_poll_votes_topic_id` (`topic_id` ASC) VISIBLE,
  INDEX `phpbb_poll_votes_vote_user_id` (`vote_user_id` ASC) VISIBLE,
  INDEX `phpbb_poll_votes_vote_user_ip` (`vote_user_ip` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_posts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `topic_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `poster_id` INT NOT NULL DEFAULT 0,
  `icon_id` INT NOT NULL DEFAULT 0,
  `poster_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `post_time` INT NOT NULL DEFAULT 0,
  `post_reported` SMALLINT NOT NULL,
  `enable_bbcode` SMALLINT NOT NULL,
  `enable_smilies` SMALLINT NOT NULL,
  `enable_magic_url` SMALLINT NOT NULL,
  `enable_sig` SMALLINT NOT NULL,
  `post_username` VARCHAR(255) NOT NULL DEFAULT '',
  `post_subject` VARCHAR(255) NOT NULL DEFAULT '',
  `post_text` LONGTEXT NOT NULL DEFAULT (''),
  `post_checksum` VARCHAR(32) NOT NULL DEFAULT '',
  `post_attachment` SMALLINT NOT NULL,
  `bbcode_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `bbcode_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `post_postcount` SMALLINT NOT NULL,
  `post_edit_time` INT NOT NULL DEFAULT 0,
  `post_edit_reason` VARCHAR(255) NOT NULL DEFAULT '',
  `post_edit_user` INT NOT NULL DEFAULT 0,
  `post_edit_count` SMALLINT NOT NULL,
  `post_edit_locked` SMALLINT NOT NULL,
  `post_visibility` SMALLINT NOT NULL,
  `post_delete_time` INT NOT NULL DEFAULT 0,
  `post_delete_reason` VARCHAR(255) NOT NULL DEFAULT '',
  `post_delete_user` INT NOT NULL DEFAULT 0,
  `sfs_reported` SMALLINT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `phpbb_posts_forum_id` (`forum_id` ASC) VISIBLE,
  INDEX `phpbb_posts_post_username` (`post_username` ASC) VISIBLE,
  INDEX `phpbb_posts_post_visibility` (`post_visibility` ASC) VISIBLE,
  INDEX `phpbb_posts_poster_id` (`poster_id` ASC) VISIBLE,
  INDEX `phpbb_posts_poster_ip` (`poster_ip` ASC) VISIBLE,
  INDEX `phpbb_posts_tid_post_time` (`topic_id` ASC, `post_time` ASC) VISIBLE,
  INDEX `phpbb_posts_topic_id` (`topic_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_privmsgs
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_privmsgs` (
  `msg_id` INT NOT NULL AUTO_INCREMENT,
  `root_level` INT NOT NULL DEFAULT 0,
  `author_id` INT NOT NULL DEFAULT 0,
  `icon_id` INT NOT NULL DEFAULT 0,
  `author_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `message_time` INT NOT NULL DEFAULT 0,
  `enable_bbcode` SMALLINT NOT NULL,
  `enable_smilies` SMALLINT NOT NULL,
  `enable_magic_url` SMALLINT NOT NULL,
  `enable_sig` SMALLINT NOT NULL,
  `message_subject` VARCHAR(255) NOT NULL DEFAULT '',
  `message_text` LONGTEXT NOT NULL DEFAULT (''),
  `message_edit_reason` VARCHAR(255) NOT NULL DEFAULT '',
  `message_edit_user` INT NOT NULL DEFAULT 0,
  `message_attachment` SMALLINT NOT NULL,
  `bbcode_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `bbcode_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `message_edit_time` INT NOT NULL DEFAULT 0,
  `message_edit_count` SMALLINT NOT NULL,
  `to_address` VARCHAR(4000) NOT NULL DEFAULT '',
  `bcc_address` VARCHAR(4000) NOT NULL DEFAULT '',
  `message_reported` SMALLINT NOT NULL,
  PRIMARY KEY (`msg_id`),
  INDEX `phpbb_privmsgs_author_id` (`author_id` ASC) VISIBLE,
  INDEX `phpbb_privmsgs_author_ip` (`author_ip` ASC) VISIBLE,
  INDEX `phpbb_privmsgs_message_time` (`message_time` ASC) VISIBLE,
  INDEX `phpbb_privmsgs_root_level` (`root_level` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_privmsgs_folder
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_privmsgs_folder` (
  `folder_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT 0,
  `folder_name` VARCHAR(255) NOT NULL DEFAULT '',
  `pm_count` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`folder_id`),
  INDEX `phpbb_privmsgs_folder_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_privmsgs_rules
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_privmsgs_rules` (
  `rule_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT 0,
  `rule_check` INT NOT NULL DEFAULT 0,
  `rule_connection` INT NOT NULL DEFAULT 0,
  `rule_string` VARCHAR(255) NOT NULL DEFAULT '',
  `rule_user_id` INT NOT NULL DEFAULT 0,
  `rule_group_id` INT NOT NULL DEFAULT 0,
  `rule_action` INT NOT NULL DEFAULT 0,
  `rule_folder_id` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`),
  INDEX `phpbb_privmsgs_rules_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_privmsgs_to
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_privmsgs_to` (
  `msg_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `author_id` INT NOT NULL DEFAULT 0,
  `pm_deleted` SMALLINT NOT NULL,
  `pm_new` SMALLINT NOT NULL,
  `pm_unread` SMALLINT NOT NULL,
  `pm_replied` SMALLINT NOT NULL,
  `pm_marked` SMALLINT NOT NULL,
  `pm_forwarded` SMALLINT NOT NULL,
  `folder_id` INT NOT NULL DEFAULT 0,
  INDEX `phpbb_privmsgs_to_author_id` (`author_id` ASC) VISIBLE,
  INDEX `phpbb_privmsgs_to_msg_id` (`msg_id` ASC) VISIBLE,
  INDEX `phpbb_privmsgs_to_usr_flder_id` (`user_id` ASC, `folder_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_profile_fields
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_profile_fields` (
  `field_id` INT NOT NULL AUTO_INCREMENT,
  `field_name` VARCHAR(255) NOT NULL DEFAULT '',
  `field_type` VARCHAR(100) NOT NULL DEFAULT '',
  `field_ident` VARCHAR(20) NOT NULL DEFAULT '',
  `field_length` VARCHAR(20) NOT NULL DEFAULT '',
  `field_minlen` VARCHAR(255) NOT NULL DEFAULT '',
  `field_maxlen` VARCHAR(255) NOT NULL DEFAULT '',
  `field_novalue` VARCHAR(255) NOT NULL DEFAULT '',
  `field_default_value` VARCHAR(255) NOT NULL DEFAULT '',
  `field_validation` VARCHAR(64) NOT NULL DEFAULT '',
  `field_required` SMALLINT NOT NULL,
  `field_show_on_reg` SMALLINT NOT NULL,
  `field_hide` SMALLINT NOT NULL,
  `field_no_view` SMALLINT NOT NULL,
  `field_active` SMALLINT NOT NULL,
  `field_order` INT NOT NULL DEFAULT 0,
  `field_show_profile` SMALLINT NOT NULL,
  `field_show_on_vt` SMALLINT NOT NULL,
  `field_show_novalue` SMALLINT NOT NULL,
  `field_show_on_pm` SMALLINT NOT NULL,
  `field_show_on_ml` SMALLINT NOT NULL,
  `field_is_contact` SMALLINT NOT NULL,
  `field_contact_desc` VARCHAR(255) NOT NULL DEFAULT '',
  `field_contact_url` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`),
  INDEX `phpbb_profile_fields_fld_ordr` (`field_order` ASC) VISIBLE,
  INDEX `phpbb_profile_fields_fld_type` (`field_type` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_profile_fields_data
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_profile_fields_data` (
  `user_id` INT NOT NULL DEFAULT 0,
  `pf_phpbb_interests` LONGTEXT NOT NULL DEFAULT (''),
  `pf_phpbb_occupation` LONGTEXT NOT NULL DEFAULT (''),
  `pf_phpbb_location` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_youtube` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_facebook` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_icq` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_skype` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_twitter` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_googleplus` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_website` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_yahoo` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_aol` VARCHAR(255) NOT NULL DEFAULT '',
  `pf_phpbb_instagram` VARCHAR(255) NULL DEFAULT '',
  PRIMARY KEY (`user_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_profile_fields_lang
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_profile_fields_lang` (
  `field_id` INT NOT NULL DEFAULT 0,
  `lang_id` INT NOT NULL DEFAULT 0,
  `option_id` INT NOT NULL DEFAULT 0,
  `field_type` VARCHAR(100) NOT NULL DEFAULT '',
  `lang_value` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`, `lang_id`, `option_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_profile_lang
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_profile_lang` (
  `field_id` INT NOT NULL DEFAULT 0,
  `lang_id` INT NOT NULL DEFAULT 0,
  `lang_name` VARCHAR(255) NOT NULL DEFAULT '',
  `lang_explain` VARCHAR(4000) NOT NULL DEFAULT '',
  `lang_default_value` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`, `lang_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_qa_confirm
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_qa_confirm` (
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  `confirm_id` CHAR(32) NOT NULL DEFAULT '',
  `lang_iso` VARCHAR(30) NOT NULL DEFAULT '',
  `question_id` INT NOT NULL DEFAULT 0,
  `attempts` INT NOT NULL DEFAULT 0,
  `confirm_type` SMALLINT NOT NULL,
  PRIMARY KEY (`confirm_id`),
  INDEX `phpbb_qa_confirm_lookup` (`session_id` ASC, `confirm_id` ASC, `lang_iso` ASC) VISIBLE,
  INDEX `phpbb_qa_confirm_session_id` (`session_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_ranks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_ranks` (
  `rank_id` INT NOT NULL AUTO_INCREMENT,
  `rank_title` VARCHAR(255) NOT NULL DEFAULT '',
  `rank_min` INT NOT NULL DEFAULT 0,
  `rank_special` SMALLINT NOT NULL,
  `rank_image` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_reports
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_reports` (
  `report_id` INT NOT NULL AUTO_INCREMENT,
  `reason_id` SMALLINT NOT NULL,
  `post_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `user_notify` SMALLINT NOT NULL,
  `report_closed` SMALLINT NOT NULL,
  `report_time` INT NOT NULL DEFAULT 0,
  `report_text` LONGTEXT NOT NULL DEFAULT (''),
  `pm_id` INT NOT NULL DEFAULT 0,
  `reported_post_enable_bbcode` SMALLINT NOT NULL,
  `reported_post_enable_smilies` SMALLINT NOT NULL,
  `reported_post_enable_magic_url` SMALLINT NOT NULL,
  `reported_post_text` LONGTEXT NOT NULL DEFAULT (''),
  `reported_post_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `reported_post_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`report_id`),
  INDEX `phpbb_reports_pm_id` (`pm_id` ASC) VISIBLE,
  INDEX `phpbb_reports_post_id` (`post_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_reports_reasons
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_reports_reasons` (
  `reason_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `reason_title` VARCHAR(255) NOT NULL DEFAULT '',
  `reason_description` LONGTEXT NOT NULL DEFAULT (''),
  `reason_order` SMALLINT NOT NULL,
  PRIMARY KEY (`reason_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_search_results
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_search_results` (
  `search_key` VARCHAR(32) NOT NULL DEFAULT '',
  `search_time` INT NOT NULL DEFAULT 0,
  `search_keywords` LONGTEXT NOT NULL DEFAULT (''),
  `search_authors` LONGTEXT NOT NULL DEFAULT (''),
  PRIMARY KEY (`search_key`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_search_wordlist
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_search_wordlist` (
  `word_id` INT NOT NULL AUTO_INCREMENT,
  `word_text` VARCHAR(255) NOT NULL DEFAULT '',
  `word_common` SMALLINT NOT NULL,
  `word_count` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`word_id`),
  INDEX `phpbb_search_wordlist_wrd_cnt` (`word_count` ASC) VISIBLE,
  UNIQUE INDEX `phpbb_search_wordlist_wrd_txt` (`word_text` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_search_wordmatch
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_search_wordmatch` (
  `post_id` INT NOT NULL DEFAULT 0,
  `word_id` INT NOT NULL DEFAULT 0,
  `title_match` SMALLINT NOT NULL,
  INDEX `phpbb_search_wordmatch_post_id` (`post_id` ASC) VISIBLE,
  UNIQUE INDEX `phpbb_search_wordmatch_un_mtch` (`post_id` ASC, `word_id` ASC, `title_match` ASC) VISIBLE,
  INDEX `phpbb_search_wordmatch_word_id` (`word_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_sessions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_sessions` (
  `session_id` CHAR(32) NOT NULL DEFAULT '',
  `session_user_id` INT NOT NULL DEFAULT 0,
  `session_last_visit` INT NOT NULL DEFAULT 0,
  `session_start` INT NOT NULL DEFAULT 0,
  `session_time` INT NOT NULL DEFAULT 0,
  `session_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `session_browser` VARCHAR(150) NOT NULL DEFAULT '',
  `session_forwarded_for` VARCHAR(255) NOT NULL DEFAULT '',
  `session_page` VARCHAR(255) NOT NULL DEFAULT '',
  `session_viewonline` SMALLINT NOT NULL,
  `session_autologin` SMALLINT NOT NULL,
  `session_admin` SMALLINT NOT NULL,
  `session_forum_id` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`session_id`),
  INDEX `phpbb_sessions_session_fid` (`session_forum_id` ASC) VISIBLE,
  INDEX `phpbb_sessions_session_time` (`session_time` ASC) VISIBLE,
  INDEX `phpbb_sessions_session_user_id` (`session_user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_sessions_keys
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_sessions_keys` (
  `key_id` CHAR(32) NOT NULL DEFAULT '',
  `user_id` INT NOT NULL DEFAULT 0,
  `last_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `last_login` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`key_id`, `user_id`),
  INDEX `phpbb_sessions_keys_last_login` (`last_login` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_sitelist
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_sitelist` (
  `site_id` INT NOT NULL AUTO_INCREMENT,
  `site_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `site_hostname` VARCHAR(255) NOT NULL DEFAULT '',
  `ip_exclude` SMALLINT NOT NULL,
  PRIMARY KEY (`site_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_smilies
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_smilies` (
  `smiley_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(50) NOT NULL DEFAULT '',
  `emotion` VARCHAR(255) NOT NULL DEFAULT '',
  `smiley_url` VARCHAR(50) NOT NULL DEFAULT '',
  `smiley_width` SMALLINT NOT NULL,
  `smiley_height` SMALLINT NOT NULL,
  `smiley_order` INT NOT NULL DEFAULT 0,
  `display_on_posting` SMALLINT NOT NULL,
  PRIMARY KEY (`smiley_id`),
  INDEX `phpbb_smilies_display_on_post` (`display_on_posting` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_styles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_styles` (
  `style_id` INT NOT NULL AUTO_INCREMENT,
  `style_name` VARCHAR(255) NOT NULL DEFAULT '',
  `style_copyright` VARCHAR(255) NOT NULL DEFAULT '',
  `style_active` SMALLINT NOT NULL,
  `style_path` VARCHAR(100) NOT NULL DEFAULT '',
  `bbcode_bitfield` VARCHAR(255) NOT NULL DEFAULT 'kNg=',
  `style_parent_id` INT NOT NULL DEFAULT 0,
  `style_parent_tree` VARCHAR(8000) NOT NULL DEFAULT '',
  PRIMARY KEY (`style_id`),
  UNIQUE INDEX `phpbb_styles_style_name` (`style_name` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_teampage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_teampage` (
  `teampage_id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL DEFAULT 0,
  `teampage_name` VARCHAR(255) NOT NULL DEFAULT '',
  `teampage_position` INT NOT NULL DEFAULT 0,
  `teampage_parent` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`teampage_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_topics
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_topics` (
  `topic_id` INT NOT NULL AUTO_INCREMENT,
  `forum_id` INT NOT NULL DEFAULT 0,
  `icon_id` INT NOT NULL DEFAULT 0,
  `topic_attachment` SMALLINT NOT NULL,
  `topic_reported` SMALLINT NOT NULL,
  `topic_title` VARCHAR(255) NOT NULL DEFAULT '',
  `topic_poster` INT NOT NULL DEFAULT 0,
  `topic_time` INT NOT NULL DEFAULT 0,
  `topic_time_limit` INT NOT NULL DEFAULT 0,
  `topic_views` INT NOT NULL DEFAULT 0,
  `topic_status` SMALLINT NOT NULL,
  `topic_type` SMALLINT NOT NULL,
  `topic_first_post_id` INT NOT NULL DEFAULT 0,
  `topic_first_poster_name` VARCHAR(255) NOT NULL DEFAULT '',
  `topic_first_poster_colour` VARCHAR(6) NOT NULL DEFAULT '',
  `topic_last_post_id` INT NOT NULL DEFAULT 0,
  `topic_last_poster_id` INT NOT NULL DEFAULT 0,
  `topic_last_poster_name` VARCHAR(255) NOT NULL DEFAULT '',
  `topic_last_poster_colour` VARCHAR(6) NOT NULL DEFAULT '',
  `topic_last_post_subject` VARCHAR(255) NOT NULL DEFAULT '',
  `topic_last_post_time` INT NOT NULL DEFAULT 0,
  `topic_last_view_time` INT NOT NULL DEFAULT 0,
  `topic_moved_id` INT NOT NULL DEFAULT 0,
  `topic_bumped` SMALLINT NOT NULL,
  `topic_bumper` INT NOT NULL DEFAULT 0,
  `poll_title` VARCHAR(255) NOT NULL DEFAULT '',
  `poll_start` INT NOT NULL DEFAULT 0,
  `poll_length` INT NOT NULL DEFAULT 0,
  `poll_max_options` SMALLINT NOT NULL,
  `poll_last_vote` INT NOT NULL DEFAULT 0,
  `poll_vote_change` SMALLINT NOT NULL,
  `topic_visibility` SMALLINT NOT NULL,
  `topic_delete_time` INT NOT NULL DEFAULT 0,
  `topic_delete_reason` VARCHAR(255) NOT NULL DEFAULT '',
  `topic_delete_user` INT NOT NULL DEFAULT 0,
  `topic_posts_approved` INT NOT NULL DEFAULT 0,
  `topic_posts_unapproved` INT NOT NULL DEFAULT 0,
  `topic_posts_softdeleted` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`),
  INDEX `phpbb_topics_fid_time_moved` (`forum_id` ASC, `topic_last_post_time` ASC, `topic_moved_id` ASC) VISIBLE,
  INDEX `phpbb_topics_forum_id` (`forum_id` ASC) VISIBLE,
  INDEX `phpbb_topics_forum_id_type` (`forum_id` ASC, `topic_type` ASC) VISIBLE,
  INDEX `phpbb_topics_forum_vis_last` (`forum_id` ASC, `topic_last_post_id` ASC, `topic_visibility` ASC) VISIBLE,
  INDEX `phpbb_topics_last_post_time` (`topic_last_post_time` ASC) VISIBLE,
  INDEX `phpbb_topics_latest_topics` (`forum_id` ASC, `topic_last_post_id` ASC, `topic_last_post_time` ASC, `topic_moved_id` ASC) VISIBLE,
  INDEX `phpbb_topics_topic_visibility` (`topic_visibility` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_topics_posted
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_topics_posted` (
  `user_id` INT NOT NULL DEFAULT 0,
  `topic_id` INT NOT NULL DEFAULT 0,
  `topic_posted` SMALLINT NOT NULL,
  PRIMARY KEY (`user_id`, `topic_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_topics_track
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_topics_track` (
  `user_id` INT NOT NULL DEFAULT 0,
  `topic_id` INT NOT NULL DEFAULT 0,
  `forum_id` INT NOT NULL DEFAULT 0,
  `mark_time` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `topic_id`),
  INDEX `phpbb_topics_track_forum_id` (`forum_id` ASC) VISIBLE,
  INDEX `phpbb_topics_track_topic_id` (`topic_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_topics_watch
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_topics_watch` (
  `topic_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `notify_status` SMALLINT NOT NULL,
  INDEX `phpbb_topics_watch_notify_stat` (`notify_status` ASC) VISIBLE,
  INDEX `phpbb_topics_watch_topic_id` (`topic_id` ASC) VISIBLE,
  INDEX `phpbb_topics_watch_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_user_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_user_group` (
  `group_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `group_leader` SMALLINT NOT NULL,
  `user_pending` SMALLINT NOT NULL,
  INDEX `phpbb_user_group_group_id` (`group_id` ASC) VISIBLE,
  INDEX `phpbb_user_group_group_leader` (`group_leader` ASC) VISIBLE,
  INDEX `phpbb_user_group_user_id` (`user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_user_notifications
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_user_notifications` (
  `item_type` VARCHAR(165) NOT NULL DEFAULT '',
  `item_id` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL DEFAULT 0,
  `method` VARCHAR(165) NOT NULL DEFAULT '',
  `notify` SMALLINT NOT NULL,
  UNIQUE INDEX `phpbb_user_notifications_itm_usr_mthd` (`item_type` ASC, `item_id` ASC, `user_id` ASC, `method` ASC) VISIBLE,
  INDEX `phpbb_user_notifications_uid_itm_id` (`item_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `phpbb_user_notifications_user_id` (`user_id` ASC) VISIBLE,
  INDEX `phpbb_user_notifications_usr_itm_tpe` (`item_type` ASC, `item_id` ASC, `user_id` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_type` SMALLINT NOT NULL,
  `group_id` INT NOT NULL DEFAULT 3,
  `user_permissions` LONGTEXT NOT NULL DEFAULT (''),
  `user_perm_from` INT NOT NULL DEFAULT 0,
  `user_ip` VARCHAR(40) NOT NULL DEFAULT '',
  `user_regdate` INT NOT NULL DEFAULT 0,
  `username` VARCHAR(255) NOT NULL DEFAULT '',
  `username_clean` VARCHAR(255) NOT NULL DEFAULT '',
  `user_password` VARCHAR(255) NOT NULL DEFAULT '',
  `user_passchg` INT NOT NULL DEFAULT 0,
  `user_email` VARCHAR(100) NOT NULL DEFAULT '',
  `user_email_hash` BIGINT NOT NULL,
  `user_birthday` VARCHAR(10) NOT NULL DEFAULT '',
  `user_lastvisit` INT NOT NULL DEFAULT 0,
  `user_lastmark` INT NOT NULL DEFAULT 0,
  `user_lastpost_time` INT NOT NULL DEFAULT 0,
  `user_lastpage` VARCHAR(200) NOT NULL DEFAULT '',
  `user_last_confirm_key` VARCHAR(10) NOT NULL DEFAULT '',
  `user_last_search` INT NOT NULL DEFAULT 0,
  `user_warnings` SMALLINT NOT NULL,
  `user_last_warning` INT NOT NULL DEFAULT 0,
  `user_login_attempts` SMALLINT NOT NULL,
  `user_inactive_reason` SMALLINT NOT NULL,
  `user_inactive_time` INT NOT NULL DEFAULT 0,
  `user_posts` INT NOT NULL DEFAULT 0,
  `user_lang` VARCHAR(30) NOT NULL DEFAULT '',
  `user_timezone` VARCHAR(100) NOT NULL DEFAULT '',
  `user_dateformat` VARCHAR(64) NOT NULL DEFAULT 'd M Y H:i',
  `user_style` INT NOT NULL DEFAULT 0,
  `user_rank` INT NOT NULL DEFAULT 0,
  `user_colour` VARCHAR(6) NOT NULL DEFAULT '',
  `user_new_privmsg` INT NOT NULL DEFAULT 0,
  `user_unread_privmsg` INT NOT NULL DEFAULT 0,
  `user_last_privmsg` INT NOT NULL DEFAULT 0,
  `user_message_rules` SMALLINT NOT NULL,
  `user_full_folder` INT NOT NULL,
  `user_emailtime` INT NOT NULL DEFAULT 0,
  `user_topic_show_days` SMALLINT NOT NULL,
  `user_topic_sortby_type` VARCHAR(1) NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` VARCHAR(1) NOT NULL DEFAULT 'd',
  `user_post_show_days` SMALLINT NOT NULL,
  `user_post_sortby_type` VARCHAR(1) NOT NULL DEFAULT 't',
  `user_post_sortby_dir` VARCHAR(1) NOT NULL DEFAULT 'a',
  `user_notify` SMALLINT NOT NULL,
  `user_notify_pm` SMALLINT NOT NULL,
  `user_notify_type` SMALLINT NOT NULL,
  `user_allow_pm` SMALLINT NOT NULL,
  `user_allow_viewonline` SMALLINT NOT NULL,
  `user_allow_viewemail` SMALLINT NOT NULL,
  `user_allow_massemail` SMALLINT NOT NULL,
  `user_options` INT NOT NULL DEFAULT 230271,
  `user_avatar` VARCHAR(255) NOT NULL DEFAULT '',
  `user_avatar_type` VARCHAR(255) NOT NULL DEFAULT '',
  `user_avatar_width` SMALLINT NOT NULL,
  `user_avatar_height` SMALLINT NOT NULL,
  `user_sig` LONGTEXT NOT NULL DEFAULT (''),
  `user_sig_bbcode_uid` VARCHAR(8) NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` VARCHAR(255) NOT NULL DEFAULT '',
  `user_jabber` VARCHAR(255) NOT NULL DEFAULT '',
  `user_actkey` VARCHAR(32) NOT NULL DEFAULT '',
  `user_newpasswd` VARCHAR(255) NOT NULL DEFAULT '',
  `user_form_salt` VARCHAR(32) NOT NULL DEFAULT '',
  `user_new` SMALLINT NOT NULL,
  `user_reminded` SMALLINT NOT NULL,
  `user_reminded_time` INT NOT NULL DEFAULT 0,
  `user_font` SMALLINT NOT NULL,
  `user_font_size` INT NOT NULL DEFAULT 104,
  `user_font_bold` SMALLINT NOT NULL,
  `user_mobile_font` SMALLINT NOT NULL,
  `user_mobile_font_size` INT NOT NULL DEFAULT 104,
  PRIMARY KEY (`user_id`),
  INDEX `phpbb_users_user_birthday` (`user_birthday` ASC) VISIBLE,
  INDEX `phpbb_users_user_email_hash` (`user_email_hash` ASC) VISIBLE,
  INDEX `phpbb_users_user_type` (`user_type` ASC) VISIBLE,
  UNIQUE INDEX `phpbb_users_username_clean` (`username_clean` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_warnings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_warnings` (
  `warning_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT 0,
  `post_id` INT NOT NULL DEFAULT 0,
  `log_id` INT NOT NULL DEFAULT 0,
  `warning_time` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`warning_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_words
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_words` (
  `word_id` INT NOT NULL AUTO_INCREMENT,
  `word` VARCHAR(255) NOT NULL DEFAULT '',
  `replacement` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`));

-- ----------------------------------------------------------------------------
-- Table phpbb.phpbb_zebra
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpbb`.`phpbb_zebra` (
  `user_id` INT NOT NULL DEFAULT 0,
  `zebra_id` INT NOT NULL DEFAULT 0,
  `friend` SMALLINT NOT NULL,
  `foe` SMALLINT NOT NULL,
  PRIMARY KEY (`user_id`, `zebra_id`));
SET FOREIGN_KEY_CHECKS = 1;

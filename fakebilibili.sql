/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 90600 (9.6.0)
 Source Host           : localhost:3306
 Source Schema         : fakebilibili

 Target Server Type    : MySQL
 Target Server Version : 90600 (9.6.0)
 File Encoding         : 65001

 Date: 28/03/2026 19:39:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for imgs
-- ----------------------------
DROP TABLE IF EXISTS `imgs`;
CREATE TABLE `imgs` (
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of imgs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lv_article_classification
-- ----------------------------
DROP TABLE IF EXISTS `lv_article_classification`;
CREATE TABLE `lv_article_classification` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `a_id` bigint unsigned DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_article_classification_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_article_classification
-- ----------------------------
BEGIN;
INSERT INTO `lv_article_classification` (`id`, `created_at`, `updated_at`, `deleted_at`, `a_id`, `label`) VALUES (1, '2025-05-14 09:06:15.000', NULL, NULL, 0, '生活');
INSERT INTO `lv_article_classification` (`id`, `created_at`, `updated_at`, `deleted_at`, `a_id`, `label`) VALUES (2, '2025-05-14 09:06:30.000', NULL, NULL, 0, '科技');
INSERT INTO `lv_article_classification` (`id`, `created_at`, `updated_at`, `deleted_at`, `a_id`, `label`) VALUES (3, '2025-05-14 09:06:48.000', NULL, NULL, 1, '游戏');
INSERT INTO `lv_article_classification` (`id`, `created_at`, `updated_at`, `deleted_at`, `a_id`, `label`) VALUES (4, '2025-05-14 09:21:33.000', NULL, NULL, 1, '知识分享');
INSERT INTO `lv_article_classification` (`id`, `created_at`, `updated_at`, `deleted_at`, `a_id`, `label`) VALUES (5, '2025-05-14 09:21:55.000', NULL, NULL, 2, '数码');
COMMIT;

-- ----------------------------
-- Table structure for lv_article_contribution
-- ----------------------------
DROP TABLE IF EXISTS `lv_article_contribution`;
CREATE TABLE `lv_article_contribution` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `classification_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cover` json DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `content_storage_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_comments` tinyint DEFAULT NULL,
  `heat` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_article_contribution_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_article_contribution_classification` (`classification_id`) USING BTREE,
  KEY `fk_lv_article_contribution_user_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_article_contribution_classification` FOREIGN KEY (`classification_id`) REFERENCES `lv_article_classification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_article_contribution_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_article_contribution
-- ----------------------------
BEGIN;
INSERT INTO `lv_article_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `classification_id`, `title`, `cover`, `label`, `content`, `content_storage_type`, `is_comments`, `heat`) VALUES (1, '2025-03-26 19:13:40.000', '2025-03-26 19:13:42.000', '2025-05-14 09:23:41.266', 2, NULL, 'title1', NULL, NULL, 'article_hhh1', NULL, NULL, NULL);
INSERT INTO `lv_article_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `classification_id`, `title`, `cover`, `label`, `content`, `content_storage_type`, `is_comments`, `heat`) VALUES (2, '2025-03-26 19:13:40.000', '2025-03-26 19:13:42.000', '2025-05-14 09:23:45.015', 2, NULL, 'title2', NULL, NULL, 'article_hhh2', NULL, NULL, NULL);
INSERT INTO `lv_article_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `classification_id`, `title`, `cover`, `label`, `content`, `content_storage_type`, `is_comments`, `heat`) VALUES (20, '2025-03-26 19:13:40.000', '2025-03-26 19:13:42.000', '2025-05-14 09:23:47.725', 2, NULL, 'title2', NULL, NULL, 'article_hhh2', NULL, NULL, NULL);
INSERT INTO `lv_article_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `classification_id`, `title`, `cover`, `label`, `content`, `content_storage_type`, `is_comments`, `heat`) VALUES (21, '2025-05-14 09:23:35.193', '2025-05-14 09:24:08.008', NULL, 2, 4, '25.5.14 9:22', '{\"src\": \"Cover/articleCover/41e41ca1673371f730550c569e963c506f20687c4dd22a6a89daf94b0cfb84d4.jpg\", \"type\": \"aliyunOss\"}', '', '<p>哎，加油捏。</p><p>赶紧debug</p><p>赶紧上线</p><p>赶紧投简历</p>', 'aliyunOss', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for lv_article_contribution_comments
-- ----------------------------
DROP TABLE IF EXISTS `lv_article_contribution_comments`;
CREATE TABLE `lv_article_contribution_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `article_id` bigint unsigned DEFAULT NULL,
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `comment_id` bigint unsigned DEFAULT NULL,
  `comment_user_id` bigint unsigned DEFAULT NULL,
  `comment_first_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_article_contribution_comments_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_article_contribution_comments` (`article_id`) USING BTREE,
  KEY `fk_lv_article_contribution_comments_user_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_article_contribution_comments` FOREIGN KEY (`article_id`) REFERENCES `lv_article_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_article_contribution_comments_article_info` FOREIGN KEY (`article_id`) REFERENCES `lv_article_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_article_contribution_comments_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_article_contribution_comments
-- ----------------------------
BEGIN;
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (1, '2025-05-14 09:43:33.884', '2025-05-14 09:43:33.884', NULL, 2, 21, '加油，陌生人', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (2, '2025-05-14 09:43:36.078', '2025-05-14 09:43:36.078', NULL, 2, 21, '', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (3, '2025-05-14 09:43:54.062', '2025-05-14 09:43:54.062', NULL, 2, 21, '加油陌生人🥰', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (4, '2025-05-14 09:45:02.934', '2025-05-14 09:45:02.934', NULL, 2, 21, '你也是QAQ', 1, 2, 1);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (5, '2025-05-14 09:47:50.502', '2025-05-14 09:47:50.502', NULL, 2, 21, '我们一起加油', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (6, '2025-05-14 10:02:18.891', '2025-05-14 10:02:18.891', NULL, 2, 21, '你怎么不说话？', 2, 2, 2);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (7, '2025-05-14 10:03:37.574', '2025-05-14 10:03:37.574', NULL, 2, 21, '祝你找到实习捏', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (8, '2025-05-14 10:05:05.822', '2025-05-14 10:05:05.822', NULL, 2, 21, '谢谢你', 7, 2, 7);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (9, '2025-05-14 10:05:53.042', '2025-05-14 10:05:53.042', NULL, 2, 21, '怎么和影子玩拳击', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (10, '2025-05-14 10:09:39.879', '2025-05-14 10:09:39.879', NULL, 2, 21, '我也不想~', 9, 2, 9);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (11, '2025-05-14 10:22:17.744', '2025-05-14 10:22:17.744', NULL, 2, 21, '怎么这么多ug', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (12, '2025-05-14 10:24:49.242', '2025-05-14 10:24:49.242', NULL, 2, 21, '好像漏加了个<!>', 0, 0, 0);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (13, '2025-05-14 10:25:32.666', '2025-05-14 10:25:32.666', NULL, 2, 21, '?好菜', 12, 2, 12);
INSERT INTO `lv_article_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `article_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`) VALUES (14, '2025-05-14 10:44:09.866', '2025-05-14 10:44:09.866', NULL, 2, 21, '1', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for lv_article_contribution_likes
-- ----------------------------
DROP TABLE IF EXISTS `lv_article_contribution_likes`;
CREATE TABLE `lv_article_contribution_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `article_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_article_contribution_likes_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_article_contribution_likes` (`article_id`) USING BTREE,
  CONSTRAINT `fk_lv_article_contribution_likes` FOREIGN KEY (`article_id`) REFERENCES `lv_article_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_article_contribution_likes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lv_check_in
-- ----------------------------
DROP TABLE IF EXISTS `lv_check_in`;
CREATE TABLE `lv_check_in` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `latest_day` bigint DEFAULT NULL,
  `consecutive_day` bigint DEFAULT NULL,
  `integral` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_check_in_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_check_in
-- ----------------------------
BEGIN;
INSERT INTO `lv_check_in` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `latest_day`, `consecutive_day`, `integral`) VALUES (1, '2025-03-30 22:49:03.524', '2025-03-30 22:49:03.524', NULL, 2, 20250330, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for lv_cron_events
-- ----------------------------
DROP TABLE IF EXISTS `lv_cron_events`;
CREATE TABLE `lv_cron_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_cron_events
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lv_home_rotograph
-- ----------------------------
DROP TABLE IF EXISTS `lv_home_rotograph`;
CREATE TABLE `lv_home_rotograph` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cover` json DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `to_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_home_rotograph_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_home_rotograph
-- ----------------------------
BEGIN;
INSERT INTO `lv_home_rotograph` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `cover`, `color`, `type`, `to_id`) VALUES (1, '2025-04-21 17:20:59.000', '2025-05-22 19:24:08.000', '2025-05-22 19:25:22.000', 'rotog1', '{\"Tp\": \"aliyunOss\", \"Src\": \"path1\"}', 'black', NULL, NULL);
INSERT INTO `lv_home_rotograph` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `cover`, `color`, `type`, `to_id`) VALUES (2, '2025-04-21 17:22:41.000', '2025-05-22 19:24:11.000', '2025-05-22 19:25:24.000', 'rotog2', '{\"Tp\": \"aliyunOss\", \"Src\": \"path2\"}', 'red', NULL, NULL);
INSERT INTO `lv_home_rotograph` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `cover`, `color`, `type`, `to_id`) VALUES (3, '2025-05-16 10:07:40.025', '2025-05-16 10:07:40.025', NULL, '【老鼠人行动】航天基地（绝密）???w→721w', '{\"src\": \"Cover/videoCover/532133e49e165f3251dd758cd822ca74640e50efa3d83ee708b46756a1ce25fd.jpg\", \"type\": \"oss\"}', 'rgb(116,82,81)', 'video', 41);
INSERT INTO `lv_home_rotograph` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `cover`, `color`, `type`, `to_id`) VALUES (4, '2025-05-16 10:07:40.032', '2025-05-16 10:07:40.032', NULL, '巴拔之交~巴也连麦御姐（拔里神玉）', '{\"src\": \"Cover/videoCover/3320a767a12b96f175bbfced082285e99e573dea10f9ee062cd787620f0a05d3.jpg\", \"type\": \"oss\"}', 'rgb(116,82,81)', 'video', 42);
INSERT INTO `lv_home_rotograph` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `cover`, `color`, `type`, `to_id`) VALUES (5, '2025-05-16 10:07:40.033', '2025-05-16 10:07:40.033', '2026-03-28 19:32:22.000', '25.5.14 9:22', '{\"src\": \"Cover/articleCover/41e41ca1673371f730550c569e963c506f20687c4dd22a6a89daf94b0cfb84d4.jpg\", \"type\": \"aliyunOss\"}', 'rgb(116,82,81)', 'article', 21);
COMMIT;

-- ----------------------------
-- Table structure for lv_live_info
-- ----------------------------
DROP TABLE IF EXISTS `lv_live_info`;
CREATE TABLE `lv_live_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img` json DEFAULT NULL COMMENT 'img',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_live_info_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_live_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_users_live_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_live_info
-- ----------------------------
BEGIN;
INSERT INTO `lv_live_info` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `img`) VALUES (1, '2025-03-30 16:49:53.000', '2025-05-14 15:27:44.028', NULL, 2, '开播啦', '{\"src\": \"Cover/liveCover/41e41ca1673371f730550c569e963c506f20687c4dd22a6a89daf94b0cfb84d4.jpg\", \"type\": \"aliyunOss\"}');
COMMIT;

-- ----------------------------
-- Table structure for lv_runtime_log
-- ----------------------------
DROP TABLE IF EXISTS `lv_runtime_log`;
CREATE TABLE `lv_runtime_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `level` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `function` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_runtime_log_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_runtime_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lv_transcoding_task
-- ----------------------------
DROP TABLE IF EXISTS `lv_transcoding_task`;
CREATE TABLE `lv_transcoding_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  `resolution` bigint DEFAULT NULL,
  `dst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_transcoding_task_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_transcoding_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lv_upload_method
-- ----------------------------
DROP TABLE IF EXISTS `lv_upload_method`;
CREATE TABLE `lv_upload_method` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `interface` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `quality` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_upload_method_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_upload_method
-- ----------------------------
BEGIN;
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (1, '2025-04-13 20:39:24.000', NULL, NULL, 'videoContributionCover', 'aliyunOss', 'Cover/videoCover/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (2, '2025-04-21 19:25:30.000', NULL, NULL, 'videoContribution', 'aliyunOss', 'videoContribution/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (3, '2025-05-09 16:12:28.000', NULL, NULL, 'articleContribution', 'aliyunOss', 'articleContribution/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (4, '2025-05-09 16:13:08.000', NULL, NULL, 'articleContributionCover', 'aliyunOss', 'Cover/articleCover/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (5, '2025-05-09 16:13:54.000', NULL, NULL, 'createFavoritesCover', 'aliyunOss', 'Cover/favoriteCover/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (6, '2025-05-09 16:15:31.000', NULL, NULL, 'userAvatar', 'aliyunOss', 'Avatar/', NULL);
INSERT INTO `lv_upload_method` (`id`, `created_at`, `updated_at`, `deleted_at`, `interface`, `method`, `path`, `quality`) VALUES (7, '2025-05-09 16:16:08.000', NULL, NULL, 'liveCover', 'aliyunOss', 'Cover/liveCover/', NULL);
COMMIT;

-- ----------------------------
-- Table structure for lv_users
-- ----------------------------
DROP TABLE IF EXISTS `lv_users`;
CREATE TABLE `lv_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` json DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `birth_date` datetime(3) DEFAULT NULL,
  `is_visible` tinyint DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `social_media` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users
-- ----------------------------
BEGIN;
INSERT INTO `lv_users` (`id`, `created_at`, `updated_at`, `deleted_at`, `email`, `username`, `openid`, `salt`, `password`, `photo`, `gender`, `birth_date`, `is_visible`, `signature`, `social_media`) VALUES (2, '2025-03-25 18:39:56.522', '2026-03-28 18:40:02.380', NULL, '2199492464@qq.com', 'test1', '', 'NOmPGi', '3b05ea7a979168290803dcad3f577aa2', '{\"src\": \"Avatar/b57389af7b9b952dbda43c552de7cc6d7cc03afc886252340de04d73c30aebd2.jpg\", \"type\": \"tencentCos\"}', 0, '2002-09-14 23:04:05.000', 1, '我不是最狂', 'Wechat, QQ');
INSERT INTO `lv_users` (`id`, `created_at`, `updated_at`, `deleted_at`, `email`, `username`, `openid`, `salt`, `password`, `photo`, `gender`, `birth_date`, `is_visible`, `signature`, `social_media`) VALUES (3, '2025-03-30 16:43:20.833', '2025-05-14 15:23:31.288', '2026-03-28 19:19:59.000', 'feisun0208@163.com', 'test2', '', 'nxyNXW', '5e42fa8abac1500eead208ed76891593', '{\"src\": \"Avatar/f03a5b7fe4b6965ff365a3eb08a8474c97f8f6c69b08c663f6276ba103e53c8c.jpg\", \"type\": \"aliyunOss\"}', 0, '2025-03-30 16:43:20.833', 0, '', '');
INSERT INTO `lv_users` (`id`, `created_at`, `updated_at`, `deleted_at`, `email`, `username`, `openid`, `salt`, `password`, `photo`, `gender`, `birth_date`, `is_visible`, `signature`, `social_media`) VALUES (4, '2026-03-28 19:29:36.303', '2026-03-28 19:29:36.303', NULL, 'feisun0208@163.com', 'test2', '', 'aRVAGY', 'b58d74975e7d2affb0185b1c250eb7a1', '{\"src\": \"default_image_female_2.png\", \"type\": \"oss\"}', 0, '2026-03-28 19:29:36.303', 0, '', '');
COMMIT;

-- ----------------------------
-- Table structure for lv_users_attention
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_attention`;
CREATE TABLE `lv_users_attention` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `attention_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_attention_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_attention_user_info` (`uid`) USING BTREE,
  KEY `fk_lv_users_attention_attention_user_info` (`attention_id`) USING BTREE,
  CONSTRAINT `fk_lv_users_attention_attention_user_info` FOREIGN KEY (`attention_id`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_attention_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_attention
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_attention` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `attention_id`) VALUES (1, '2025-03-30 17:08:04.174', '2025-03-30 17:08:04.174', '2025-03-30 17:08:43.674', 2, 3);
INSERT INTO `lv_users_attention` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `attention_id`) VALUES (3, '2025-03-30 17:08:48.855', '2025-03-30 17:08:48.855', '2025-05-09 09:50:38.312', 2, 3);
INSERT INTO `lv_users_attention` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `attention_id`) VALUES (4, '2025-05-09 09:50:39.446', '2025-05-09 09:50:39.446', NULL, 2, 3);
COMMIT;

-- ----------------------------
-- Table structure for lv_users_chat_list
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_chat_list`;
CREATE TABLE `lv_users_chat_list` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `tid` bigint unsigned DEFAULT NULL,
  `unread` bigint DEFAULT NULL,
  `last_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_chat_list_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_chat_list_to_user_info` (`tid`) USING BTREE,
  CONSTRAINT `fk_lv_users_chat_list_to_user_info` FOREIGN KEY (`tid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_chat_list
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_chat_list` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `unread`, `last_message`, `last_at`) VALUES (2, '2025-03-30 22:46:17.316', '2025-03-30 22:46:17.316', '2025-03-30 22:47:39.387', 2, 3, 1, '', '2025-03-30 22:33:46.000');
INSERT INTO `lv_users_chat_list` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `unread`, `last_message`, `last_at`) VALUES (3, '2025-04-03 14:08:08.000', '2025-05-14 15:31:28.125', NULL, 2, 3, 0, 'bye', '2025-04-03 14:08:33.000');
INSERT INTO `lv_users_chat_list` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `unread`, `last_message`, `last_at`) VALUES (5, '2025-05-14 15:25:28.462', '2025-05-14 15:31:41.238', NULL, 3, 2, 0, '你在哪里', '2025-05-14 15:25:28.461');
COMMIT;

-- ----------------------------
-- Table structure for lv_users_chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_chat_msg`;
CREATE TABLE `lv_users_chat_msg` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `tid` bigint unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_chat_msg_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_chat_msg_uinfo` (`uid`) USING BTREE,
  KEY `fk_lv_users_chat_msg_t_info` (`tid`) USING BTREE,
  CONSTRAINT `fk_lv_users_chat_msg_t_info` FOREIGN KEY (`tid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_chat_msg_uinfo` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_chat_msg
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_chat_msg` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `type`, `message`) VALUES (1, '2025-03-30 22:33:46.000', NULL, NULL, 2, 3, NULL, '你好');
INSERT INTO `lv_users_chat_msg` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `type`, `message`) VALUES (2, '2025-04-03 14:12:38.000', NULL, NULL, 2, 3, NULL, '你好帅');
INSERT INTO `lv_users_chat_msg` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `type`, `message`) VALUES (3, '2025-05-14 15:25:28.456', '2025-05-14 15:25:28.456', NULL, 2, 3, 'sendChatMsgText', '你在哪里');
INSERT INTO `lv_users_chat_msg` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `tid`, `type`, `message`) VALUES (4, '2025-05-14 15:31:21.880', '2025-05-14 15:31:21.880', NULL, 3, 2, 'sendChatMsgText', '你心里~');
COMMIT;

-- ----------------------------
-- Table structure for lv_users_collect
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_collect`;
CREATE TABLE `lv_users_collect` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `favorites_id` bigint unsigned DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_collect_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_collect_video_info` (`video_id`) USING BTREE,
  KEY `fk_lv_users_collect_user_info` (`uid`) USING BTREE,
  KEY `fk_lv_users_favorites_collect_list` (`favorites_id`) USING BTREE,
  CONSTRAINT `fk_lv_users_collect_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_collect_video_info` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_favorites_collect_list` FOREIGN KEY (`favorites_id`) REFERENCES `lv_users_favorites` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_collect
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_collect` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `favorites_id`, `video_id`) VALUES (2, '2025-05-14 08:53:52.800', '2025-05-14 08:53:52.800', NULL, 2, 3, 20);
COMMIT;

-- ----------------------------
-- Table structure for lv_users_favorites
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_favorites`;
CREATE TABLE `lv_users_favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cover` json DEFAULT NULL COMMENT 'cover',
  `max` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_favorites_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_favorites_user_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_users_favorites_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_favorites
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_favorites` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `content`, `cover`, `max`) VALUES (1, '2025-03-30 17:37:56.958', '2025-03-30 17:37:56.958', '2025-05-14 08:54:33.001', 2, '1号收藏夹', '美食', '{\"src\": \"aaa.com\", \"type\": \"oss\"}', 1000);
INSERT INTO `lv_users_favorites` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `content`, `cover`, `max`) VALUES (3, '2025-05-14 08:53:50.778', '2025-05-14 08:55:12.121', NULL, 2, '游戏', '', '{\"src\": \"Cover/favoriteCover/67da946bacbbb29cce21f92951561d3194dcc5b0effcc89f7299f0463a54fe19.jpg\", \"type\": \"aliyunOss\"}', 1000);
COMMIT;

-- ----------------------------
-- Table structure for lv_users_notices
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_notices`;
CREATE TABLE `lv_users_notices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `cid` bigint unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `to_id` bigint unsigned DEFAULT NULL,
  `is_read` bigint unsigned DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_notices_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_notices_user_info` (`cid`) USING BTREE,
  KEY `fk_lv_users_notices_article_info` (`to_id`) USING BTREE,
  CONSTRAINT `fk_lv_users_notices_article_info` FOREIGN KEY (`to_id`) REFERENCES `lv_article_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_notices_user_info` FOREIGN KEY (`cid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_notices_video_info` FOREIGN KEY (`to_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_notices
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (1, '2025-03-30 22:08:41.000', '2025-05-09 09:41:13.830', NULL, 2, 3, 'system', NULL, 1, NULL);
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (2, '2025-05-14 15:23:43.300', '2025-05-14 15:25:09.558', NULL, 2, 3, 'videoLike', 20, 1, '攒了您的作品');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (3, '2025-05-14 15:24:08.469', '2025-05-14 15:25:09.558', NULL, 2, 3, 'videoComment', 20, 1, '好可怕的食人鼠');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (25, '2025-05-16 10:46:10.021', '2025-05-16 10:46:22.942', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (26, '2025-05-16 10:46:10.026', '2025-05-16 10:46:10.026', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (27, '2025-05-16 10:46:20.013', '2025-05-16 10:46:22.942', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (28, '2025-05-16 10:46:20.017', '2025-05-16 10:46:20.017', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (29, '2025-05-16 10:46:30.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (30, '2025-05-16 10:46:30.016', '2025-05-16 10:46:30.016', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (31, '2025-05-16 10:46:40.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (32, '2025-05-16 10:46:40.009', '2025-05-16 10:46:40.009', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (33, '2025-05-16 10:46:50.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (34, '2025-05-16 10:46:50.019', '2025-05-16 10:46:50.019', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (35, '2025-05-16 10:47:00.002', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (36, '2025-05-16 10:47:00.017', '2025-05-16 10:47:00.017', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (37, '2025-05-16 10:47:10.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (38, '2025-05-16 10:47:10.018', '2025-05-16 10:47:10.018', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (39, '2025-05-16 10:47:20.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (40, '2025-05-16 10:47:20.016', '2025-05-16 10:47:20.016', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (41, '2025-05-16 10:47:30.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (42, '2025-05-16 10:47:30.007', '2025-05-16 10:47:30.007', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (43, '2025-05-16 10:49:20.004', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (44, '2025-05-16 10:49:20.019', '2025-05-16 10:49:20.019', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (45, '2025-05-16 10:49:30.003', '2025-05-16 10:49:31.110', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (46, '2025-05-16 10:49:30.007', '2025-05-16 10:49:30.007', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (47, '2025-05-16 10:49:40.004', '2025-05-22 16:51:36.257', NULL, 2, 2, 'dailyReport', NULL, 1, '您昨日报告:昨日新增0粉丝！');
INSERT INTO `lv_users_notices` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `cid`, `type`, `to_id`, `is_read`, `content`) VALUES (48, '2025-05-16 10:49:40.008', '2025-05-16 10:49:40.008', NULL, 3, 2, 'dailyReport', NULL, 0, '您昨日报告:昨日新增0粉丝！:昨日新增0粉丝！');
COMMIT;

-- ----------------------------
-- Table structure for lv_users_record
-- ----------------------------
DROP TABLE IF EXISTS `lv_users_record`;
CREATE TABLE `lv_users_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `to_video_id` bigint unsigned DEFAULT NULL,
  `to_article_id` bigint unsigned DEFAULT NULL,
  `to_live_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_users_record_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_users_record_video_info` (`to_video_id`) USING BTREE,
  KEY `fk_lv_users_record_user_info` (`uid`) USING BTREE,
  KEY `fk_lv_users_record_article_info` (`to_article_id`) USING BTREE,
  CONSTRAINT `fk_lv_users_record_article_info` FOREIGN KEY (`to_article_id`) REFERENCES `lv_article_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_record_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_users_record_video_info` FOREIGN KEY (`to_video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_users_record
-- ----------------------------
BEGIN;
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (1, '2025-05-12 21:21:59.264', '2026-03-28 15:29:33.826', NULL, 2, 'video', 20, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (2, '2025-05-12 21:27:18.004', '2025-05-16 10:08:33.855', NULL, 2, 'video', 21, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (3, '2025-05-12 22:15:47.062', '2026-03-28 15:31:05.636', NULL, 2, 'video', 39, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (4, '2025-05-12 22:15:47.070', '2025-05-12 22:15:47.070', NULL, 2, 'video', 39, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (5, '2025-05-14 09:24:08.001', '2025-05-14 10:25:48.612', NULL, 2, 'article', NULL, 21, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (6, '2025-05-14 15:23:36.582', '2025-05-14 15:23:36.582', NULL, 3, 'video', 20, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (7, '2025-05-14 15:23:36.584', '2025-05-14 15:23:36.584', NULL, 3, 'video', 20, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (8, '2025-05-14 15:29:52.577', '2025-05-14 15:29:52.577', NULL, 3, 'live', NULL, NULL, 2);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (9, '2025-05-14 15:30:17.763', '2026-03-28 19:18:27.355', NULL, 2, 'live', NULL, NULL, 2);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (10, '2026-03-28 15:31:34.816', '2026-03-28 15:31:34.816', NULL, 2, 'video', 36, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (11, '2026-03-28 15:31:34.816', '2026-03-28 15:31:34.816', NULL, 2, 'video', 36, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (12, '2026-03-28 18:05:56.181', '2026-03-28 18:20:45.524', NULL, 2, 'video', 40, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (13, '2026-03-28 18:05:56.213', '2026-03-28 18:05:56.213', NULL, 2, 'video', 40, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (14, '2026-03-28 18:38:05.222', '2026-03-28 18:38:11.119', NULL, 2, 'video', 59, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (15, '2026-03-28 19:32:57.581', '2026-03-28 19:32:57.581', NULL, 4, 'video', 42, NULL, NULL);
INSERT INTO `lv_users_record` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `type`, `to_video_id`, `to_article_id`, `to_live_id`) VALUES (16, '2026-03-28 19:32:57.581', '2026-03-28 19:32:57.581', NULL, 4, 'video', 42, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lv_video_contribution
-- ----------------------------
DROP TABLE IF EXISTS `lv_video_contribution`;
CREATE TABLE `lv_video_contribution` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `video` json DEFAULT NULL,
  `video_720p` json DEFAULT NULL,
  `video_480p` json DEFAULT NULL,
  `video_360p` json DEFAULT NULL,
  `media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cover` json DEFAULT NULL,
  `video_duration` bigint DEFAULT NULL,
  `reprinted` tinyint DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `heat` bigint DEFAULT NULL,
  `is_visible` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_video_contribution_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_video_contribution_user_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_video_contribution_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_video_contribution
-- ----------------------------
BEGIN;
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (1, '2025-03-26 19:15:00.000', '2025-04-22 15:43:15.263', '2025-05-12 21:35:05.000', 2, 'ocean!', '{\"Tp\": \"aliyunOss\", \"Src\": \"path1\"}', NULL, NULL, NULL, NULL, '{\"src\": \"E:\\\\wallpaper\\\\QQ图片20230509220502.jpg\", \"type\": \"local\"}', NULL, 1, 'food,toy', '一个本地海洋视频', 2, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (2, '2025-04-21 17:24:38.000', '2025-04-22 10:32:40.669', '2025-05-12 21:34:54.000', 2, 'title2', '{\"Tp\": \"aliyunOss\", \"Src\": \"path2\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (3, '2025-04-21 17:24:38.000', NULL, '2025-05-12 21:34:51.000', 2, 'title3', '{\"Tp\": \"aliyunOss\", \"Src\": \"path3\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (4, '2025-04-21 17:24:38.000', '2025-05-07 11:52:44.070', '2025-05-12 21:34:48.000', 2, 'title4', '{\"Tp\": \"aliyunOss\", \"Src\": \"path4\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (5, '2025-04-21 17:24:38.000', NULL, '2025-05-12 21:34:45.000', 2, 'title5', '{\"Tp\": \"aliyunOss\", \"Src\": \"path5\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (6, '2025-04-21 17:24:38.000', '2025-05-09 09:51:37.763', '2025-05-12 21:34:41.000', 2, 'title6', '{\"Tp\": \"aliyunOss\", \"Src\": \"path6\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (7, '2025-04-21 17:24:38.000', NULL, '2025-04-22 15:45:13.112', 2, 'title7', '{\"Tp\": \"aliyunOss\", \"Src\": \"path7\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (20, '2025-05-12 16:50:12.722', '2026-03-28 15:29:33.417', '2026-03-28 18:21:15.000', 2, '【老鼠人行动】航天基地（绝密）???w→721w', NULL, NULL, '{\"src\": \"videoContribution/b4bb1866063b95a6490a27e742e74fa09d46ee3a4dd8bd59e02bc55d14305836.mp4\", \"type\": \"oss\"}', NULL, '9a9f80302f0d71f0af9ee6f6c74b6302', '{\"src\": \"Cover/videoCover/67da946bacbbb29cce21f92951561d3194dcc5b0effcc89f7299f0463a54fe19.jpg\", \"type\": \"oss\"}', 335, 0, '游戏', '三角洲启动', 3, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (21, '2025-05-12 21:27:09.225', '2025-05-12 21:27:17.990', '2026-03-28 18:21:15.000', 2, '巴拔之交~巴也连麦御姐（拔里神玉）', NULL, NULL, '{\"src\": \"videoContribution/fc614d3ca7b14e0f23ca8acf166b946376fe9c28eaa0e8b4b2d95172c36c887d.mp4\", \"type\": \"oss\"}', NULL, 'b5991a002f3471f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/76c8a22b0c103f1e0b26e5e1de3137f0425e443e08e15d67f56f16a722eed660.jpg\", \"type\": \"oss\"}', 182, 0, '动漫', '不良人集合！', 1, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (22, '2025-05-12 21:36:43.806', '2025-05-12 21:36:43.806', '2026-03-28 18:21:15.000', 2, '小伯恩山第一次拴绳，开启蹦迪模式，死活不肯走！', NULL, NULL, '{\"src\": \"videoContribution/9f024f759eb7a3107967409a34157ee577cc0b1cb52e2a594ac01784fb146839.mp4\", \"type\": \"oss\"}', NULL, '0d28c3002f3671f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/132996c0969a0ea9f059b8d90124c3a7a86f5c96d3116fac8ccd79c3ba8b9e4c.jpg\", \"type\": \"oss\"}', 435, 0, '萌宠', '大脚小伯~', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (23, '2025-05-12 21:40:18.894', '2025-05-12 21:40:18.894', '2026-03-28 18:21:15.000', 2, '为什么你吃的羊肉串里可能没有羊肉？【食录】', NULL, NULL, '{\"src\": \"videoContribution/d7748c82bce96e6b324cddd89d4e047d013a80e603a52df585b2710b21617553.mp4\", \"type\": \"oss\"}', NULL, '9359a2f02f3671f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/9f3008094c28aaf0f723cd8b3e9f74cfa49a9ea6c83f08215a5a6ce4a247ecde.jpg\", \"type\": \"oss\"}', 575, 0, '美食', '啊，原来是这样！！', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (24, '2025-05-12 21:44:26.541', '2025-05-12 21:44:26.541', '2026-03-28 18:21:15.000', 2, '黑神话顶级影帝-猪八戒', NULL, NULL, '{\"src\": \"videoContribution/5f8e4be7fde0fadce4bcdb4bd5f0a3c30eefe6490290f36bc901d9c1fd6caf43.mp4\", \"type\": \"oss\"}', NULL, '11cb2c802f3771f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/eaddc10ba0c38873ee5dddd8e3268f7d8c8de370cd1426ba7a16366deada4b10.jpg\", \"type\": \"oss\"}', 519, 0, '影视', '根据黑神话细节聊聊八戒并推测一波DLC！\n这个系列非常难做，求个三连转发呀！', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (25, '2025-05-12 21:45:26.312', '2025-05-12 21:45:26.312', '2026-03-28 18:21:15.000', 2, '《非洲大乱炖》', NULL, NULL, '{\"src\": \"videoContribution/349065e1ae6011faed6f18bc613c57f4e4557dedcf373b0e24161196f9b5354f.mp4\", \"type\": \"oss\"}', NULL, '4d0e39902f3771f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/e405eb9cfb15796dcb226e1597e947ce5cb82587eabc9e976e6edf33cbd12629.jpg\", \"type\": \"oss\"}', 864, 0, '纪录片', '非洲大乱炖', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (26, '2025-05-12 21:47:14.002', '2025-05-12 21:47:14.002', '2026-03-28 18:21:15.000', 2, '教皇：没有一兵一卒的“皇帝”，却控制全球13亿人，干预世界', NULL, NULL, '{\"src\": \"videoContribution/6349c00f9d08a0be135f30c553a48c6d619a5ceb8f9214ea8acad1604d6d7745.mp4\", \"type\": \"oss\"}', NULL, '87fbac902f3771f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/81ef4e44dfaf273dfc84063a30a8571f4a27fbfbd9d4e2a80a630ad18af611a0.jpg\", \"type\": \"oss\"}', 486, 0, '纪录片', '教皇去世，圣座换人，吸引了全世界的关注。这个宝座到底有什么样权力？历史上的教皇又利用权力做了些什么呢？', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (27, '2025-05-12 21:49:39.772', '2025-05-12 21:49:39.772', '2026-03-28 18:21:15.000', 2, '第八季要炸啦——瑞城回归，新瑞城将大战邪恶莫蒂！（瑞克和莫蒂第八季·预告片解析）#315', NULL, NULL, '{\"src\": \"videoContribution/be2e22010ae234c7f834845ad0ff4a49a0a79cd54173378960a0ebad97511b27.mp4\", \"type\": \"oss\"}', NULL, 'e020ad302f3771f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/aefec094a5294726735264e8f0278939c99dce27945988791d15ff64f07ee0c4.jpg\", \"type\": \"oss\"}', 521, 0, '动漫', '把话说满：第八季邪恶莫蒂会被提及，但不会登场！第九季邪恶莫蒂回归，和新瑞成上演大决战！！！\n——百分百预测准确率！', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (28, '2025-05-12 21:52:09.625', '2025-05-12 21:52:09.625', '2026-03-28 18:21:15.000', 2, '白酒为何偏爱53° 一度之差 口感竟截然不同？【四象Vol.184】', NULL, NULL, '{\"src\": \"videoContribution/e6e6e1a58c7062f2c7e25cc7eb7a74a72971c4aa06472948ff44d8479fb4b46d.mp4\", \"type\": \"oss\"}', NULL, '3ebdde302f3871f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/1c26e07497f2f63df37f7959c58d2f1ed4a8350f8324a0ba3b1fb9515e086e4c.jpg\", \"type\": \"oss\"}', 387, 0, '', 'ლ(´ڡ`ლ) 白酒的度数各有不同，但一些名酒偏爱53°\n53°背后究竟是经验之谈，还是科学选择？\n', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (29, '2025-05-12 21:54:45.080', '2025-05-12 21:54:45.080', '2026-03-28 18:21:15.000', 2, '印度断水！除了巴基斯坦，还有哪些国家也被“水权”卡脖子？', NULL, NULL, '{\"src\": \"videoContribution/39cd80719f676a8afce5dc342712d0a85e32d879e6d90736aa074e76a903e524.mp4\", \"type\": \"oss\"}', NULL, '9aefdb902f3871f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/1d7b6348e4df1023986f4d0b47bf162f1c78924dffff5573803087df147fc89d.jpg\", \"type\": \"oss\"}', 348, 0, '', '印度断水！除了巴基斯坦，还有哪些国家也被“水权”卡脖子？', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (30, '2025-05-12 21:59:46.977', '2025-05-12 21:59:46.977', '2026-03-28 18:21:15.000', 2, '大暴雨扩大：龙卷风冰雹袭击南方北方，暴雨移向两广福建京津冀', NULL, NULL, '{\"src\": \"videoContribution/76cbeccaf8b3c13f07584a026491fb51936ddc404287aee05257d3ce89867bbf.mp4\", \"type\": \"oss\"}', NULL, '3b5ac0902f3971f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/10230c7c0de593da7db3dbb1f6ec29ccd4b5d79099b8a7c6e0c777a6436efd1f.jpg\", \"type\": \"oss\"}', 209, 0, '', '5月8日凌晨起，我国的天气格局是一涡一高三风暴，出现了龙卷冰雹雨大爆的情况。一涡指的是正在南下的西北冷涡，一高是正在加强的副热带高压。在两者之间，我国出现了5月以来范围最大、最为剧烈的冷暖交汇，长江中下游形成了强大的江淮气旋，东北出现了东北气旋，而华北气旋也在形成之中。', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (31, '2025-05-12 22:01:15.475', '2025-05-12 22:01:15.475', '2026-03-28 18:21:15.000', 2, '粉丝驱车250公里找我见面，UP主请他疯狂炫牛肉喝奶茶！', NULL, NULL, '{\"src\": \"videoContribution/6cf138a391aa19d36acd9b12017cd767fd007e0eb449ab277b6639e1629065a6.mp4\", \"type\": \"oss\"}', NULL, '886a89102f3971f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/9f7c39d3ce013612e4a51e4908c663d3d9d18ddbcd07d03e4de859284a3d5a36.jpg\", \"type\": \"oss\"}', 382, 0, '', '加油，懒狗！', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (32, '2025-05-12 22:03:31.234', '2025-05-12 22:03:31.234', '2026-03-28 18:21:15.000', 2, '1934年希特勒演讲真实影像，现场几十万人，让人不寒而栗', NULL, NULL, '{\"src\": \"videoContribution/0b695adc3522b017e09aba9a1e2ee5b00e31c01f76346752ac5c4f8c525ebac1.mp4\", \"type\": \"oss\"}', NULL, 'd93892102f3971f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/4c17c6d733dbe3c118124348d178c6231ed90a36d66b0b76ceed03fc3927048a.jpg\", \"type\": \"oss\"}', 72, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (33, '2025-05-12 22:05:24.826', '2025-05-12 22:05:24.826', '2026-03-28 18:21:15.000', 2, '虎先锋洗澡！', NULL, NULL, '{\"src\": \"videoContribution/5b51da2145694b1a9ff05a7c574e4ea0ebbc883a2c63a2f5c631a46ef2a5a766.mp4\", \"type\": \"oss\"}', NULL, '21cff1d02f3a71f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/ed6341f80077ba901136d1b39a73a0d2dd66c3f90a8fff07c3f67a2b9a6cd68d.jpg\", \"type\": \"oss\"}', 343, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (34, '2025-05-12 22:07:04.411', '2025-05-12 22:07:04.411', '2026-03-28 18:21:15.000', 2, '香油店开业一周年啦！当初的选择没有错，第一次吃湘菜，辣过瘾啦', NULL, NULL, '{\"src\": \"videoContribution/700bec03a175861c2c755cdb836d5d0106f9f15d8d0fcbf0c42271a95af49d1c.mp4\", \"type\": \"oss\"}', NULL, '5432f6402f3a71f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/5ab0be83c3835fb7728226f50cdeb1123b597d8ec2d22cba730605341bbe939d.jpg\", \"type\": \"oss\"}', 277, 0, '', '香油店开业一周年啦！当初的选择没有错，第一次吃湘菜，辣过瘾啦', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (35, '2025-05-12 22:08:36.436', '2025-05-12 22:08:36.436', '2026-03-28 18:21:15.000', 2, '40分钟吃24个大饺子即可免单，成功吃完还能再续加，能吃饱吗？', NULL, NULL, '{\"src\": \"videoContribution/001401cefd73fbf85a892b05fb0106deec4705622835c02b15887f75d8a842f0.mp4\", \"type\": \"oss\"}', NULL, '9067b6502f3a71f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/55295c6d6b7fc85957c5cb95f1d793adac3bb8c51e463d5ca1ce4dcfabe07756.jpg\", \"type\": \"oss\"}', 589, 0, '', '本期视频由神气小鹿深睡枕赞助播出。', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (36, '2025-05-12 22:10:24.183', '2026-03-28 15:31:34.799', '2026-03-28 18:21:15.000', 2, '算个账双人餐比单人餐实惠，39元泡馍小炒加凉菜拼盘，8块钱给娃买个肉少的牛肉面', NULL, NULL, '{\"src\": \"videoContribution/edc0f3b87263248ae10ab1a16acd789e3375c6f2db42909f2837f4551cd1421e.mp4\", \"type\": \"oss\"}', NULL, 'c6facfe02f3a71f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/fa96350435d3dd53ab0a28a94bdc2414f829d51842281e9f92700a373e74c629.jpg\", \"type\": \"oss\"}', 247, 0, '美食', '-', 2, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (37, '2025-05-12 22:11:24.540', '2025-05-12 22:11:24.540', '2026-03-28 18:21:15.000', 2, '【金将军】的爱情这么夸张？', NULL, NULL, '{\"src\": \"videoContribution/3bc4611305157d3b90b8d75e342d30c547b919d3c8083e39980904d01e2a9329.mp4\", \"type\": \"oss\"}', NULL, 'f76b7a302f3a71f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/c9e69115d77b6948c2ad06b05dbaa0f84c9586900f8311cb33333ba0949cbe74.jpg\", \"type\": \"oss\"}', 690, 0, '', '我叫金日成！\n俺们家正宗老平壤啊~\n闺女你也是朝鲜的啊？太好咧！！！', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (38, '2025-05-12 22:13:40.565', '2025-05-12 22:13:40.565', '2026-03-28 18:21:15.000', 2, '历时69天，带大家体验了生物肥的厉害，顺便还能收几个小西瓜！', NULL, NULL, '{\"src\": \"videoContribution/2545447a0533f7c64b48a81592dbadbdc3ce5af0a03ecb558522951cd22f95dc.mp4\", \"type\": \"oss\"}', NULL, '4ae78c302f3b71f09acaf6e6c6486302', '{\"src\": \"Cover/videoCover/a89d07acc303e5d24cb6d6c04047787c54b4278524a3277ebbf19c70a4c96618.jpg\", \"type\": \"oss\"}', 489, 0, '', '埋鱼种西瓜体验生物肥的厉害', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (39, '2025-05-12 22:15:44.544', '2026-03-28 15:31:05.602', '2026-03-28 18:21:15.000', 2, '让美国妹妹见识下中国高端素食！', NULL, NULL, '{\"src\": \"videoContribution/3ba1e8ebd3ca177ddf8308260be52530ec6cdf9ab8b6d0f776ba0521c637b23f.mp4\", \"type\": \"oss\"}', NULL, '75642a402f3b71f0b018e6f6c74b6302', '{\"src\": \"Cover/videoCover/819793ce7fabe2d000232fb772d8d4fde920f2519a45a1967cc248d9ffdba208.jpg\", \"type\": \"oss\"}', 992, 0, '', '-', 3, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (40, '2026-03-28 18:05:46.774', '2026-03-28 18:05:56.125', NULL, 2, '1934年希特勒演讲真实影像，现场几十万人，让人不寒而栗', NULL, NULL, '{\"src\": \"videoContribution/0b695adc3522b017e09aba9a1e2ee5b00e31c01f76346752ac5c4f8c525ebac1.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/4c17c6d733dbe3c118124348d178c6231ed90a36d66b0b76ceed03fc3927048a.jpg\", \"type\": \"oss\"}', 72, 0, '', '-', 2, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (41, '2026-03-28 18:24:52.908', '2026-03-28 18:24:52.908', NULL, 2, '【老鼠人行动】航天基地（绝密）???w→721w', NULL, NULL, '{\"src\": \"videoContribution/b4bb1866063b95a6490a27e742e74fa09d46ee3a4dd8bd59e02bc55d14305836.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/532133e49e165f3251dd758cd822ca74640e50efa3d83ee708b46756a1ce25fd.jpg\", \"type\": \"oss\"}', 335, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (42, '2026-03-28 18:26:26.266', '2026-03-28 19:32:57.566', NULL, 2, '巴拔之交~巴也连麦御姐（拔里神玉）', NULL, NULL, '{\"src\": \"videoContribution/fc614d3ca7b14e0f23ca8acf166b946376fe9c28eaa0e8b4b2d95172c36c887d.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/3320a767a12b96f175bbfced082285e99e573dea10f9ee062cd787620f0a05d3.jpg\", \"type\": \"oss\"}', 182, 0, '', '-', 2, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (43, '2026-03-28 18:27:00.447', '2026-03-28 18:27:00.447', NULL, 2, '小伯恩山第一次拴绳，开启蹦迪模式，死活不肯走！', NULL, NULL, '{\"src\": \"videoContribution/9f024f759eb7a3107967409a34157ee577cc0b1cb52e2a594ac01784fb146839.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/66a572044625774478ffbb27cd2e70aa3e6e07cf516c74a1d22cb2c938c406d0.jpg\", \"type\": \"oss\"}', 435, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (44, '2026-03-28 18:27:34.416', '2026-03-28 18:27:34.416', NULL, 2, '为什么你吃的羊肉串里可能没有羊肉？【食录】', NULL, NULL, '{\"src\": \"videoContribution/d7748c82bce96e6b324cddd89d4e047d013a80e603a52df585b2710b21617553.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/28f4460d3d5b1df04691750853b3f4a76453681397d9218df8f07c382cb41ea6.jpg\", \"type\": \"oss\"}', 575, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (45, '2026-03-28 18:28:46.395', '2026-03-28 18:28:46.395', NULL, 2, '黑神话顶级影帝-猪八戒', NULL, NULL, '{\"src\": \"videoContribution/5f8e4be7fde0fadce4bcdb4bd5f0a3c30eefe6490290f36bc901d9c1fd6caf43.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/8c7b010ea84f64637c9dbdc958a399e6d57963d1cf59d626ef6bac4c84a11efe.jpg\", \"type\": \"oss\"}', 519, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (46, '2026-03-28 18:30:05.713', '2026-03-28 18:30:05.713', NULL, 2, '《非洲大乱炖》', NULL, NULL, '{\"src\": \"videoContribution/349065e1ae6011faed6f18bc613c57f4e4557dedcf373b0e24161196f9b5354f.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/45142d014bbbd2dad3e78b8ef1c45967f4d7440fcef2ea5e30922fb57baa9885.jpg\", \"type\": \"oss\"}', 864, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (47, '2026-03-28 18:30:38.938', '2026-03-28 18:30:38.938', NULL, 2, '教皇：没有一兵一卒的“皇帝”，却控制全球13亿人，干预世界', NULL, NULL, '{\"src\": \"videoContribution/6349c00f9d08a0be135f30c553a48c6d619a5ceb8f9214ea8acad1604d6d7745.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/81ef4e44dfaf273dfc84063a30a8571f4a27fbfbd9d4e2a80a630ad18af611a0.jpg\", \"type\": \"oss\"}', 486, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (48, '2026-03-28 18:31:17.889', '2026-03-28 18:31:17.889', NULL, 2, '第八季要炸啦——瑞城回归，新瑞城将大战邪恶莫蒂！（瑞克和莫蒂第八季·预告片解析）#315', NULL, NULL, '{\"src\": \"videoContribution/be2e22010ae234c7f834845ad0ff4a49a0a79cd54173378960a0ebad97511b27.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/adc5e5491263c685cc739a96cac7805d663db4f1f606c67efc213df3030a7ddb.jpg\", \"type\": \"oss\"}', 521, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (49, '2026-03-28 18:31:50.108', '2026-03-28 18:31:50.108', NULL, 2, '白酒为何偏爱53° 一度之差 口感竟截然不同？【四象Vol.184】', NULL, NULL, '{\"src\": \"videoContribution/e6e6e1a58c7062f2c7e25cc7eb7a74a72971c4aa06472948ff44d8479fb4b46d.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/3bff791546bb3581cad297e0b75132c27eddfdf4ebeffb031935cb1aadb0c573.jpg\", \"type\": \"oss\"}', 387, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (50, '2026-03-28 18:32:31.090', '2026-03-28 18:32:31.090', NULL, 2, '印度断水！除了巴基斯坦，还有哪些国家也被“水权”卡脖子？', NULL, NULL, '{\"src\": \"videoContribution/39cd80719f676a8afce5dc342712d0a85e32d879e6d90736aa074e76a903e524.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/7942b4007a532877cc96668b767fce756846f94338cfe1f97c9bc2a0db4b14c8.jpg\", \"type\": \"oss\"}', 348, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (51, '2026-03-28 18:33:01.687', '2026-03-28 18:33:01.687', NULL, 2, '大暴雨扩大：龙卷风冰雹袭击南方北方，暴雨移向两广福建京津冀', NULL, NULL, '{\"src\": \"videoContribution/76cbeccaf8b3c13f07584a026491fb51936ddc404287aee05257d3ce89867bbf.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/3c0a982086c750895e9f5fbfcd12ca987b45c4d94198220bfacb0dfae0f63386.jpg\", \"type\": \"oss\"}', 209, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (52, '2026-03-28 18:33:28.200', '2026-03-28 18:33:28.200', NULL, 2, '粉丝驱车250公里找我见面，UP主请他疯狂炫牛肉喝奶茶！', NULL, NULL, '{\"src\": \"videoContribution/6cf138a391aa19d36acd9b12017cd767fd007e0eb449ab277b6639e1629065a6.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/871210e487c9582b9af6942fb488c84469a855d634533c209ba01f5dced83a9f.jpg\", \"type\": \"oss\"}', 382, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (53, '2026-03-28 18:34:06.261', '2026-03-28 18:34:06.261', NULL, 2, '虎先锋洗澡！', NULL, NULL, '{\"src\": \"videoContribution/5b51da2145694b1a9ff05a7c574e4ea0ebbc883a2c63a2f5c631a46ef2a5a766.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/ed6341f80077ba901136d1b39a73a0d2dd66c3f90a8fff07c3f67a2b9a6cd68d.jpg\", \"type\": \"oss\"}', 343, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (54, '2026-03-28 18:34:47.201', '2026-03-28 18:34:47.201', NULL, 2, '香油店开业一周年啦！当初的选择没有错，第一次吃湘菜，辣过瘾啦', NULL, NULL, '{\"src\": \"videoContribution/700bec03a175861c2c755cdb836d5d0106f9f15d8d0fcbf0c42271a95af49d1c.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/a78395e22bf286e56185978d8d02fc7ad3276bf887919f639486937b4af6f953.jpg\", \"type\": \"oss\"}', 277, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (55, '2026-03-28 18:35:31.197', '2026-03-28 18:35:31.197', NULL, 2, '40分钟吃24个大饺子即可免单，成功吃完还能再续加，能吃饱吗？', NULL, NULL, '{\"src\": \"videoContribution/001401cefd73fbf85a892b05fb0106deec4705622835c02b15887f75d8a842f0.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/d8962e13e8e2ad117a7942d9c849e431fb8b0dfbcc0b22ea5054b0eaf000d9d5.jpg\", \"type\": \"oss\"}', 589, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (56, '2026-03-28 18:36:00.565', '2026-03-28 18:36:00.565', NULL, 2, '算个账双人餐比单人餐实惠，39元泡馍小炒加凉菜拼盘，8块钱给娃买个肉少的牛肉面', NULL, NULL, '{\"src\": \"videoContribution/edc0f3b87263248ae10ab1a16acd789e3375c6f2db42909f2837f4551cd1421e.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/7e8fea8875df876bf59880f101b93bd4789633439c1e1bd88d2683122d66d174.jpg\", \"type\": \"oss\"}', 247, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (57, '2026-03-28 18:36:28.559', '2026-03-28 18:36:28.559', NULL, 2, '【金将军】的爱情这么夸张？', NULL, NULL, '{\"src\": \"videoContribution/3bc4611305157d3b90b8d75e342d30c547b919d3c8083e39980904d01e2a9329.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/42e0296b625b72350537e35e53cab1a7d6fd5adccc9a11e2e83e020fd3e4f03d.jpg\", \"type\": \"oss\"}', 690, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (58, '2026-03-28 18:37:05.342', '2026-03-28 18:37:05.342', NULL, 2, '历时69天，带大家体验了生物肥的厉害，顺便还能收几个小西瓜！', NULL, NULL, '{\"src\": \"videoContribution/2545447a0533f7c64b48a81592dbadbdc3ce5af0a03ecb558522951cd22f95dc.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/33c5240ac2b3ccd8fc22588afdfd206ae59764ee9ac9b1310812d340e54b0cbe.jpg\", \"type\": \"oss\"}', 489, 0, '', '-', 0, 1);
INSERT INTO `lv_video_contribution` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `title`, `video`, `video_720p`, `video_480p`, `video_360p`, `media_id`, `cover`, `video_duration`, `reprinted`, `label`, `introduce`, `heat`, `is_visible`) VALUES (59, '2026-03-28 18:38:03.093', '2026-03-28 18:38:05.193', NULL, 2, '让美国妹妹见识下中国高端素食！', NULL, NULL, '{\"src\": \"videoContribution/3ba1e8ebd3ca177ddf8308260be52530ec6cdf9ab8b6d0f776ba0521c637b23f.mp4\", \"type\": \"oss\"}', NULL, '', '{\"src\": \"Cover/videoCover/f492eadf301e2387a8de535245f2e01d76d298629a2adfc87ccdef61bcba5093.jpg\", \"type\": \"oss\"}', 992, 0, '', '-', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for lv_video_contribution_barrage
-- ----------------------------
DROP TABLE IF EXISTS `lv_video_contribution_barrage`;
CREATE TABLE `lv_video_contribution_barrage` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  `time` double DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` bigint unsigned DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `color` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_video_contribution_barrage_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_video_contribution_barrage_user_info` (`uid`) USING BTREE,
  KEY `fk_lv_video_contribution_barrage` (`video_id`) USING BTREE,
  CONSTRAINT `fk_lv_video_contribution_barrage` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_video_contribution_barrage_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_video_contribution_barrage_video_info` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_video_contribution_barrage
-- ----------------------------
BEGIN;
INSERT INTO `lv_video_contribution_barrage` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `time`, `author`, `type`, `text`, `color`) VALUES (4, '2025-05-12 21:27:26.820', '2025-05-12 21:27:26.820', NULL, 2, 21, 3.607441, 'test1', 0, '你好', 16777215);
INSERT INTO `lv_video_contribution_barrage` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `time`, `author`, `type`, `text`, `color`) VALUES (5, '2025-05-12 21:27:33.417', '2025-05-12 21:27:33.417', NULL, 2, 21, 9.838717, 'test1', 0, '哈哈', 16777215);
INSERT INTO `lv_video_contribution_barrage` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `time`, `author`, `type`, `text`, `color`) VALUES (6, '2025-05-14 15:24:41.102', '2025-05-14 15:24:41.102', NULL, 3, 20, 8.752089, 'test2', 0, '你好我的朋友~~', 16777215);
COMMIT;

-- ----------------------------
-- Table structure for lv_video_contribution_comments
-- ----------------------------
DROP TABLE IF EXISTS `lv_video_contribution_comments`;
CREATE TABLE `lv_video_contribution_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `comment_id` bigint unsigned DEFAULT NULL,
  `comment_user_id` bigint unsigned DEFAULT NULL,
  `comment_first_id` bigint unsigned DEFAULT NULL,
  `heat` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_video_contribution_comments_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_video_contribution_comments` (`video_id`) USING BTREE,
  KEY `fk_lv_video_contribution_comments_user_info` (`uid`) USING BTREE,
  CONSTRAINT `fk_lv_video_contribution_comments` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_video_contribution_comments_user_info` FOREIGN KEY (`uid`) REFERENCES `lv_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lv_video_contribution_comments_video_info` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_video_contribution_comments
-- ----------------------------
BEGIN;
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (4, '2025-05-12 17:06:58.317', '2025-05-12 17:06:58.317', NULL, 2, 1, '你好', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (5, '2025-05-12 21:27:43.266', '2025-05-12 21:27:43.266', NULL, 2, 21, '你好\n', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (6, '2025-05-14 14:41:46.568', '2025-05-14 14:41:46.568', NULL, 2, 20, '曼波~', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (7, '2025-05-14 14:43:05.578', '2025-05-14 14:43:05.578', NULL, 2, 20, '7878', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (8, '2025-05-14 15:18:19.653', '2025-05-14 15:18:19.653', NULL, 2, 20, '食人鼠！', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (9, '2025-05-14 15:21:18.709', '2025-05-14 15:21:18.709', NULL, 2, 20, '鼠鼠，我的鼠鼠', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (10, '2025-05-14 15:21:27.900', '2025-05-14 15:21:27.900', NULL, 2, 20, '哈哈哈哈', 9, 2, 9, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (11, '2025-05-14 15:21:37.556', '2025-05-14 15:21:37.556', NULL, 2, 20, 'QAQ', 0, 0, 0, 0);
INSERT INTO `lv_video_contribution_comments` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`, `context`, `comment_id`, `comment_user_id`, `comment_first_id`, `heat`) VALUES (12, '2025-05-14 15:24:08.467', '2025-05-14 15:24:08.467', NULL, 3, 20, '好可怕的食人鼠', 8, 2, 8, 0);
COMMIT;

-- ----------------------------
-- Table structure for lv_video_contribution_like
-- ----------------------------
DROP TABLE IF EXISTS `lv_video_contribution_like`;
CREATE TABLE `lv_video_contribution_like` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lv_video_contribution_like_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_lv_video_contribution_likes` (`video_id`) USING BTREE,
  CONSTRAINT `fk_lv_video_contribution_likes` FOREIGN KEY (`video_id`) REFERENCES `lv_video_contribution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_video_contribution_like
-- ----------------------------
BEGIN;
INSERT INTO `lv_video_contribution_like` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`) VALUES (1, '2025-04-22 16:11:53.726', '2025-04-22 16:11:53.726', '2025-04-22 16:14:54.103', 2, 1);
INSERT INTO `lv_video_contribution_like` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`) VALUES (2, '2025-05-14 08:52:58.269', '2025-05-14 08:52:58.269', NULL, 2, 20);
INSERT INTO `lv_video_contribution_like` (`id`, `created_at`, `updated_at`, `deleted_at`, `uid`, `video_id`) VALUES (3, '2025-05-14 15:23:43.296', '2025-05-14 15:23:43.296', NULL, 3, 20);
COMMIT;

-- ----------------------------
-- Table structure for lv_watch_record
-- ----------------------------
DROP TABLE IF EXISTS `lv_watch_record`;
CREATE TABLE `lv_watch_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `video_id` bigint unsigned DEFAULT NULL,
  `watch_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `delete_status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lv_watch_record
-- ----------------------------
BEGIN;
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (1, 2, 1, '6', '2025-04-22 16:19:14', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (2, 2, 20, '0', '2025-05-12 19:54:07', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (3, 2, 21, '23.211354', '2025-05-12 21:27:18', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (4, 2, 39, '0', '2025-05-12 22:15:47', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (5, 3, 20, '27.842512', '2025-05-14 15:23:36', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (6, 2, 36, '0', '2026-03-28 15:31:35', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (7, 2, 40, '33.149277', '2026-03-28 18:05:57', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (8, 2, 59, '301.491725', '2026-03-28 18:38:06', 0);
INSERT INTO `lv_watch_record` (`id`, `uid`, `video_id`, `watch_time`, `create_time`, `delete_status`) VALUES (9, 4, 42, '0.192953', '2026-03-28 19:32:58', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

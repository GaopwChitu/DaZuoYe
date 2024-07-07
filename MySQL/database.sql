/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : database

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 07/07/2024 17:22:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`database` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `database`;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `active_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `active_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动开始时间',
  `duration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时长',
  `active_area` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `active_style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动形式',
  `create_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动创建人',
  `active_number` int NULL DEFAULT NULL COMMENT '活动人数',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES (1, '广场舞', '2022/04/23 18:30:00', '3', '小区广场', '一起跳舞', '管理员', 2, 0, 1, '2022-04-21 20:42:08', 1, '2022-05-13 09:58:56');
INSERT INTO `activities` VALUES (2, '麻将', '2022-04-23 05:00:00', '5', '小区大厅', '四人一组打麻将', '管理员', 2, 0, 1, '2022-04-22 22:34:12', NULL, NULL);
INSERT INTO `activities` VALUES (3, '象棋', '2022-04-25 01:00:00', '2.5', '小区二楼', '双人Pk争霸', '管理员', 2, 0, 1, '2022-04-22 22:38:35', 1, '2022-04-22 23:17:45');
INSERT INTO `activities` VALUES (4, '老年交谊舞', '2022-04-29 05:00:00', '2', '小区广场', '一男一女一起跳舞', '管理员', 1, 0, 1, '2022-04-22 23:02:51', NULL, NULL);
INSERT INTO `activities` VALUES (5, '掼蛋', '2022/04/27 08:00:00', '5', '小区大厅', '四人一桌，两人一队', '管理员', 1, 0, 1, '2022-04-27 15:08:06', 1, '2022-05-13 12:52:35');
INSERT INTO `activities` VALUES (6, '听书会', '2022-04-30 05:00:00', '2', '小区广场', '上台讲故事', '管理员', 1, 0, 1, '2022-04-29 14:21:57', NULL, NULL);
INSERT INTO `activities` VALUES (7, '围棋比赛', '2022-05-19 06:00:00', '3', '小区大厅二楼', '两人一组比赛，淘汰制。', '管理员', 1, 0, 1, '2022-05-13 09:42:04', 1, '2022-05-13 09:47:24');
INSERT INTO `activities` VALUES (8, '社区老年活动庆典', '2022/05/25 17:00:00', '2', '小区广场', '广场举行活动开幕式', '管理员', 1, 0, 1, '2022-05-13 09:52:31', NULL, NULL);
INSERT INTO `activities` VALUES (9, '老年广播操', '2022/05/24 09:00:00', '2', '小区广场', '集体跳操', '管理员', 1, 0, 1, '2022-05-13 09:58:25', 1, '2022-05-13 09:59:16');

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `appointNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '预约单号',
  `hospitalName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医院',
  `doctorId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生',
  `departmentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室',
  `appointTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '预约时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '门诊费',
  `del_flag` int NULL DEFAULT NULL COMMENT '是否删除0，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 'YY49768087', '苏州大学附属独墅湖医院', '4', '2', '2022/05/21 09:00:00', 12.00, 0, 1, '2022-05-13 13:24:47', 1, '2022-05-16 00:43:24');
INSERT INTO `appointment` VALUES (2, 'YY69419594', '苏州市立医院', '5', '1', '2022/05/19 09:00', 12.00, 0, 2, '2022-05-16 16:25:30', NULL, NULL);
INSERT INTO `appointment` VALUES (3, 'YY33427050', '九龙医院', '8', '6', '2022/05/26 06:30', 12.00, 0, 1, '2022-05-20 13:12:16', NULL, NULL);

-- ----------------------------
-- Table structure for assess
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `assess` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评价：1：极差，2：失望，3：一般，4：满意，5：惊喜',
  `createName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评估人',
  `createTime` datetime NULL DEFAULT NULL COMMENT '评估时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of assess
-- ----------------------------
INSERT INTO `assess` VALUES (1, '4', '徐医生', '2022-04-29 16:43:20');
INSERT INTO `assess` VALUES (2, '5', '超级管理员', '2022-04-29 16:46:01');
INSERT INTO `assess` VALUES (3, '5', '闵某', '2022-04-29 16:48:17');
INSERT INTO `assess` VALUES (4, '2', '叶某', '2022-04-29 16:57:44');
INSERT INTO `assess` VALUES (5, '3', '羽生', '2022-04-29 17:04:53');
INSERT INTO `assess` VALUES (6, '5', '徐某', '2022-04-29 17:34:27');
INSERT INTO `assess` VALUES (7, '1', '顾某', '2022-04-29 17:37:15');
INSERT INTO `assess` VALUES (8, '1', '风某', '2022-05-02 16:14:37');
INSERT INTO `assess` VALUES (9, '3', '华某', '2022-05-02 19:16:15');

-- ----------------------------
-- Table structure for body
-- ----------------------------
DROP TABLE IF EXISTS `body`;
CREATE TABLE `body`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `bloodSugar` float NULL DEFAULT NULL,
  `bloodPressure` float NULL DEFAULT NULL,
  `bloodLipid` float NULL DEFAULT NULL,
  `heart_rate` float NULL DEFAULT NULL,
  `vision` int NULL DEFAULT NULL,
  `sleep_duration` float NULL DEFAULT NULL,
  `sleep_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `smoking` tinyint(1) NULL DEFAULT NULL,
  `drinking` tinyint(1) NULL DEFAULT NULL,
  `exercise` tinyint(1) NULL DEFAULT NULL,
  `food_types` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `water_consumption` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of body
-- ----------------------------
INSERT INTO `body` VALUES (6, '不写每次还得重写', 18, '男', 1.8, 50, 25, 16, 25, 80, 220, 8, '好', 0, 0, 0, '蔬菜', 1500);
INSERT INTO `body` VALUES (13, 'Alice', 18, '男', 1.8, 50, 20, 24, 15, 65, 200, 8, '好', 0, 0, 0, '水果', 1500);
INSERT INTO `body` VALUES (31, 'test', 18, '男', 1.8, 50, 20, 20, 15, 80, 200, 7, '好', 0, 0, 0, '水果', 2000);

-- ----------------------------
-- Table structure for body_notes
-- ----------------------------
DROP TABLE IF EXISTS `body_notes`;
CREATE TABLE `body_notes`  (
  `notes_id` int NOT NULL AUTO_INCREMENT,
  `id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `bloodSugar` float NULL DEFAULT NULL,
  `bloodPressure` float NULL DEFAULT NULL,
  `bloodLipid` float NULL DEFAULT NULL,
  `heart_rate` float NULL DEFAULT NULL,
  `vision` int NULL DEFAULT NULL,
  `sleep_duration` float NULL DEFAULT NULL,
  `sleep_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `smoking` tinyint(1) NULL DEFAULT NULL,
  `drinking` tinyint(1) NULL DEFAULT NULL,
  `exercise` tinyint(1) NULL DEFAULT NULL,
  `food_types` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `water_consumption` float NULL DEFAULT NULL,
  `Date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notes_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of body_notes
-- ----------------------------
INSERT INTO `body_notes` VALUES (20, 13, 'Alice', 25, '男', 1.8, 80, 20, 20, 20, 100, 100, 9, '好', 0, 0, 0, '豆类', 3000, '2023-04-13 06:01:06');
INSERT INTO `body_notes` VALUES (21, 13, 'Alice', 25, '男', 1.8, 80, 20, 25, 23, 80, 120, 9, '好', 0, 0, 0, '豆类', 3000, '2023-04-13 06:01:52');
INSERT INTO `body_notes` VALUES (26, 6, '不写每次还得重写', 20, '男', 2, 56, 8, 13, 20, 120, 50, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-02 13:36:31');
INSERT INTO `body_notes` VALUES (27, 6, '不写每次还得重写', 20, '男', 1.7, 56, 15, 20, 20, 70, 65, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-04 13:36:32');
INSERT INTO `body_notes` VALUES (28, 6, '不写每次还得重写', 20, '男', 1.7, 56, 21, 8, 20, 80, 75, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-16 13:36:34');
INSERT INTO `body_notes` VALUES (29, 6, '不写每次还得重写', 20, '男', 1.7, 56, 15, 10, 20, 110, 80, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-20 13:36:38');
INSERT INTO `body_notes` VALUES (30, 6, '不写每次还得重写', 20, '男', 1.7, 56, 17, 16, 20, 75, 120, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-23 13:36:40');
INSERT INTO `body_notes` VALUES (31, 6, '不写每次还得重写', 20, '男', 1.7, 56, 8, 25, 20, 130, 150, 10, '好', 1, 1, 1, '鱼类', 1500, '2024-03-25 13:36:43');
INSERT INTO `body_notes` VALUES (32, 6, '不写每次还得重写', 20, '男', 1.7, 56, 11, 7, 20, 80, 150, 10, '好', 0, 0, 0, '鱼类', 1500, '2024-03-27 13:36:45');
INSERT INTO `body_notes` VALUES (34, 31, 'test', 18, '男', 1.8, 50, 20, 20, 15, 80, 50, 7, '好', 0, 0, 0, '水果', 2000, '2023-05-02 18:04:57');
INSERT INTO `body_notes` VALUES (35, 31, 'test', 18, '男', 1.8, 50, 20, 20, 15, 80, 100, 7, '好', 0, 0, 0, '水果', 2000, '2023-05-02 18:05:03');
INSERT INTO `body_notes` VALUES (36, 31, 'test', 18, '男', 1.8, 50, 20, 20, 15, 80, 150, 7, '好', 0, 0, 0, '水果', 2000, '2023-05-02 18:05:05');
INSERT INTO `body_notes` VALUES (37, 31, 'test', 18, '男', 1.8, 50, 20, 20, 15, 80, 200, 7, '好', 0, 0, 0, '水果', 2000, '2023-05-02 18:05:08');
INSERT INTO `body_notes` VALUES (38, 13, 'Alice', 25, '男', 1.8, 80, 26, 21, 23, 90, 140, 9, '好', 0, 0, 0, '豆类', 3000, '2023-04-13 06:01:52');
INSERT INTO `body_notes` VALUES (39, 13, 'Alice', 25, '男', 1.8, 80, 26, 16, 18, 79, 160, 9, '好', 0, 0, 0, '豆类', 3000, '2023-04-13 06:01:52');
INSERT INTO `body_notes` VALUES (40, 13, 'Alice', 18, '男', 1.8, 50, 20, 24, 15, 65, 200, 8, '好', 0, 0, 0, '水果', 1500, '2023-05-06 15:15:17');
INSERT INTO `body_notes` VALUES (41, 6, '不写每次还得重写', 18, '男', 1.8, 50, 25, 16, 25, 80, 220, 8, '好', 0, 0, 0, '蔬菜', 1500, '2024-03-29 15:23:27');

-- ----------------------------
-- Table structure for communities
-- ----------------------------
DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `community_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '社区名称',
  `community_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '社区编号',
  `community_place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区位置',
  `community_area` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区面积',
  `people_number` int NULL DEFAULT NULL COMMENT '社区人数',
  `state` tinyint NULL DEFAULT 0 COMMENT '状态，1：正常，0：失效',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of communities
-- ----------------------------
INSERT INTO `communities` VALUES (1, '社区A', '001', '苏州园区松涛街867号', '45000', 5000, 1, '0', '2022-03-26 11:08:49', '2022-05-18 11:39:57');
INSERT INTO `communities` VALUES (2, '社区B', '002', '苏州园区现代大道227号', '70000', 7000, 1, '0', '2022-03-26 11:10:00', '2024-07-07 12:49:23');
INSERT INTO `communities` VALUES (3, '社区C', '003', '苏州园区钟园路129号', '57000', 8500, 1, '0', '2022-03-01 11:13:52', '2022-05-18 11:40:09');
INSERT INTO `communities` VALUES (4, '社区D', '004', '苏州吴中区斜塘街道886号', '62000', 7800, 1, '0', '2022-03-26 11:16:17', '2022-05-18 12:54:57');
INSERT INTO `communities` VALUES (5, '社区E', '005', '苏州园区星湖街234号', '77000', 9800, 1, '0', '2022-03-26 11:17:16', '2022-05-19 11:25:58');
INSERT INTO `communities` VALUES (6, '社区F', '006', '苏州吴中区玲珑街1号', '850000', 7000, 1, '0', '2022-04-06 10:03:22', '2024-06-25 19:10:21');
INSERT INTO `communities` VALUES (7, 'qqq', '111', 'aaa', 'aaa', 22222, 0, '0', '2024-06-25 19:17:43', '2024-07-07 12:49:25');
INSERT INTO `communities` VALUES (8, '1111', '111', 'aaaaaa', '1234', 12344, 0, '1', '2024-06-25 19:19:20', '2024-06-25 19:32:48');
INSERT INTO `communities` VALUES (9, 'aaaa', 'aaaa', 'aaaaa', 'aaaaa', 1234, 0, '0', '2024-06-25 19:20:39', '2024-07-07 12:49:24');

-- ----------------------------
-- Table structure for community_restaurant
-- ----------------------------
DROP TABLE IF EXISTS `community_restaurant`;
CREATE TABLE `community_restaurant`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `communityCd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区编号',
  `restaurant` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '餐厅',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of community_restaurant
-- ----------------------------
INSERT INTO `community_restaurant` VALUES (7, '001', '嘉园餐厅', 0, 1, '2022-05-21 16:15:47', NULL, NULL);
INSERT INTO `community_restaurant` VALUES (8, '002', '乾元餐馆', 0, 1, '2022-05-21 16:16:49', NULL, NULL);
INSERT INTO `community_restaurant` VALUES (9, '001', '风味餐厅', 0, 1, '2022-05-21 16:17:07', NULL, NULL);
INSERT INTO `community_restaurant` VALUES (10, '001', 'adad', 0, 1, '2022-05-24 19:01:54', NULL, NULL);
INSERT INTO `community_restaurant` VALUES (11, '001', 'add', 0, 1, '2022-05-24 19:02:06', NULL, NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `departmentName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '神经内科');
INSERT INTO `department` VALUES (2, '消化内科');
INSERT INTO `department` VALUES (3, '呼吸内科');
INSERT INTO `department` VALUES (4, '内科');
INSERT INTO `department` VALUES (5, '神经外科');
INSERT INTO `department` VALUES (6, '妇科');
INSERT INTO `department` VALUES (7, '产科');
INSERT INTO `department` VALUES (8, '儿科');
INSERT INTO `department` VALUES (9, '皮肤科');
INSERT INTO `department` VALUES (10, '耳鼻喉科');
INSERT INTO `department` VALUES (11, '眼科');
INSERT INTO `department` VALUES (12, '口腔科');
INSERT INTO `department` VALUES (13, '急诊科');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sport_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `disease` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES (1, '体操', '心脏病', '适度运动，不要剧烈运动，保持心情愉快', '避免在气温过高或过低的环境下运动');
INSERT INTO `detail` VALUES (2, '太极拳', '高血压', '轻柔的动作，缓慢而稳定的呼吸', '保持心情平稳，不要过度紧张');
INSERT INTO `detail` VALUES (3, '快跑', '关节炎', '选择跑步道或软质地面进行，适当热身', '避免过度的冲击力，注意饮食，保持合理体重');
INSERT INTO `detail` VALUES (4, '慢跑', '哮喘', '避免在雾霾天气、气温过高或过低的环境下运动', '控制呼吸，使用合适的防护装备');
INSERT INTO `detail` VALUES (6, '抖空竹', '眼疾', '注意眼睛的休息和保护，不要盯着空竹太久', '避免在光线昏暗的环境下玩抖空竹');
INSERT INTO `detail` VALUES (7, '抽陀螺', '高血压', '避免剧烈运动，不要在悬崖陡坡等高度场所运动', '避免在气温过高或过低的环境下运动');
INSERT INTO `detail` VALUES (8, '拔河', '心脏病', '注意不要过度用力，保持呼吸稳定', '人数相对平衡，避免人数不足或过多');
INSERT INTO `detail` VALUES (9, '排球', '扭伤', '注意热身，保持肌肉灵活', '避免在硬地面和湿滑地面上运动，注意落地姿势');
INSERT INTO `detail` VALUES (10, '放风筝', '过敏性鼻炎', '避免在花粉高发季节和污染严重的地区放风筝', '选择空气清新的场地，不要在风力过大的环境下放风筝');
INSERT INTO `detail` VALUES (11, '橄榄球', '骨折', '选择合适的防护装备，不要使用过度生硬的球', '规范比赛流程，避免激烈对抗');
INSERT INTO `detail` VALUES (12, '游泳', '心脏病、心律失常、哮喘、高血压', '游泳是一项全身性运动，但对于患有心脏病、心律失常、哮喘等疾病的人来说，游泳容易加重病情，甚至引发突发病情，因此应该避免。而患有高血压的人可以适当游泳，但是游泳时间和强度不宜过大。', '游泳时一定要注意安全，避免溺水事故的发生；同时注意保持游泳池的清洁卫生，避免感染泳池病毒。');
INSERT INTO `detail` VALUES (13, '滑冰', '骨折、关节炎、心脏病、高血压', '滑冰是一项高风险运动，容易导致骨折、关节炎等损伤，对于患有心脏病、高血压等疾病的人来说，也需要注意保护自己，避免剧烈运动。', '滑冰时要穿好防护装备，注意自己的身体状况，避免过度运动造成身体损伤。');
INSERT INTO `detail` VALUES (14, '爬山', '高血压、心脏病、脑血管疾病', '选择较平缓的山路，避免过于陡峭的路段；掌握正确的呼吸方法，避免缺氧；', '切勿贪多嚼不烂，随时可以补充水分和能量；注意天气变化，避免在大雾、大风、雷雨天气攀登；');
INSERT INTO `detail` VALUES (15, '瑜伽', '脊椎病、膝盖受伤、关节病变', '选择适合自己身体情况的瑜伽动作；呼吸要自然流畅，不要憋气或过度呼吸；动作要准确，避免造成不必要的压力或伤害；', '练习前应注意饮食、排便，不宜在空腹或饱腹时练习；练习时注意周围环境，保持安静的氛围；练习后应适当休息，以便身体恢复；');
INSERT INTO `detail` VALUES (16, '篮球', '心脏病、脑血管疾病、骨折', '保持适度的身体活动，不要过度用力；掌握正确的篮球技巧，避免不必要的伤害；在比赛中要遵守规则，注意安全；', '合理安排练球时间和强度，不要过度训练；练球时应注意防护措施，如佩戴护具等；注意饮食，保证充足的营养摄入；');
INSERT INTO `detail` VALUES (17, '网球', '肩部受伤、腕关节疼痛、脱臼', '掌握正确的发球姿势和击球技巧；加强肌肉的训练，提高关节的灵活性；注意休息，避免过度疲劳；', '选择合适的球拍和鞋子，避免不必要的伤害；保持场地干燥，防止滑倒；定期进行身体检查，及时发现问题；');
INSERT INTO `detail` VALUES (18, '羽毛球', '肌肉劳损', '逐渐增加训练量，充足的热身与休息，避免过度用力', '注意营养、充足的睡眠，避免疲劳、缺氧');
INSERT INTO `detail` VALUES (19, '越野跑', '膝盖疼痛', '选择软质路面，加强膝关节周围肌肉的锻炼', '注意营养、饮食的平衡，避免过度减重、缺氧');
INSERT INTO `detail` VALUES (20, '足球', '膝盖疼痛', '选择软质路面，加强膝关节周围肌肉的锻炼', '注意营养、饮食的平衡，避免过度减重、缺氧');
INSERT INTO `detail` VALUES (21, '跆拳道', '扭伤、拉伤', '逐渐增加训练量，充足的热身与休息，避免过度用力', '注意营养、充足的睡眠，避免疲劳、缺氧');
INSERT INTO `detail` VALUES (22, '跑步', '膝盖疼痛', '选择软质路面，加强膝关节周围肌肉的锻炼', '注意营养、饮食的平衡，避免过度减重、缺氧');
INSERT INTO `detail` VALUES (23, '跳板', '脊椎损伤', '注意技术细节，逐渐增加训练难度，避免过度用力', '可选择针对脊柱的力量训练，加强腰背肌群的锻炼');
INSERT INTO `detail` VALUES (24, '跳皮筋', '肌肉劳损', '逐渐增加训练量，充足的热身与休息，避免过度用力', '注意营养、充足的睡眠，避免疲劳、缺氧');
INSERT INTO `detail` VALUES (25, '跳绳', '膝盖或脚踝疼痛、肌肉酸痛、运动损伤', '手持跳绳，双脚交替跳跃，以规定时间内跳跃次数最多者获胜。', '需要注意跳绳时的姿势和呼吸。');
INSERT INTO `detail` VALUES (26, '跳高', '扭伤、肌肉拉伤、腰椎间盘突出、关节炎', '又称跳高栏，运动员在助跑后跳过竞赛高度悬挂的水平杠，以完成跳高动作，高度逐渐升高，未能过去的选手则被淘汰。', '需要注意跳高时的跑道、助跑和跳跃姿势。');
INSERT INTO `detail` VALUES (27, '踢毽子', '扭伤、拉伤', '将毽子踢起来并在空中进行一系列动作，规定时间内完成动作最多的人获胜。', '需要注意毽子的质量和天气情况。');
INSERT INTO `detail` VALUES (28, '长跑', '心脏病、高血压、哮喘、慢性阻塞性肺疾病', '一项有氧耐力运动，比赛时要跑过规定的路程，规定时间内到达终点的人获胜。', '需要注意长跑时的呼吸和水分补给。');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `doctor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生名称',
  `hospitalId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组织编号',
  `departmentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '徐医生', '3', '5');
INSERT INTO `doctor` VALUES (2, '沈医生', '1', '2');
INSERT INTO `doctor` VALUES (3, '秦医生', '2', '4');
INSERT INTO `doctor` VALUES (4, '王医生', '1', '2');
INSERT INTO `doctor` VALUES (5, '李医生', '3', '1');
INSERT INTO `doctor` VALUES (6, '夏医生', '3', '4');
INSERT INTO `doctor` VALUES (7, '陈医生', '3', '6');
INSERT INTO `doctor` VALUES (8, '赵医生', '2', '6');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pharmacy_id` int NULL DEFAULT NULL COMMENT '药店ID',
  `drugName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药名',
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `drugNumber` int NULL DEFAULT NULL COMMENT '药存量',
  `unit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药量单位',
  `price` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药价',
  `termOfValidity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `explain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '说明',
  `drugTypeId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药类',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES (1, 1, '999感冒灵颗粒', 'assets/imgs/999ganmao.jpg', 200, '10g*9袋/盒', '9.5', '24个月', '开水冲服，一次1袋，一日3次', '1', '0', 1, '2022-05-10 10:24:39', NULL, NULL);
INSERT INTO `drug` VALUES (2, 1, '云南白药气雾剂', 'assets/imgs/yunnan.jpg', 300, '145g', '78.2', '36个月', '外用。喷于伤患处', '2', '0', 1, '2022-05-10 10:28:07', NULL, NULL);
INSERT INTO `drug` VALUES (3, 1, '青原感冒灵胶囊', 'assets/imgs/999ganmao.jpg', 500, '0.5g*12粒*3板/盒', '21.5', '24个月', '口服，一次2粒，一日3次', '1', '0', 1, '2022-05-10 14:14:45', NULL, NULL);
INSERT INTO `drug` VALUES (4, 1, '邦迪创口贴', 'assets/imgs/bangdi.jpg', 300, '70mm*22mm*10片/盒', '10.63', '36个月', '贴在伤口上', '2', '0', 1, '2022-05-10 23:24:24', NULL, NULL);
INSERT INTO `drug` VALUES (5, 1, '三九胃泰温胃舒颗粒', 'assets/imgs/39weitai.jpg', 200, '10g*10袋/盒', '32', '36个月', '开水冲服，一次1-2袋，一日2次', '4', '0', 1, '2022-05-10 23:34:33', NULL, NULL);
INSERT INTO `drug` VALUES (6, 2, '三九胃泰温胃舒颗粒', 'assets/imgs/39weitai.jpg', 140, '10g*10袋/盒', '31', '36个月', '开水冲服，一次1-2袋，一日2次', '4', '0', 1, '2022-05-10 23:38:59', NULL, NULL);
INSERT INTO `drug` VALUES (7, 2, '云南白药气雾剂', 'assets/imgs/yunnan.jpg', 70, '145g', '79', '36个月', '外用。喷于伤患处', '2', '0', 1, '2022-05-10 23:41:29', NULL, NULL);

-- ----------------------------
-- Table structure for drug_type
-- ----------------------------
DROP TABLE IF EXISTS `drug_type`;
CREATE TABLE `drug_type`  (
  `id` int NOT NULL COMMENT '主键ID',
  `drugType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药品类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drug_type
-- ----------------------------
INSERT INTO `drug_type` VALUES (1, '感冒药');
INSERT INTO `drug_type` VALUES (2, '外用药');
INSERT INTO `drug_type` VALUES (3, '皮肤病用药');
INSERT INTO `drug_type` VALUES (4, '消化系统');
INSERT INTO `drug_type` VALUES (5, '儿童用药');
INSERT INTO `drug_type` VALUES (6, '维生素');
INSERT INTO `drug_type` VALUES (7, '风湿骨痛用药');
INSERT INTO `drug_type` VALUES (8, '慢性病用药');
INSERT INTO `drug_type` VALUES (9, '其他');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `communityCd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区编号',
  `restaurant` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '餐厅名称',
  `foodName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜名',
  `foodImgUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `foodPrice` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '菜价',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (5, '001', '嘉园餐厅', '宫保鸡丁', 'assets/imgs/gongbaojiding.jpg', 00000017.00, 0, 1, '2022-05-21 17:48:37', NULL, NULL);
INSERT INTO `food` VALUES (6, '001', '嘉园餐厅', '番茄炒鸡蛋', 'assets/imgs/fanqiechaojidan.jpg', 00000012.00, 0, 1, '2022-05-21 19:59:11', NULL, NULL);
INSERT INTO `food` VALUES (7, '002', '乾元餐馆', '宫保鸡丁', 'assets/imgs/gongbaojiding.jpg', 00000017.00, 0, 1, '2022-05-21 22:40:14', NULL, NULL);

-- ----------------------------
-- Table structure for food_order
-- ----------------------------
DROP TABLE IF EXISTS `food_order`;
CREATE TABLE `food_order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `foodOrderNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `contactNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系号码',
  `orderPerson` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '取餐地址',
  `communityRestaurant` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '餐厅',
  `communityId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区编号',
  `foodNames` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单内容',
  `foodPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `orderStatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food_order
-- ----------------------------
INSERT INTO `food_order` VALUES (1, 'CY59807422', '15951055308', 'admin', NULL, '嘉园餐厅', NULL, 'undefined1份宫保鸡丁2份番茄炒鸡蛋', NULL, '1', 1, 1, '2022-05-21 21:23:56', '2022-05-21 22:55:29');
INSERT INTO `food_order` VALUES (2, 'CY75466370', '15951055308', '你好', NULL, '嘉园餐厅', NULL, 'undefined3份宫保鸡丁', NULL, '1', 1, 3, '2022-05-21 21:46:29', '2022-05-21 22:37:00');
INSERT INTO `food_order` VALUES (3, 'CY98725776', '15951055308', 'angrybird', NULL, '嘉园餐厅', NULL, '3份宫保鸡丁', 0.00, '1', 1, 4, '2022-05-21 21:57:49', '2022-05-21 22:37:03');
INSERT INTO `food_order` VALUES (4, 'CY91241232', '15951055308', 'bagayaru', NULL, '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 0.00, '1', 1, 5, '2022-05-21 22:11:08', '2022-05-21 22:37:06');
INSERT INTO `food_order` VALUES (5, 'CY36397718', '15951055308', '不写每次还得重写', '社区A', '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 0.00, '1', 0, 6, '2022-05-21 22:12:04', '2022-05-21 22:37:09');
INSERT INTO `food_order` VALUES (6, 'CY39334303', '15951055308', '不写每次还得重写', '社区A', '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 0.00, '1', 0, 6, '2022-05-21 22:15:35', '2022-05-21 22:37:11');
INSERT INTO `food_order` VALUES (7, 'CY69091399', '15951055308', '不写每次还得重写', '社区A', '嘉园餐厅', NULL, '2份宫保鸡丁', 0.00, '1', 0, 6, '2022-05-21 22:16:14', '2022-05-21 22:37:12');
INSERT INTO `food_order` VALUES (8, 'CY46758817', '15951055308', '不写每次还得重写', '社区A', '嘉园餐厅', NULL, '2份宫保鸡丁', 0.00, '2', 0, 6, '2022-05-21 22:17:58', '2022-05-21 22:37:14');
INSERT INTO `food_order` VALUES (9, 'CY66298768', '15951055308', '生命因何而沉睡', '社区A', '嘉园餐厅', NULL, '1份番茄炒鸡蛋', 12.00, '0', 0, 7, '2022-05-21 22:21:21', NULL);
INSERT INTO `food_order` VALUES (10, 'CY47161764', '15951055308', '生命因何而沉睡', '社区A', '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 12.00, '2', 0, 7, '2022-05-21 22:21:51', NULL);
INSERT INTO `food_order` VALUES (11, 'CY38361236', '15951055308', '生命因何而沉睡', '社区A', '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 24.00, '0', 0, 7, '2022-05-21 22:22:52', NULL);
INSERT INTO `food_order` VALUES (12, 'CY6884159', '15951055308', '真的会被自己蠢哭', '社区A', '嘉园餐厅', NULL, '3份番茄炒鸡蛋', 36.00, '1', 0, 8, '2022-05-21 22:24:28', NULL);
INSERT INTO `food_order` VALUES (13, 'CY68227466', '18857765503', '真的会被自己蠢哭', '社区B', '乾元餐馆', NULL, '2份宫保鸡丁', 34.00, '1', 0, 8, '2022-05-21 22:41:10', NULL);
INSERT INTO `food_order` VALUES (14, 'CY83710131', '15951055308', 'a', '社区A', '嘉园餐厅', NULL, '2份宫保鸡丁3份番茄炒鸡蛋', 70.00, '1', 0, 25, '2022-05-23 22:54:09', NULL);
INSERT INTO `food_order` VALUES (15, 'CY60073854', '15951055308', 'a', '社区A', '嘉园餐厅', NULL, '10份宫保鸡丁', 170.00, '1', 0, 25, '2022-05-24 19:09:58', NULL);
INSERT INTO `food_order` VALUES (16, 'CY86276230', '18857765503', '2233', '社区A', '嘉园餐厅', NULL, '2份番茄炒鸡蛋', 24.00, '1', 0, 26, '2022-06-05 02:33:23', NULL);
INSERT INTO `food_order` VALUES (17, 'CY32354812', '16603808798', '不写每次还得重写', '社区B', '乾元餐馆', NULL, '100份宫保鸡丁', 1700.00, '1', 0, 6, '2024-06-26 00:45:43', NULL);

-- ----------------------------
-- Table structure for healthy_files
-- ----------------------------
DROP TABLE IF EXISTS `healthy_files`;
CREATE TABLE `healthy_files`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `older_id` int NOT NULL COMMENT '老人Id',
  `user_id` int NOT NULL COMMENT '监护人Id',
  `height` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身高m',
  `weight` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体重kg',
  `nation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '民族',
  `native_place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `marital_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '婚姻：0：未婚，1：已婚，2：离异',
  `work_year` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '工作年限',
  `education_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文化程度：0：文盲，1：小学，2：中学，3：大学，4：硕士，5：博士',
  `career` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职业',
  `files` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '档案描述',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` date NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of healthy_files
-- ----------------------------
INSERT INTO `healthy_files` VALUES (1, 1, 1, '1.73', '65', '汉族', '苏邮', '1', '25', '2', '自由职业', '一月健康报告', '0', 2, '2022-01-01', 0, '2022-04-29 14:24:36');
INSERT INTO `healthy_files` VALUES (2, 2, 1, '1.73', '65', '汉族', '扬州', '1', '25', '2', '自由职业', '一月健康报告', '0', 2, '2022-01-01', 0, '2022-05-13 14:26:25');
INSERT INTO `healthy_files` VALUES (3, 3, 2, '1.71', '61', '汉族', '苏邮', '1', '30', '1', '钢厂工', '一月健康档案', '0', 1, '2022-01-02', 1, NULL);
INSERT INTO `healthy_files` VALUES (4, 5, 2, '1.58', '62', '布依族', '贵州', '1', '15', '0', '长工', '一月健康档案', '0', 1, '2022-01-07', NULL, NULL);
INSERT INTO `healthy_files` VALUES (5, 1, 1, '1.73', '64', '汉族', '苏邮', '1', '25', '2', '自由职业', '二月健康档案', '0', 1, '2022-02-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (6, 2, 1, '1.66', '65', '汉族', '扬州', '1', '23', '2', '服装员工', '二月健康报告', '0', 1, '2022-02-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (7, 3, 2, '1.71', '60', '汉族', '苏邮', '1', '30', '1', '钢厂工', '二月健康档案', '0', 1, '2022-02-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (8, 5, 2, '1.58', '62', '布依族', '贵州', '1', '15', '0', '长工', '二月健康报告', '0', 1, '2022-02-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (9, 1, 1, '1.73', '65', '汉族', '苏邮', '1', '25', '2', '自由职业', '三月健康报告', '0', 1, '2022-03-01', 1, '2022-04-21 15:03:25');
INSERT INTO `healthy_files` VALUES (10, 1, 1, '1.73', '67', '汉族', '苏邮', '1', '25', '2', '自由职业', '四月健康档案', '0', 1, '2022-04-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (11, 1, 1, '1.73', '66', '汉族', '苏邮', '1', '25', '2', '自由职业', '五月健康档案', '0', 1, '2022-05-01', NULL, NULL);
INSERT INTO `healthy_files` VALUES (12, 1, 1, '1.73', '62', '汉族', '苏邮', '1', '25', '2', '自由职业', '六月健康报告', '0', 1, '2022-06-01', NULL, NULL);

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `hospitalName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医院名称',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医院logo',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `grade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '级别',
  `registerTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '放号时间',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES (1, '苏州大学附属独墅湖医院', 'assets/imgs/23176368020632682.jpg', '工业园区', '三级甲等', '09:00', 0, 1, '2022-05-11 16:44:26', NULL, NULL);
INSERT INTO `hospital` VALUES (2, '九龙医院', 'assets/imgs/23176410054422867.jpg', '园区万盛街', '私立医院', '06:30', 0, 1, '2022-05-11 17:21:39', NULL, NULL);
INSERT INTO `hospital` VALUES (3, '苏州市立医院', 'assets/imgs/23176875181268638.jpg', '吴中区', '三级甲等', '09:00', 0, 1, '2022-05-11 21:37:24', NULL, NULL);
INSERT INTO `hospital` VALUES (4, '苏州市第一人民医院', 'assets/imgs/23177084467557645.jpg', '姑苏区平龙路', '三级甲等', '08:30', 0, 1, '2022-05-12 21:16:07', NULL, NULL);

-- ----------------------------
-- Table structure for internal
-- ----------------------------
DROP TABLE IF EXISTS `internal`;
CREATE TABLE `internal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `older_Id` int NOT NULL COMMENT '老人Id',
  `healthy_Id` int NOT NULL COMMENT '档案Id',
  `heart_rate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '心率',
  `blood_pressure` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血压',
  `blood_sugar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血糖',
  `blood_fat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血脂',
  `pulse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '脉搏',
  `liver_function` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '肝功能',
  `renal_function` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '肾功能',
  `blood_routine` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血常规',
  `urinalysis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '尿常规',
  `work_Id` int NULL DEFAULT NULL COMMENT '医生Id',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of internal
-- ----------------------------
INSERT INTO `internal` VALUES (1, 1, 1, '70', '90/60', '4.1', '2.6', '70', '正常', '正常', '110', '2', 2, '0', 1, '2022-04-18 15:53:51', 0, '2022-04-29 14:24:36');
INSERT INTO `internal` VALUES (2, 2, 2, '70', '90/60', '4.1', '2.6', '70', '正常', '正常', '110', '2', 2, '0', 1, '2022-04-18 15:55:26', 0, '2022-05-13 14:26:25');
INSERT INTO `internal` VALUES (3, 3, 3, '78', '110/70', '4.2', '2.9', '78', '正常', '正常', '120', '3', 4, '0', 1, '2022-04-19 11:29:02', NULL, NULL);
INSERT INTO `internal` VALUES (4, 5, 4, '88', '110/80', '4.4', '3.6', '88', '正常', '正常', '112', '3.1', 4, '0', 1, '2022-04-19 11:53:29', NULL, NULL);
INSERT INTO `internal` VALUES (5, 1, 5, '74', '96/69', '3.9', '2.7', '70', '正常', '正常', '112', '3', 5, '0', 1, '2022-04-19 22:13:39', NULL, NULL);
INSERT INTO `internal` VALUES (6, 2, 6, '133', '130/78', '5.3', '3.7', '133', '正常', '正常', '135', '5.4', 4, '0', 1, '2022-04-19 22:25:59', NULL, NULL);
INSERT INTO `internal` VALUES (7, 3, 7, '80', '114/68', '4.7', '3.1', '80', '正常', '正常', '124', '3.2', 3, '0', 1, '2022-04-19 22:43:52', NULL, NULL);
INSERT INTO `internal` VALUES (8, 5, 8, '90', '119/67', '4.1', '3.5', '90', '正常', '正常', '118', '3.2', 5, '0', 1, '2022-04-19 22:50:39', NULL, NULL);
INSERT INTO `internal` VALUES (9, 1, 9, '99', '109/68', '4.9', '3.2', '99', '正常', '正常', '123', '3.9', 2, '0', 1, '2022-04-19 23:23:55', 1, '2022-04-21 15:03:25');
INSERT INTO `internal` VALUES (10, 1, 10, '110', '120/99', '4.5', '3.2', '110', '正常', '正常', '122', '3.8', 2, '0', 1, '2022-04-27 11:47:31', NULL, NULL);
INSERT INTO `internal` VALUES (11, 1, 11, '101', '110/70', '4.3', '3.5', '101', '正常', '正常', '113', '3.5', 3, '0', 1, '2022-04-27 13:01:24', NULL, NULL);
INSERT INTO `internal` VALUES (12, 1, 12, '155', '130/66', '3.1', '4.1', '155', '正常', '正常', '116', '3.2', 3, '0', 1, '2022-06-01 17:49:38', NULL, NULL);

-- ----------------------------
-- Table structure for joins
-- ----------------------------
DROP TABLE IF EXISTS `joins`;
CREATE TABLE `joins`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activeId` int NULL DEFAULT NULL COMMENT '活动Id',
  `joinId` int NULL DEFAULT NULL COMMENT '参与者ID',
  `joinName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参加者',
  `joinTime` datetime NULL DEFAULT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of joins
-- ----------------------------
INSERT INTO `joins` VALUES (1, 1, 2, '闵某', '2022-05-18 17:01:35');
INSERT INTO `joins` VALUES (2, 2, 2, '闵某', '2022-05-18 17:02:41');
INSERT INTO `joins` VALUES (3, 3, 2, '闵某', '2022-05-18 17:02:43');
INSERT INTO `joins` VALUES (4, 4, 2, '闵某', '2022-05-18 17:02:43');
INSERT INTO `joins` VALUES (5, 5, 2, '闵某', '2022-05-18 17:02:44');
INSERT INTO `joins` VALUES (6, 6, 2, '闵某', '2022-05-18 17:02:44');
INSERT INTO `joins` VALUES (7, 7, 2, '闵某', '2022-05-18 17:02:44');
INSERT INTO `joins` VALUES (8, 8, 2, '闵某', '2022-05-18 17:02:45');
INSERT INTO `joins` VALUES (12, 3, 1, '徐某', '2022-05-18 17:09:22');
INSERT INTO `joins` VALUES (14, 9, 2, '闵某', '2022-05-20 17:25:13');
INSERT INTO `joins` VALUES (15, 1, 6, '不写每次还得重写', '2024-07-06 23:21:19');
INSERT INTO `joins` VALUES (16, 2, 6, '不写每次还得重写', '2024-07-07 12:51:59');

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `book_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '书名',
  `read_number` int NULL DEFAULT NULL COMMENT '阅读量',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `content` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类型0：草稿，1：发布',
  `del_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `roleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色Id',
  `create_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者名',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (1, '健康饮食', 13, '关于老年人健康饮食习惯，以及一日三餐食谱推荐。', 'sadasdkahkjh\n\n\n\n\n\n\n', '0', '0', '1', '管理员', 1, '2022-04-21 10:11:55', 1, '2022-04-23 09:44:43');
INSERT INTO `knowledge` VALUES (2, '坚持健康锻炼', 19, '关于老年人健康运动问题，提供了一些适合老年锻炼身体的方法', '坚持锻炼哈哈哈哈\n\n\n\n\n', '0', '0', '1', '管理员', 1, '2022-04-21 12:44:33', 1, '2022-05-05 10:36:26');
INSERT INTO `knowledge` VALUES (3, '《健康中国家庭必备健康生活丛书》', 21, '《健康中国家庭必备健康生活丛书》由钟南山、曾益新、陈君石三大院士领衔“南湘雅北协和”33位资深专家教授耗时3年联手打造。这不再是一套传统意义上的健康丛书,而是承载...', NULL, '1', '0', '1', '管理员', 1, '2022-04-21 16:28:32', NULL, NULL);
INSERT INTO `knowledge` VALUES (4, '《百岁非梦》', 6, ' 本书从大量古今中外老人的长寿资料和作者实地调研的材料出发,向读者证明:人类延长寿命并非梦想,而是有规律可循的。长期以来人们一直追求的“长命百岁”的目的有希望达到。', ' 本书从大量古今中外老人的长寿资料和作者实地调研的材料出发,向读者证明:人类延长寿命并非梦想,而是有规律可循的。长期以来人们一直追求的“长命百岁”的目的有希望达到。', '0', '0', '2', '徐医生', 2, '2022-04-21 17:56:22', 2, '2022-05-18 15:23:45');
INSERT INTO `knowledge` VALUES (5, '《牙医门诊日记》', 7, ' 本书是一位口腔科主任医师的日记随笔,她用个人眼光打量门诊室发生的一切,呈现一个个故事。。', ' 本书是一位口腔科主任医师的日记随笔,她用个人眼光打量门诊室发生的一切,呈现一个个故事。', '1', '0', '2', '徐医生', 2, '2022-04-21 17:58:42', NULL, NULL);
INSERT INTO `knowledge` VALUES (6, '《汪芳说 血管清爽活百岁》', 3, '北京医院心内科主任医师汪芳教授从医近30工作感悟首度结集出版。精准的科学分析、温暖的人文关怀、健康的生活理念。用讲故事的方式以最浅显的语言讲解普通读者最需了解的心血管知识。', '北京医院心内科主任医师汪芳教授从医近30工作感悟首度结集出版。精准的科学分析、温暖的人文关怀、健康的生活理念。用讲故事的方式以最浅显的语言讲解普通读者最需了解的心血管知识。', '1', '0', '2', '王医生', 5, '2022-04-21 18:07:12', NULL, NULL);
INSERT INTO `knowledge` VALUES (7, '《36.5℃决定健康》', 3, '《36.5℃决定健康》为日本著名健康养生专家石原结实所著。书中提到，医学研究表明，体温在正常范围内升高1℃，人体免疫力就会提高5-6倍；相反，体温降低1℃，免疫力下降30%，加速危险细胞生长。', '《36.5℃决定健康》为日本著名健康养生专家石原结实所著。书中提到，医学研究表明，体温在正常范围内升高1℃，人体免疫力就会提高5-6倍；相反，体温降低1℃，免疫力下降30%，加速危险细胞生长.哈哈哈哈哈哈哈哈哈哈\n\n', '1', '0', '2', '王医生', 5, '2022-04-21 18:16:55', 1, '2022-04-22 00:04:35');
INSERT INTO `knowledge` VALUES (8, '《老老恒言》', 6, '老老恒言》又称《养生随笔》，清代著名养生学家、文学家曹庭栋著，是汇集清以前各家养生思想，并结合作者自己的切身体会，总结编纂而成的养生学专著。', '老老恒言》又称《养生随笔》，清代著名养生学家、文学家曹庭栋著，是汇集清以前各家养生思想，并结合作者自己的切身体会，总结编纂而成的养生学专著。分别从饮食起居、精神调摄、运动导引、服药卫生、预防疾病等方面，阐述老年养生的指导思想和具体方法。作者养生理论始终贯穿“ 道贵自然”的思想，主张养生应顺应自然，生活习惯应合四时阴阳，并且紧密结合老年人自身的特点，把养生寓于日常生活琐事之中。全书共5卷，前4 卷涉及饮食起居及日常用品的保健措施。第5卷为粥谱，粥分上、中、下三品。作者非常重视养静和顾护脾胃的重要性，并力推粥食在养生中的重要地位。null\n', '1', '0', '1', '管理员', 1, '2022-04-21 23:22:11', NULL, NULL);
INSERT INTO `knowledge` VALUES (9, '人与自然', 1, '大自然与人类和睦相处、。。。。', '\n大自然与人类和睦相处、亲近大自然\n\n\n\n', '1', '0', '2', '徐医生', 2, '2022-05-18 15:16:00', NULL, NULL);

-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES (100, '系统管理', '/admin');
INSERT INTO `mainmenu` VALUES (200, '系统功能', '/func');
INSERT INTO `mainmenu` VALUES (300, '身体信息', '/bodyinfo');
INSERT INTO `mainmenu` VALUES (400, '互助功能', '/mutualhelp');

-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `businessNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '业务编号',
  `businessType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '0：买药，1：预约挂号',
  `businessContent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '业务内容',
  `businessOrganization` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '业务机构',
  `businessStatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '0：完成；1：进行中；2：废弃',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '业务费',
  `del_flag` int NULL DEFAULT NULL COMMENT '是否删除0，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medical
-- ----------------------------
INSERT INTO `medical` VALUES (1, 'YY49768087', '1', '2022/05/21 09:00:00在苏州大学附属独墅湖医院预约挂号', '苏州大学附属独墅湖医院', '0', 12.00, 0, 1, '2022-05-16 00:43:24', 5, '2022-06-05 02:22:00');
INSERT INTO `medical` VALUES (2, 'MY5696034', '0', '徐某在富仁大药房买了青原感冒灵胶囊999感冒灵颗粒', '富仁大药房', '2', 31.00, 0, 1, '2022-05-16 16:16:49', 2, '2022-05-18 21:02:42');
INSERT INTO `medical` VALUES (3, 'MY17156733', '0', '闵某在标智药房买了云南白药气雾剂', '标智药房', '2', 78.20, 0, 2, '2022-05-16 16:18:53', 2, '2022-06-05 02:08:50');
INSERT INTO `medical` VALUES (4, 'MY21669975', '0', '闵某在富仁大药房买了三九胃泰温胃舒颗粒云南白药气雾剂', '富仁大药房', '1', 110.20, 0, 2, '2022-05-16 16:23:33', NULL, NULL);
INSERT INTO `medical` VALUES (5, 'YY69419594', '1', '2022/05/19 09:00在苏州市立医院预约挂号', '苏州市立医院', '2', 12.00, 0, 2, '2022-05-16 16:25:30', 2, '2022-05-16 18:31:15');
INSERT INTO `medical` VALUES (6, 'YY33427050', '1', '2022/05/26 06:30在九龙医院预约挂号', '九龙医院', '1', 12.00, 0, 1, '2022-05-20 13:12:16', NULL, NULL);
INSERT INTO `medical` VALUES (7, 'MY29508284', '0', '徐某在富仁大药房买了云南白药气雾剂', '富仁大药房', '0', 78.20, 0, 1, '2022-06-05 02:34:43', 7, '2022-06-05 06:18:57');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `news` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `createtime` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` int NULL DEFAULT NULL COMMENT '是否删除0，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '超级管理员', '哈哈哈', '2022-04-29 13:16:04', 0);
INSERT INTO `news` VALUES (2, '超级管理员', 'hhhhhh', '2022-04-29 13:17:04', 0);
INSERT INTO `news` VALUES (3, '超级管理员', '哎呦我去', '2022-04-29 13:18:03', 0);
INSERT INTO `news` VALUES (4, '徐医生', '我是徐颖', '2022-04-29 13:45:34', 0);
INSERT INTO `news` VALUES (5, '徐医生', '天降异象，剑仙陨落', '2022-04-29 13:54:10', 0);
INSERT INTO `news` VALUES (6, '徐医生', '大王烦烦烦', '2022-04-29 14:03:47', 0);
INSERT INTO `news` VALUES (7, '超级管理员', '关爱老人，共建幸福家园。', '2022-05-03 14:13:16', 0);
INSERT INTO `news` VALUES (8, '超级管理员', '系统升级中。。。。。', '2022-05-09 17:18:12', 0);
INSERT INTO `news` VALUES (9, '闵某', '天干缔造', '2022-06-05 03:31:04', 0);
INSERT INTO `news` VALUES (10, NULL, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2024-06-25 18:21:00', 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goodsId` int NULL DEFAULT NULL COMMENT '商品Id',
  `orderNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `shopName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家',
  `imgUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `goodsName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `orderPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `orderNumber` int NULL DEFAULT NULL COMMENT '商品下单数量',
  `orderStatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态，0：完成，1：进行中，2：废弃',
  `del_flag` int NULL DEFAULT NULL COMMENT '是否删除0，1删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (2, 1, 'SP15097472', '京东', 'assets/imgs/niunai.jpg', '伊利纯牛奶', 46.90, 5, '0', 0, 2, '2022-05-19 22:35:35', NULL, NULL);
INSERT INTO `order` VALUES (3, 2, 'SP64898548', '京东', 'assets/imgs/shuiguo.jpg', '新疆库尔勒香梨', 58.80, 4, '0', 0, 2, '2022-05-19 22:35:35', NULL, NULL);
INSERT INTO `order` VALUES (6, 3, 'SP43480763', '京东', 'assets/imgs/yangcong.jpg', '紫洋葱', 21.90, 2, '0', 0, 3, '2022-05-20 16:49:23', NULL, NULL);
INSERT INTO `order` VALUES (7, 4, 'SP80873021', '京东', 'assets/imgs/fanqie.jpg', '云南硬粉番茄', 24.90, 1, '1', 0, 3, '2022-05-20 16:51:53', NULL, NULL);

-- ----------------------------
-- Table structure for order_customer
-- ----------------------------
DROP TABLE IF EXISTS `order_customer`;
CREATE TABLE `order_customer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `orderNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `orderCustomer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `orderTime` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `number` int NULL DEFAULT NULL COMMENT '下单数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_customer
-- ----------------------------
INSERT INTO `order_customer` VALUES (3, 'SP15097472', '8', '闵某', '2022-05-19 22:35:35', 2);
INSERT INTO `order_customer` VALUES (4, 'SP64898548', '8', '闵某', '2022-05-19 22:35:35', 1);
INSERT INTO `order_customer` VALUES (7, 'SP15097472', '7', '徐某', '2022-05-20 14:00:27', 1);
INSERT INTO `order_customer` VALUES (8, 'SP64898548', '7', '徐某', '2022-05-20 14:06:27', 2);
INSERT INTO `order_customer` VALUES (9, 'SP15097472', '6', '羽生', '2022-05-20 14:10:15', 1);
INSERT INTO `order_customer` VALUES (10, 'SP64898548', '6', '羽生', '2022-05-20 14:17:40', 1);
INSERT INTO `order_customer` VALUES (11, 'SP43480763', '6', '羽生', '2022-05-20 16:49:23', 1);
INSERT INTO `order_customer` VALUES (12, 'SP80873021', '6', '羽生', '2022-05-20 16:51:53', 1);
INSERT INTO `order_customer` VALUES (13, 'SP15097472', '7', '徐某', '2022-06-05 02:33:53', 1);

-- ----------------------------
-- Table structure for pharmacy
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药店名称',
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '照片地址',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药店地址',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药店评分',
  `monthlySale` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '月售',
  `startDelivery` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '起送费',
  `delivery` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '有无配送费',
  `distance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '配送距离',
  `deliveryTime` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '配送时间',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pharmacy
-- ----------------------------
INSERT INTO `pharmacy` VALUES (1, '富仁大药房', 'assets/imgs/furen.jpg', '车坊普惠路店', '4.2', '1563', '20', '免配送费', '3.5', '25', 0, 1, '2022-05-06 10:57:26', NULL, NULL);
INSERT INTO `pharmacy` VALUES (2, '标智药房', 'assets/imgs/biaozhi.jpg', '莲花店', '4.5', '1688', '22', '2元配送费', '4.8', '35', 0, 1, '2022-05-06 12:51:53', NULL, NULL);
INSERT INTO `pharmacy` VALUES (3, '君钰康大药房', 'assets/imgs/junyu.jpg', '东沙湖邻里中心店', '5', '0', '20', '免配送费', '3.6', '30', 0, 1, '2022-05-09 14:38:05', NULL, NULL);
INSERT INTO `pharmacy` VALUES (4, '连旺大药房', 'assets/imgs/lianwang.jpg', '独墅湖店', '5', '0', '25', '5元配送费', '3.6', '30', 0, 1, '2022-05-09 14:40:27', NULL, NULL);
INSERT INTO `pharmacy` VALUES (5, '康华大药房', 'assets/imgs/kanghua.jpg', '玲珑街店', '5', '0', '20', '3元配送费', '3.6', '30', 0, 1, '2022-05-10 17:00:56', NULL, NULL);

-- ----------------------------
-- Table structure for role_mm
-- ----------------------------
DROP TABLE IF EXISTS `role_mm`;
CREATE TABLE `role_mm`  (
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mm_id` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_mm
-- ----------------------------
INSERT INTO `role_mm` VALUES ('管理员', 100);
INSERT INTO `role_mm` VALUES ('管理员', 200);
INSERT INTO `role_mm` VALUES ('用户', 200);
INSERT INTO `role_mm` VALUES ('管理员', 300);
INSERT INTO `role_mm` VALUES ('管理员', 400);
INSERT INTO `role_mm` VALUES ('用户', 300);
INSERT INTO `role_mm` VALUES ('用户', 400);

-- ----------------------------
-- Table structure for shop_mall
-- ----------------------------
DROP TABLE IF EXISTS `shop_mall`;
CREATE TABLE `shop_mall`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goodsName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goodsImgUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `goodsUnit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `goodsPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `shopName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家',
  `qualityGuarantee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '保质期',
  `stock` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存量',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop_mall
-- ----------------------------
INSERT INTO `shop_mall` VALUES (1, '伊利纯牛奶', 'assets/imgs/niunai.jpg', '250ml*16', 46.90, '京东', '12个月', '195', 0, 1, '2022-05-19 14:40:23', 1, '2022-05-19 16:01:45');
INSERT INTO `shop_mall` VALUES (2, '新疆库尔勒香梨', 'assets/imgs/shuiguo.jpg', '2.5kg', 58.80, '京东', '12个月', '226', 0, 1, '2022-05-19 15:44:47', NULL, NULL);
INSERT INTO `shop_mall` VALUES (3, '紫洋葱', 'assets/imgs/yangcong.jpg', '1kg', 21.90, '京东', '1个月', '48', 0, 1, '2022-05-20 14:21:19', NULL, NULL);
INSERT INTO `shop_mall` VALUES (4, '云南硬粉番茄', 'assets/imgs/fanqie.jpg', '1.25kg', 24.90, '京东', '15天', '149', 0, 1, '2022-05-20 14:26:49', NULL, NULL);
INSERT INTO `shop_mall` VALUES (5, '黑猪五花肉', 'assets/imgs/lengxianrou.jpg', '248g', 56.90, '京东', '20天', '30', 0, 1, '2022-05-20 14:31:13', 1, '2022-05-20 14:39:37');

-- ----------------------------
-- Table structure for sport_info
-- ----------------------------
DROP TABLE IF EXISTS `sport_info`;
CREATE TABLE `sport_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sport_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `suitable_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `suitable_heart_rate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `suitable_frequency` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `recommended_speed` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sport_info
-- ----------------------------
INSERT INTO `sport_info` VALUES (1, '越野跑', '33分钟', '130-160次/分', '3-4次/周', '8km/h');
INSERT INTO `sport_info` VALUES (3, '瑜伽', '60分钟', '90-110次/分', '1-2次/周', '无');
INSERT INTO `sport_info` VALUES (4, '羽毛球', '120分钟', '130-150次/分', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (5, '慢跑', '60分钟', '130-150次/分', '3-4次/周', '8km/h');
INSERT INTO `sport_info` VALUES (10, '跑步', '45分钟', '140-160次/分', '4-5次/周', '10km/h');
INSERT INTO `sport_info` VALUES (13, '太极拳', '60分钟', '80-100次/分', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (14, '足球', '90分钟', '130-150次/分', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (15, '快跑', '30分钟', '130-150次/分', '5-6次/周', '13km/h');
INSERT INTO `sport_info` VALUES (16, '爬山', '60分钟', '130-150次/分', '2-3次/周', '5km/h');
INSERT INTO `sport_info` VALUES (18, '游泳', '45分钟', '120-140次/分', '3-4次/周', '2.5km/h');
INSERT INTO `sport_info` VALUES (19, '篮球', '120分钟', '130-150次/分', '1-2次/周', '无');
INSERT INTO `sport_info` VALUES (20, '排球', '1小时', '100-120次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (21, '网球', '1.5小时', '100-130次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (22, '滑冰', '1小时', '100-120次/分钟', '2-3次/周', '10-15千米/小时');
INSERT INTO `sport_info` VALUES (23, '长跑', '30分钟-1小时', '120-160次/分钟', '3-4次/周', '10-15千米/小时');
INSERT INTO `sport_info` VALUES (24, '橄榄球', '1.5-2小时', '100-120次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (25, '跆拳道', '1小时', '120-140次/分钟', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (26, '体操', '1-2小时', '100-120次/分钟', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (27, '跳高', '1小时', '120-160次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (28, '跳板', '1小时', '120-160次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (29, '跳皮筋', '30分钟-1小时', '100-120次/分钟', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (30, '跳绳', '30分钟-1小时', '120-160次/分钟', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (31, '踢毽子', '30分钟-1小时', '100-120次/分钟', '3-4次/周', '无');
INSERT INTO `sport_info` VALUES (32, '放风筝', '1-2小时', '80-100次/分钟', '1-2次/周', '无');
INSERT INTO `sport_info` VALUES (33, '拔河', '30分钟-1小时', '100-120次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (34, '抽陀螺', '30分钟-1小时', '80-100次/分钟', '1-2次/周', '无');
INSERT INTO `sport_info` VALUES (35, '抖空竹', '30分钟-1小时', '80-100次/分钟', '1-2次/周', '无');
INSERT INTO `sport_info` VALUES (36, '扔沙袋', '30分钟-1小时', '100-120次/分钟', '2-3次/周', '无');
INSERT INTO `sport_info` VALUES (37, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sport_info` VALUES (38, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sport_info` VALUES (39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sport_info` VALUES (40, '哈哈哈哈哈', '哈哈哈哈哈哈哈', '哈哈哈', '哈哈哈哈哈哈', '哈哈哈哈哈');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid` ASC) USING BTREE,
  CONSTRAINT `submenu_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `mainmenu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 305 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES (101, '用户管理', '/user_admin', 100);
INSERT INTO `submenu` VALUES (102, '运动知识管理', '/sport_admin', 100);
INSERT INTO `submenu` VALUES (103, ' 运动详情管理', '/detail_admin', 100);
INSERT INTO `submenu` VALUES (104, '用户身体信息管理', '/info_admin', 100);
INSERT INTO `submenu` VALUES (105, '社区管理', '/community_admin', 100);
INSERT INTO `submenu` VALUES (201, '身体信息上传', '/info_upload', 300);
INSERT INTO `submenu` VALUES (202, '身体信息管理', '/info_history', 300);
INSERT INTO `submenu` VALUES (203, '身体信息仪表', '/bodyinfo', 300);
INSERT INTO `submenu` VALUES (204, '健康评估', '/assess', 300);
INSERT INTO `submenu` VALUES (205, '运动知识', '/sport_knowledge', 200);
INSERT INTO `submenu` VALUES (206, '健康知识管理', '/health_knowledge', 200);
INSERT INTO `submenu` VALUES (207, '个人中心', '/personal', 200);
INSERT INTO `submenu` VALUES (208, '活动', '/activity', 200);
INSERT INTO `submenu` VALUES (301, '餐饮互助', '/repast', 400);
INSERT INTO `submenu` VALUES (302, '医疗互助', '/medicine', 400);
INSERT INTO `submenu` VALUES (303, '代购互助', '/shop', 400);

-- ----------------------------
-- Table structure for surgery
-- ----------------------------
DROP TABLE IF EXISTS `surgery`;
CREATE TABLE `surgery`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `healthy_Id` int NOT NULL COMMENT '档案Id',
  `older_Id` int NOT NULL COMMENT '老人Id',
  `skin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '皮肤',
  `lymph` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '淋巴',
  `thyroid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '甲状腺',
  `spine` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '脊柱',
  `limb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '四肢',
  `joint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关节',
  `head` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头部',
  `eye` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '眼睛',
  `ears` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '耳朵',
  `nose` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '鼻子',
  `oral_cavity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '口腔',
  `throat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '咽喉',
  `work_Id` int NULL DEFAULT NULL COMMENT '医生Id',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of surgery
-- ----------------------------
INSERT INTO `surgery` VALUES (1, 1, 1, '正常', '正常', '正常', '略微向右弯曲', '正常', '微肿', '正常', '红血丝，过于疲劳', '正常', '发炎', '舌苔发黄，有蛀牙', '正常', 2, 0, 1, '2022-04-17 21:14:09', 0, '2022-04-29 14:24:36');
INSERT INTO `surgery` VALUES (2, 2, 2, '正常', '正常', '正常', '略微向右弯曲', '正常', '微肿', '正常', '红血丝，过于疲劳', '正常', '发炎', '舌苔发黄，有蛀牙', '正常', 2, 0, 1, '2022-04-17 21:27:54', 0, '2022-05-13 14:26:25');
INSERT INTO `surgery` VALUES (3, 3, 3, '正常', '正常', '正常', '弯曲', '手指，脚趾变形', '肿大', '正常', '正常', '正常', '正常', '牙齿脱落', '正常', 4, 0, 0, '2022-04-19 11:29:02', NULL, NULL);
INSERT INTO `surgery` VALUES (4, 4, 5, '正常', '正常', '正常', '弯曲', '正常', '右腿膝盖有损伤', '正常', '正常', '正常', '正常', '牙齿损坏', '正常', 4, 0, 0, '2022-04-19 11:53:29', NULL, NULL);
INSERT INTO `surgery` VALUES (5, 5, 1, '正常', '正常', '脖子右侧略微发肿', '弯曲', '正常', '正常', '正常', '正常', '右耳耳鸣', '正常', '正常', '正常', 5, 0, 1, '2022-04-19 22:13:39', NULL, NULL);
INSERT INTO `surgery` VALUES (6, 6, 2, '局部皮肤有湿疹', '正常', '正常', '正常', '正常', '右手腕有损伤', '正常', '正常', '正常', '轻微鼻炎', '正常', '正常', 4, 0, 1, '2022-04-19 22:25:59', NULL, NULL);
INSERT INTO `surgery` VALUES (7, 7, 3, '正常', '正常', '正常', '弯曲', '变形', '肿大', '正常', '正常', '正常', '正常', '牙齿脱落', '正常', 3, 0, 1, '2022-04-19 22:43:17', NULL, NULL);
INSERT INTO `surgery` VALUES (8, 8, 5, '正常', '正常', '正常', '弯曲', '正常', '正常', '正常', '红血丝密布', '左耳耳鸣', '轻微鼻炎', '正常', '咽喉发炎', 5, 0, 1, '2022-04-19 22:50:39', NULL, NULL);
INSERT INTO `surgery` VALUES (9, 9, 1, '正常', '正常', '正常', '弯曲', '正常', '正常', '正常', '正常', '正常', '正常', '正常', '正常', 2, 0, 1, '2022-04-19 23:23:52', 1, '2022-04-21 15:03:25');
INSERT INTO `surgery` VALUES (10, 10, 1, '正常', '正常', '正常', '静脉曲张', '正常', '正常', '正常', '正常', '正常', '鼻炎', '口腔溃疡', '正常', 2, 0, 1, '2022-04-27 11:47:31', NULL, NULL);
INSERT INTO `surgery` VALUES (11, 11, 1, '正常', '正常', '脖子肿大', '正常', '正常', '左手腕损伤', '正常', '正常', '正常', '正常', '正常', '正常', 3, 0, 1, '2022-04-27 13:01:24', NULL, NULL);
INSERT INTO `surgery` VALUES (12, 12, 1, '正常', '正常', '正常', '正常', '正常', '肩关节劳损', '正常', '正常', '正常', '鼻炎', '正常', '正常', 3, 0, 1, '2022-05-03 17:49:38', NULL, NULL);

-- ----------------------------
-- Table structure for tb_older
-- ----------------------------
DROP TABLE IF EXISTS `tb_older`;
CREATE TABLE `tb_older`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_Id` int NOT NULL COMMENT '用户主键',
  `older_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '老人姓名',
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `sex` int NULL DEFAULT NULL COMMENT '性别：0：男1：女',
  `older_age` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '老人年龄',
  `communityCd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所在社区Id',
  `medical_history` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '病史',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '状态，0：正常，1：失效',
  `del_flag` int UNSIGNED NULL DEFAULT NULL COMMENT '是否删除',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_older
-- ----------------------------
INSERT INTO `tb_older` VALUES (1, 1, '徐老', 'assets/imgs/sportlogo.jpg', 0, '59', '003', '无', '1963-02-19', 1, 0, 1, '2022-04-07 09:43:11', 0, '2022-04-29 14:24:36');
INSERT INTO `tb_older` VALUES (2, 1, '李老', 'assets/imgs/sportback.jpg', 1, '59', '001', '血糖高，血脂高', '1967-02-19', 1, 0, 1, '2022-04-07 21:24:04', 0, '2022-05-13 14:26:25');
INSERT INTO `tb_older` VALUES (3, 2, '闵老', 'assets/imgs/community.jpg', 0, '58', '001', '风湿性关节炎', '1964-04-14', 1, 0, 1, '2022-04-22 00:59:38', 1, '2022-04-23 09:35:57');
INSERT INTO `tb_older` VALUES (5, 2, '杨老', 'assets/imgs/sportlogo.jpg', 1, '48', '001', '结石', '1974-03-14', 1, 0, 1, '2022-04-11 11:40:44', 1, '2022-05-06 16:04:33');
INSERT INTO `tb_older` VALUES (6, 5, '顾老', 'assets/imgs/sportlogo.jpg', 0, '59', '003', '无', '1963-03-21', 1, 0, 1, '2022-04-21 09:57:09', 1, '2022-05-06 16:28:33');
INSERT INTO `tb_older` VALUES (7, 6, '风老', 'assets/imgs/sportlogo.jpg', 0, '68', '002', '高血压', '1954-02-01', 1, 0, 1, '2022-04-29 10:34:31', 1, '2022-05-06 16:28:33');
INSERT INTO `tb_older` VALUES (8, 7, '李老', 'assets/imgs/sportlogo.jpg', 0, '72', '006', '无', '1950-02-01', 0, 0, 1, '2022-05-06 15:15:07', NULL, '2022-05-06 15:15:20');
INSERT INTO `tb_older` VALUES (9, 4, '叶老', 'assets/imgs/sportlogo.jpg', 0, '66', '004', '无', '1956-08-23', 0, 0, 1, '2022-05-06 15:28:02', 1, '2022-05-06 15:28:02');
INSERT INTO `tb_older` VALUES (10, 18, '江老', 'assets/imgs/sportlogo.jpg', 1, '55', '001', '无', '1967-05-15', 0, 0, 1, '2022-05-06 15:31:20', 1, '2022-05-06 15:31:20');
INSERT INTO `tb_older` VALUES (11, 20, '易老', 'assets/imgs/sportlogo.jpg', 0, '54', '003', '无', '1968-04-13', 1, 0, 1, '2022-05-06 17:16:05', 1, '2022-05-09 13:08:23');
INSERT INTO `tb_older` VALUES (12, 12, '韩老', 'assets/imgs/xupopo.jpg', 0, '61', '002', '无', '1961-10-25', 1, 0, 1, '2022-05-09 09:28:07', 1, '2022-05-09 09:47:50');
INSERT INTO `tb_older` VALUES (13, 12, '王老', 'assets/imgs/xupopo.jpg', 1, '56', '004', '无', '1966-07-09', 1, 0, 1, '2022-05-09 09:48:38', 1, '2022-05-09 13:08:19');
INSERT INTO `tb_older` VALUES (14, 2, '钱老', 'assets/imgs/xupopo.jpg', 1, '56', '002', '无', '1966-12-19', 0, 0, 1, '2022-05-09 10:02:29', 1, '2022-05-09 10:02:29');
INSERT INTO `tb_older` VALUES (15, 19, '赵老', 'assets/imgs/xupopo.jpg', 0, '61', '003', '无', '1961-06-05', 1, 0, 1, '2022-05-09 10:07:20', 1, '2022-05-09 13:08:18');
INSERT INTO `tb_older` VALUES (16, 12, '郑老', 'assets/imgs/boy.jpg', 0, '52', '002', '无', '1970-05-04', 1, 0, 1, '2022-05-09 13:01:10', 1, '2022-05-09 13:08:17');
INSERT INTO `tb_older` VALUES (17, 14, '天老', 'assets/imgs/boy.jpg', 0, '52', '001', '无', '1970-05-05', 1, 0, 1, '2022-05-09 13:04:33', 1, '2022-05-09 13:08:17');
INSERT INTO `tb_older` VALUES (18, 11, '曹老', 'assets/imgs/xupopo.jpg', 1, '51', '003', '无', '1971-10-13', 0, 0, 1, '2022-05-09 13:12:38', 1, '2022-05-09 13:12:38');
INSERT INTO `tb_older` VALUES (19, 11, '张老', 'assets/imgs/xupopo.jpg', 1, '47', '005', '无', '1975-06-02', 0, 0, 1, '2022-05-09 13:15:05', 1, '2022-05-09 13:15:05');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主鍵Id',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色',
  `roleId` int NULL DEFAULT NULL COMMENT '関連easyuser表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理員', 1);
INSERT INTO `tb_role` VALUES (2, '医生', 2);
INSERT INTO `tb_role` VALUES (3, '员工', 3);
INSERT INTO `tb_role` VALUES (4, '监护人', 4);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户姓名',
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别：0：男，1：女',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `roleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色',
  `communityCd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '社区CD',
  `state` tinyint NOT NULL DEFAULT 1 COMMENT '状态，1：正常，0：失效',
  `isAssess` int NULL DEFAULT 0 COMMENT '是否已评价0：否，1：是',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除，0正常，1删除',
  `loginTime` date NULL DEFAULT NULL COMMENT '登录日期',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '徐某', '1', '123456', '18857765503', '4', '001', 1, 1, '0', '2022-06-04', 1, '2022-03-23 15:15:13', 1, '2022-04-23 11:15:18');
INSERT INTO `tb_user` VALUES (2, '闵某', '0', '123456', '15951055308', '4', '001', 1, 1, '0', '2022-06-05', 1, '2022-03-23 15:31:37', 2, '2022-05-18 10:52:42');
INSERT INTO `tb_user` VALUES (3, '羽生', '0', '123456', '11111111', '4', '002', 1, 1, '0', '2022-06-04', 1, '2022-03-23 15:31:42', 1, '2022-04-02 16:56:04');
INSERT INTO `tb_user` VALUES (4, '叶某', '0', '123456', '222222223', '4', '002', 1, 1, '0', '2022-06-05', 1, '2022-03-23 15:31:51', 1, '2022-03-30 21:16:12');
INSERT INTO `tb_user` VALUES (5, '顾某', '1', '123456', '5555555512', '4', '004', 1, 1, '0', '2022-06-06', 1, '2022-03-23 15:31:56', 2, '2022-05-18 10:52:45');
INSERT INTO `tb_user` VALUES (6, '风某', '0', '123456', '7777777777', '4', '001', 1, 1, '0', '2022-06-07', 1, '2022-03-23 15:32:01', 1, '2022-04-29 10:36:20');
INSERT INTO `tb_user` VALUES (7, '东方', '1', '123456', '66666666', '4', '003', 0, 0, '0', '2022-06-07', 1, '2022-03-23 15:32:05', 2, '2022-05-18 10:52:48');
INSERT INTO `tb_user` VALUES (8, '华某', '0', '123456', '111111112', '4', '005', 0, 1, '0', '2022-06-08', 1, '2022-03-23 15:32:10', 2, '2022-05-18 10:52:48');
INSERT INTO `tb_user` VALUES (9, '古某', '1', '123456', '999999992', '4', '004', 0, 0, '0', '2022-06-09', 1, '2022-03-23 15:32:15', 2, '2022-05-18 10:52:49');
INSERT INTO `tb_user` VALUES (10, '陈某', '1', '123456', '99999999', '4', '005', 0, 0, '1', '2022-06-08', 1, '2022-03-24 16:04:26', 1, '2022-03-30 21:19:24');
INSERT INTO `tb_user` VALUES (11, '刘某', '0', '123456', '88888888', '4', '001', 1, 0, '0', '2022-06-08', 1, '2022-03-24 16:05:12', 1, '2022-03-28 09:28:34');
INSERT INTO `tb_user` VALUES (12, '郑某', '0', '123456', '15151515151', '4', '005', 1, 0, '0', '2022-06-07', 1, '2022-03-30 21:19:05', 1, '2022-03-30 21:26:17');
INSERT INTO `tb_user` VALUES (13, '江某', '1', '123456', '1775126789', '4', '001', 0, 0, '0', '2022-06-06', 1, '2022-03-31 13:12:49', 1, '2022-03-31 13:13:38');
INSERT INTO `tb_user` VALUES (14, '天某', '0', '123456', '18851269705', '4', '002', 1, 0, '0', '2022-06-09', 1, '2022-03-31 13:21:27', 1, '2022-04-06 17:11:24');
INSERT INTO `tb_user` VALUES (15, '无痕', '0', '123456', '19885123', '4', '002', 0, 0, '0', '2022-06-08', 0, '2022-04-22 17:21:17', 0, '2022-04-22 17:21:17');
INSERT INTO `tb_user` VALUES (16, '王道', '0', '123456', '123456789', '4', '003', 0, 0, '0', '2022-06-04', 0, '2022-04-22 17:28:26', 0, '2022-04-22 17:28:26');
INSERT INTO `tb_user` VALUES (17, '风采臣', '0', '123456', '963852741', '4', '003', 0, 0, '0', '2022-06-03', 0, '2022-04-22 17:50:05', 0, '2022-04-22 17:50:05');
INSERT INTO `tb_user` VALUES (18, '胡某', '1', '123456', '17125963', '4', '002', 1, 0, '0', '2022-06-02', 0, '2022-04-22 17:51:26', 0, '2022-04-22 17:51:26');
INSERT INTO `tb_user` VALUES (19, '赵子龙', '0', '123456', '9906121516', '4', '006', 1, 0, '0', '2022-06-02', 0, '2022-04-22 17:56:22', 0, '2022-04-22 17:56:22');
INSERT INTO `tb_user` VALUES (20, '十四', '1', '123456', '555555555', '4', '006', 1, 0, '0', '2022-06-03', 0, '2022-04-22 17:57:36', 0, '2022-04-22 17:57:36');
INSERT INTO `tb_user` VALUES (21, '方羽', '0', '123456', '99176852', '4', '006', 1, 0, '0', '2022-06-09', 1, '2022-04-29 14:56:35', 1, '2022-04-29 14:56:35');

-- ----------------------------
-- Table structure for tb_worker
-- ----------------------------
DROP TABLE IF EXISTS `tb_worker`;
CREATE TABLE `tb_worker`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `workNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `workname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '职工名称',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别：0：男，1：女',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `roleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色',
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态，0：正常，1：失效',
  `isAssess` int NULL DEFAULT 0 COMMENT '是否已评价0：否，1：是',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除，0：正常，2:   删除',
  `loginTime` date NULL DEFAULT NULL COMMENT '登录日期',
  `createId` int NULL DEFAULT NULL COMMENT '创建Id',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateId` int NULL DEFAULT NULL COMMENT '修改Id',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_worker
-- ----------------------------
INSERT INTO `tb_worker` VALUES (1, 'admin', 'admin', '管理员', '1', '12345665411', '1', '1', 1, 0, '2022-06-05', 1, '2022-03-07 21:28:06', 1, '2022-06-05 01:20:58');
INSERT INTO `tb_worker` VALUES (2, 'admin1', 'admin1', '徐医生', '0', '18888888', '2', '1', 1, 0, '2022-06-05', 1, '2022-03-07 21:28:06', 2, '2022-06-05 01:21:52');
INSERT INTO `tb_worker` VALUES (3, 'admin2', 'admin', '沈医生', '1', '123456789', '2', '1', 0, 0, '2022-06-03', 1, '2022-03-07 21:28:06', 1, '2022-04-01 10:13:12');
INSERT INTO `tb_worker` VALUES (4, 'admin3', 'admin', '秦医生', '0', '300002222', '2', '1', 0, 0, '2022-06-04', 1, '2022-03-31 09:31:06', 14, '2022-03-31 22:08:44');
INSERT INTO `tb_worker` VALUES (5, 'admin4', 'admin', '王医生', '0', '77777777', '2', '1', 1, 0, '2022-06-02', 1, '2022-03-31 09:35:54', 1, '2022-04-01 10:13:23');
INSERT INTO `tb_worker` VALUES (6, 'admin5', 'admin', '员工1', '0', '11111111', '3', '0', 1, 0, '2022-06-03', 1, '2022-03-31 09:37:12', 1, '2022-04-02 16:56:23');
INSERT INTO `tb_worker` VALUES (7, 'admin6', 'admin', '员工2', '1', '96357801', '3', '1', 0, 0, '2022-06-05', 1, '2022-03-31 09:37:12', 1, '2022-04-02 14:29:55');
INSERT INTO `tb_worker` VALUES (8, 'admin7', 'admin', '员工3', '0', '888888888', '3', '1', 1, 0, '2022-06-06', 1, '2022-03-31 09:37:12', 1, '2022-04-07 21:22:50');
INSERT INTO `tb_worker` VALUES (9, 'admin8', 'admin', '员工4', '0', '122222222', '3', '0', 0, 1, '2022-06-08', 1, '2022-03-31 09:37:12', 1, '2022-05-16 12:54:39');
INSERT INTO `tb_worker` VALUES (10, 'admin9', 'admin', '员工5', '0', '999999999', '3', '0', 0, 0, '2022-06-07', 1, '2022-03-31 09:39:48', 1, '2022-04-01 10:15:26');
INSERT INTO `tb_worker` VALUES (11, 'admin10', 'admin', '员工6', '0', '15951055308', '3', '0', 0, 0, '2022-06-09', 1, '2022-03-31 09:40:34', 1, '2022-04-01 10:15:43');
INSERT INTO `tb_worker` VALUES (12, 'admin11', 'admin', '员工7', '1', '17355308441', '3', '0', 0, 0, '2022-06-08', 1, '2022-03-31 09:40:15', 1, '2022-04-01 10:16:13');
INSERT INTO `tb_worker` VALUES (13, 'admin12', 'admin', '员工8', '1', '996969635', '3', '0', 0, 0, '2022-06-07', 1, '2022-03-31 09:43:41', 1, '2022-04-01 10:17:11');
INSERT INTO `tb_worker` VALUES (14, 'admin001', 'admin123', '管理者2', '0', '188502165', '1', '1', 0, 1, '2022-06-03', 1, '2022-03-31 15:02:00', 1, '2022-05-11 21:41:42');
INSERT INTO `tb_worker` VALUES (15, 'admin14', 'admin', '李医生', '1', '199030201', '2', '1', 0, 0, '2022-06-08', 0, '2022-04-01 13:23:00', 1, '2022-05-12 09:44:26');
INSERT INTO `tb_worker` VALUES (16, 'admin16', '123456', '员工甲', '0', '22222222', '3', '0', 0, 0, '2022-06-07', 0, '2022-04-10 21:22:47', 0, '2022-04-10 21:22:47');
INSERT INTO `tb_worker` VALUES (17, 'H001', '123456', '夏医生', '0', '1735546985', '2', '1', 0, 0, '2022-06-08', 0, '2022-05-12 10:07:26', 1, '2022-05-12 10:14:10');
INSERT INTO `tb_worker` VALUES (18, 'D001', '123456', '陈医生', '1', '80003156', '2', '1', 0, 0, '2022-06-09', 0, '2022-05-12 10:14:01', 1, '2022-05-12 10:14:11');
INSERT INTO `tb_worker` VALUES (19, 'YS2001', 'admin', '赵医生', '0', '3210551999', '2', '1', 0, 0, '2022-06-06', 0, '2022-05-20 13:11:36', 1, '2022-05-20 13:11:42');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '男', '123456', '123@qq.com', '11111111111', '001', '用户', 1, '');
INSERT INTO `user` VALUES (2, 'admin001', '女', '888888', '456@qq.com', '22222222222', '002', '管理员', 1, '');
INSERT INTO `user` VALUES (3, '你好', '女', '777777', 'qwe@qq.com', '33333333333', '003', '用户', 1, '');
INSERT INTO `user` VALUES (4, 'angrybirds', '武装直升机', '321654', 'aaaa@163.com', '55555555555', '004', '用户', 0, '');
INSERT INTO `user` VALUES (5, 'bagayaru', '沃尔玛购物袋', 'hamburger', 'dabendan@erhuo.com', '44444444444', '005', '用户', 0, '');
INSERT INTO `user` VALUES (6, '不写每次还得重写', '男', '反正写啥也看不见随便写吧', 'hahahahahahaha', '16603808798', '006', '管理员', 1, '');
INSERT INTO `user` VALUES (7, '生命因何而沉睡', '女', '因为害怕从梦中醒来', '若我不曾见过太阳', '12312341234', '006', '管理员', 1, '');
INSERT INTO `user` VALUES (8, '真的会被自己蠢哭', '不被定义', '1555555555555', '害只剩叹气我真的', '32132143214', '006', '用户', 0, '');
INSERT INTO `user` VALUES (25, 'a', '小南娘', '123456', '※喵', '66666666666', '006', '用户', 1, 'https://bpic.51yuansu.com/pic2/cover/00/35/43/58119f542530c_610.jpg');
INSERT INTO `user` VALUES (26, '2233', '女', '123456', 'gaopwchitu@gmail.com', '13613809789', '005', '用户', 0, 'https://bpic.51yuansu.com/pic2/cover/00/35/43/58119f542530c_610.jpg');

SET FOREIGN_KEY_CHECKS = 1;

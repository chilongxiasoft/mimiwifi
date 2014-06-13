-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 06 月 13 日 07:35
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `mimiyun`
--
CREATE DATABASE IF NOT EXISTS `mimiyun` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mimiyun`;

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_action`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `mimi_yun_action`
--

INSERT INTO `mimi_yun_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '用户登录系统', '', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1396424613),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, -1, 1396424313),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, -1, 1396424327),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, -1, 1396424331),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, -1, 1396424337),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, -1, 1396424532),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, -1, 1396424544),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, -1, 1396424391),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, -1, 1396424398);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_action_log`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=230 ;

--
-- 转存表中的数据 `mimi_yun_action_log`
--

INSERT INTO `mimi_yun_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(92, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396831284),
(93, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396831384),
(94, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-07 18:03登录了后台', 1, 1396865032),
(95, 10, 1, 2130706433, 'Menu', 0, '操作url：/Menu/del/id/36.html', 1, 1396868981),
(96, 10, 1, 2130706433, 'Menu', 0, '操作url：/Menu/del/id/40.html', 1, 1396868985),
(97, 10, 1, 2130706433, 'Menu', 52, '操作url：/Menu/edit.html', 1, 1396871935),
(98, 10, 1, 2130706433, 'Menu', 52, '操作url：/Menu/edit.html', 1, 1396871949),
(99, 10, 1, 2130706433, 'Menu', 0, '操作url：/Menu/del.html', 1, 1396876320),
(100, 10, 1, 2130706433, 'Menu', 29, '操作url：/Menu/edit.html', 1, 1396881740),
(101, 10, 1, 2130706433, 'Menu', 29, '操作url：/Menu/edit.html', 1, 1396881767),
(102, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396885671),
(103, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396885979),
(104, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396886042),
(105, 10, 1, 2130706433, 'Menu', 3, '操作url：/Menu/edit.html', 1, 1396886077),
(106, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del/id/29.html', 1, 1396888709),
(107, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del/id/22.html', 1, 1396888717),
(108, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del/id/28.html', 1, 1396888767),
(109, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del/id/21.html', 1, 1396888772),
(110, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del.html', 1, 1396890070),
(111, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del.html', 1, 1396890166),
(112, 6, 1, 2130706433, 'config', 0, '操作url：/Config/del.html', 1, 1396890180),
(113, 10, 1, 2130706433, 'Menu', 2, '操作url：/Menu/edit.html', 1, 1396897259),
(114, 10, 1, 2130706433, 'Menu', 56, '操作url：/Menu/add.html', 1, 1396897461),
(115, 10, 1, 2130706433, 'Menu', 0, '操作url：/Menu/del.html', 1, 1396897502),
(116, 6, 1, 2130706433, 'config', 33, '操作url：/Config/edit.html', 1, 1396898875),
(117, 10, 1, 2130706433, 'Menu', 57, '操作url：/Menu/edit.html', 1, 1396902502),
(118, 10, 1, 2130706433, 'Menu', 1, '操作url：/Menu/edit.html', 1, 1396903537),
(119, 10, 1, 2130706433, 'Menu', 58, '操作url：/Menu/edit.html', 1, 1396905944),
(120, 1, 3, 2130706433, 'member', 3, '用户在2014-04-08 06:05登录了后台', 1, 1396908352),
(121, 1, 2, 2130706433, 'member', 2, '代理商在2014-04-08 06:06登录了后台', 1, 1396908370),
(122, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-08 06:17登录了后台', 1, 1396909072),
(123, 10, 1, 2130706433, 'Menu', 28, '操作url：/Menu/edit.html', 1, 1396915425),
(124, 10, 1, 2130706433, 'Menu', 77, '操作url：/Menu/add.html', 1, 1396915519),
(125, 10, 1, 2130706433, 'Menu', 78, '操作url：/Menu/add.html', 1, 1396915629),
(126, 10, 1, 2130706433, 'Menu', 78, '操作url：/Menu/edit.html', 1, 1396915654),
(127, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-08 08:44登录了后台', 1, 1396917866),
(128, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-08 11:33登录了后台', 1, 1396928009),
(129, 10, 1, 2130706433, 'Menu', 0, '操作url：/Menu/del.html', 1, 1396969049),
(130, 10, 1, 2130706433, 'Menu', 47, '操作url：/Menu/edit.html', 1, 1396969203),
(131, 10, 1, 2130706433, 'Menu', 46, '操作url：/Menu/edit.html', 1, 1396969213),
(132, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 02:47登录了后台', 1, 1396982834),
(133, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 03:15登录了后台', 1, 1396984553),
(134, 10, 1, 2130706433, 'Menu', 87, '操作url：/Menu/add.html', 1, 1396984652),
(135, 10, 1, 2130706433, 'Menu', 47, '操作url：/Menu/edit.html', 1, 1396989444),
(136, 10, 1, 2130706433, 'Menu', 47, '操作url：/Menu/edit.html', 1, 1396989460),
(137, 10, 1, 2130706433, 'Menu', 47, '操作url：/Menu/edit.html', 1, 1396989484),
(138, 10, 1, 2130706433, 'Menu', 46, '操作url：/Menu/edit.html', 1, 1396989562),
(139, 10, 1, 2130706433, 'Menu', 46, '操作url：/Menu/edit.html', 1, 1396989592),
(140, 10, 1, 2130706433, 'Menu', 46, '操作url：/Menu/edit.html', 1, 1396989632),
(141, 10, 1, 2130706433, 'Menu', 46, '操作url：/Menu/edit.html', 1, 1396989769),
(142, 6, 1, 2130706433, 'config', 37, '操作url：/Config/edit.html', 1, 1397000023),
(143, 10, 1, 2130706433, 'Menu', 35, '操作url：/Menu/add.html', 1, 1397017235),
(144, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 20:55登录了后台', 1, 1397048112),
(145, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 20:56登录了后台', 1, 1397048162),
(146, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 21:00登录了后台', 1, 1397048414),
(147, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 21:03登录了后台', 1, 1397048613),
(148, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-09 23:44登录了后台', 1, 1397058251),
(149, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-10 05:29登录了后台', 1, 1397078952),
(150, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-10 19:57登录了后台', 1, 1397131061),
(151, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-10 22:36登录了后台', 1, 1397140604),
(152, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-10 22:52登录了后台', 1, 1397141534),
(153, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-11 06:34登录了后台', 1, 1397169284),
(154, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-12 00:22登录了后台', 1, 1397233368),
(155, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-12 11:23登录了后台', 1, 1397273039),
(156, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-13 08:14登录了后台', 1, 1397348065),
(157, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-13 08:22登录了后台', 1, 1397348562),
(158, 1, 1, 2130706433, 'member', 1, '管理员在2014-04-13 11:49登录了后台', 1, 1397360984),
(159, 1, 1, 1904873932, 'member', 1, '管理员在2014-04-14 09:48登录了后台', 1, 1397440090),
(160, 1, 1, 1904873932, 'member', 1, '管理员在2014-04-14 09:57登录了后台', 1, 1397440620),
(161, 1, 1, 1904873932, 'member', 1, '管理员在2014-04-14 12:25登录了后台', 1, 1397449506),
(162, 1, 1, 606956848, 'member', 1, '管理员在2014-04-14 19:42登录了后台', 1, 1397475741),
(163, 1, 1, 3730528370, 'member', 1, '管理员在2014-04-14 23:27登录了后台', 1, 1397489272),
(164, 1, 1, 1694571481, 'member', 1, '管理员在2014-04-16 18:57登录了后台', 1, 1397645854),
(165, 1, 1, 607067122, 'member', 1, '管理员在2014-04-16 22:10登录了后台', 1, 1397657440),
(166, 1, 1, 3056242561, 'member', 1, '管理员在2014-04-17 01:01登录了后台', 1, 1397667677),
(167, 1, 1, 1859731148, 'member', 1, '管理员在2014-04-17 09:38登录了后台', 1, 1397698696),
(168, 1, 1, 1965296062, 'member', 1, '管理员在2014-04-17 17:04登录了后台', 1, 1397725466),
(169, 1, 1, 3074417400, 'member', 1, '管理员在2014-04-18 11:05登录了后台', 1, 1397790352),
(170, 1, 1, 3683718484, 'member', 1, '管理员在2014-04-18 16:10登录了后台', 1, 1397808640),
(171, 1, 1, 2416748215, 'member', 1, '管理员在2014-04-19 19:46登录了后台', 1, 1397907986),
(172, 1, 1, 1859728009, 'member', 1, '管理员在2014-04-20 10:33登录了后台', 1, 1397961239),
(173, 1, 1, 1859728009, 'member', 1, '管理员在2014-04-20 11:17登录了后台', 1, 1397963849),
(174, 1, 1, 1859730283, 'member', 1, '管理员在2014-04-22 08:59登录了后台', 1, 1398128367),
(175, 1, 1, 2087953777, 'member', 1, '管理员在2014-04-22 09:07登录了后台', 1, 1398128836),
(176, 1, 1, 2074811231, 'member', 1, '管理员在2014-04-22 17:16登录了后台', 1, 1398158210),
(177, 1, 1, 607098542, 'member', 1, '管理员在2014-04-22 22:29登录了后台', 1, 1398176964),
(178, 1, 1, 22316680, 'member', 1, '管理员在2014-04-24 01:57登录了后台', 1, 1398275829),
(179, 1, 1, 1859728845, 'member', 1, '管理员在2014-04-24 15:34登录了后台', 1, 1398324861),
(180, 1, 1, 3683682328, 'member', 1, '管理员在2014-04-26 11:12登录了后台', 1, 1398481934),
(181, 1, 1, 1965296374, 'member', 1, '管理员在2014-04-26 18:19登录了后台', 1, 1398507543),
(182, 1, 1, 2047284964, 'member', 1, '管理员在2014-04-28 12:50登录了后台', 1, 1398660637),
(183, 1, 1, 1859729722, 'member', 1, '管理员在2014-05-01 17:55登录了后台', 1, 1398938108),
(184, 1, 1, 2416747151, 'member', 1, '管理员在2014-05-03 13:03登录了后台', 1, 1399093397),
(185, 1, 1, 1859728365, 'member', 1, '管理员在2014-05-04 09:43登录了后台', 1, 1399167817),
(186, 1, 1, 22307867, 'member', 1, '管理员在2014-05-05 03:56登录了后台', 1, 1399233382),
(187, 1, 1, 3056013476, 'member', 1, '管理员在2014-05-06 18:18登录了后台', 1, 1399371519),
(188, 1, 1, 1698983129, 'member', 1, '管理员在2014-05-07 12:55登录了后台', 1, 1399438555),
(193, 1, 1, 465167656, 'member', 1, '管理员在2014-05-15 16:18登录了后台', 1, 1400141904),
(196, 1, 1, 3725726815, 'member', 1, '管理员在2014-05-19 21:50登录了后台', 1, 1400507407),
(194, 1, 1, 2047286046, 'member', 1, '管理员在2014-05-17 22:22登录了后台', 1, 1400336544),
(195, 1, 1, 465172035, 'member', 1, '管理员在2014-05-19 10:49登录了后台', 1, 1400467780),
(197, 1, 1, 3725726815, 'member', 1, '管理员在2014-05-19 22:06登录了后台', 1, 1400508396),
(198, 1, 1, 22307926, 'member', 1, '管理员在2014-05-21 04:14登录了后台', 1, 1400616882),
(200, 1, 1, 1859727906, 'member', 1, '管理员在2014-05-27 19:09登录了后台', 1, 1401188969),
(201, 1, 1, 3725726811, 'member', 1, '管理员在2014-05-27 19:19登录了后台', 1, 1401189545),
(202, 1, 1, 606613571, 'member', 1, '管理员在2014-05-28 23:11登录了后台', 1, 1401289909),
(203, 1, 1, 606613571, 'member', 1, '管理员在2014-05-29 23:23登录了后台', 1, 1401377022),
(204, 1, 1, 606613571, 'member', 1, '管理员在2014-05-29 23:26登录了后台', 1, 1401377164),
(205, 1, 1, 606613571, 'member', 1, '管理员在2014-05-30 04:44登录了后台', 1, 1401396274),
(206, 1, 1, 606613571, 'member', 1, '管理员在2014-05-30 07:22登录了后台', 1, 1401405745),
(207, 1, 1, 22311768, 'member', 1, '管理员在2014-05-30 08:07登录了后台', 1, 1401408470),
(213, 1, 1, 1859728609, 'member', 1, '管理员在2014-06-03 16:46登录了后台', 1, 1401785176),
(214, 1, 1, 1859727443, 'member', 1, '管理员在2014-06-06 08:33登录了后台', 1, 1402014834),
(215, 1, 1, 3735568883, 'member', 1, '管理员在2014-06-06 08:55登录了后台', 1, 1402016152),
(216, 1, 1, 1780758064, 'member', 1, '管理员在2014-06-07 22:10登录了后台', 1, 1402150221),
(217, 1, 1, 1898712812, 'member', 1, '管理员在2014-06-07 22:13登录了后台', 1, 1402150388),
(218, 1, 1, 1780758064, 'member', 1, '管理员在2014-06-07 22:14登录了后台', 1, 1402150453),
(219, 1, 1, 1908984960, 'member', 1, '管理员在2014-06-07 22:46登录了后台', 1, 1402152398),
(220, 1, 1, 3546620994, 'member', 1, '管理员在2014-06-07 23:07登录了后台', 1, 1402153661),
(221, 1, 1, 3546620994, 'member', 1, '管理员在2014-06-07 23:29登录了后台', 1, 1402154977),
(222, 1, 1, 607111891, 'member', 1, '管理员在2014-06-08 11:35登录了后台', 1, 1402198516),
(223, 1, 1, 1904663006, 'member', 1, '管理员在2014-06-08 13:56登录了后台', 1, 1402206973),
(224, 1, 1, 1904495448, 'member', 1, '管理员在2014-06-08 14:46登录了后台', 1, 1402209995),
(225, 1, 1, 1905108517, 'member', 1, '管理员在2014-06-09 08:16登录了后台', 1, 1402273019),
(226, 1, 1, 1859729016, 'member', 1, '管理员在2014-06-09 10:03登录了后台', 1, 1402279412),
(227, 1, 1, 2073984432, 'member', 1, '管理员在2014-06-09 10:30登录了后台', 1, 1402281054),
(228, 1, 1, 2130706433, 'member', 1, '管理员在2014-06-12 08:49登录了后台', 1, 1402534163),
(229, 1, 1, 2130706433, 'member', 1, '管理员在2014-06-13 14:31登录了后台', 1, 1402641099);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_attachment`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_auth_extend`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_auth_group`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mimi_yun_auth_group`
--

INSERT INTO `mimi_yun_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'home', 1, 'user', '用户', 1, ''),
(2, 'home', 1, 'agent', '代理商', 1, ''),
(3, 'home', 1, 'administrator', '管理员', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mimi_yun_auth_group_access`
--

INSERT INTO `mimi_yun_auth_group_access` (`uid`, `group_id`) VALUES
(8, 1),
(11, 1),
(21, 1),
(22, 2),
(23, 2),
(23, 3),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(26, 3);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_auth_rule`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `mimi_yun_auth_rule`
--

INSERT INTO `mimi_yun_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'home', 1, 'Home/User/index', '我的资料', 1, ''),
(2, 'home', 1, 'Home/AuthManager/index', '权限管理', 1, ''),
(3, 'home', 1, 'Home/User/add', '添加代理商', 1, ''),
(4, 'home', 1, 'Home/Device/index', '设备列表', 1, ''),
(5, 'home', 1, 'Home/Device/add', '添加设备', 1, ''),
(6, 'home', 1, 'Home/Node/index', '应用点列表', 1, ''),
(7, 'home', 1, 'Home/Node/add', '添加应用点', 1, ''),
(8, 'home', 1, 'Home/Cloud/index', '云认证列表', 1, ''),
(9, 'home', 1, 'Home/Cloud/add', '添加云认证', 1, ''),
(10, 'home', 1, 'Home/Ads/index', '广告列表', 1, ''),
(11, 'home', 1, 'Home/Ads/add', '添加广告', 1, ''),
(12, 'home', 1, 'Home/Report/index', '统计设置', 1, ''),
(13, 'home', 1, 'Home/Config/group', '系统设置', 1, ''),
(14, 'home', 1, 'Home/Config/index', '配置管理', 1, ''),
(15, 'home', 1, 'Home/Menu/index', '菜单管理', 1, ''),
(16, 'home', 1, 'Home/Action/actionlog', '操作日志', 1, ''),
(17, 'home', 1, 'Home/User/action', '操作日志配置', 1, ''),
(18, 'home', 1, 'Home/View/index', '认证页模板', 1, ''),
(19, 'home', 1, 'Home/Sms/index', '短信配额', 1, ''),
(20, 'home', 1, 'Home/Pay/index', '财务记录', 1, ''),
(21, 'home', 2, 'Home/Index/', '首页', 1, ''),
(22, 'home', 2, 'Home/Device/index', '设备', 1, ''),
(23, 'home', 2, 'Home/Node/index', '应用点', 1, ''),
(24, 'home', 2, 'Home/Cloud/index', '云认证', 1, ''),
(25, 'home', 2, 'Home/Ads/index', '广告', 1, ''),
(26, 'home', 2, 'Home/Report/index', '统计报告', 1, ''),
(27, 'home', 2, 'Home/User/index', '用户', 1, ''),
(28, 'home', 2, 'Home/Pay/index', '财务', 1, ''),
(29, 'home', 2, 'Home/Menu/index', '系统', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_cloud`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_cloud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `name` char(32) NOT NULL COMMENT '应用点名称',
  `fullname` char(255) NOT NULL DEFAULT '' COMMENT '序列号',
  `about` char(255) NOT NULL COMMENT '版本',
  `logo` char(32) NOT NULL DEFAULT '' COMMENT '网关IP',
  `tel` char(32) NOT NULL DEFAULT '' COMMENT '当前WANIP',
  `address` char(255) NOT NULL,
  `website` char(255) NOT NULL,
  `linkman` char(255) NOT NULL,
  `linkman_qq` char(255) NOT NULL,
  `linkman_mobile` char(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='云认证表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_config`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `mimi_yun_config`
--

INSERT INTO `mimi_yun_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'blue_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:用户\r\n3:系统', 4),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1396898875, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 1, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1397000023, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_device`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `mac` char(50) DEFAULT NULL COMMENT 'MAC地址',
  `sn` char(32) DEFAULT '' COMMENT '序列号',
  `version` char(32) DEFAULT NULL COMMENT '版本',
  `gw_ip` char(20) DEFAULT NULL COMMENT '网关IP',
  `wan_ip` bigint(20) DEFAULT NULL COMMENT '当前接入IP',
  `gw_port` int(10) DEFAULT NULL COMMENT '路由器WAN 管理端口',
  `vpn_cip` bigint(20) DEFAULT NULL COMMENT 'VPN客户端的IP地址',
  `usrnum` int(10) DEFAULT NULL COMMENT '在线认证人数',
  `datas` mediumtext COMMENT '用户的上网信息',
  `last_utime` int(10) DEFAULT NULL COMMENT '后最更新运行数据时间',
  `node_id` int(10) DEFAULT NULL COMMENT '所属应用点ID',
  `cloud_id` int(10) DEFAULT NULL COMMENT '云认证ID',
  `add_uid` int(10) DEFAULT NULL COMMENT '加添人UID',
  `uid` int(10) DEFAULT NULL COMMENT '所属用户ID',
  `agent_id` int(10) DEFAULT NULL COMMENT '所属代理商ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `mark` mediumtext COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '会员状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='设备表' AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `mimi_yun_device`
--

INSERT INTO `mimi_yun_device` (`id`, `mac`, `sn`, `version`, `gw_ip`, `wan_ip`, `gw_port`, `vpn_cip`, `usrnum`, `datas`, `last_utime`, `node_id`, `cloud_id`, `add_uid`, `uid`, `agent_id`, `add_time`, `mark`, `status`) VALUES
(1, '00:55:55:55:56:78:87', '55658', '', '192.168.118.1', NULL, 80, NULL, NULL, '', NULL, NULL, NULL, NULL, 3, NULL, NULL, '', 1),
(2, '00-65-56-89-89-98-89', '5687w', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1),
(4, '88-89-87-65-48-89-98', 'd123', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, NULL, NULL, '', 1),
(5, '88-89-87-88-89-87-62', 'asd12', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, NULL, NULL, '', 1),
(10, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(11, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(12, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(13, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(14, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(15, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(16, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(17, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(18, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(19, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(20, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(21, '123123', '123123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(22, 'qweqwe', 'qweqwe', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(23, 'qweqwe', '123123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1),
(24, 'asdasd12', '32123123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_file`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_hb`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_hb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gwmac` varchar(100) CHARACTER SET utf8 NOT NULL,
  `gwaddr` varchar(15) CHARACTER SET utf8 NOT NULL,
  `usrnum` int(11) DEFAULT NULL,
  `device_status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mimi_yun_hb`
--

INSERT INTO `mimi_yun_hb` (`id`, `gwmac`, `gwaddr`, `usrnum`, `device_status`) VALUES
(1, 'c8:3a:35:29:bc:80', '192.168.1.10', NULL, 0),
(2, 'c8:3a:35:29:bc:8', '192.168.1.10', 0, 0),
(3, 'c8:3a:35:29:bc:8', '192.168.1.10', 0, 0),
(4, 'c8:3a:35:29:bc:8', '192.168.1.10', 10, 0),
(5, 'c8:3a:35:29:bc:80', '192.168.1.10', 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_member`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `usertype` tinyint(4) NOT NULL COMMENT '户用类型',
  `nickname` char(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `email` char(32) NOT NULL DEFAULT '' COMMENT 'email',
  `mobile` char(12) NOT NULL DEFAULT '',
  `qq` char(12) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_uid` int(10) DEFAULT NULL COMMENT '注册人uid',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `mimi_yun_member`
--

INSERT INTO `mimi_yun_member` (`uid`, `username`, `password`, `usertype`, `nickname`, `email`, `mobile`, `qq`, `login`, `reg_uid`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '5e7e27821648636b2afd7a80d4c39738', 3, '管理员', '', '123123', '123123', 143, NULL, 2130706433, 1396548697, 2130706433, 1402641099, 1),
(2, 'agent', '5e7e27821648636b2afd7a80d4c39738', 2, '代理商', '', '123123', '123123', 4, NULL, 0, 0, 2130706433, 1396908370, 1),
(3, 'user', '5e7e27821648636b2afd7a80d4c39738', 1, '用户', '', '123123', '12123123', 3, NULL, 0, 0, 2130706433, 1396908352, 1),
(9, 'asdasd21', 'eb3aebb90518a675af90e320891e82c5', 1, '', '122333@qq.com', '123123123123', '123123123', 0, NULL, 2130706433, 1396551552, 0, 0, 1),
(8, 'sjjjalksjd', 'eb3aebb90518a675af90e320891e82c5', 1, 'sjjjalksjd', 'lkajsd@mi.com', '123123', '234234', 0, NULL, 2130706433, 1396550173, 0, 0, 1),
(32, '123', '', 0, 'asdasd', 'asdasd', '123123123', '', 0, NULL, 0, 0, 0, 0, 0),
(11, 'usdser', '5e7e27821648636b2afd7a80d4c39738', 3, '用户', '', '123123', '234234', 2, NULL, 0, 0, 2130706433, 1396599567, 1),
(12, 'assddasd21', 'eb3aebb90518a675af90e320891e82c5', 1, '', '122333@qq.com', '123123123123', '123123123', 0, NULL, 2130706433, 1396551552, 0, 0, 1),
(13, 'sjsdjjalksjd', 'eb3aebb90518a675af90e320891e82c5', 1, 'sjjjalksjd', 'lkajsd@mi.com', '123123', '1231233', 0, NULL, 2130706433, 1396550173, 0, 0, 1),
(14, '12sd3123', 'eb3aebb90518a675af90e320891e82c5', 1, '123123', '123123123@qq.com', '123', '2345345', 2, NULL, 2130706433, 1396592971, 2130706433, 1396595111, 1),
(21, 'sjsdjjalksjd', 'eb3aebb90518a675af90e320891e82c5', 1, 'sjjjalksjd', 'lkajsd@mi.com', '32123123', '234234', 0, NULL, 2130706433, 1396550173, 0, 0, 1),
(22, '12sd3123', 'eb3aebb90518a675af90e320891e82c5', 1, '123123', '123123123@qq.com', '123', '234345', 2, NULL, 2130706433, 1396592971, 2130706433, 1396595111, 1),
(23, 'usdser', '5e7e27821648636b2afd7a80d4c39738', 3, '用户', '', '123123', '345', 2, NULL, 0, 0, 2130706433, 1396599567, 1),
(24, 'assddasd21', 'eb3aebb90518a675af90e320891e82c5', 1, '', '122333@qq.com', '123123123123', '123123123', 0, NULL, 2130706433, 1396551552, 0, 0, 0),
(25, 'sjsdjjalksjd', 'eb3aebb90518a675af90e320891e82c5', 1, 'sjjjalksjd', 'lkajsd@mi.com', '123123', '234234', 0, NULL, 2130706433, 1396550173, 0, 0, 0),
(26, '12sd3123', 'eb3aebb90518a675af90e320891e82c5', 2, '123123', '123123123@qq.com', '123', '345345', 2, NULL, 2130706433, 1396592971, 2130706433, 1396595111, 1),
(33, '西安勾股信息科技有限公司', '', 0, 'pythagoras', 'admin@pythagorastech.com', '18161980116', '651205932', 0, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_menu`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '标图',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='菜单表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `mimi_yun_menu`
--

INSERT INTO `mimi_yun_menu` (`id`, `title`, `pid`, `sort`, `url`, `icon`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/', '', 1, '', '', 0),
(2, '用户', 0, 7, 'User/index', '', 0, '', '', 0),
(3, '设备', 0, 2, 'Device/index', '', 0, '', '', 0),
(4, '应用点', 0, 3, 'Node/index', '', 0, '', '', 0),
(5, '云认证', 0, 4, 'Cloud/index', '', 0, '', '', 0),
(6, '广告', 0, 5, 'Ads/index', '', 0, '', '', 0),
(7, '统计报告', 0, 6, 'Report/index', '', 0, '', '', 0),
(8, '系统', 0, 9, 'Menu/index', '', 0, '', '', 0),
(9, '用户列表', 2, 0, 'User/index', '', 0, '', '用户中心', 0),
(10, '权限管理', 2, 0, 'AuthManager/index', '', 0, '', '用户中心', 0),
(11, '我的资料', 2, 0, 'User/index', '', 0, '', '用户中心', 0),
(12, '添加用户', 2, 0, 'User/add', '', 0, '', '用户中心', 0),
(13, '添加代理商', 2, 0, 'User/add', '', 0, '', '用户中心', 0),
(14, '设备列表', 5, 0, 'Device/index', '', 0, '', '云路由管理', 0),
(15, '添加设备', 5, 0, 'Device/add', '', 0, '', '云路由管理', 0),
(16, '应用点列表', 5, 0, 'Node/index', '', 0, '', '云路由管理', 0),
(17, '添加应用点', 5, 0, 'Node/add', '', 0, '', '云路由管理', 0),
(18, '云认证列表', 5, 0, 'Cloud/index', '', 0, '', '云路由管理', 0),
(19, '添加云认证', 5, 0, 'Cloud/add', '', 0, '', '云路由管理', 0),
(20, '广告列表', 6, 0, 'Ads/index', '', 0, '', '广告管理', 0),
(21, '添加广告', 6, 0, 'Ads/add', '', 0, '', '广告管理', 0),
(22, '统计总览', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(23, '微信登录统计', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(24, 'QQ登录统计', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(25, '微博登录统计', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(26, '手机验证登录统计', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(27, '统计设置', 7, 0, 'Report/index', '', 0, '', '统计报告', 0),
(28, '系统设置', 8, 0, 'Config/group', '', 0, '', '系统设置', 0),
(29, '配置管理', 8, 0, 'Config/index', '', 0, '', '系统设置', 0),
(30, '菜单管理', 8, 0, 'Menu/index', '', 0, '', '系统设置', 0),
(31, '操作日志', 8, 0, 'Action/actionlog', '', 0, '', '系统设置', 0),
(32, '操作日志配置', 8, 0, 'User/action', '', 0, '', '系统设置', 0),
(33, '认证页模板', 5, 0, 'View/index', '', 0, '', '云路由管理', 0),
(34, '短信配额', 5, 0, 'Sms/index', '', 0, '', '云路由管理', 0),
(35, '财务', 0, 8, 'Pay/index', '', 0, '', '财务中心', 0),
(36, '财务中心', 35, 0, 'Pay/index', '', 0, '', '财务中心', 0),
(37, '在线支付', 35, 0, 'Pay/index', '', 0, '', '财务中心', 0),
(38, '财务记录', 35, 0, 'Pay/index', '', 0, '', '财务中心', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_node`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用点ID',
  `pid` int(10) NOT NULL COMMENT '上级ID',
  `uid` int(10) DEFAULT NULL COMMENT '所属用户UID',
  `title` char(32) DEFAULT NULL COMMENT '应用点名称',
  `fullname` char(255) DEFAULT '' COMMENT '全称',
  `class` tinyint(4) DEFAULT NULL COMMENT '行业分类',
  `area` tinyint(4) DEFAULT NULL COMMENT '地理位置',
  `about` char(255) DEFAULT NULL COMMENT '简介',
  `logo` char(32) DEFAULT '' COMMENT 'LOGO',
  `tel` char(32) DEFAULT '' COMMENT '电话',
  `address` char(255) DEFAULT NULL COMMENT '地理位置',
  `website` char(255) DEFAULT NULL COMMENT '网站',
  `linkman` char(255) DEFAULT NULL COMMENT '联系人',
  `linkman_qq` char(255) DEFAULT NULL COMMENT '联系人QQ',
  `linkman_mobile` char(255) DEFAULT NULL COMMENT '联系人手机',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='应用点表' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `mimi_yun_node`
--

INSERT INTO `mimi_yun_node` (`id`, `pid`, `uid`, `title`, `fullname`, `class`, `area`, `about`, `logo`, `tel`, `address`, `website`, `linkman`, `linkman_qq`, `linkman_mobile`, `add_time`, `status`) VALUES
(1, 0, NULL, '测试应用点', '测试一下子', NULL, NULL, '西安睿智电子科技', '', '13659239977', '西安', '', '朱泽', '592358', '13659239977', 0, 0),
(24, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(23, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(22, 0, NULL, 'asaas', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(21, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(20, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(19, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(31, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(30, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(29, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(28, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(27, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(26, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0),
(25, 0, NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_picture`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mimi_yun_url`
--

CREATE TABLE IF NOT EXISTS `mimi_yun_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

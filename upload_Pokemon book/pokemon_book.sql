-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019 年 05 月 08 日 19:55
-- 伺服器版本: 10.1.29-MariaDB
-- PHP 版本： 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `pokemon book`
--

-- --------------------------------------------------------

--
-- 資料表結構 `image`
--

CREATE TABLE `image` (
  `編號` int(3) NOT NULL,
  `圖片名稱` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `image`
--

INSERT INTO `image` (`編號`, `圖片名稱`) VALUES
(1, '001.png'),
(2, '002.png'),
(3, '003.png'),
(4, '004.png'),
(5, '005.png'),
(6, '006.png'),
(7, '007.png'),
(8, '008.png'),
(9, '009.png');

-- --------------------------------------------------------

--
-- 資料表結構 `monsters`
--

CREATE TABLE `monsters` (
  `編號` int(3) NOT NULL,
  `名字` varchar(10) CHARACTER SET utf8 NOT NULL,
  `屬性` varchar(10) CHARACTER SET utf8 NOT NULL,
  `特性` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `monsters`
--

INSERT INTO `monsters` (`編號`, `名字`, `屬性`, `特性`) VALUES
(1, '妙蛙種子', '草/毒', '茂盛'),
(2, '妙蛙草', '草/毒', '茂盛'),
(3, '妙蛙花', '草/毒', '茂盛'),
(4, '小火龍', '火', '猛火'),
(5, '火恐龍', '火', '猛火'),
(6, '噴火龍', '火/飛行', '猛火'),
(7, '傑尼龜', '水', '激流'),
(8, '卡咪龜', '水', '激流'),
(9, '水箭龜', '水', '激流');

-- --------------------------------------------------------

--
-- 資料表結構 `skill`
--

CREATE TABLE `skill` (
  `編號` int(3) NOT NULL,
  `等級` varchar(10) CHARACTER SET utf8 NOT NULL,
  `招式` varchar(10) CHARACTER SET utf8 NOT NULL,
  `屬性` varchar(5) CHARACTER SET utf8 NOT NULL,
  `分類` varchar(5) CHARACTER SET utf8 NOT NULL,
  `威力` varchar(5) CHARACTER SET utf8 NOT NULL,
  `命中` varchar(5) CHARACTER SET utf8 NOT NULL,
  `PP` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `skill`
--

INSERT INTO `skill` (`編號`, `等級`, `招式`, `屬性`, `分類`, `威力`, `命中`, `PP`) VALUES
(3, '—', '花瓣舞', '草', '特殊', '120', '100', 10),
(3, '—', '撞擊', '一般', '物理', '40', '100', 35),
(3, '—', '叫聲', '一般', '變化', '—', '100', 40),
(3, '—', '寄生種子', '草', '變化', '—', '90', 10),
(3, '—', '藤鞭', '草', '物理', '45', '100', 25),
(3, '進化', '花瓣舞', '草', '特殊', '120', '100', 10),
(3, '3', '叫聲', '一般', '變化', '—', '100', 40),
(3, '7', '寄生種子', '草', '變化', '—', '90', 10),
(3, '9', '藤鞭', '草', '物理', '45', '100', 25),
(3, '13', '毒粉', '毒', '變化', '—', '75', 35),
(3, '13', '催眠粉', '草', '變化', '—', '75', 15),
(3, '15', '猛撞', '一般', '物理', '90', '85', 20),
(3, '20', '飛葉快刀', '草', '物理', '55', '95', 25),
(3, '23', '甜甜香氣', '一般', '變化', '—', '100', 20),
(3, '28', '生長', '一般', '變化', '—', '—', 20),
(3, '31', '捨身衝撞', '一般', '物理', '120', '100', 15),
(3, '39', '煩惱種子', '草', '變化', '—', '100', 10),
(3, '45', '光合作用', '草', '變化', '—', '—', 5),
(3, '50', '落英繽紛', '草', '物理', '90', '100', 15),
(3, '53', '日光束', '草', '特殊', '120', '100', 10),
(1, '—', '撞擊', '一般', '物理', '40', '100', 35),
(1, '3', '叫聲', '一般', '變化', '—', '100', 40),
(1, '7USUM', '寄生種子', '草', '變化', '—', '90', 10),
(1, '7SM', '藤鞭', '草', '物理', '45', '100', 25),
(1, '9', '藤鞭', '草', '物理', '45', '100', 25),
(1, '13', '毒粉', '毒', '變化', '—', '75', 35),
(1, '13', '催眠粉', '草', '變化', '—', '75', 15),
(1, '15', '猛撞', '一般', '物理', '90', '85', 20),
(1, '19', '飛葉快刀', '草', '物理', '55', '95', 25),
(1, '21', '甜甜香氣', '一般', '變化', '—', '100', 20),
(1, '25', '生長', '一般', '變化', '—', '—', 20),
(1, '27', '捨身衝撞', '一般', '物理', '120', '100', 15),
(1, '31', '煩惱種子', '草', '變化', '—', '100', 10),
(1, '33', '光合作用', '草', '變化', '—', '—', 5),
(1, '37', '種子炸彈', '草', '物理', '80', '100', 15),
(2, '—', '撞擊', '一般', '物理', '40', '100', 35),
(2, '—', '叫聲', '一般', '變化', '—', '100', 40),
(2, '—', '寄生種子', '草', '變化', '—', '90', 10),
(2, '3', '叫聲', '一般', '變化', '—', '100', 40),
(2, '7', '寄生種子', '草', '變化', '—', '90', 10),
(2, '9', '藤鞭', '草', '物理', '45', '100', 25),
(2, '13', '毒粉', '毒', '變化', '—', '75', 35),
(2, '13', '催眠粉', '草', '變化', '—', '75', 15),
(2, '15', '猛撞', '一般', '物理', '90', '85', 20),
(2, '20', '飛葉快刀', '草', '物理', '55', '95', 25),
(2, '23', '甜甜香氣', '一般', '變化', '—', '100', 20),
(2, '28', '生長', '一般', '變化', '—', '—', 20),
(2, '31', '捨身衝撞', '一般', '物理', '120', '100', 15),
(2, '36', '煩惱種子', '草', '變化', '—', '100', 10),
(2, '39', '光合作用', '草', '變化', '—', '—', 5),
(2, '44', '日光束', '草', '特殊', '120', '100', 10),
(4, '—', '抓', '一般', '物理', '40', '100', 35),
(4, '—', '叫聲', '一般', '變化', '—', '100', 40),
(4, '7', '火花', '火', '特殊', '40', '100', 25),
(4, '10', '煙幕', '一般', '變化', '—', '100', 20),
(4, '16', '龍之怒', '龍', '特殊', '變化', '100', 10),
(4, '19', '鬼面', '一般', '變化', '—', '100', 10),
(4, '25', '火焰牙', '火', '物理', '65', '95', 15),
(4, '28', '烈焰濺射', '火', '特殊', '70', '100', 15),
(4, '34', '劈開', '一般', '物理', '70', '100', 20),
(4, '37', '噴射火焰', '火', '特殊', '90', '100', 15),
(4, '43', '火焰旋渦', '火', '特殊', '35', '85', 15),
(4, '46', '煉獄', '火', '特殊', '100', '50', 5),
(5, '—', '抓', '一般', '物理', '40', '100', 35),
(5, '—', '叫聲', '一般', '變化', '—', '100', 40),
(5, '—', '火花', '火', '特殊', '40', '100', 25),
(5, '7', '火花', '火', '特殊', '40', '100', 25),
(5, '10', '煙幕', '一般', '變化', '—', '100', 20),
(5, '17', '龍之怒', '龍', '特殊', '變化', '100', 10),
(5, '21', '鬼面', '一般', '變化', '—', '100', 10),
(5, '28', '火焰牙', '火', '物理', '65', '95', 15),
(5, '32', '烈焰濺射', '火', '特殊', '70', '100', 15),
(5, '39', '劈開', '一般', '物理', '70', '100', 20),
(5, '43', '噴射火焰', '火', '特殊', '90', '100', 15),
(5, '50', '火焰旋渦', '火', '特殊', '35', '85', 15),
(5, '54', '煉獄', '火', '特殊', '100', '50', 5),
(6, '—', '翅膀攻擊', '飛行', '物理', '60', '100', 35),
(6, '—', '閃焰衝鋒', '火', '物理', '120', '100', 15),
(6, '—', '熱風', '火', '特殊', '95', '90', 10),
(6, '—', '龍爪', '龍', '物理', '80', '100', 15),
(6, '—', '暗影爪', '幽靈', '物理', '70', '100', 15),
(6, '—', '空氣斬', '飛行', '特殊', '75', '95', 15),
(6, '—', '抓', '一般', '物理', '40', '100', 35),
(6, '—', '叫聲', '一般', '變化', '—', '100', 40),
(6, '—', '火花', '火', '特殊', '40', '100', 25),
(6, '進化', '翅膀攻擊', '飛行', '物理', '60', '100', 35),
(6, '7', '火花', '火', '特殊', '40', '100', 25),
(6, '10', '煙幕', '一般', '變化', '—', '100', 20),
(6, '17', '龍之怒', '龍', '特殊', '變化', '100', 10),
(6, '21', '鬼面', '一般', '變化', '—', '100', 10),
(6, '28', '火焰牙', '火', '物理', '65', '95', 15),
(6, '32', '烈焰濺射', '火', '特殊', '70', '100', 15),
(6, '41', '劈開', '一般', '物理', '70', '100', 20),
(6, '47', '噴射火焰', '火', '特殊', '90', '100', 15),
(6, '56', '火焰旋渦', '火', '特殊', '35', '85', 15),
(6, '62', '煉獄', '火', '特殊', '100', '50', 5),
(6, '71', '熱風', '火', '特殊', '95', '90', 10),
(6, '77', '閃焰衝鋒', '火', '物理', '120', '100', 15),
(7, '—', '撞擊', '一般', '物理', '40', '100', 35),
(7, '4', '搖尾巴', '一般', '變化', '—', '100', 30),
(7, '7', '水槍', '水', '特殊', '40', '100', 25),
(7, '10', '縮入殼中', '水', '變化', '—', '—', 40),
(7, '13', '泡沫', '水', '特殊', '40', '100', 30),
(7, '16', '咬住', '惡', '物理', '60', '100', 25),
(7, '19', '高速旋轉', '一般', '物理', '20', '100', 40),
(7, '22', '守住', '一般', '變化', '—', '—', 10),
(7, '25', '水之波動', '水', '特殊', '60', '100', 20),
(7, '28', '水流尾', '水', '物理', '90', '90', 10),
(7, '31', '火箭頭錘', '一般', '物理', '130', '100', 10),
(7, '34', '鐵壁', '鋼', '變化', '—', '—', 15),
(7, '37', '求雨', '水', '變化', '—', '—', 5),
(7, '40', '水炮', '水', '特殊', '110', '80', 5),
(8, '—', '撞擊', '一般', '物理', '40', '100', 35),
(8, '—', '搖尾巴', '一般', '變化', '—', '100', 30),
(8, '—', '水槍', '水', '特殊', '40', '100', 25),
(8, '4', '搖尾巴', '一般', '變化', '—', '100', 30),
(8, '7', '水槍', '水', '特殊', '40', '100', 25),
(8, '10', '縮入殼中', '水', '變化', '—', '—', 40),
(8, '13', '泡沫', '水', '特殊', '40', '100', 30),
(8, '17', '咬住', '惡', '物理', '60', '100', 25),
(8, '21', '高速旋轉', '一般', '物理', '20', '100', 40),
(8, '25', '守住', '一般', '變化', '—', '—', 10),
(8, '29', '水之波動', '水', '特殊', '60', '100', 20),
(8, '33', '水流尾', '水', '物理', '90', '90', 10),
(8, '37', '火箭頭錘', '一般', '物理', '130', '100', 10),
(8, '41', '鐵壁', '鋼', '變化', '—', '—', 15),
(8, '45', '求雨', '水', '變化', '—', '—', 5),
(8, '49', '水炮', '水', '特殊', '110', '80', 5),
(9, '—', '加農光炮', '鋼', '特殊', '80', '100', 10),
(9, '—', '撞擊', '一般', '物理', '40', '100', 35),
(9, '—', '搖尾巴', '一般', '變化', '—', '100', 30),
(9, '—', '水槍', '水', '特殊', '40', '100', 25),
(9, '—', '縮入殼中', '水', '變化', '—', '—', 40),
(9, '4', '搖尾巴', '一般', '變化', '—', '100', 30),
(9, '7', '水槍', '水', '特殊', '40', '100', 25),
(9, '10', '縮入殼中', '水', '變化', '—', '—', 40),
(9, '13', '泡沫', '水', '特殊', '40', '100', 30),
(9, '17', '咬住', '惡', '物理', '60', '100', 25),
(9, '21', '高速旋轉', '一般', '物理', '20', '100', 40),
(9, '25', '守住', '一般', '變化', '—', '—', 10),
(9, '29', '水之波動', '水', '特殊', '60', '100', 20),
(9, '33', '水流尾', '水', '物理', '90', '90', 10),
(9, '40', '火箭頭錘', '一般', '物理', '130', '100', 10),
(9, '47', '鐵壁', '鋼', '變化', '—', '—', 15),
(9, '54', '求雨', '水', '變化', '—', '—', 5),
(9, '60', '水炮', '水', '特殊', '110', '80', 5);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`編號`),
  ADD KEY `編號` (`編號`);

--
-- 資料表索引 `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`編號`);

--
-- 資料表索引 `skill`
--
ALTER TABLE `skill`
  ADD KEY `編號` (`編號`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `圖片表編號_fk` FOREIGN KEY (`編號`) REFERENCES `monsters` (`編號`);

--
-- 資料表的 Constraints `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `技能表編號_fk` FOREIGN KEY (`編號`) REFERENCES `monsters` (`編號`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

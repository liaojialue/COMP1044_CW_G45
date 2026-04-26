-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:8889
-- 生成日期： 2026-04-26 13:57:35
-- 服务器版本： 8.0.44
-- PHP 版本： 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `internship_system`
--

-- --------------------------------------------------------

--
-- 表的结构 `Assessment`
--

CREATE TABLE `Assessment` (
  `assessment_id` int NOT NULL,
  `internship_id` int NOT NULL,
  `qualitative_comments` text,
  `final_score` decimal(5,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `Assessment`
--

INSERT INTO `Assessment` (`assessment_id`, `internship_id`, `qualitative_comments`, `final_score`) VALUES
(5, 8, 'nice', 87.30),
(6, 10, 'nice', 88.25),
(9, 11, 'nice perfect', 90.40);

-- --------------------------------------------------------

--
-- 表的结构 `AssessmentCriterion`
--

CREATE TABLE `AssessmentCriterion` (
  `criterion_id` int NOT NULL,
  `criterion_name` varchar(255) NOT NULL,
  `weight_percent` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `AssessmentCriterion`
--

INSERT INTO `AssessmentCriterion` (`criterion_id`, `criterion_name`, `weight_percent`) VALUES
(1, 'Undertaking Tasks/Projects', 10.00),
(2, 'Health and Safety Requirements at the Workplace', 10.00),
(3, 'Connectivity and Use of Theoretical Knowledge', 10.00),
(4, 'Presentation of the Report as a Written Document', 15.00),
(5, 'Clarity of Language and Illustration', 10.00),
(6, 'Lifelong Learning Activities', 15.00),
(7, 'Project Management', 15.00),
(8, 'Time Management', 15.00);

-- --------------------------------------------------------

--
-- 表的结构 `AssessmentMark`
--

CREATE TABLE `AssessmentMark` (
  `mark_id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `criterion_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `AssessmentMark`
--

INSERT INTO `AssessmentMark` (`mark_id`, `assessment_id`, `criterion_id`, `score`) VALUES
(33, 5, 1, 90.00),
(34, 5, 2, 80.00),
(35, 5, 3, 79.00),
(36, 5, 4, 70.00),
(37, 5, 5, 90.00),
(38, 5, 6, 89.00),
(39, 5, 7, 100.00),
(40, 5, 8, 97.00),
(41, 6, 1, 90.00),
(42, 6, 2, 90.00),
(43, 6, 3, 80.00),
(44, 6, 4, 88.00),
(45, 6, 5, 99.00),
(46, 6, 6, 88.00),
(47, 6, 7, 78.00),
(48, 6, 8, 95.00),
(49, 9, 1, 90.00),
(50, 9, 2, 90.00),
(51, 9, 3, 90.00),
(52, 9, 4, 90.00),
(53, 9, 5, 88.00),
(54, 9, 6, 97.00),
(55, 9, 7, 87.00),
(56, 9, 8, 90.00);

-- --------------------------------------------------------

--
-- 表的结构 `Assessor`
--

CREATE TABLE `Assessor` (
  `assessor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `full_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `Assessor`
--

INSERT INTO `Assessor` (`assessor_id`, `user_id`, `full_name`) VALUES
(1, 2, 'Dr. Smith');

-- --------------------------------------------------------

--
-- 表的结构 `Internship`
--

CREATE TABLE `Internship` (
  `internship_id` int NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `assessor_id` int NOT NULL,
  `company_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `Internship`
--

INSERT INTO `Internship` (`internship_id`, `student_id`, `assessor_id`, `company_name`) VALUES
(8, '20712208', 1, 'google'),
(10, '20675592', 1, 'google'),
(11, '20676720', 1, 'google');

-- --------------------------------------------------------

--
-- 表的结构 `Student`
--

CREATE TABLE `Student` (
  `student_id` varchar(20) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `programme` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `Student`
--

INSERT INTO `Student` (`student_id`, `student_name`, `programme`) VALUES
('20675592', 'Chen Guanyi', 'computer science'),
('20676720', 'Liao Jialue', 'computer science'),
('20712208', 'Sun Rongliang', 'computer science');

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

CREATE TABLE `User` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('ADMIN','ASSESSOR') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `User`
--

INSERT INTO `User` (`user_id`, `username`, `password_hash`, `role`) VALUES
(1, 'admin', 'admin123', 'ADMIN'),
(2, 'teacher', 'teacher123', 'ASSESSOR');

--
-- 转储表的索引
--

--
-- 表的索引 `Assessment`
--
ALTER TABLE `Assessment`
  ADD PRIMARY KEY (`assessment_id`),
  ADD UNIQUE KEY `internship_id` (`internship_id`);

--
-- 表的索引 `AssessmentCriterion`
--
ALTER TABLE `AssessmentCriterion`
  ADD PRIMARY KEY (`criterion_id`);

--
-- 表的索引 `AssessmentMark`
--
ALTER TABLE `AssessmentMark`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `assessment_id` (`assessment_id`),
  ADD KEY `criterion_id` (`criterion_id`);

--
-- 表的索引 `Assessor`
--
ALTER TABLE `Assessor`
  ADD PRIMARY KEY (`assessor_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 表的索引 `Internship`
--
ALTER TABLE `Internship`
  ADD PRIMARY KEY (`internship_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `assessor_id` (`assessor_id`);

--
-- 表的索引 `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`student_id`);

--
-- 表的索引 `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `Assessment`
--
ALTER TABLE `Assessment`
  MODIFY `assessment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `AssessmentCriterion`
--
ALTER TABLE `AssessmentCriterion`
  MODIFY `criterion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `AssessmentMark`
--
ALTER TABLE `AssessmentMark`
  MODIFY `mark_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- 使用表AUTO_INCREMENT `Assessor`
--
ALTER TABLE `Assessor`
  MODIFY `assessor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `Internship`
--
ALTER TABLE `Internship`
  MODIFY `internship_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 限制导出的表
--

--
-- 限制表 `Assessment`
--
ALTER TABLE `Assessment`
  ADD CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`internship_id`) REFERENCES `Internship` (`internship_id`);

--
-- 限制表 `AssessmentMark`
--
ALTER TABLE `AssessmentMark`
  ADD CONSTRAINT `assessmentmark_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `Assessment` (`assessment_id`),
  ADD CONSTRAINT `assessmentmark_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `AssessmentCriterion` (`criterion_id`);

--
-- 限制表 `Assessor`
--
ALTER TABLE `Assessor`
  ADD CONSTRAINT `assessor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE;

--
-- 限制表 `Internship`
--
ALTER TABLE `Internship`
  ADD CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`),
  ADD CONSTRAINT `internship_ibfk_2` FOREIGN KEY (`assessor_id`) REFERENCES `Assessor` (`assessor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

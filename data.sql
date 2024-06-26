DROP TABLE S;
DROP TABLE SC;
DROP TABLE C;
DROP VIEW BS;

CREATE TABLE S (
	学号 INT PRIMARY KEY, 
	姓名 VARCHAR(20), 
	性别 VARCHAR(5), 
	出生日期 DATE,
	专业 VARCHAR(40)
);
CREATE TABLE SC (
	学号 INT, 
	课程号 INT, 
	成绩 INT
);
CREATE TABLE C (
	课程号 INT PRIMARY KEY,
	课程名 VARCHAR(30), 
	先导课 INT, 
	学分 INT
 );
 
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180001, '李勇', '男', STR_TO_DATE('08-03-2000', '%d-%m-%Y'), '信息安全');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180002, '刘晨', '女', STR_TO_DATE('01-09-1999', '%d-%m-%Y'), '计算机科学与技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180003, '王敏', '女', STR_TO_DATE('01-08-2001', '%d-%m-%Y'), '计算机科学与技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180004, '张立', '男', STR_TO_DATE('08-01-2000', '%d-%m-%Y'), '计算机科学与技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180005, '陈新奇', '男', STR_TO_DATE('01-11-2001', '%d-%m-%Y'), '信息管理与信息系统');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180006, '赵明', '男', STR_TO_DATE('12-06-2000', '%d-%m-%Y'), '数据科学与大数据技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180007, '王佳佳', '女', STR_TO_DATE('07-12-2001', '%d-%m-%Y'), '数据科学与大数据技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180008, '赵志强', '男', STR_TO_DATE('14-04-2000', '%d-%m-%Y'), '软件工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180009, '钱晓红', '女', STR_TO_DATE('23-05-2000', '%d-%m-%Y'), '网络工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180010, '孙浩然', '男', STR_TO_DATE('01-06-2000', '%d-%m-%Y'), '物联网工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180011, '李思辰', '男', STR_TO_DATE('12-07-2000', '%d-%m-%Y'), '计算机科学与技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180012, '周丽娜', '女', STR_TO_DATE('19-08-2000', '%d-%m-%Y'), '信息安全');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180013, '吴文博', '男', STR_TO_DATE('28-09-2000', '%d-%m-%Y'), '软件工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180014, '郑晓雯', '女', STR_TO_DATE('05-10-2000', '%d-%m-%Y'), '网络工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180015, '王志伟', '男', STR_TO_DATE('13-11-2000', '%d-%m-%Y'), '物联网工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180016, '刘敏', '女', STR_TO_DATE('20-12-2000', '%d-%m-%Y'), '计算机科学与技术');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180017, '张晨', '男', STR_TO_DATE('02-01-2001', '%d-%m-%Y'), '信息安全');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180018, '王强', '男', STR_TO_DATE('15-02-2001', '%d-%m-%Y'), '软件工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180019, '陈丽', '女', STR_TO_DATE('22-03-2001', '%d-%m-%Y'), '网络工程');
INSERT INTO S (学号, 姓名, 性别, 出生日期, 专业) VALUES (20180020, '赵伟', '男', STR_TO_DATE('03-04-2001', '%d-%m-%Y'), '物联网工程');

INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81008, 81);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81001, 89);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81004, 53);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81005, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81006, 91);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81002, 59);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81007, 100);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180001, 81003, 56);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81005, 94);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81001, 79);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81006, 70);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81003, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81004, 65);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81008, 61);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81002, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180002, 81007, 96);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81002, 89);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81006, 74);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81003, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81001, 58);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81005, 67);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81007, 69);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81004, 91);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180003, 81008, 70);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81005, 76);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81003, 69);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81007, 61);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81002, 81);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81004, 80);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81006, 72);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81008, 88);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180004, 81001, 62);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81003, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81002, 68);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81007, 65);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81004, 96);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81005, 78);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81006, 66);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81001, 98);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180005, 81008, 54);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81005, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81006, 76);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81004, 99);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81008, 52);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81007, 76);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81002, 75);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81003, 66);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180006, 81001, 84);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81007, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81001, 54);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81004, 94);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81003, 66);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81005, 79);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81002, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81006, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180007, 81008, 71);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81003, 97);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81001, 55);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81007, 94);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81004, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81005, 50);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81008, 93);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81006, 83);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180008, 81002, 69);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81002, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81001, 54);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81003, 92);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81007, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81008, 82);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81004, 62);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81005, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180009, 81006, 99);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81002, 99);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81003, 69);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81004, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81005, 61);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81006, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81007, 85);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81001, 83);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180010, 81008, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81002, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81007, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81004, 53);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81006, 58);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81003, 66);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81005, 53);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81008, 84);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180011, 81001, 82);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81001, 83);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81007, 65);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81008, 56);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81005, 59);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81004, 55);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81006, 56);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81003, 62);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180012, 81002, 92);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81007, 83);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81002, 63);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81003, 67);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81006, 61);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81004, 92);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81005, 90);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81008, 84);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180013, 81001, 71);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81003, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81007, 85);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81002, 57);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81006, 84);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81005, 93);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81008, 58);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81004, 92);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180014, 81001, 73);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81003, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81007, 52);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81006, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81001, 67);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81002, 77);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81004, 70);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81008, 52);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180015, 81005, 50);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81002, 73);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81004, 79);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81005, 89);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81008, 57);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81006, 98);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81003, 95);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81007, 92);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180016, 81001, 68);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81007, 98);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81002, 54);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81001, 81);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81004, 67);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81008, 77);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81003, 57);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81005, 97);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180017, 81006, 100);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81004, 73);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81002, 64);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81005, 51);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81001, 76);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81008, 86);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81007, 62);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81006, 63);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180018, 81003, 82);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81004, 59);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81006, 50);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81001, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81005, 67);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81002, 60);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81008, 69);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81003, 87);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180019, 81007, 52);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81008, 82);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81003, 97);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81002, 96);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81001, 62);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81007, 79);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81005, 81);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81006, 72);
INSERT INTO SC (学号, 课程号, 成绩) VALUES (20180020, 81004, 75);

-- 插入课程数据
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81001, '程序设计基础与C语言', NULL, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81002, '数据结构', 81001, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81003, '数据库原理', 81002, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81004, '计算机网络', 81003, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81005, '操作系统', 81002, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81006, '计算机组成原理', 81005, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81007, '编译原理', NULL, 4);
INSERT INTO C (课程号, 课程名, 先导课, 学分) VALUES (81008, '人工智能导论', NULL, 4);




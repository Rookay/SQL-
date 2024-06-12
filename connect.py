# -*- coding: utf-8 -*-
# @Time     : 2024/6/3 下午2:42
# @Author   : 刘景涛
# @File     : connect.py
# @Software : PyCharm
# @Comment  :
import mysql.connector

# 数据库连接配置
db = mysql.connector.connect(
    host="localhost",  # MySQL服务器地址
    user="root",   # 用户名
    password="162110322",  # 密码
    database="my",  # 数据库名称
    port=3308
)


# 连接数据库
def connect_db():
    return db;

# conn = connect_db()
# cursor = conn.cursor()
# cursor.execute("SELECT * FROM S")  # 假设S表是存储学生信息的表
# # 获取查询结果
# rows = cursor.fetchall()
#
# # 打印查询结果
# for row in rows:
#     print(row)
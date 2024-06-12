# -*- coding: utf-8 -*-
# @Time     : 2024/6/4 下午4:56
# @Author   : 刘景涛
# @File     : student_table.py
# @Software : PyCharm
# @Comment  :
import tkinter as tk
from tkinter import ttk, messagebox
from connect import connect_db
from table_manager import create_table_manager

def search_myself(sno):
    conn = connect_db()
    cursor = conn.cursor()

    # 查询学生信息
    cursor.execute("SELECT * FROM S WHERE 学号=%s", (sno,))
    student_info = cursor.fetchone()

    if not student_info:
        messagebox.showerror("错误", "学生信息不存在")
        return

    # 查询选课信息
    cursor.execute("SELECT C.课程名, SC.成绩 FROM SC, C WHERE SC.学号=%s AND SC.课程号=C.课程号", (sno,))
    course_info = cursor.fetchall()

    # 计算加权平均成绩
    cursor.execute("SELECT SUM(C.学分 * SC.成绩) / SUM(C.学分) FROM SC, C WHERE SC.学号=%s AND SC.课程号=C.课程号", (sno,))
    gpa = cursor.fetchone()[0]

    # 创建窗口
    root = tk.Tk()
    root.title("学生信息")

    # 显示学生信息
    tk.Label(root, text="学生信息").grid(row=0, column=0, columnspan=2)

    tk.Label(root, text="学号：").grid(row=1, column=0)
    tk.Label(root, text=student_info[0]).grid(row=1, column=1)
    tk.Label(root, text="姓名：").grid(row=2, column=0)
    tk.Label(root, text=student_info[1]).grid(row=2, column=1)
    tk.Label(root, text="性别：").grid(row=3, column=0)
    tk.Label(root, text=student_info[2]).grid(row=3, column=1)
    tk.Label(root, text="出生日期：").grid(row=4, column=0)
    tk.Label(root, text=student_info[3]).grid(row=4, column=1)
    tk.Label(root, text="专业：").grid(row=5, column=0)
    tk.Label(root, text=student_info[4]).grid(row=5, column=1)

    # 添加分割线
    tk.Label(root, text="-----------------------------").grid(row=6, column=0, columnspan=2)
    # 显示选课信息
    tk.Label(root, text="选课信息").grid(row=7, column=0, columnspan=2)

    tk.Label(root, text="课程名").grid(row=8, column=0)
    tk.Label(root, text="成绩").grid(row=8, column=1)
    for i, course in enumerate(course_info):
        tk.Label(root, text=course[0]).grid(row=9+i, column=0)
        tk.Label(root, text=course[1]).grid(row=9+i, column=1)

    # 显示加权平均成绩
    tk.Label(root, text="加权平均成绩：").grid(row=10+len(course_info), column=0)
    tk.Label(root, text=gpa).grid(row=10+len(course_info), column=1)

    root.mainloop()



def search_course(sno):
    create_table_manager("C", "课程信息", ["课程号", "课程名", "先导课", "学分"],
                         ["课程号", "课程名", "先导课", "学分"], "开课信息", "Cno", sno)

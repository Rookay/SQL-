# -*- coding: utf-8 -*-
# @Time     : 2024/6/3 下午2:44
# @Author   : 刘景涛
# @File     : student.py
# @Software : PyCharm
# @Comment  :

import tkinter as tk
from tkinter import messagebox
from student_table import search_myself
from student_table import search_course

def student_main(sno):
    main_root = tk.Tk()
    main_root.title("学生信息管理系统")
    main_root.geometry("200x200")  # 设置窗口大小

    def view_student_info():
        # 调用查找学生信息的函数，并传递sno参数
        search_myself(sno)

    def view_course_info():
        # 调用查找选课信息的函数
        search_course(sno)

    # 查找学生信息按钮
    view_button = tk.Button(main_root, text="个人信息", command=view_student_info)
    view_button.pack(pady=15)

    # 修改学生信息按钮
    update_button = tk.Button(main_root, text="课程信息", command=view_course_info)
    update_button.pack(pady=15)

    main_root.mainloop()



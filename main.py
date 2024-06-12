# -*- coding: utf-8 -*-
# @Time     : 2024/6/3 下午2:45
# @Author   : 刘景涛
# @File     : main.py
# @Software : PyCharm
# @Comment  :
import tkinter as tk
from tkinter import messagebox
from manager import manager_main
from connect import connect_db
from student import student_main
# 登录界面
def login():
    def check_login():
        user_type = var.get()
        username = user_entry.get()
        password = pass_entry.get()
        admin = ["admin", "admin"]
        isAdmin = username == admin[0] and password == admin[1]
        if isAdmin and user_type == 'admin':
            manager_main()
        elif user_type == 'student':
            # sno = "20180001"
            # student_main(sno)
            try:
                query = "SELECT 学号 FROM S WHERE 学号 = %s"
                conn = connect_db()
                cursor = conn.cursor()
                cursor.execute(query, (username,))
                result = cursor.fetchone()
                if result and str(result[0]).strip() == password:  # 提取元组中的第一个元素进行比较
                    student_main(username)
                else:
                    messagebox.showerror("错误", "用户名或密码错误！")
            except Exception as e:
                messagebox.showerror("数据库错误", str(e))
        else:
            messagebox.showerror("错误", "用户名或密码错误！")

    login_window = tk.Tk()
    login_window.title("登录")
    login_window.geometry("300x250")  # 设置窗口大小

    var = tk.StringVar()
    var.set('admin')

    tk.Label(login_window, text="用户名").grid(row=0, column=0, padx=20, pady=20)
    user_entry = tk.Entry(login_window)
    user_entry.grid(row=0, column=1, padx=20, pady=20)
    tk.Label(login_window, text="密码").grid(row=1, column=0, padx=20, pady=20)
    pass_entry = tk.Entry(login_window, show="*")
    pass_entry.grid(row=1, column=1, padx=20, pady=20)
    tk.Radiobutton(login_window, text="管理员", variable=var, value='admin').grid(row=2, column=0, padx=20, pady=20)
    tk.Radiobutton(login_window, text="学生", variable=var, value='student').grid(row=2, column=1, padx=20, pady=20)

    login_button = tk.Button(login_window, text="登录", command=check_login)
    login_button.grid(row=3, column=0, columnspan=2, padx=20, pady=20)

    login_window.mainloop()


if __name__ == "__main__":
    login()
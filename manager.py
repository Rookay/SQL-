# -*- coding: utf-8 -*-
# @Time     : 2024/6/3 下午2:44
# @Author   : 刘景涛
# @File     : manager.py
# @Software : PyCharm
# @Comment  :
import tkinter as tk
from table_manager import create_table_manager

# 主界面
def manager_main():
    main_root = tk.Tk()
    main_root.title("学生信息管理系统")
    main_root.geometry("200x200")  # 设置窗口大小

    # 查找学生信息按钮
    view_button = tk.Button(main_root, text="学生基本信息", command=s_info)
    view_button.pack(pady=15)

    # 修改学生信息按钮
    update_button = tk.Button(main_root, text="学生选课信息", command=sc_info)
    update_button.pack(pady=15)

    # 新增学生信息按钮
    add_button = tk.Button(main_root, text="开课信息", command=c_info)
    add_button.pack(pady=15)

    main_root.mainloop()


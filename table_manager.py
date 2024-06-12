# -*- coding: utf-8 -*-
# @Time     : 2024/6/4 上午10:04
# @Author   : 刘景涛
# @File     : table_manager.py
# @Software : PyCharm
# @Comment  :
import tkinter as tk
from tkinter import ttk
from connect import connect_db

def S_search1(record_info):
    # 查找该学生的选课信息
    query = f"SELECT SC.学号, C.课程号, C.课程名, SC.成绩 FROM SC INNER JOIN C ON SC.课程号 = C.课程号 WHERE SC.学号 = {record_info[0]}"
    execute_query_and_show_results(query, f"学生 {record_info[1]} 的选课信息")
def S_search2(record_info):
    # 查找该学生的选课信息
    student_id = record_info[0]
    query = f"""
    SELECT 
        S.学号, 
        S.姓名, 
        COUNT(C.课程号) AS 课程数量, 
        SUM(C.学分 * SC.成绩) / SUM(C.学分) AS 加权平均成绩
    FROM 
        S 
        INNER JOIN SC ON S.学号 = SC.学号
        INNER JOIN C ON SC.课程号 = C.课程号
    WHERE 
        S.学号 = {student_id}
    GROUP BY 
        S.学号
    """
    execute_query_and_show_results(query, f"学生 {student_id} 的选课信息及加权平均成绩")
def C_search1(record_info):
    # 查找选修这门课的所有人的姓名，学号及成绩
    course_id = record_info[0]
    query = f"""
    SELECT 
        S.学号, 
        S.姓名, 
        SC.成绩
    FROM 
        S 
        INNER JOIN SC ON S.学号 = SC.学号
    WHERE 
        SC.课程号 = {course_id}
    ORDER BY 
        SC.成绩 DESC  # 按成绩降序排列
    """
    execute_query_and_show_results(query, f"课程 {course_id} 的选课名单（按成绩降序排列）")
def SC_search1(record_info):
    # 根据具体情况定义更多的查找功能
    # 假设 record_info 是一个包含学号和课程号的元组
    student_id, course_id = record_info[0], record_info[1]
    # 查找特定学生的特定课程的成绩
    query = f"SELECT S.学号, S.姓名, C.课程名, SC.成绩 FROM S INNER JOIN SC ON S.学号 = SC.学号 INNER JOIN C ON SC.课程号 = C.课程号 WHERE S.学号 = {student_id} AND C.课程号 = {course_id}"
    execute_query_and_show_results(query, "详情")
def execute_query_and_show_results(query, title):
    # 执行查询并显示结果
    conn = connect_db()  # 请确保 connect_db() 函数已定义
    cursor = conn.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()

    # 创建一个新的弹出窗口
    query_window = tk.Toplevel()
    query_window.title(title)
    query_window.geometry("600x400")  # 设置窗口大小

    # 创建Treeview来显示查询结果
    tree = ttk.Treeview(query_window, columns=[col[0] for col in cursor.description], show='headings')
    for index, col in enumerate(cursor.description):
        tree.heading(col[0], text=col[0], anchor=tk.W)
        tree.column(col[0], minwidth=0, width=100, stretch=tk.YES)
    tree.pack(expand=True, fill='both')

    # 将查询结果插入Treeview
    for row in rows:
        tree.insert('', tk.END, values=row)
def create_table_manager(table_name, view_window_title, columns, headings, edit_window_title, primary_key_column, username):

    def show_context_menu(event):
        # 获取选中的行
        selected_items = tree.selection()

        # 创建右键菜单
        context_menu = tk.Menu(view_window, tearoff=0)
        more_search_menu = tk.Menu(context_menu, tearoff=0)

        # 如果选中了行，则显示删除和修改按钮
        if selected_items:
            item = selected_items[0]
            record_info = tree.item(item, "values")
            context_menu.add_command(label="删除", command=lambda: delete_record(record_info))
            context_menu.add_command(label="修改", command=lambda: edit_record(record_info))
            context_menu.add_cascade(label="更多查找", menu=more_search_menu)

        context_menu.add_command(label="添加", command=add_record)

        # 根据表名添加相应的查找命令到子菜单
        if table_name == 'SC':
            more_search_menu.add_command(label="详情查看", command=lambda: SC_search1(record_info))
        elif table_name == 'C':
            more_search_menu.add_command(label="查找选课学生", command=lambda: C_search1(record_info))
        else:
            more_search_menu.add_command(label="选课信息", command=lambda: S_search1(record_info))
            more_search_menu.add_command(label="平均成绩", command=lambda: S_search2(record_info))

        # 显示右键菜单
        context_menu.post(event.x_root, event.y_root)

    def delete_record(record_info):
        # 从数据库中删除记录
        if(table_name!="SC"):
            record_id = record_info[0]  # 假设主键在第一列
            cursor.execute(f"DELETE FROM {table_name} WHERE 学号 = %s", (record_id,))
        else:
            sno = record_info[0]  # 假设主键在第一列
            cno = record_info[1]
            cursor.execute(f"DELETE FROM {table_name} WHERE 学号 = %s AND 课程号 = %s", (sno,cno))
        conn.commit()
        # 刷新表格
        filter_records()

    def edit_record(record_info):
        def save_changes():
            # 获取用户输入的新值
            new_values = []
            for index, column in enumerate(columns):
                new_value = entrys[index].get()  # 获取对应列的新值
                new_values.append(new_value)  # 添加到新值列表中
            print(new_values)
            if (table_name == 'S'):
                cursor.execute(
                    "UPDATE S SET 学号 = %s, 姓名 = %s, Sgender = %s, 出生日期 = %s, 专业 = %s WHERE 学号 = %s",
                    (new_values[0], new_values[1], new_values[2], new_values[3], new_values[4], old_no))
            elif (table_name == 'C'):
                cursor.execute(
                    "UPDATE C SET 课程号 = %s, 课程名 = %s, 先导课 = %s, 学分 = %s WHERE 课程号 = %s",
                    (new_values[0], new_values[1], new_values[2], new_values[3], old_no))
            else:
                cursor.execute(
                    "UPDATE SC SET 学号 = %s, 课程号 = %s, 成绩 = %s WHERE 学号 = %s AND 课程号 = %s",
                    (new_values[0], new_values[1], new_values[2], old_no, old_no2))
            # 执行SQL更新
            conn.commit()
            view_window.destroy()  # 关闭编辑窗口

            # 重新获取数据库中的记录信息并刷新表格
            filter_records()

        old_no = record_info[0]
        old_no2 = record_info[1]
        view_window = tk.Tk()
        view_window.title(edit_window_title)
        view_window.geometry("400x300")  # 设置窗口大小

        entrys = []
        # 创建输入框和标签
        for index, column in enumerate(columns):
            label = tk.Label(view_window, text=column)
            label.pack()
            entry = tk.Entry(view_window)
            entry.insert(0, record_info[index])  # 填充原始值
            entry.pack()
            entrys.append(entry)
        # 创建保存按钮
        save_button = tk.Button(view_window, text="保存", command=save_changes)
        save_button.pack()
        conn = connect_db()  # 请确保 connect_db() 函数已定义
        cursor = conn.cursor()

        view_window.mainloop()

    def add_record():
        def save_changes():
            # 获取用户输入的新值
            new_values = []
            for index, column in enumerate(columns):
                new_value = entrys[index].get()  # 获取对应列的新值
                new_values.append(new_value)  # 添加到新值列表中
            if (table_name == 'S'):
                cursor.execute(
                    "INSERT INTO S SET 学号 = %s, 姓名 = %s, Sgender = %s, 出生日期 = %s, 专业 = %s",
                    (new_values[0], new_values[1], new_values[2], new_values[3], new_values[4]))
            elif (table_name == 'C'):
                cursor.execute(
                    "INSERT INTO C (课程号, 课程名, 学分) VALUES (%s, %s, %s)",
                    (new_values[0], new_values[1], new_values[2], new_values[3]))
            else:
                cursor.execute(
                    "INSERT INTO SC SET (学号, 课程号, 成绩) VALUES (%s, %s, %s)",
                    (new_values[0], new_values[1], new_values[2]))
            # 执行SQL更新
            conn.commit()
            view_window.destroy()  # 关闭编辑窗口

            # 重新获取数据库中的记录信息并刷新表格
            filter_records()

        view_window = tk.Tk()
        view_window.title(edit_window_title)
        view_window.geometry("400x300")  # 设置窗口大小

        # 创建输入框和标签
        record_id_entry = tk.Entry(view_window)

        entrys = []
        # 创建输入框和标签
        for index, column in enumerate(columns):
            label = tk.Label(view_window, text=column)
            label.pack()
            entry = tk.Entry(view_window)
            entry.pack()
            entrys.append(entry)

        # 创建保存按钮
        save_button = tk.Button(view_window, text="保存", command=save_changes)
        save_button.pack()
        conn = connect_db()
        cursor = conn.cursor()

        view_window.mainloop()

    def filter_records():
        filter_text = filter_entry.get()
        if filter_text:
            # 根据所有列进行模糊匹配
            filter_conditions = [f"{heading} LIKE %s" for heading in headings]
            filter_query = f"SELECT * FROM {table_name} WHERE {' OR '.join(filter_conditions)}"
            params = [f"%{filter_text}%" for _ in headings]
            cursor.execute(filter_query, params)
        else:
            cursor.execute(f"SELECT * FROM {table_name}")
        rows = cursor.fetchall()
        tree.delete(*tree.get_children())  # 清空当前表格
        for row in rows:
            tree.insert('', tk.END, values=row)

    view_window = tk.Tk()
    view_window.title(view_window_title)
    view_window.geometry("1000x600")  # 设置窗口大小

    tree = ttk.Treeview(view_window, columns=headings, show='headings')
    for index, heading in enumerate(headings):
        tree.heading(heading, text=heading, anchor=tk.W)
        tree.column(heading, minwidth=0, width=150, stretch=tk.YES)  # 设置列的宽度
    if(username == 'admin'):
        tree.bind("<Button-3>", show_context_menu)

    filter_button = tk.Button(view_window, text="查找", command=filter_records)
    filter_button.pack(side=tk.BOTTOM)  # 将按钮放在窗口底部

    filter_entry = tk.Entry(view_window)
    filter_entry.pack(side=tk.BOTTOM)  # 将输入框放在窗口底部
    filter_label = tk.Label(view_window, text="查找字段:")
    filter_label.pack(side=tk.BOTTOM)

    # 连接数据库并获取所有记录信息
    conn = connect_db()  # 请确保 connect_db() 函数已定义
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()
    for row in rows:
        tree.insert('', tk.END, values=row)

    tree.pack(expand=True, fill='both')
    view_window.mainloop()

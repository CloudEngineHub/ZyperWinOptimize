﻿using System;
using System.Diagnostics;

namespace ZyperWin__
{
    public partial class Others : AntdUI.Window
    {
        public Others()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Process.Start(".\\Bin\\Explorer11\\右键");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Process.Start(".\\Bin\\Explorer11\\资源管理器");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Process.Start(".\\Bin\\Update");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Process.Start(".\\Bin\\Explorer11\\Win11DisableOrRestoreRoundedCorners.exe");
        }
    }
}

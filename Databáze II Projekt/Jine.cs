using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using AuctionSystem.ORM.DAO.Sqls;
using AuctionSystem.ORM;
using System.Collections.ObjectModel;

namespace Databáze_II_Projekt
{
    public partial class Jine : Form
    {
        public Jine()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            db.Connect();
            Adminstratori_ModeratoriTable.JmenovaniAdministratorem(this.textBox1.Text, this.textBox2.Text, db);
            db.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

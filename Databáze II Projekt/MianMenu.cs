using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DS_II_Projekt;

namespace Databáze_II_Projekt
{
    public partial class MainMenu : Form
    {
        public MainMenu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SpravceHracu sp = new SpravceHracu();
            this.Hide();
            sp.ShowDialog();
            this.Show();
        }

        private void buttonSpravceBugu_Click(object sender, EventArgs e)
        {
            Spravce_bugu sb = new Spravce_bugu();
            this.Hide();
            sb.ShowDialog();
            this.Show();
        }

        private void buttonSpravceBanu_Click(object sender, EventArgs e)
        {
            Form1 sb = new Form1();
            this.Hide();
            sb.ShowDialog();
            this.Show();
        }

        private void buttonStats_Click(object sender, EventArgs e)
        {
            Statistiky st = new Statistiky();
            this.Hide();
            st.ShowDialog();
            this.Show();
        }

        private void buttonquit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Jine jine = new Jine();
            this.Hide();
            jine.ShowDialog();
            this.Show();
        }
    }
}

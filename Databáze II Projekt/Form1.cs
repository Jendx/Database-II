using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AuctionSystem.ORM.DAO.Sqls;
using AuctionSystem.ORM;
using System.Collections.ObjectModel;

namespace DS_II_Projekt
{
    public partial class Form1 : Form
    {
        Collection<Bany> b = new Collection<Bany>();
        Collection<Hraci> hraci = new Collection<Hraci>();
        Collection<Administratori_Moderatori> AM = new Collection<Administratori_Moderatori>();
        Collection<Servery> ser = new Collection<Servery>();
        
        public Form1()
        {
            InitializeComponent();


            Table();
            
        }

        private void Table()
        {
            this.dataGridViewBany.AllowUserToAddRows = true;
            b = BanyTable.SeznamZabanovanychHracu();
            hraci = HraciTable.Select();
            AM = Adminstratori_ModeratoriTable.SeznamAdministratoru();
            ser = ServeryTable.Select();

            this.dataGridViewBany.Rows.Clear();
            #region Inicializace tabulky


            for (int i = 0; i < this.dataGridViewBany.Rows.Count; i++)
            {
                if (i < b.Count)
                {
                    this.dataGridViewBany.Rows.Add();
                }
                else
                {
                    this.dataGridViewBany.AllowUserToAddRows = false;
                    break;
                }

                if (b[i].Typ_banu == "Perma")
                {
                    this.dataGridViewBany.Rows[i].DefaultCellStyle.BackColor = Color.DarkRed;
                }
                else if (b[i].Typ_banu == "VAC")
                {
                    this.dataGridViewBany.Rows[i].DefaultCellStyle.BackColor = Color.DarkOrange;
                }
                else if (b[i].Typ_banu == "Temp")
                {
                    this.dataGridViewBany.Rows[i].DefaultCellStyle.BackColor = Color.Green;
                }

                foreach (var hrac in hraci) // Nastavení přezdívky
                {
                    if (hrac.Hrac_id == b[i].Hrac_id)
                    {
                        this.dataGridViewBany.Rows[i].Cells[0].Value = hrac.Prezdivka + " #" +b[i].Ban_id;
                        break;
                    }
                }

                this.dataGridViewBany.Rows[i].Cells[1].Value = b[i].Typ_banu;
                this.dataGridViewBany.Rows[i].Cells[2].Value = b[i].Datum_cas_udeleni_banu;
                this.dataGridViewBany.Rows[i].Cells[3].Value = b[i].Datum_cas_odbanovani;
                foreach (var admin in AM) // Nastavení přezdívky admina
                {
                    if (admin.Admin_id == b[i].Admin_id)
                    {
                        this.dataGridViewBany.Rows[i].Cells[4].Value = admin.Prezdivka;
                        break;
                    }
                }

                foreach (var server in ser) // Nastavení jména serveru
                {
                    if (server.Server_id == b[i].Server_id)
                    {
                        this.dataGridViewBany.Rows[i].Cells[5].Value = server.Nazev_serveru;
                        break;
                    }
                }
                this.dataGridViewBany.Rows[i].Cells[6].Value = b[i].Zabanovany;


            }
            this.dataGridViewBany.Refresh();

            #endregion
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonBAN_Click(object sender, EventArgs e)
        {
            #region Prepare Values
            int h_id = -1;
            while ( h_id == -1)
            {
                foreach (var h in hraci)
                {
                    if (h.Prezdivka == this.textBoxName.Text)
                    {
                        h_id = h.Hrac_id;
                    }
                }

                if(h_id == -1)
                {
                    MessageBox.Show("Hráč nebyl nalezen!");
                    return;
                }
            }
            
            

            #endregion

            Bany b = new Bany() {
                Hrac_id = h_id,
                Typ_banu = this.comboBoxTypBanu.SelectedItem.ToString(),
                Datum_cas_udeleni_banu = DateTime.Parse(this.textBoxStart.Text),
                Datum_cas_odbanovani = this.textBoxKonec.Text != "" ? DateTime.Parse(this.textBoxKonec.Text) : (DateTime?)null,
                Server_id = int.Parse(this.textBoxServer.Text),
                Zabanovany = true
            };

            Database db = new Database();
            db.Connect();
            BanyTable.PridaniBanu(b, db);
            db.Close();

            this.Table();
        }

        private void dataGridViewBany_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 7)
            {
                int id = -1;
                string prezdivka = this.dataGridViewBany.Rows[e.RowIndex].Cells[0].Value.ToString();
                var ban_id = prezdivka.Split('#');

                BanyTable.OdebraniBanu(int.Parse(ban_id[1]));

                Table();
            }
        }
    }
}

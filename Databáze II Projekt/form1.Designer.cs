
namespace DS_II_Projekt
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.labelPrezdivka = new System.Windows.Forms.Label();
            this.comboBoxTypBanu = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridViewBany = new System.Windows.Forms.DataGridView();
            this.ColumnPrezdivka = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Columntyp = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnStart = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnEND = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnAdmin = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnServer = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnZabanovany = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnUnban = new System.Windows.Forms.DataGridViewButtonColumn();
            this.labelKonec = new System.Windows.Forms.Label();
            this.textBoxKonec = new System.Windows.Forms.TextBox();
            this.textBoxServer = new System.Windows.Forms.TextBox();
            this.labelServer = new System.Windows.Forms.Label();
            this.labelStart = new System.Windows.Forms.Label();
            this.textBoxStart = new System.Windows.Forms.TextBox();
            this.buttonBAN = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBoxBan = new System.Windows.Forms.GroupBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewBany)).BeginInit();
            this.groupBoxBan.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(111, 56);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(100, 23);
            this.textBoxName.TabIndex = 0;
            this.textBoxName.Text = "Pepa";
            // 
            // labelPrezdivka
            // 
            this.labelPrezdivka.AutoSize = true;
            this.labelPrezdivka.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelPrezdivka.Location = new System.Drawing.Point(123, 32);
            this.labelPrezdivka.Name = "labelPrezdivka";
            this.labelPrezdivka.Size = new System.Drawing.Size(77, 21);
            this.labelPrezdivka.TabIndex = 1;
            this.labelPrezdivka.Text = "Přezdívka";
            // 
            // comboBoxTypBanu
            // 
            this.comboBoxTypBanu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxTypBanu.FormattingEnabled = true;
            this.comboBoxTypBanu.Items.AddRange(new object[] {
            "Temp",
            "Perma",
            "VAC"});
            this.comboBoxTypBanu.Location = new System.Drawing.Point(217, 56);
            this.comboBoxTypBanu.Name = "comboBoxTypBanu";
            this.comboBoxTypBanu.Size = new System.Drawing.Size(100, 23);
            this.comboBoxTypBanu.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(227, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 21);
            this.label1.TabIndex = 3;
            this.label1.Text = "Typ Banu";
            // 
            // dataGridViewBany
            // 
            this.dataGridViewBany.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewBany.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ColumnPrezdivka,
            this.Columntyp,
            this.ColumnStart,
            this.ColumnEND,
            this.ColumnAdmin,
            this.ColumnServer,
            this.ColumnZabanovany,
            this.ColumnUnban});
            this.dataGridViewBany.Location = new System.Drawing.Point(12, 75);
            this.dataGridViewBany.Name = "dataGridViewBany";
            this.dataGridViewBany.RowTemplate.Height = 25;
            this.dataGridViewBany.Size = new System.Drawing.Size(847, 228);
            this.dataGridViewBany.TabIndex = 4;
            this.dataGridViewBany.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewBany_CellContentClick);
            // 
            // ColumnPrezdivka
            // 
            this.ColumnPrezdivka.HeaderText = "Prezdivka #ban id";
            this.ColumnPrezdivka.Name = "ColumnPrezdivka";
            this.ColumnPrezdivka.ReadOnly = true;
            // 
            // Columntyp
            // 
            this.Columntyp.HeaderText = "Typ banu";
            this.Columntyp.Name = "Columntyp";
            this.Columntyp.ReadOnly = true;
            // 
            // ColumnStart
            // 
            this.ColumnStart.HeaderText = "Začátek Banu";
            this.ColumnStart.Name = "ColumnStart";
            this.ColumnStart.ReadOnly = true;
            // 
            // ColumnEND
            // 
            this.ColumnEND.HeaderText = "Konec banu";
            this.ColumnEND.Name = "ColumnEND";
            this.ColumnEND.ReadOnly = true;
            // 
            // ColumnAdmin
            // 
            this.ColumnAdmin.HeaderText = "Administrátor";
            this.ColumnAdmin.Name = "ColumnAdmin";
            this.ColumnAdmin.ReadOnly = true;
            // 
            // ColumnServer
            // 
            this.ColumnServer.HeaderText = "Server";
            this.ColumnServer.Name = "ColumnServer";
            this.ColumnServer.ReadOnly = true;
            // 
            // ColumnZabanovany
            // 
            this.ColumnZabanovany.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells;
            this.ColumnZabanovany.HeaderText = "Zabanovaný?";
            this.ColumnZabanovany.Name = "ColumnZabanovany";
            this.ColumnZabanovany.ReadOnly = true;
            this.ColumnZabanovany.Width = 102;
            // 
            // ColumnUnban
            // 
            this.ColumnUnban.HeaderText = "Unban";
            this.ColumnUnban.Name = "ColumnUnban";
            this.ColumnUnban.Text = "Unban";
            this.ColumnUnban.ToolTipText = "Unban";
            // 
            // labelKonec
            // 
            this.labelKonec.AutoSize = true;
            this.labelKonec.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelKonec.Location = new System.Drawing.Point(453, 32);
            this.labelKonec.Name = "labelKonec";
            this.labelKonec.Size = new System.Drawing.Size(91, 21);
            this.labelKonec.TabIndex = 7;
            this.labelKonec.Text = "Konec banu";
            // 
            // textBoxKonec
            // 
            this.textBoxKonec.Location = new System.Drawing.Point(440, 56);
            this.textBoxKonec.Name = "textBoxKonec";
            this.textBoxKonec.Size = new System.Drawing.Size(119, 23);
            this.textBoxKonec.TabIndex = 6;
            // 
            // textBoxServer
            // 
            this.textBoxServer.Location = new System.Drawing.Point(565, 56);
            this.textBoxServer.Name = "textBoxServer";
            this.textBoxServer.Size = new System.Drawing.Size(100, 23);
            this.textBoxServer.TabIndex = 8;
            this.textBoxServer.Text = "1";
            // 
            // labelServer
            // 
            this.labelServer.AutoSize = true;
            this.labelServer.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelServer.Location = new System.Drawing.Point(586, 32);
            this.labelServer.Name = "labelServer";
            this.labelServer.Size = new System.Drawing.Size(55, 21);
            this.labelServer.TabIndex = 9;
            this.labelServer.Text = "Server";
            // 
            // labelStart
            // 
            this.labelStart.AutoSize = true;
            this.labelStart.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelStart.Location = new System.Drawing.Point(326, 32);
            this.labelStart.Name = "labelStart";
            this.labelStart.Size = new System.Drawing.Size(102, 21);
            this.labelStart.TabIndex = 11;
            this.labelStart.Text = "Začátek banu";
            // 
            // textBoxStart
            // 
            this.textBoxStart.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.textBoxStart.Location = new System.Drawing.Point(323, 56);
            this.textBoxStart.Name = "textBoxStart";
            this.textBoxStart.Size = new System.Drawing.Size(111, 23);
            this.textBoxStart.TabIndex = 10;
            this.textBoxStart.Text = "24.02.2020 10:26:46";
            // 
            // buttonBAN
            // 
            this.buttonBAN.BackColor = System.Drawing.Color.IndianRed;
            this.buttonBAN.Cursor = System.Windows.Forms.Cursors.Default;
            this.buttonBAN.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.buttonBAN.Location = new System.Drawing.Point(671, 45);
            this.buttonBAN.Name = "buttonBAN";
            this.buttonBAN.Size = new System.Drawing.Size(131, 39);
            this.buttonBAN.TabIndex = 12;
            this.buttonBAN.Text = "BAN!";
            this.buttonBAN.UseVisualStyleBackColor = false;
            this.buttonBAN.Click += new System.EventHandler(this.buttonBAN_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(333, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 30);
            this.label2.TabIndex = 13;
            this.label2.Text = "Aktualní bany";
            // 
            // groupBoxBan
            // 
            this.groupBoxBan.Controls.Add(this.textBoxServer);
            this.groupBoxBan.Controls.Add(this.textBoxName);
            this.groupBoxBan.Controls.Add(this.buttonBAN);
            this.groupBoxBan.Controls.Add(this.labelPrezdivka);
            this.groupBoxBan.Controls.Add(this.labelStart);
            this.groupBoxBan.Controls.Add(this.comboBoxTypBanu);
            this.groupBoxBan.Controls.Add(this.textBoxStart);
            this.groupBoxBan.Controls.Add(this.label1);
            this.groupBoxBan.Controls.Add(this.labelServer);
            this.groupBoxBan.Controls.Add(this.textBoxKonec);
            this.groupBoxBan.Controls.Add(this.labelKonec);
            this.groupBoxBan.Location = new System.Drawing.Point(12, 309);
            this.groupBoxBan.Name = "groupBoxBan";
            this.groupBoxBan.Size = new System.Drawing.Size(847, 121);
            this.groupBoxBan.TabIndex = 14;
            this.groupBoxBan.TabStop = false;
            this.groupBoxBan.Text = "Banování";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(987, 270);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(744, 218);
            this.tabControl1.TabIndex = 15;
            this.tabControl1.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.BackColor = System.Drawing.Color.Gray;
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(736, 190);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "BAN";
            // 
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.Color.Gray;
            this.tabPage2.Controls.Add(this.button1);
            this.tabPage2.Controls.Add(this.textBox1);
            this.tabPage2.Controls.Add(this.textBox2);
            this.tabPage2.Controls.Add(this.label3);
            this.tabPage2.Controls.Add(this.label4);
            this.tabPage2.Controls.Add(this.comboBox1);
            this.tabPage2.Controls.Add(this.textBox3);
            this.tabPage2.Controls.Add(this.label5);
            this.tabPage2.Controls.Add(this.label6);
            this.tabPage2.Controls.Add(this.textBox4);
            this.tabPage2.Controls.Add(this.label7);
            this.tabPage2.Location = new System.Drawing.Point(4, 24);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(736, 190);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Odbanování";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.IndianRed;
            this.button1.Cursor = System.Windows.Forms.Cursors.Default;
            this.button1.Enabled = false;
            this.button1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.button1.Location = new System.Drawing.Point(295, 83);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(131, 39);
            this.button1.TabIndex = 22;
            this.button1.Text = "Odbanovat!";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // textBox1
            // 
            this.textBox1.Enabled = false;
            this.textBox1.Location = new System.Drawing.Point(523, 54);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 23);
            this.textBox1.TabIndex = 18;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(99, 54);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 23);
            this.textBox2.TabIndex = 12;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label3.Location = new System.Drawing.Point(111, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 21);
            this.label3.TabIndex = 13;
            this.label3.Text = "Přezdívka";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label4.Location = new System.Drawing.Point(311, 30);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(102, 21);
            this.label4.TabIndex = 21;
            this.label4.Text = "Začátek banu";
            // 
            // comboBox1
            // 
            this.comboBox1.Enabled = false;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Temp",
            "Perma",
            "VAC"});
            this.comboBox1.Location = new System.Drawing.Point(205, 54);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(100, 23);
            this.comboBox1.TabIndex = 14;
            // 
            // textBox3
            // 
            this.textBox3.Enabled = false;
            this.textBox3.Location = new System.Drawing.Point(311, 54);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 23);
            this.textBox3.TabIndex = 20;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label5.Location = new System.Drawing.Point(215, 30);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(73, 21);
            this.label5.TabIndex = 15;
            this.label5.Text = "Typ Banu";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label6.Location = new System.Drawing.Point(544, 30);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(55, 21);
            this.label6.TabIndex = 19;
            this.label6.Text = "Server";
            // 
            // textBox4
            // 
            this.textBox4.Enabled = false;
            this.textBox4.Location = new System.Drawing.Point(417, 54);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(100, 23);
            this.textBox4.TabIndex = 16;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label7.Location = new System.Drawing.Point(421, 30);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(91, 21);
            this.label7.TabIndex = 17;
            this.label7.Text = "Konec banu";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(12, 450);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(116, 38);
            this.button2.TabIndex = 16;
            this.button2.Text = "Zpět";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.ClientSize = new System.Drawing.Size(889, 500);
            this.Controls.Add(this.groupBoxBan);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridViewBany);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Správce banů";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewBany)).EndInit();
            this.groupBoxBan.ResumeLayout(false);
            this.groupBoxBan.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label labelPrezdivka;
        private System.Windows.Forms.ComboBox comboBoxTypBanu;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridViewBany;
        private System.Windows.Forms.Label labelKonec;
        private System.Windows.Forms.TextBox textBoxKonec;
        private System.Windows.Forms.TextBox textBoxServer;
        private System.Windows.Forms.Label labelServer;
        private System.Windows.Forms.Label labelStart;
        private System.Windows.Forms.TextBox textBoxStart;
        private System.Windows.Forms.Button buttonBAN;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBoxBan;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnPrezdivka;
        private System.Windows.Forms.DataGridViewTextBoxColumn Columntyp;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnStart;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnEND;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnAdmin;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnServer;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnZabanovany;
        private System.Windows.Forms.DataGridViewButtonColumn ColumnUnban;
    }
}


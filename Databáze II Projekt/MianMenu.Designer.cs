
namespace Databáze_II_Projekt
{
    partial class MainMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonSpravceBanu = new System.Windows.Forms.Button();
            this.buttonStats = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.buttonSpravceBugu = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.buttonquit = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // buttonSpravceBanu
            // 
            this.buttonSpravceBanu.Location = new System.Drawing.Point(52, 162);
            this.buttonSpravceBanu.Name = "buttonSpravceBanu";
            this.buttonSpravceBanu.Size = new System.Drawing.Size(161, 34);
            this.buttonSpravceBanu.TabIndex = 0;
            this.buttonSpravceBanu.Text = "Správce banů";
            this.buttonSpravceBanu.UseVisualStyleBackColor = true;
            this.buttonSpravceBanu.Click += new System.EventHandler(this.buttonSpravceBanu_Click);
            // 
            // buttonStats
            // 
            this.buttonStats.Location = new System.Drawing.Point(52, 202);
            this.buttonStats.Name = "buttonStats";
            this.buttonStats.Size = new System.Drawing.Size(161, 34);
            this.buttonStats.TabIndex = 1;
            this.buttonStats.Text = "Statistiky";
            this.buttonStats.UseVisualStyleBackColor = true;
            this.buttonStats.Click += new System.EventHandler(this.buttonStats_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(52, 82);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(161, 34);
            this.button1.TabIndex = 2;
            this.button1.Text = "Správa Hráčů";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // buttonSpravceBugu
            // 
            this.buttonSpravceBugu.Location = new System.Drawing.Point(52, 122);
            this.buttonSpravceBugu.Name = "buttonSpravceBugu";
            this.buttonSpravceBugu.Size = new System.Drawing.Size(161, 34);
            this.buttonSpravceBugu.TabIndex = 3;
            this.buttonSpravceBugu.Text = "Správa Bugů";
            this.buttonSpravceBugu.UseVisualStyleBackColor = true;
            this.buttonSpravceBugu.Click += new System.EventHandler(this.buttonSpravceBugu_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(62, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(138, 32);
            this.label1.TabIndex = 4;
            this.label1.Text = "Main Menu";
            // 
            // buttonquit
            // 
            this.buttonquit.BackColor = System.Drawing.Color.Firebrick;
            this.buttonquit.Location = new System.Drawing.Point(52, 282);
            this.buttonquit.Name = "buttonquit";
            this.buttonquit.Size = new System.Drawing.Size(161, 34);
            this.buttonquit.TabIndex = 6;
            this.buttonquit.Text = "Konec";
            this.buttonquit.UseVisualStyleBackColor = false;
            this.buttonquit.Click += new System.EventHandler(this.buttonquit_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(52, 242);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(161, 34);
            this.button2.TabIndex = 7;
            this.button2.Text = "Jiné";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // MainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.ClientSize = new System.Drawing.Size(268, 373);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.buttonquit);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.buttonSpravceBugu);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.buttonStats);
            this.Controls.Add(this.buttonSpravceBanu);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "MainMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Main Menu";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonSpravceBanu;
        private System.Windows.Forms.Button buttonStats;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button buttonSpravceBugu;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button buttonquit;
        private System.Windows.Forms.Button button2;
    }
}
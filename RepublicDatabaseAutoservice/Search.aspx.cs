using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Text;
using RepublicDatabaseAutoservice.Logic;

namespace RepublicDatabaseAutoservice
{
    public partial class Search : System.Web.UI.Page
    {
        private string selectedBrand;
        private string selectedRegion;
        private string selectedCategory;
        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillFields.LoadBrands(DropDownList1);
                FillFields.LoadRegions(DropDownList2);
                FillFields.LoadCategories(DropDownList3);
                FillFields.LoadBrands(DropDownList4);
                FillFields.LoadModels(DropDownList5);
            }
        }

        private void GenerateHTML(DataTable _dt)
        {
            StringBuilder html = new StringBuilder();
            html.Append("<br><center><table border = '1'><tr>");
            foreach (DataColumn column in _dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            foreach (DataRow row in _dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in _dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            html.Append("</table></center>");

            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }

        protected void Button1_Click(object sender, EventArgs e) { }

        protected void ddl2_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedRegion = DropDownList2.Items[System.Convert.ToInt32(DropDownList2.SelectedValue)].Text;
            DataTable dt = CallStoredProcedure.spGetStoByRegion(DropDownList2.SelectedItem.Text);
            GenerateHTML(dt);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable dt = CallStoredProcedure.spGetStoByDistrict(TextBox2.Text);
            GenerateHTML(dt);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataTable dt = CallStoredProcedure.spGetStoByCity(TextBox3.Text);
            GenerateHTML(dt);
        }

        protected void Button4_Click(object sender, EventArgs e) { }

        protected void ddl3_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCategory = DropDownList3.Items[System.Convert.ToInt32(DropDownList3.SelectedValue)].Text;
            DataTable dt = CallStoredProcedure.spGetStoByCategory(DropDownList3.SelectedItem.Text);
            GenerateHTML(dt);
        }
          
        protected void Button5_Click(object sender, EventArgs e)
        {
            DataTable dt = CallStoredProcedure.spGetStoByBrandAndModel(DropDownList4.SelectedItem.Text, DropDownList5.SelectedItem.Text);
            GenerateHTML(dt);
        }

        protected void Button6_Click(object sender, EventArgs e) { }

        protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedBrand = DropDownList1.Items[System.Convert.ToInt32(DropDownList1.SelectedValue)].Text;
            DataTable dt = CallStoredProcedure.spGetStoByBrand(DropDownList1.SelectedItem.Text);
            GenerateHTML(dt);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            DataTable dt = CallStoredProcedure.spGetStoByAgeAuto(TextBox8.Text);
            GenerateHTML(dt);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            DataTable dt = CallStoredProcedure.spGetStoByAgeAndMakerCountry(TextBox9.Text, TextBox10.Text);
            GenerateHTML(dt);
        }*/
    }
}
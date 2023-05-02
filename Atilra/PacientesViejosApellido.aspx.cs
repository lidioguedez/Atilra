using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Atilra
{
    public partial class PacientesViejosApellido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("sp_pacientes_mas_viejos", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@cantidad", 10);
                    command.Parameters.AddWithValue("@patron", TextBoxPatronApellido.Text);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    GridViewPacientesViejosApellido.DataSource = table;
                    GridViewPacientesViejosApellido.DataBind();
                }
            }
        }
    }
}
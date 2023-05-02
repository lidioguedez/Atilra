using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Atilra
{
    public partial class Ingresos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonIngresar_Click(object sender, EventArgs e)
        {
            string nombreEstudio = txtNombreEstudio.Text;
            int dni = Convert.ToInt32(txtDni.Text);
            int matricula = Convert.ToInt32(txtMatricula.Text);
            string nombreInstituto = txtNombreInstituto.Text;
            string sigla = txtSigla.Text;
            int cantidad = Convert.ToInt32(txtCantidad.Text);
            int lapso = Convert.ToInt32(txtLapso.Text);

            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("sp_IngresarEstudiosProgramados", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@nombreEstudio", nombreEstudio);
                    command.Parameters.AddWithValue("@dni", dni);
                    command.Parameters.AddWithValue("@matricula", matricula);
                    command.Parameters.AddWithValue("@nombreInstituto", nombreInstituto);
                    command.Parameters.AddWithValue("@sigla", sigla);
                    command.Parameters.AddWithValue("@cantidad", cantidad);
                    command.Parameters.AddWithValue("@lapso", lapso);

                    command.ExecuteNonQuery();
                }
            }

            lblResult.Text = "Estudios programados ingresados correctamente.";
        }
    }
}
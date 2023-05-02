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
    public partial class IngresarActualizarPrecios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonIngresarActualizar_Click(object sender, EventArgs e)
        {
            string nombreEstudio = TextBoxNombreEstudio.Text;
            string nombreInstituto = TextBoxNombreInstituto.Text;
            double precio = Convert.ToDouble(TextBoxPrecio.Text);

            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("sp_ingresar_precio_estudio", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@nombreEstudio", nombreEstudio);
                    command.Parameters.AddWithValue("@nombreInstituto", nombreInstituto);
                    command.Parameters.AddWithValue("@precio", precio);

                    command.ExecuteNonQuery();
                }
            }

            LabelResult.Text = "Precio del estudio ingresado o actualizado correctamente.";
        }
    }
}
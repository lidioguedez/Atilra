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
    public partial class EstudiosPeriodo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonConsultar_Click(object sender, EventArgs e)
        {
            int mes = Convert.ToInt32(TextBoxMes.Text);
            int anio = Convert.ToInt32(TextBoxAnio.Text);
            int cantidadPacientes, cantidadMedicos;

            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("sp_cantidad_pacientes_y_medicos_por_periodo", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@mes", mes);
                    command.Parameters.AddWithValue("@anio", anio);
                    SqlParameter cantidadPacientesParam = new SqlParameter("@cantidadPacientes", SqlDbType.Int);
                    cantidadPacientesParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(cantidadPacientesParam);

                    SqlParameter cantidadMedicosParam = new SqlParameter("@cantidadMedicos", SqlDbType.Int);
                    cantidadMedicosParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(cantidadMedicosParam);

                    command.ExecuteNonQuery();

                    cantidadPacientes = (int)cantidadPacientesParam.Value;
                    cantidadMedicos = (int)cantidadMedicosParam.Value;
                }
            }

            LabelResult.Text = $"En el período {mes}/{anio}, {cantidadPacientes} pacientes y {cantidadMedicos} médicos realizaron estudios.";
        }
    }
}
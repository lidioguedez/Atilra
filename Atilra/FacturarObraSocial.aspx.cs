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
    public partial class FacturarObraSocial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonFacturar_Click(object sender, EventArgs e)
        {
            string obraSocialSigla = TextBoxObraSocialSigla.Text;
            DateTime periodoInicio = Convert.ToDateTime(TextBoxPeriodoInicio.Text);
            DateTime periodoFin = Convert.ToDateTime(TextBoxPeriodoFin.Text);

            double precioTotal;
            int cantidadEstudios;

            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("sp_precio_total_facturar", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@obraSocialSigla", obraSocialSigla);
                    command.Parameters.AddWithValue("@periodoInicio", periodoInicio);
                    command.Parameters.AddWithValue("@periodoFin", periodoFin);

                    SqlParameter precioTotalParam = new SqlParameter("@precioTotal", SqlDbType.Float);
                    precioTotalParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(precioTotalParam);

                    SqlParameter cantidadEstudiosParam = new SqlParameter("@cantidadEstudios", SqlDbType.Int);
                    cantidadEstudiosParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(cantidadEstudiosParam);

                    command.ExecuteNonQuery();

                    precioTotal = (double)precioTotalParam.Value;
                    cantidadEstudios = (int)cantidadEstudiosParam.Value;
                }
            }

            ClearCrlts();

            LabelResult.Text = $"Se facturarán {cantidadEstudios} estudios a la obra social '{obraSocialSigla}' por un total de {precioTotal:C2}.";
        }

        private void ClearCrlts()
        {
            TextBoxObraSocialSigla.Text = "";
            TextBoxPeriodoInicio.Text = "";
            TextBoxPeriodoFin.Text = "";
        }
    }
}
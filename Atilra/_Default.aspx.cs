using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atilra
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            ConsultarPacientes();
        }

        private void ConsultarPacientes()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
            string query = @"SELECT TOP 3
                        p.Nombre,
                        p.Apellido,
                        os.razonSocial AS ObraSocial,
                        pl.idPlan AS PlanID,
                        ei.precio * (1 - pce.porcentaje / 100) AS ImporteAbonado
                        FROM
                        pacientes p
                        INNER JOIN estudiosRealizados er ON er.dni = p.dni
                        INNER JOIN obraSocial os ON os.sigla = er.sigla
                        INNER JOIN pacientes_Planes pp ON pp.dni = p.dni
                        INNER JOIN planes pl ON pl.idPlan = pp.idPlan
                        INNER JOIN estudios_Institutos ei ON ei.idEstudio = er.idEstudio AND ei.idInstituto = er.idInstituto
                        INNER JOIN planes_cob_estudios pce ON pce.idPlan = pl.idPlan AND pce.idEstudio = er.idEstudio
                        WHERE
                        er.abono = 've' AND er.sigla IS NOT NULL
                        ORDER BY
                        er.idEstudioReal DESC";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dtResultados = new DataTable();
                    adapter.Fill(dtResultados);
                    gvResultados.DataSource = dtResultados;
                    gvResultados.DataBind();
                }
            }
        }
    }
}
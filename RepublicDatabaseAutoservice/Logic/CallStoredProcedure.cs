using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace RepublicDatabaseAutoservice.Logic
{
    public class CallStoredProcedure
    {
        private static string conStr = "RDAConnection";

        public static DataTable CallSP(string _query)
        {
            string constr = ConfigurationManager.ConnectionStrings[conStr].ConnectionString;
            
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(_query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        public static DataTable spGetSto(string _reg, string _distr, string _city, string _br, string _mo, string _cat, string _age, string _country)
        {
            string query = String.Concat("EXEC GetSTO '", _reg, "','", _distr, "','", _city, "','", _br, "','", _mo, "','", _cat, "',", _age, ",'", _country, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByRegion(string _param)
        {
            string query = String.Concat("EXEC GetSTOByRegion '", _param, "'");
            return CallSP(query);            
        }

        public static DataTable spGetStoByDistrict(string _param)
        {
            string query = String.Concat("EXEC GetSTOByDistrict '", _param, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByCity(string _param)
        {
            string query = String.Concat("EXEC GetSTOByCity '", _param, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByCategory(string _param)
        {
            string query = String.Concat("EXEC GetSTOByCategory '", _param, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByBrandAndModel(string _param1, string _param2)
        {
            string query = String.Concat("EXEC GetSTOByBrandAndModel '", _param1, "','", _param2, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByBrand(string _param)
        {
            string query = String.Concat("EXEC GetSTOByBrand '", _param, "'");
            return CallSP(query);
        }

        public static DataTable spGetStoByAgeAuto(string _param)
        {
            string query = String.Concat("EXEC GetSTOByAgeAuto ", _param);
            return CallSP(query);
        }

        public static DataTable spGetStoByAgeAndMakerCountry(string _param1, string _param2)
        {
            string query = String.Concat("EXEC GetSTOByAgeAndMakerCountry ", _param1, ",'", _param2, "'");
            return CallSP(query);
        }
    }
}
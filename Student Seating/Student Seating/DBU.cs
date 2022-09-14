using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace IPUMS
{
    public class DBU
    {
        public static SqlDataAdapter da;
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static DataSet ds;

        public static void callproc(string dml)
        {
            da = new SqlDataAdapter();
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            cmd = new SqlCommand();
            ds = new DataSet();
            cmd.Connection = con;
            cmd.CommandText = dml;
            da.SelectCommand = cmd;
            da.Fill(ds);
        }
        public static int getnewid(string dml)
        {
            int maxid;
            da = new SqlDataAdapter();
            ds = new DataSet();
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = dml;
            da.SelectCommand = cmd;
            da.Fill(ds);
            try
            {
                maxid = (int)ds.Tables[0].Rows[0].ItemArray[0];
            }
            catch
            {
                maxid = 0;
            }
            return maxid + 1;
        }

        public static string bestHall(string fctid, string date, string start, string end, int number, string hid1)
        {
            DBU.callproc("exec select_count_hall_by_fctid @fctid = '" + fctid + "';");
            int nbHall = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
            int i = 0, j = 0, diff = 0;
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "';");
            int min = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[1].ToString());
            min = min - number;
            while (i < nbHall)
            {
                DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "';");
                string hids = DBU.ds.Tables[0].Rows[i].ItemArray[0].ToString();
                int seats = int.Parse(DBU.ds.Tables[0].Rows[i].ItemArray[1].ToString());
                diff = seats - number;
                if (diff > 0 || diff == 0)
                {
                    if (diff < min || diff == min)
                    {
                        DBU.callproc("check_hall @hid = '" + hids + "', @date = '" + date + "', @start = '" + start + "', @end = '" + end + "';");
                        int test;
                        try
                        {
                            test = int.Parse(DBU.ds.Tables[0].Rows[0].ItemArray[0].ToString());
                        }
                        catch
                        {
                            test = 0;
                        }
                        if (test + number < seats || test + number == seats)
                        {
                            if (!string.Equals(hids, hid1))
                            {
                                j = i;
                                min = diff;
                            }
                        }
                    }
                }
                i++;
            }
            DBU.callproc("exec select_hall_by_fctid @fctid = '" + fctid + "';");
            string hid = DBU.ds.Tables[0].Rows[j].ItemArray[0].ToString();
            return hid;
        }
    }
}
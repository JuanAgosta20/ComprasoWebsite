﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CapaAccesoaDatos
{
    public class BaseDeDatos
    {
        SqlConnection connection;

        public BaseDeDatos(string path)
        {
            
            connection = new SqlConnection(path);
        }
        public SqlConnection getConnection()
        {
            return connection;
        }
    
        public DataTable getTable(string selectConsulta, string tableName)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(selectConsulta, connection);
            DataTable table = new DataTable(tableName);
            try
            {
                connection.Open();
                adapter.Fill(table);
                connection.Close();
                return table;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int ExecStoredProcedure(SqlCommand cmd, String spName)
        {
            cmd.Connection = connection;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = spName;
            try
            {
                connection.Open();
                int Filas = cmd.ExecuteNonQuery();
                connection.Close();
                return Filas;
            }
            catch (SqlException ex)
            {
                connection.Close();
                return ex.Number;
            }
        }

        public void ExecStoredProcedure(SqlCommand cmd, String spName, ref DataTable table)
        {
            cmd.Connection = connection;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = spName;
            try
            {
                connection.Open();
                SqlDataReader dataReader = cmd.ExecuteReader();
                table.Load(dataReader);
                connection.Close();

            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    public class ArvoExepcion: Exception
    {
        public ArvoExepcion(string mensaje) : base (mensaje)
        {

        }
    }
}

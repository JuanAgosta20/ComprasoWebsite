﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class Usuario
    {
        private string idUsuario;
        private bool admin;
        private string nombre;
        private string apellido;
        private string dni;
        private string email;
        private string password;
        private string nrocel;
        private string fechaNac;

        public Usuario()
        {

        }

        public Usuario(string _Email)
        {
            Email = _Email;
        }

        public string IDUsuario
        {
            get { return idUsuario; }
            set { idUsuario = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        public string DNI
        {
            get { return dni; }
            set { dni = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string nroCel
        {
            get { return nrocel; }
            set { nrocel = value; }
        }
        public string FechaNac
        {
            get { return fechaNac; }
            set { fechaNac = value; }
        }
        public bool Admin
        {
            get { return admin; }
            set { admin = value; }
        }
    }
}

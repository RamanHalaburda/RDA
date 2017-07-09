using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SqlServer.Types;

namespace RepublicDatabaseAutoservice.Models
{
    public class Models
    {
    }

    public class Autoservice
    {
        public int serviceID { get; set; }
        public string serviceName { get; set; }
        public Address serviceAddress { get; set; }
        public SqlGeography serviceLocation { get; set; }
    }

    public class Address
    {
        public string region { get; set; }
        public string district { get; set; }
        public string city { get; set; }
        public string street { get; set; }
        public string house { get; set; }
        public string housing { get; set; }
        public string office { get; set; }
    }

    public class Person
    {
        public string firstName { get; set; }
        public string fatherName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
    }

    public class Admin : Person
    {
        public int adminID { get; set; }
        public int service { get; set; }
        public string login { get; set; }
        public string passowrd { get; set; }
    }
}
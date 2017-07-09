using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RepublicDatabaseAutoservice.Models;
using Microsoft.SqlServer.Types;

namespace RepublicDatabaseAutoservice.Logic
{
    public class AddAutoservices
    {
        public bool AddService(int serviceID, string serviceName, Address serviceAddress, SqlGeography serviceLocation)
        {
            var myService = new Autoservice();
            myService.serviceID = serviceID;
            myService.serviceName = serviceName;
            myService.serviceAddress = serviceAddress;
            myService.serviceLocation = serviceLocation;
            /*
            using (ProductContext _db = new ProductContext())
            {
                // Add service to DB.
                _db.Products.Add(myService);
                _db.SaveChanges();
            }*/
            // Success.
            return true;
        }
    }
}
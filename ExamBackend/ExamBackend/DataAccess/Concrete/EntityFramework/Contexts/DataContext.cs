using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities.Concrete;
using System.Configuration;
using System.Reflection;
using Entities.Concrete;

namespace DataAccess.Concrete.EntityFramework.Contexts
{
    public class DataContext : DbContext
    {
       
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
         
            //Data Source=DESKTOP-LAEV069;Initial Catalog=Weekly;Integrated Security=True
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-LAEV069;Initial Catalog=Exam;Integrated Security=True");
      
        }
        public DbSet<OperationClaim> OperationClaims { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Demand> Demand { get; set; }
        public DbSet<UserOperationClaim> UserOperationClaim { get; set; }

        // public DbSet<ERP_DATA> ERP_DATA { get; set; }

    }
}

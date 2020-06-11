using Core.Entities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Entities.Concrete
{
    public class Demand:IEntity
    {
        public int Id { get; set; }
        public string  Name { get; set; }
        public string Surname { get; set; }
        public string File { get; set; }
        public string Aciklama { get; set; }
        public string Adminaciklama { get; set; }
        public DateTime Createdate { get; set; }
        public DateTime? Reviewdate { get; set; }
        public bool? State { get; set; }//Değerlendirilmiş mi

        public bool Active { get; set; }
        public int UserId { get; set; }
    }
}

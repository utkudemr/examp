using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Business.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemandController : ControllerBase
    {
        private static IDemandService _demand;

        public DemandController(IDemandService demand)
        {
            _demand = demand;
        }
        [HttpPost("add")]
        public ActionResult Add(Demand demand)
        {
            var response = _demand.Add(demand);
            return Ok(response);
        }


        public void SendMail(string email, string name,bool? state )
        {
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            // setup Smtp authentication
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("mail adı","mail şifresi");
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;
            //can be obtained from your model
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(email);
            msg.To.Add(new MailAddress("utkuudemr@gmail.com"));

            msg.Subject = "Message from A.info";
            msg.IsBodyHtml = true;
            msg.Body = string.Format("<html><head></head><body><b> Talep "+state+"</b></body>");
            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {

            }
        }

        [HttpPost("update")]
        public ActionResult Update(Demand demand)
        {
             var response = _demand.Update(demand);
            var email = User.Claims.FirstOrDefault(a => a.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")?.Value;
            var namesurname = User.Claims.FirstOrDefault(a => a.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name")?.Value;
            //SendMail(email, namesurname,response.Data.State);
            return Ok(response);
        }

        [HttpGet("getadmin/{demandType?}")]
        public ActionResult GetAdmin(string demandType)
        {
            bool? asdsad = demandType=="null" ? (bool?)null : Convert.ToBoolean(demandType);
            var response = _demand.GetAdmin(asdsad);
            return Ok(response);
        }
    

        [HttpGet("getuser")]
        public ActionResult GetUser()
        {
            var response = _demand.GetList();
            return Ok(response);
        }
    }
}
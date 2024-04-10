using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("a5e15d3eb6b392", "cb9d8e82338b37");
            server.EnableSsl = true;
            server.Port= 2525;
            server.Host = "sandbox.smtp.mailtrap.io";
        }

        public void armarCorreo(string emailDestino,string asunto,string cuerpo)
        {
            email=new MailMessage();
            email.From= new MailAddress("noresponder@pokedexweb.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.Body = cuerpo;

        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}

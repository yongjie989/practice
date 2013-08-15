using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for clsCommon
/// </summary>
public static class clsCommon
{
    public static bool GetObject(HttpContext context, ref object obj, ref clsRtnMsg msg)
    {
        try
        {
            foreach (var prop in obj.GetType().GetProperties())
            {
                    if (prop.PropertyType.Name.Equals("Int32"))
                    {                        
                        prop.SetValue(obj, Convert.ToInt16(context.Request[prop.Name]), null);
                    }
                    else if (prop.PropertyType.Name.Equals("String"))
                    {
                        prop.SetValue(obj, context.Request[prop.Name], null);
                    }
                    else if (prop.PropertyType.Name.Equals("Double"))
                    {
                        prop.SetValue(obj, Convert.ToDouble(context.Request[prop.Name]), null);
                    }
                    else
                    {
                        prop.SetValue(obj, context.Request[prop.Name], null);
                    }
            } 
        }
        catch (Exception ex)
        {
            msg.id = eCode.EXCEPTION;
            msg.message = GetExceptionType(ex);            
            return false;
        }
        return true;
    }

    public static string GetExceptionType(Exception ex)
    {
        string exceptionType = ex.GetType().ToString();
        return exceptionType.Substring(
            exceptionType.LastIndexOf('.') + 1);
    }

    public static void SendMail(HttpContext context, clsMember m, ref clsRtnMsg msg)
    {
        MailMessage mailMsg = new MailMessage();
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        try
        {
            mailMsg.Subject = "DoItWell啟動連結";
            mailMsg.Body = clsCommon.ActiveMailTemplate(context, m.real_name, m.email);
            mailMsg.From = new MailAddress("doitwell588@gmail.com");
            mailMsg.To.Add("amau712@gmail.com");
            mailMsg.IsBodyHtml = true;
            client.Host = "smtp.gmail.com";
            System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential("doitwell588@gmail.com", "0936066188");
            client.Port = int.Parse("587");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicauthenticationinfo;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(mailMsg);
        }
        catch (Exception ex)
        {
            msg.id = eCode.EX_SEND_EMAIL;
            msg.message = clsRtnMsg.errDecrip[msg.id] + ex.Message;            
        }
    }

    public static string ActiveMailTemplate(HttpContext context, string userNamem, string eMail)
    {
        StreamReader sr = null;
        string strBody = "";

        //讀取信件範本 
        try
        {
            sr = new StreamReader(context.Request.MapPath("TemplateActiveMail.html"), Encoding.Default);
            strBody = sr.ReadToEnd();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sr.Close();
        }
        //將範本內的特定變數作取代 
        strBody = strBody.Replace("$realName$", userNamem);
        strBody = strBody.Replace("$eMail$", eMail);

        return strBody;
    }
}
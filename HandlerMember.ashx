<%@ WebHandler Language="C#" Class="HandlerMember" %>

using System;
using System.Web;
using System.Data;
using Newtonsoft.Json;

public class HandlerMember : IHttpHandler
{    
    private clsRtnMsg _msg;
    private clsMember _member;
    private bool _rltJson = false;
    
    public void ProcessRequest(HttpContext context)
    {
        _msg = new clsRtnMsg();
        _member = new clsMember();
        
        try
        {
            if (context.Request["action"] == null) return;

            string mode = context.Request["action"].ToString();
            switch (mode)
            {
                case "member_register":
                    _rltJson = MemberRegister(context);                  
                    break;
                case "member_active":
                    _rltJson = MemberActive(context);  
                    break;
                case "member_login":
                    _rltJson = MemberLogin(context);
                    break;
                case "member_forgot":
                    _rltJson = MemberForgot(context);
                    break;
            }

            if (_rltJson)
            {
                _msg.id = eCode.SUCCESS;
                _msg.message = clsRtnMsg.errDecrip[_msg.id];                
            }

            if (_msg.id.Length > 0)
            {
                var json = JsonConvert.SerializeObject(_msg);
                context.Response.Write(json); 
            }            
        }
        catch (Exception ex)
        {

            string message = ex.Message;
            if (ex.InnerException != null && ex.InnerException.Message != null)
                message += "<BR>" + ex.InnerException.Message;

            _msg.id = eCode.EXCEPTION;
            _msg.message = message;

            var json = JsonConvert.SerializeObject(_msg);
            context.Response.Write(json);
        }
    }

    private bool MemberRegister(HttpContext context)
    {
        object obj = _member;
        string json = "";
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return false;

        DataTable dt;
        
        dt = ComSQL.Member_ExistAccount(_member);
        if (dt.Rows.Count > 0)
        {
            _msg.id = eCode.DUP_ACCOUNT;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return false;
        }
        
        dt = ComSQL.Member_ExistMail(_member);
        if (dt.Rows.Count > 0)
        {
            _msg.id = eCode.DUP_EMAIL;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return false;
        }

        ComSQL.Member_Register(_member);
        
        // 發出啟動信
        // .....
        // .....
        
        return true;
    }

    private bool MemberActive(HttpContext context)
    {
        object obj = _member;
        string json = "";
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return false;

        clsCommon.SendMail(context, _member, ref _msg);   
        return true;
    }

    public bool MemberLogin(HttpContext context)
    {
        object obj = _member;
        string json = "";
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return false;

        DataTable dt;

        dt = ComSQL.Member_ExistAccount(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.NOT_EXIST_UID;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return false;
        }

        dt = ComSQL.Member_ExistPassword(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.NOT_EXIST_PW;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return false;
        }

        dt = ComSQL.Member_ActiveCheck(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.UNACTIVE;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return false;
        }
        
        return true;
    }

    public bool MemberForgot(HttpContext context)
    {
        object obj = _member;
        string json = "";
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return false;
        
        
        
        return true;
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
<%@ WebHandler Language="C#" Class="HandlerMember" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using Newtonsoft.Json;

public class HandlerMember : IHttpHandler, IRequiresSessionState
{    
    private clsRtnMsg _msg;
    private clsMember _member;
    private int _rltJson = -1;
    
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
                case "get_member_info":
                    _rltJson = GetMemberInfo(context);
                    break;
                case "member_update":
                    _rltJson = MemberUpdate(context);
                    break;
                default:
                    _msg.id = eCode.NOT_EXIST_ACTION;
                    _msg.message = clsRtnMsg.errDecrip[_msg.id];                
                    break;
            }

            
            
            switch (_rltJson)
            {
                case 0:
                    _msg.id = eCode.SUCCESS;
                    _msg.message = clsRtnMsg.errDecrip[_msg.id];
                    var jsonMsg = JsonConvert.SerializeObject(_msg);
                    context.Response.Write(jsonMsg);  
                    break;
                case 1:
                    var jsonFailMsg = JsonConvert.SerializeObject(_msg);
                    context.Response.Write(jsonFailMsg);  
                    break;
                case 2:
                    var jsonData = JsonConvert.SerializeObject(_member);
                    context.Response.Write(jsonData);  
                    break;
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

    private int MemberRegister(HttpContext context)
    {
        object obj = _member;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return GVar.JFAIL;

        DataTable dt;

        if (context.Session["Captcha"].ToString() != _member.verify)
        {
            _msg.id = eCode.EX_CAPTCHA;
            _msg.message = clsRtnMsg.errDecrip[_msg.id] + _member.verify;
            return GVar.JFAIL;
        }
        
        dt = ComSQL.Member_ExistAccount(_member);
        if (dt.Rows.Count > 0)
        {
            _msg.id = eCode.DUP_ACCOUNT;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL;
        }
        
        dt = ComSQL.Member_ExistMail(_member);
        if (dt.Rows.Count > 0)
        {
            _msg.id = eCode.DUP_EMAIL;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL;
        }

        ComSQL.Member_Register(_member);
        
        // TODO
        // 發出啟動信
        // clsCommon.SendMail("ActiveMail", context, _member, ref _msg);

        return GVar.JRTN_MSG;
    }

    private int MemberActive(HttpContext context)
    {
        if (context.Request["user_name"] == null) return GVar.JFAIL;
        if (context.Request["email"] == null) return GVar.JFAIL;
        
        string userName = context.Request["user_name"];
        string eMail = context.Request["email"];
        ComSQL.Member_ActiveMember(userName, eMail);

        return GVar.JRTN_MSG;
    }

    public int MemberLogin(HttpContext context)
    {
        object obj = _member;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return GVar.JFAIL;

        DataTable dt;

        dt = ComSQL.Member_ExistAccount(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.NOT_EXIST_UID;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL;
        }

        dt = ComSQL.Member_ExistPassword(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.NOT_EXIST_PW;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL;
        }

        dt = ComSQL.Member_ActiveCheck(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.UNACTIVE;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL;
        }

        context.Session["user_name"] = _member.user_name;

        return GVar.JRTN_MSG;
    }

    public int MemberForgot(HttpContext context)
    {
        object obj = _member;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return GVar.JFAIL;
        
        // TODO
        // clsCommon.SendMail("SendPassword", context, _member, ref _msg);

        return GVar.JRTN_MSG;
    }

    public int GetMemberInfo(HttpContext context)
    {
        object obj = _member;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return GVar.JFAIL;
        
        DataTable dt;

        dt = ComSQL.Member_ExistAccount(_member);
        if (dt.Rows.Count == 0)
        {
            _msg.id = eCode.NOT_EXIST_MEMBER;
            _msg.message = clsRtnMsg.errDecrip[_msg.id];
            return GVar.JFAIL; 
        }

        _member.user_id = dt.Rows[0]["user_id"].ToString();
        _member.real_name = dt.Rows[0]["real_name"].ToString();
        _member.user_name = dt.Rows[0]["user_name"].ToString();
        _member.password = dt.Rows[0]["password"].ToString();
        _member.gender = dt.Rows[0]["gender"].ToString();
        _member.birthday_year = dt.Rows[0]["birthday_year"].ToString();
        _member.birthday_month = dt.Rows[0]["birthday_month"].ToString();
        _member.birthday_day = dt.Rows[0]["birthday_day"].ToString();
        _member.telephone = dt.Rows[0]["telephone"].ToString();
        _member.mobile = dt.Rows[0]["mobile"].ToString();
        _member.email = dt.Rows[0]["email"].ToString();
        _member.city = dt.Rows[0]["city"].ToString();
        _member.locality = dt.Rows[0]["locality"].ToString();
        _member.address = dt.Rows[0]["address"].ToString();
        _member.active = dt.Rows[0]["active"].ToString();
        _member.createtime = dt.Rows[0]["createtime"].ToString();

        return GVar.JDATA_OBJ;
    }

    public int MemberUpdate(HttpContext context)
    {
        object obj = _member;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return GVar.JFAIL;
        
        ComSQL.Member_Update(_member);
        
        return GVar.JRTN_MSG;
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
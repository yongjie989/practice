using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsResult
/// </summary>
/// 

public class eCode
{
    public static readonly string SUCCESS = "000";
    public static readonly string DUP_ACCOUNT = "100";
    public static readonly string DUP_EMAIL = "101";
    public static readonly string EX_SEND_EMAIL = "102";
    public static readonly string NOT_EXIST_UID = "103";
    public static readonly string NOT_EXIST_PW = "104";
    public static readonly string UNACTIVE = "105";
    public static readonly string EXCEPTION = "999";
}

public class clsRtnMsg
{
    public string id { get; set; }
    public string message { get; set; }

    public static readonly Dictionary<string, string> errDecrip = new Dictionary<string, string>
    {   
        { eCode.SUCCESS, "成功 " },
        { eCode.DUP_ACCOUNT, "帳號已重覆, 請選用其他帳號 " },
        { eCode.DUP_EMAIL, "此Email已註冊過 " },
        { eCode.EX_SEND_EMAIL, "發送Email發生錯誤 " },
        { eCode.NOT_EXIST_UID, "帳號錯誤 " },
        { eCode.NOT_EXIST_PW, "密碼錯誤 " },
        { eCode.UNACTIVE, "未啟動連結 " }
    };
}
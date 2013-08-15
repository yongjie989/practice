<%@ WebHandler Language="C#" Class="HandlerPainter" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class HandlerPainter : IHttpHandler {

    private clsRtnMsg _msg;
    private clsPainter _painter;
    private bool _rltJson = false;
    
    public void ProcessRequest(HttpContext context)
    {
        //?
        //context.Response.ContentType = "text/plain";
        _msg = new clsRtnMsg();
        _painter = new clsPainter();
        
        try
        {
            if (context.Request["action"] == null) return;

            string mode = context.Request["action"].ToString();
            switch (mode)
            {
                case "save_painter_step":
                    _rltJson = SavePainterStep(context);
                    break;
                case "get_painter_step":
                    _rltJson = GetPainterStep(context);
                    break;
            }

            if (_rltJson)
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
        //?
        //context.Response.End();
    }

    private bool SavePainterStep(HttpContext context)
    {
        object obj = _painter;
        if (clsCommon.GetObject(context, ref obj, ref _msg) == false) return false;
        ComSQL.Painter_SaveStep(_painter);
        return true;
    }

    private bool GetPainterStep(HttpContext context)
    {
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
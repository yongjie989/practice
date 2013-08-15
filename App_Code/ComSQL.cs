using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Data;

/// <summary>
/// Summary description for ComSQL
/// </summary>
public static class ComSQL
{
    #region " table name "
    private const string TABLE_PAINTER = "painter";
    private const string TABLE_MEMBER = "member";
    #endregion

    #region " member "
    public static DataTable Member_ExistMail(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("SELECT * FROM {0} WHERE EMAIl='{1}'", TABLE_MEMBER, m.email);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Member_ActiveCheck(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("SELECT * FROM {0} WHERE USER_NAME='{1}' AND PASSWORD='{2}' AND ACTIVE='Y'", TABLE_MEMBER, m.user_name, m.password);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Member_ExistPassword(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("SELECT * FROM {0} WHERE PASSWORD='{1}'", TABLE_MEMBER, m.password);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Member_ExistAccount(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("SELECT * FROM {0} WHERE USER_NAME='{1}'", TABLE_MEMBER, m.user_name);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    /*
    public static DataTable Member_ExistMail(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("SELECT * FROM {0} WHERE EMAIL='{1}'", TABLE_MEMBER, m.email);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    */
    public static int Member_Register(clsMember m)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_MEMBER);

        foreach (var prop in m.GetType().GetProperties())
        {
            ins.Add(prop.Name, prop.GetValue(m, null));
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    #endregion

    #region " painter "
    public static int Painter_SaveStep(clsPainter p)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_PAINTER);

        foreach (var prop in p.GetType().GetProperties())
        {
            ins.Add(prop.Name, prop.GetValue(p, null));            
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static void Painter_GetStep()
    {
    }

    #endregion
}
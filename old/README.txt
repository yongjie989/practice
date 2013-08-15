Developing Notes for DoItWell
=============================
Latest update time: 2013/8/9 23:08
developer: Ethan
[1] Comments: I has been update painter.html in the D:\doitwell02,
    the painter screen is designed at screen over 1300 pixel (width) and this
    server is 1200 pixel. Therefore we can use google chrome and zoom out it
    to 75%.
[2] in the server virtual location have a modules.aspx, this's mysql function,
    if want to use mysql needed copy MySql.Data.dll into D:\doitwell_dev\doitwell\bin
[3]	Changed Web.config added providerName="MySql.Data.MySqlClient", and trun on debug mode.
[4] http://140.116.86.167/page1.aspx?act=showdata is example for mysql select.
[5] http://140.116.86.167/painter.html is draft layout for painter desktop.

Latest update time: 2013/8/13 10:36
developer: Ethan
[1] painter.sql is SQL for Painter.
[2] Save step logs in MySQL, that's for Undo and Redo.
    var session_id, step_id, object_type, object_height, object_width, position_top, position_left,
    angle, fill, filpX, flipY, hasBorders, hasControls, hasRotatingPoint, opacity, overlayFill,
    scaleX, scaleY, selectable;
    
    var params = '{
        "session_id": session_id,
        "step_id": step_id,
        "object_type": object_type,
        "object_height": object_height,
        "object_width": object_width,
        "position_top": position_top,
    
    }';
    var obj = jQuery.parseJSON({);
[2] Undo & Redo QueryString:
    Undo => painterHandler.ashx?action=undo

Latest update time: 2013/8/14 14:13
developer: Ethan
[1] Send member register data to HandlerMember.ashx?action=member_register
    {
        real_name: "黃勇介"
        user_name: "ethan"
        password: "123"
        gender: "男"
        birthday_year: "1994"
        birthday_month: "3"
        birthday_day: "5"
        telephone: "06-23456789"
        mobile: "0988000000"
        email: "yongjie989@gmail.com"
        city: "台南市"
        locality: "安南區"
        address: "安中一街"
    };
[2] Response data for [action=member_register]
    Response '000' when insert into OK . Otherwise server return { id:xxx, message: xxx } json format.
[3] HandlerMember.ashx?action=member_login 
    for user login.
[4] HandlerMember.ashx?action=get_member_data&user_name=Session['user_name'];
[5] HandlerMember.ashx?action=member_forgot 
    back-side needs send password to email for the user.  
    
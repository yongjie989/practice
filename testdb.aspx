<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testdb.aspx.cs" Inherits="testdb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/fabric.all.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script>
        var step_id = 0;
        var undo_id, redo_id, total_step_id = 0;
        var session_id = 'qwertyuio';
        $(document).ready(function () {

            var painter = {
                book_id: 123,
                page_id: 456,
                session_id: session_id,
                step_id: step_id,
                object_type: 'circle',
                object_height: 0,
                object_width: 0,
                position_top: 0,
                position_left: 0,
                angle: 0,
                fill: 'fill',
                filpX: false,
                flipY: false,
                hasBorders: true,
                hasControls: true,
                hasRotatingPoint: false,
                opacity: 1,
                overlayFill: 'fill',
                scaleX: 1,
                scaleY: 1,
                selectable: true
            };

            $("#send_json").click(function () {

                var painter_json = jQuery.parseJSON(JSON.stringify(painter));
                $.ajax({
                    dataType: "json",
                    url: 'HandlerPainter.ashx?action=save_painter_step',
                    data: painter_json,
                    success: function (data) { alert(data); }
                });

                total_step_id++;
                step_id++;
                undo_id = NaN;
                redo_id = NaN;
                $("#Total_ID").html("總步驟ID = " + total_step_id);
            });

            $("#get_json").click(function () {
                //get current painter_step
                $.getJSON('HandlerPainter.ashx', { 'action': 'get_painter_step', 'session_id': session_id, 'step_id': step_id }, function (data) {
                    $.each(data, function (key, val) {
                        console.log(key + "=>" + val);
                    });
                });
            });

            $("#Undo").click(function () {
                if (isNaN(undo_id)) {
                    undo_id = total_step_id;
                    redo_id = undo_id;
                }
                if (undo_id != 1) {
                    undo_id -= 1;
                    $.getJSON('HandlerPainter.ashx', { 'action': 'get_painter_step', 'session_id': session_id, 'step_id': undo_id }, function (data) {
                        $.each(data, function (key, val) {
                            console.log(key + "=>" + val);
                        });
                    });
                    total_step_id++;
                }
                $("#Undo_ID").html("Undo步驟ID = " + undo_id);
            });

            $("#Redo").click(function () {
                if (undo_id < redo_id) {
                    undo_id += 1;
                    $.getJSON('HandlerPainter.ashx', { 'action': 'get_painter_step', 'session_id': session_id, 'step_id': undo_id }, function (data) {
                        $.each(data, function (key, val) {
                            console.log(key + "=>" + val);
                        });
                    });
                    total_step_id++;
                }
                $("#Redo_ID").html("Redo步驟ID = " + undo_id);
            });

            $("#Member_Active").click(function () {

                var member_json
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMember.ashx?action=member_active&user_name=aa&email=amau712@gmail.com',
                    data: member_json,
                    success: function (data) { alert(data); }
                });
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <button id="send_json">
        send json</button>
    <button id="get_json">
        get json</button>
    <button id="Undo">
        Undo</button>
    <button id="Redo">
        Redo</button>
    <button id="Member_Active">
        Active</button>
    <div>
    </div>
    </form>
</body>
</html>

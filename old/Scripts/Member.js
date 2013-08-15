$(document).ready(function() {
    $("#system_message").hide();
    $("#system_message").css({"background-color":"#D462FF","padding":"5px","color":"#ffffff","margin":"5px"});
    
    
    $("#submit_button").click(function(data){
        $("#system_message").hide();
        
        if( $.trim($("#user_register_form").find("input[name=real_name]").val()) == ''){
            $("#system_message").slideDown().html("請輸入姓名");
            return false;
        };
        
        if( $.trim($("#user_register_form").find("input[name=user_name]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入帳號");
            return false;
        };
        
        if( $.trim($("#user_register_form").find("input[name=password]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入登入密碼");
            return false;
        };
        if( $.trim($("#user_register_form").find("input[name=confirm_password]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入確認密碼");
            return false;
        };
        if( $.trim($("#user_register_form").find("input[name=confirm_password]").val()) != 
            $.trim($("#user_register_form").find("input[name=password]").val())
        ){
            $("#system_message").slideDown().html("您輸入兩次的密碼不一樣");
            return false;
        };
        
        if( $.trim($("#user_register_form").find("select[name=gender]").val()) == '' ){
            $("#system_message").slideDown().html("請選擇您的性別");
            return false;
        };
        if( $.trim($("#user_register_form").find("select[name=birthday_year]").val()) == '' ||
            $.trim($("#user_register_form").find("select[name=birthday_month]").val()) == '' ||
            $.trim($("#user_register_form").find("select[name=birthday_day]").val()) == ''
        ){
            $("#system_message").slideDown().html("請選擇您的生日");
            return false;
        };
        if( $.trim($("#user_register_form").find("input[name=telephone]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入電話");
            return false;
        };        
        if( $.trim($("#user_register_form").find("input[name=email]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入Email");
            return false;
        };
        if( $.trim($("#user_register_form").find("input[name=address]").val()) == '' ){
            $("#system_message").slideDown().html("請輸入收件地址");
            return false;
        };
        
        var member_json = {};
        member_json.real_name = $.trim($("#user_register_form").find("input[name=real_name]").val());
        member_json.user_name = $.trim($("#user_register_form").find("input[name=user_name]").val());
        member_json.password = $.trim($("#user_register_form").find("input[name=password]").val());
        member_json.gender = $.trim($("#user_register_form").find("select[name=gender]").val());
        member_json.birthday_year = $.trim($("#user_register_form").find("select[name=birthday_year]").val());
        member_json.birthday_month = $.trim($("#user_register_form").find("select[name=birthday_month]").val());
        member_json.birthday_day = $.trim($("#user_register_form").find("select[name=birthday_day]").val());
        member_json.telephone = $.trim($("#user_register_form").find("input[name=telephone]").val());
        member_json.mobile = $.trim($("#user_register_form").find("input[name=mobile]").val());
        member_json.email = $.trim($("#user_register_form").find("input[name=email]").val());
        member_json.zipcode = $.trim($("#user_register_form").find("input[name=zipcode]").val());
        member_json.city = $.trim($("#user_register_form").find("select[name=city]").val());
        member_json.locality = $.trim($("#user_register_form").find("select[name=locality]").val());
        member_json.address = $.trim($("#user_register_form").find("input[name=address]").val());
        
        var member_json = jQuery.parseJSON(JSON.stringify(member_json));
        console.log(member_json);
        
        $.ajax({
            dataType: "json",
            url: 'HandlerMember.ashx?action=member_register',
            data: member_json,
            success: function(data){
                if(data=='000'){
                    window.location.href = '/';
                };
                if(data.id != '000'){
                    $("#system_message").slideDown().html(data.message);
                };
            }
        });
    });
    
    $("#login_button").click(function(){
        if( $("input[name='user_name']").val() == "" || $("input[name='password']").val() == "") {
                $("#system_message").slideDown().html("請輸入登入帳號及密碼");
                return false;				
            }else{
                var member_json = {};
                member_json.user_name = $.trim($("#user_login_form").find("input[name=user_name]").val());
                member_json.password = $.trim($("#user_login_form").find("input[name=password]").val());
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMember.ashx?action=member_login',
                    data: member_json,
                    success: function(data){
                        if(data=='000'){
                            window.location.href = '/';
                        };
                        if(data.id != '000'){
                            $("#system_message").slideDown().html(data.message);
                        };
                    }
                });
            }
    });

    $("#send_forgot_button").click(function(){
        if( $("input[name='email']").val() == "") {
                $("#system_message").slideDown().html("請輸入Email");
                return false;				
            }else{
                var member_json = {};
                member_json.email = $.trim($("#front_user_forgot_form").find("input[name=email]").val());
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMember.ashx?action=member_forgot',
                    data: member_json,
                    success: function(data){
                        if(data=='000'){
                            window.location.href = 'MemberForgotSent.aspx';
                        };
                        if(data.id != '000'){
                            $("#system_message").slideDown().html(data.message);
                        };
                    }
                });
            }
    });
    
});
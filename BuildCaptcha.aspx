<%@ Page Language="C#" EnableSessionState="True" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Drawing.Text" %>
<%@ Import Namespace="System.Drawing.Imaging" %>
<script runat="server">
    protected void Page_Init(object sender, EventArgs e)
    {
		// (封裝 GDI+ 點陣圖) 新增一個 Bitmap 物件，並指定寬、高
        Bitmap _bmp = new Bitmap(70, 20);
		
		// (封裝 GDI+ 繪圖介面) 所有繪圖作業都需透過 Graphics 物件進行操作
        Graphics _graphics = Graphics.FromImage(_bmp);
        _graphics.Clear(Color.Black);
		// 如果想啟用「反鋸齒」功能，可以將以下這行取消註解
        //_graphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        // 設定要出現在圖片上的文字字型、大小與樣式
        Font _font = new Font("Courier New", 12, FontStyle.Bold);

		// 產生一個 5 個字元的亂碼字串，並直接寫入 Session 裡
		// 請參考: http://www.obviex.com/Samples/Password.aspx )
        Session["Captcha"] = RandomPassword.Generate(6, 6);

        // 將亂碼字串「繪製」到之前產生的 Graphics 「繪圖板」上
        _graphics.DrawString(Convert.ToString(Session["Captcha"]), _font, Brushes.White, 3, 3);

        // 輸出之前 Captcha 圖示
        Response.ContentType = "image/gif";
        _bmp.Save(Response.OutputStream, ImageFormat.Gif);
		
		// 釋放所有在 GDI+ 所佔用的記憶體空間 ( 非常重要!! )
        _font.Dispose();
        _graphics.Dispose();
        _bmp.Dispose();

		// 由於我們要輸出的是「圖片」而非「網頁」，所以必須在此中斷網頁執行
        Response.End();
    }
</script>
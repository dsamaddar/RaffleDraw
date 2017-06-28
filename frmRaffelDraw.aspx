<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmRaffelDraw.aspx.vb" Inherits="frmRaffelDraw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td style="width: 10%">
            </td>
            <td style="width: 80%">
                <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Verdana"
                    Font-Size="XX-Large" ForeColor="#00CC00">REFL Picnic 
                2017 - Raffle Draw</asp:Label>
            </td>
            <td style="width: 10%">
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Label ID="lblPrizeNo" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="XX-Large"
                    ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlButtons" runat="server">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td style="width: 16.67%">
                                <asp:Button ID="btnPickUp" runat="server" Text="Random Selection" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="btnDigitOne" runat="server" Text="D1" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="btnDigitTwo" runat="server" Text="D2" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="btnDigitThree" runat="server" Text="D3" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="btnDigitFour" runat="server" Text="D4" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="lblDigitAll" runat="server" Text="All" />
                            </td>
                            <td style="width: 16.67%">
                                <asp:Button ID="btnConfirmSelection" runat="server" Text="Confirm Selection" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlCouponEnlarged" runat="server">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td style="width: 25%">
                                <asp:Label ID="lblDigitOne" runat="server" Font-Size="225pt" ForeColor="#660066"
                                    Text="-"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:Label ID="lblDigitTwo" runat="server" Font-Size="225pt" ForeColor="#660066"
                                    Text="-"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:Label ID="lblDigitThree" runat="server" Font-Size="225pt" ForeColor="#660066"
                                    Text="-"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:Label ID="lblDigitFour" runat="server" Font-Size="225pt" ForeColor="#660066"
                                    Text="-"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEmpInfo" runat="server">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                <asp:Label ID="lblEmployeeName" runat="server" Font-Bold="True" Font-Italic="False"
                                    Font-Names="Verdana" Font-Size="XX-Large" ForeColor="#3333CC"></asp:Label>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Image ID="imgWinner" runat="server" Height="250px" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                                <asp:Label ID="lblCouponNo" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Verdana"
                                    Font-Size="XX-Large" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:HiddenField ID="hdFldCouponNo" runat="server" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    </form>

    <script type="text/javascript">

/******************************************
* Snow Effect Script- By Altan d.o.o. (http://www.altan.hr/snow/index.html)
* Visit Dynamic Drive DHTML code library (http://www.dynamicdrive.com/) for full source code
* Last updated Nov 9th, 05' by DD. This notice must stay intact for use
******************************************/
  function openwindow(){
window.open("autumn_effect.htm","","width=350,height=500")
}

  //Configure below to change URL path to the snow image
  //var snowsrc="snow.gif"
  var snowsrc="Sources/images/snow.gif"
  // Configure below to change number of snow to render
  var no = 10;
  // Configure whether snow should disappear after x seconds (0=never):
  var hidesnowtime = 0;
  // Configure how much snow should drop down before fading ("windowheight" or "pageheight")
  var snowdistance = "pageheight";

///////////Stop Config//////////////////////////////////

  var ie4up = (document.all) ? 1 : 0;
  var ns6up = (document.getElementById&&!document.all) ? 1 : 0;

	function iecompattest(){
	return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
	}

  var dx, xp, yp;    // coordinate and position variables
  var am, stx, sty;  // amplitude and step variables
  var i, doc_width = 800, doc_height = 600; 
  
  if (ns6up) {
    doc_width = self.innerWidth;
    doc_height = self.innerHeight;
  } else if (ie4up) {
    doc_width = iecompattest().clientWidth;
    doc_height = iecompattest().clientHeight;
  }

  dx = new Array();
  xp = new Array();
  yp = new Array();
  am = new Array();
  stx = new Array();
  sty = new Array();
  snowsrc=(snowsrc.indexOf("dynamicdrive.com")!=-1)? "snow.gif" : snowsrc
  //snowsrc="Sources/images/gift1-2.png"
  for (i = 0; i < no; ++ i) {  
    dx[i] = 0;                        // set coordinate variables
    xp[i] = Math.random()*(doc_width-50);  // set position variables
    yp[i] = Math.random()*doc_height;
    am[i] = Math.random()*20;         // set amplitude variables
    stx[i] = 0.02 + Math.random()/10; // set step variables
    sty[i] = 0.7 + Math.random();     // set step variables
		if (ie4up||ns6up) {
      if (i == 0) {
        document.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><a href=\"http://dynamicdrive.com\"><img src='"+snowsrc+"' border=\"0\"><\/a><\/div>");
      } else {
        document.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img src='"+snowsrc+"' border=\"0\"><\/div>");
      }
    }
  }

  function snowIE_NS6() {  // IE and NS6 main animation function
    doc_width = ns6up?window.innerWidth-10 : iecompattest().clientWidth-10;
		doc_height=(window.innerHeight && snowdistance=="windowheight")? window.innerHeight : (ie4up && snowdistance=="windowheight")?  iecompattest().clientHeight : (ie4up && !window.opera && snowdistance=="pageheight")? iecompattest().scrollHeight : iecompattest().offsetHeight;
	if (snowdistance=="windowheight"){
		doc_height = window.innerHeight || iecompattest().clientHeight
	}
	else{
		doc_height = iecompattest().scrollHeight
	}
    for (i = 0; i < no; ++ i) {  // iterate for every dot
      yp[i] += sty[i];
      if (yp[i] > doc_height-50) {
        xp[i] = Math.random()*(doc_width-am[i]-30);
        yp[i] = 0;
        stx[i] = 0.02 + Math.random()/10;
        sty[i] = 0.7 + Math.random();
      }
      dx[i] += stx[i];
      document.getElementById("dot"+i).style.top=yp[i]+"px";
      document.getElementById("dot"+i).style.left=xp[i] + am[i]*Math.sin(dx[i])+"px";  
    }
    snowtimer=setTimeout("snowIE_NS6()", 10);
  }

	function hidesnow(){
		if (window.snowtimer) clearTimeout(snowtimer)
		for (i=0; i<no; i++) document.getElementById("dot"+i).style.visibility="hidden"
	}
		

if (ie4up||ns6up){
    snowIE_NS6();
		if (hidesnowtime>0)
		setTimeout("hidesnow()", hidesnowtime*1000)
		}

    </script>

</body>
</html>

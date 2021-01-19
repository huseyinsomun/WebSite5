<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin2.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <title></title>
     <script src="Yeni Metin Belgesi (7).txt"></script>
    <script type="text/javascript" src="scripts/platformOverrides.js"></script>
 <script>//*********************************MENU EKLEME İŞLEMLERİ **********************************************************************
        function suokuma() {
            $("#suokuma_islem").show();
            $("#aidatekle_islem").hide();
            $("#kisiekle_islem").hide();
            $("#kiraciekle_islem").hide();
            $("#suokuma").addClass("a"); $("#suokuma").removeClass("hover");
            $("#elektrikokuma").removeClass("a");$("#elektrikokuma").addClass("hover");
            $("#dogalgazokuma").removeClass("a"); $("#dogalgazokuma").addClass("hover");
            $("#aidatekle").removeClass("a"); $("#aidatekle").addClass("hover");
            $("#kisiekle").removeClass("a");   $("#kisiekle").addClass("hover");
            $("#kiraciekle").removeClass("a");$("#kiraciekle").addClass("hover");
        };

        function elektrikokuma() {
            $("#suokuma_islem").show();
            $("#aidatekle_islem").hide();
            $("#kisiekle_islem").hide();
            $("#kiraciekle_islem").hide(); 
            $("#suokuma").removeClass("a");$("#suokuma").addClass("hover");
            $("#elektrikokuma").addClass("a");$("#elektrikokuma").removeClass("hover");
            $("#dogalgazokuma").removeClass("a");$("#dogalgazokuma").addClass("hover");
            $("#aidatekle").removeClass("a");$("#aidatekle").addClass("hover");
            $("#kisiekle").removeClass("a");$("#kisiekle").addClass("hover");
            $("#kiraciekle").removeClass("a");$("#kiraciekle").addClass("hover");
        };


        function dogalgazokuma() {
            $("#suokuma_islem").show();
            $("#aidatekle_islem").hide();
            $("#kisiekle_islem").hide();
            $("#kiraciekle_islem").hide(); 
            $("#suokuma").removeClass("a");$("#suokuma").addClass("hover");
            $("#elektrikokuma").removeClass("a");$("#elektrikokuma").addClass("hover");
            $("#dogalgazokuma").addClass("a");$("#dogalgazokuma").removeClass("hover");
            $("#aidatekle").removeClass("a");$("#aidatekle").addClass("hover");
            $("#kisiekle").removeClass("a");$("#kisiekle").addClass("hover");
            $("#kiraciekle").removeClass("a");$("#kiraciekle").addClass("hover");
        };

        function aidatekle() {
            $("#suokuma_islem").hide(); 
            $("#aidatekle_islem").show();
            $("#kisiekle_islem").hide();
            $("#kiraciekle_islem").hide();
            $("#suokuma").removeClass("a");$("#suokuma").addClass("hover");
            $("#elektrikokuma").removeClass("a");$("#elektrikokuma").addClass("hover");
            $("#dogalgazokuma").removeClass("a");$("#dogalgazokuma").addClass("hover");
            $("#aidatekle").addClass("a");$("#aidatekle").removeClass("hover");
            $("#kisiekle").removeClass("a");$("#kisiekle").addClass("hover");
            $("#kiraciekle").removeClass("a");$("#kiraciekle").addClass("hover");
        };

        function kisiekle() {
            $("#suokuma_islem").hide();
          
            $("#aidatekle_islem").hide();
            $("#kisiekle_islem").show();
            $("#kiraciekle_islem").hide();
            $("#suokuma").removeClass("a");$("#suokuma").addClass("hover");
            $("#elektrikokuma").removeClass("a");$("#elektrikokuma").addClass("hover");
            $("#dogalgazokuma").removeClass("a");$("#dogalgazokuma").addClass("hover");
            $("#aidatekle").removeClass("a");$("#aidatekle").addClass("hover");
            $("#kisiekle").addClass("a");$("#kisiekle").removeClass("hover");
            $("#kiraciekle").removeClass("a");$("#kiraciekle").addClass("hover");
        };

        function kiraciekle() {
            $("#suokuma_islem").hide(); 
            $("#aidatekle_islem").hide();
            $("#kisiekle_islem").hide();
            $("#kiraciekle_islem").show();
            $("#suokuma").removeClass("a");$("#suokuma").addClass("hover");
            $("#elektrikokuma").removeClass("a");$("#elektrikokuma").addClass("hover");
            $("#dogalgazokuma").removeClass("a");$("#dogalgazokuma").addClass("hover");
            $("#aidatekle").removeClass("a");$("#aidatekle").addClass("hover");
            $("#kisiekle").removeClass("a");$("#kisiekle").addClass("hover");
            $("#kiraciekle").addClass("a");$("#kiraciekle").removeClass("hover");
        };
    </script>
    <script>  //  **************************GLOBAL DEĞİŞKENLER/*******************************************
        var tumbilgiler = new Array();
        var subayrak = "1";
        var blokid;
        var ablokid;
        var bblokid;
        var cblokid;
        var dblokid;
        var eblokid;
        var fblokid;
        var gblokid;
        var hblokid;
        var dairesayisi;
        var yoneticiid;
        var binaid;
        var bayrak1 = "";    
        var islem;
        var sual1 = new Array();
        var kontrolbayrak = "1";
   </script>
   

 <script>  //  **************************GLOBAL DEĞİŞKENLER/*******************************************




     function suislem() { subayrak = "1";  islem = "1";blokbilgileri(); suokuma();  };

     function eislem(){  subayrak = "1"; islem = "2";blokbilgileri();elektrikokuma();  };

     function gazislem() { subayrak = "1";  islem = "3";blokbilgileri();dogalgazokuma(); };

     function blokbilgileri() { 

         yoneticiid = document.getElementById("yoneticiid").innerHTML;
         $("#suisleri").show();
         $.ajax({                                            //////////////////// BLOK BİLGİLERİ ALIP HANGİ BLOKLAR VARSA ONU GÖSTERİR
             type: "POST",
             url: "admin2.aspx/Blokbilgileri",
             data: "{'yoneticiid':'" + yoneticiid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) { 
                 for (var i = 0; i < msg.d.length; i++) {
                     if (msg.d[i] == "A") { ablokid = msg.d[i + 1]; $("#A").show();}; 
                     if (msg.d[i] == "B") { bblokid = msg.d[i + 1]; $("#B").show();};
                     if (msg.d[i] == "C") { cblokid = msg.d[i + 1]; $("#C").show();};
                     if (msg.d[i] == "D") { dblokid = msg.d[i + 1]; $("#D").show();};
                     if (msg.d[i] == "E") { eblokid = msg.d[i + 1]; $("#E").show();};
                     if (msg.d[i] == "F") { fblokid = msg.d[i + 1]; $("#F").show();};
                     if (msg.d[i] == "G") { gblokid = msg.d[i + 1]; $("#G").show();};
                     if (msg.d[i] == "H") { hblokid = msg.d[i + 1]; $("#H").show();};
                    
                 };

                 blokid = ablokid;
                 gosterme();
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         }); 
    };  
     function atikleme() { blokid = ablokid; subayrak = "1"; gosterme();};
     function btikleme() { blokid = bblokid;subayrak = "1"; gosterme(); };
     function ctikleme() { blokid = cblokid;subayrak ="1";  gosterme(); };   
     function dtikleme() { blokid = dblokid;subayrak ="1";  gosterme(); };           
     function etikleme() { blokid = eblokid; subayrak = "1";  gosterme(); };
     function ftikleme() { blokid = fblokid;subayrak ="1";   gosterme(); };           
     function gtikleme() { blokid = gblokid; subayrak ="1";  gosterme(); };
     function htikleme() { blokid = hblokid; subayrak ="1";  gosterme(); };

     function gosterme() { 
              if (subayrak =="1") { subayrak = "0"; 
         $.ajax({
             type: "POST",
             url: "admin2.aspx/Dairebilgileri",
             data: "{'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 if (msg.d == "1") {
                     temizle();
                 };
                 if (msg.d != "1") {  
                 
                   tumbilgiler = msg.d;
                    dairesayisi = (tumbilgiler.length) / 5;   
                        binaid = msg.d[2];
                  yoneticiid = msg.d[3];
                     deneme();
                 };
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         }); 
 };
     };
 </script> 
   <script>   
       function temizle() {
            if (tumbilgiler != "1") {
      for (var j = 0; j < tumbilgiler.length; j++) { 
        $("div").remove(".g11");
         $("textarea").remove(".g21");
          $("div").remove(".g31"); 
          sual1 = [];
     };
  };
  };
       function deneme() { 
        
     temizle(); 
 var s1;
             $.ajax({
             type: "POST",
             url: "admin2.aspx/Sual",
             data: "{'blokid':'" + blokid + "' ,'islem':'" + islem + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
                 success: function (msg) {
            
                 if (msg.d == "1") {  
 var select = document.getElementById("g1"); 
                  for (var i = 1; i < dairesayisi+1; i++) {
                      var dno = document.createElement("div");
                      var ysu = document.createElement("textarea");
                      var esu = document.createElement("div"); 
                      dno.className = "g11"; 
                      ysu.className = "g21"; 
                      esu.className = "g31"; 
                      dno.textContent = "No:" + i; 
                      esu.textContent = "0"; 
                      dno.value = i;   
                      select.appendChild(dno);  select.appendChild(esu);
                      select.appendChild(ysu);
                      bayrak1 = "1";
              };  
                 };
                 if (msg.d != "1") {   
                     s1 = msg.d.length / dairesayisi; 
                     for (var k1 = 0; k1 < msg.d.length; k1 = k1 + s1) {
 sual1.push(msg.d[k1]);
                     }; 
 var select = document.getElementById("g1"); 
                  for (var i = 1; i < dairesayisi+1; i++) {
                      var dno = document.createElement("div");
                      var ysu = document.createElement("textarea");
                      var esu = document.createElement("div"); 
                      dno.className = "g11"; 
                      ysu.className = "g21"; 
                      esu.className = "g31"; 
                      dno.textContent = "No:" + i; 
                      esu.textContent = sual1[i-1]; 
                      dno.value = i;   
                      select.appendChild(dno);  select.appendChild(esu);
                      select.appendChild(ysu);
                      bayrak1 = "1";

                      if (esu.textContent == "") { esu.textContent = "0"; };
              }; 
 
                 };
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         });  
    
       }; 


       function kontrol() {
           var suoku = document.getElementsByClassName("g21");
           var eskisuoku = document.getElementsByClassName("g31");
           for (var i = 0; i < suoku.length; i++) {
               if ((suoku[i].value) < (eskisuoku[i].innerHTML)) {
                   alert(i+1 + " Nolu dairenin okuma değeri bir önceki okumadan küçük olamaz ");
                   kontrolbayrak = "0";
               }; 
           }; 
           if ($("#tutaral").val() == ""  ||   $("#tarihal").val() == ""  ) {
               alert("Lütfen Fatura Bilgilerini Giriniz");
                   kontrolbayrak = "0";
           };

       };








       function sukaydet() { 
           kontrolbayrak = "1";
           kontrol();
           if (kontrolbayrak == "1") { 
              var sufatura = $("#tutaral").val();
              var sonodeme = $("#tarihal").val();
              var donem = $("#donem").val();
              var suoku = document.getElementsByClassName("g21");
              var eskisuoku = document.getElementsByClassName("g31");
              var kmiktar=0;
              var j = 0;
              var kmiktar1=0;
              var carpan = 0;
               for (var t = 0; t < dairesayisi; t= t +1) {
               kmiktar1 = (suoku[t].value)-(eskisuoku[t].innerHTML) ;
                   kmiktar = kmiktar + kmiktar1;
              }; 
              carpan = sufatura / kmiktar; 
              kmiktar1 = 0;
              var hfatura = 0;
              for (var i = 0; i < tumbilgiler.length; i = i + 5) {
   var did = tumbilgiler[i];
  var dno = tumbilgiler[i + 1];
                  suokuma = suoku[j].value; 
kmiktar1 = (suoku[j].value)-(eskisuoku[j].innerHTML) ; 
             hfatura=(carpan*kmiktar1)+1;
                  j = j + 1;
                    $.ajax({
                type: "POST",
                url: "admin2.aspx/Sukaydet",
                data: "{'suokuma':'" + suokuma + "', 'did':'" + did + "', 'dno':'" + dno + "', 'blokid':'" + blokid + "', 'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'sonodeme':'" + sonodeme + "', 'sufatura':'" + sufatura + "', 'donem':'" + donem + "', 'hfatura':'" + hfatura + "', 'islem':'" + islem + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz!!!");
                },
            });
              };
              alert("Kayıtlar Başarılı");
               window.location.reload();
               };
        }; 
       
   </script>

      <script>

          function aidatal() { 

                var miktar = $("#miktar").val();
                var aralik1 = $("#aralik1").val();
                var aralik2 = $("#aralik2").val();
                var faiz = $("#faiz").val();
                var gecerlilik = $("#gecerlilik").val();
                var yonetici = document.getElementById('yoneticiid').innerHTML;



                $.ajax({
                type: "POST",
                url: "admin2.aspx/Aidatal",
                data: "{'yonetici':'" + yonetici + "','miktar':'" + miktar + "', 'aralik1':'" + aralik1 + "', 'aralik2':'" + aralik2 + "', 'faiz':'" + faiz + "', 'gecerlilik':'" + gecerlilik + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    alert(msg.d);
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };



      </script>
    <style>
        .h {   font-family: "Lucida Sans", sans-serif; color: white;background-color:#33b5e5;
               font-size: x-large;
               clear:both;
        }
         .h1 {   font-family: "Lucida Sans", sans-serif; color: white;background-color:#33b5e5;
               font-size: medium;
               clear:both;
        }
        #bloksilmeonay {
            top: 10px;
            width: 10px;
            height: 10px;
            background-color: cadetblue;
        }
        .blok {
            vertical-align: middle;
            text-align: center;
            float: left;
            margin: 5px;
            padding: 5px;
            font-size: x-large;
            border: thin solid #800080;
            width: 30px;
            height: 30px; 
            background-color: #33b5e5;
             color: #ffffff;
             box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }

            .blok:hover {
                opacity: 0.5;
                cursor: pointer;
            }
        .bloksecili {
            vertical-align: middle;
          text-align:center;
            float: left;
            margin: 5px;
            padding: 5px;
            font-size: x-large;
            border: thin solid #800080;
            width: 20px;
            height: 20px; 
            background-color: blueviolet;
             color: #ffffff;
             box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
             opacity:0.5;
        }

        .a {
            opacity: 0.5;
             
           background-color: blueviolet;
             color: #ffffff;
             box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
              font-family: "Lucida Sans", sans-serif;
            margin: 5px;
            padding: 5px;
            height: 18px;
            width: 145px;
            font-size: smaller;
            font-weight: bold;
            font-style: italic;
            font-variant: small-caps;
            vertical-align: middle;
            border: thin solid #800080;
        }
   .button {
            width: 150px;
            height: 20px;
            background-color: #33b5e5;
              color: #ffffff;
              box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            border: thin solid #0099FF;
            text-align: center;
            margin: 5px; 
            clear:both;
            padding:2px; 
        }

            .button:active {
              width:145px;
            height: 18px;
            background-color: #33b5e5;
             font-family: "Lucida Sans", sans-serif;
            font-size: smaller;
            font-weight: bold;
            font-style: italic;
            font-variant: small-caps;
            color: black;
            background-color:aqua;
            text-align: center;
            margin: 5px; 
            } 
            .button:hover {
                transition: linear;
                opacity: 0.5;
                cursor: pointer;
            }
        #menu {
            width: 190px;
            height: 400px;
            position: absolute;
            float: left;
            top: 18%;
            left: 0%;
        }
      #ust {
            background-color: #9933cc;
    color: #ffffff;
            top: 2%;
            right: 0%;
            left: 0%;
            bottom: 83%;
            width: 100%;
            height:15%;
            font-size:24px;
              opacity:0.5;
            position: absolute;
            float: left;
        }
        #menu_items {
            width: 850px;
            height: 400px;
            position: absolute;
            float: left;
            top: 18%;
            left: 200px;
            bottom: 83%;
        }

        .menu_items {
            width: 830px;
            height: 400px;
        }
         .hover {
             background-color: #33b5e5;
             color: #ffffff;
             box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
              font-family: "Lucida Sans", sans-serif;
            margin: 5px;
            padding: 5px;
            height: 20px;
            width: 150px;
            font-size: smaller;
            font-weight: bold;
            font-style: italic;
            font-variant: small-caps;
            vertical-align: middle;
            border: thin solid #800080;
           }
            .hover:active {
            margin: 5px;
            padding: 5px;
            height: 18px;
            width: 145px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: smaller;
            font-weight: bold;
            font-style: italic;
            font-variant: small-caps;
            color: black;
            background-color: blueviolet;
            text-align: center;
            vertical-align: middle;
            border: thin solid #800080;
            }

            .hover:hover {
                opacity: 0.3;
                cursor: pointer;
                background-color: blueviolet;
            } 

        .g11 {
           background-color: #33b5e5;
    color: #ffffff;
    text-align: center;
     
   width: 40px; height: 20px; 
  margin:5px;
  float:left;
        }
       
         .g21 { 
    text-align: center;
    font-size: 12px;
    
   width: 50px; height: 14px; 
  margin:5px;
  float:left;

        }
          .g31 { 
    background-color: #33b5e5;
    color: #ffffff;
    text-align: center;
     
  width: 80px; height: 20px; 
  margin:5px;
  float:left;
          }
        .g4 {
        }

        .bloksec {
            width: 30px;
            height: 30px;
            background-color: #33b5e5;
            color: #ffffff;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            border: thin solid #0099FF;
            text-align: center;
            margin: 5px; 
            float:left;
            padding:2px; 
          
        }
        #x {
     
          clear:both;
        }


        .alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}


/* Style the buttons */
.btn {
  border: none;
  outline: none;
  width:30px;
  height:30px;
  padding: 10px 16px;
  background-color: #f1f1f1;
  cursor: pointer;
  font-size: 18px;
  float:left;
  text-align:center;
  vertical-align:central;
}

/* Style the active class, and buttons on mouse-over */
.active, .btn:hover {
  background-color: #666;
  color: white;
}
        .auto-style4 {
            width: 100px;
        }
   
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 212px;
        }
   
        .auto-style7 {
            width: 29px;
        }
   
        .auto-style9 {
            width: 125px;
        }
        .auto-style12 {
            width: 33px;
        }
        .auto-style13 {
            width: 103px;
        }
        .auto-style14 {
            width: 171px;
        }
        .auto-style15 {
            width: 253px;
        }
   
        .auto-style16 {
            width: 252px;
        }
   
        .auto-style17 {
            width: 113px;
        }
   
        </style>
</head>
<body>
    <form id="form1" runat="server">
     
    
       
            <div id="ust">
                     <div id="yoneticiid" hidden="hidden">5</div>
                <h1>Yönetici Paneli</h1>
            </div>

            <div id="menu">
                <div id="suokuma" class="hover" onclick="suislem()">SU OKUMA</div>
                <div id="elektrikokuma" class="hover" onclick="eislem()">ELEKTRİK OKUMA</div>
                <div id="dogalgazokuma" class="hover" onclick="gazislem()">DOĞALGAZ OKUMA</div>
                <div id="aidatekle" class="hover" onclick="aidatekle()">AİDAT Belirle</div>
                <div id="kisiekle" class="hover" onclick="kisiekle()">Kişi EKLE</div>
                <div id="kiraciekle" class="hover" onclick="kiraciekle()"> boş </div>
            </div>
         
            <div id="menu_items">


     <div id="suokuma_islem" class="menu_items" hidden="hidden">
               <div class="alert info">
  <span class="closebtn">&times;</span>  
 Fatura Tutarı Giriniz:&nbsp; <input id="tutaral" type="text" autocomplete="off" placeholder="1250.45" class="auto-style1" /> Fatura Son Ödeme Tarihi Giriniz: <input id="tarihal" type="text" autocomplete="off" placeholder="01.01.2018"  class="auto-style2" />&nbsp; Donem :&nbsp;
   
         <asp:DropDownList ID="donem" runat="server" Height="16px" Width="158px">
             <asp:ListItem Value="0">Ocak</asp:ListItem>
             <asp:ListItem Value="1">Şubat</asp:ListItem>
             <asp:ListItem Value="2">Mart</asp:ListItem>
             <asp:ListItem Value="3">Nisan</asp:ListItem>
             <asp:ListItem Value="4">Mayıs</asp:ListItem>
             <asp:ListItem Value="5">Haziran</asp:ListItem>
             <asp:ListItem Value="6">Temmuz</asp:ListItem>
             <asp:ListItem Value="7">Ağustos</asp:ListItem>
             <asp:ListItem Value="8">Eylül</asp:ListItem>
             <asp:ListItem Value="9">Ekim</asp:ListItem>
             <asp:ListItem Value="10">Kasım</asp:ListItem>
             <asp:ListItem Value="11">Aralık</asp:ListItem>
     </asp:DropDownList>
     </div>
               
 <div id="myDIV"> 
     <div id="A" class="btn active" hidden="hidden" onclick="atikleme()">A</div>
     <div id="B" class="btn" hidden="hidden" onclick="btikleme()">B</div>
     <div id="C" class="btn" hidden="hidden"onclick="ctikleme()">C</div>
     <div id="D" class="btn" hidden="hidden"onclick="dtikleme()">D</div>
     <div id="E" class="btn" hidden="hidden"onclick="etikleme()">E</div>
    <div id="F" class="btn" hidden="hidden"onclick="ftikleme()">F</div>
     <div id="G" class="btn" hidden="hidden"onclick="gtikleme()">G</div>
     <div id="H" class="btn" hidden="hidden"onclick="htikleme()">H</div> 
</div>

<div style="clear:both;">  </div>
               
                 <div id="x">  <div id="g1"></div>      <div id="a1" class="a1"></div></div>  
                  <br /><br /><br />
        <div id="suisleri" class="button" hidden="hidden" onclick="sukaydet()">Kaydet</div> 





 </div>   
                 
 
                
                
                
                
                
                
 <div id="aidatekle_islem" class="menu_items" hidden="hidden"> 
      <div class="alert info"> 
          <table class="auto-style5"> <tr> 
                  <td class="auto-style6">Aidat Tutarı Giriniz:</td>
                  <td>  <input id="miktar" type="text" autocomplete="off" placeholder="100" class="auto-style4" /></td></tr> <tr>  
                  <td class="auto-style6">Ayın Kaçına Kadar Süresi Var</td>
                  <td> <input id="aralik1" type="text" autocomplete="off" placeholder="01"  class="auto-style7" />&nbsp; ile&nbsp;&nbsp; <input id="aralik2" type="text" autocomplete="off" placeholder="10"  class="auto-style7" /></td>
              </tr> <tr> <td class="auto-style6">Geciktirme İle İlgili Yasal Faiz Oranı:&nbsp; </td>
                  <td> <input id="faiz" type="text" autocomplete="off" placeholder="5"  class="auto-style4" /></td> </tr> <tr>
               <td class="auto-style6">Geçerlilik Sonu Giriniz :</td>
            <td>   <input id="gecerlilik" type="text" autocomplete="off" placeholder="01.01.2018"  class="auto-style4" /></td>  </tr>  <tr>  
               <td class="auto-style6"> </td>   <td>     <div id="aidatal" class="button" onclick="aidatal()">Kaydet</div></td> </tr>
                   </table>  </div> </div>   
                
         
                  
             
<div id="kisiekle_islem" class="menu_items" hidden="hidden"> 
 <div class="alert info"> 






        




     <table class="auto-style5">
         <tr>
             <td class="auto-style17">Blok Seçiniz :</td>
             <td class="auto-style15"><div id="myDIV2"> 
     <div id="A1" class="btn active" hidden="hidden" onclick="atikleme()">A</div>
     <div id="B1" class="btn" hidden="hidden" onclick="btikleme()">B</div>
     <div id="C1" class="btn" hidden="hidden"onclick="ctikleme()">C</div>
     <div id="D1" class="btn" hidden="hidden"onclick="dtikleme()">D</div>
     <div id="E1" class="btn" hidden="hidden"onclick="etikleme()">E</div>
    <div id="F1" class="btn" hidden="hidden"onclick="ftikleme()">F</div>
     <div id="G1" class="btn" hidden="hidden"onclick="gtikleme()">G</div>
     <div id="H1" class="btn" hidden="hidden"onclick="htikleme()">H</div> 
</div></td>
             <td class="auto-style12" rowspan="8" style="border-width: thin; border-color: #FFFFFF; border-left-style: solid;">&nbsp;</td>
             <td class="auto-style13">&nbsp;</td>
             <td class="auto-style14">&nbsp;</td>
         </tr>
         <tr>
             <td class="auto-style17">Daire Seçiniz :</td>
             <td class="auto-style15">
                 <select id="Select1" class="auto-style9" name="D1">
                     <option></option>
                 </select></td>
             <td class="auto-style13">&nbsp;</td>
             <td class="auto-style14">&nbsp;</td>
         </tr>
         <tr>
             <td class="auto-style17">Oturan Bilgileri: </td>
             <td class="auto-style15"> <input id="Radio1" type="radio" name="sahip" value="Kendisi" checked="checked"/>Kendisi
                  <input id="Radio2" type="radio" name="sahip" value="Kiraci"/>Kiracı
                  <input id="Radio3" type="radio" name="sahip" value="bos"/>BOŞ</td>
             <td class="auto-style13">&nbsp;</td>
             <td class="auto-style14">&nbsp;</td>
         </tr>
         <tr>
             <td colspan="2">Ev Sahibi Bilgileri :</td>
             <td class="auto-style13">Kiracı Bilgileri:</td>
             <td class="auto-style14">
                


             </td>
         </tr>
         <tr>
             <td class="auto-style17">&nbsp;</td>
             <td class="auto-style15">&nbsp;</td>
             <td class="auto-style13">&nbsp;</td>
             <td class="auto-style14">&nbsp;</td>
         </tr>
         <tr>
             <td class="auto-style17">Ad Soyad :</td>
             <td class="auto-style15">
                 <input id="Text1" class="auto-style16" type="text" autocomplete="off" placeholder="5xx xxx xxxx" /></td>
             <td class="auto-style13">Ad Soyad :</td>
             <td class="auto-style14">
                 <input id="Text3" class="auto-style16" type="text" autocomplete="off" /></td>
         </tr>
         <tr>
             <td class="auto-style17">Telefon</td>
             <td class="auto-style15">
                 <input id="Text2" class="auto-style16" type="text" autocomplete="off" /></td>
             <td class="auto-style13">Telefon</td>
             <td class="auto-style14">
                 <input id="Text4" class="auto-style16" type="text" autocomplete="off" /></td>
         </tr>
         <tr>
             <td class="auto-style17">&nbsp;</td>
             <td class="auto-style15">&nbsp;</td>
             <td class="auto-style13">&nbsp;</td>
             <td class="auto-style14">&nbsp;</td>
         </tr>
     </table>






        




</div>   
</div> 








      </div>               
    </form>
     <script>
// Add active class to the current button (highlight it)
var header = document.getElementById("myDIV");
var btns = header.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}
</script>
          
    </body>

<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
    } 
</script>







</html>
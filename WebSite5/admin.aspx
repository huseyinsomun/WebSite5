<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <title></title>
     <script src="Yeni Metin Belgesi (7).txt"></script>
    <script type="text/javascript" src="scripts/platformOverrides.js"></script>
   
    <script>//*********************************MENU EKLEME İŞLEMLERİ **********************************************************************
        function binaekle() {
            $("#bina_ekle_islem").show();
            $("#blok_ekle_islem").hide();
            $("#daire_ekle_islem").hide();
            $("#adres_ekle_islem").hide();
            $("#hesapno_ekle_islem").hide();
            $("#vergino_ekle_islem").hide();
            $("#bina_ekle").addClass("a"); $("#bina_ekle").removeClass("hover");
            $("#blok_ekle").removeClass("a");$("#blok_ekle").addClass("hover");
            $("#daire_ekle").removeClass("a"); $("#daire_ekle").addClass("hover");
            $("#adres_ekle").removeClass("a"); $("#adres_ekle").addClass("hover");
            $("#hesapno_ekle").removeClass("a");   $("#hesapno_ekle").addClass("hover");
            $("#vergino_ekle").removeClass("a");$("#vergino_ekle").addClass("hover");
        };

        function blok_ekle() {
            $("#bina_ekle_islem").hide();
            $("#blok_ekle_islem").show();
            $("#daire_ekle_islem").hide();
            $("#adres_ekle_islem").hide();
            $("#hesapno_ekle_islem").hide();
            $("#vergino_ekle_islem").hide();
            $("#bina_ekle").removeClass("a");$("#bina_ekle").addClass("hover");
            $("#blok_ekle").addClass("a");$("#blok_ekle").removeClass("hover");
            $("#daire_ekle").removeClass("a");$("#daire_ekle").addClass("hover");
            $("#adres_ekle").removeClass("a");$("#adres_ekle").addClass("hover");
            $("#hesapno_ekle").removeClass("a");$("#hesapno_ekle").addClass("hover");
            $("#vergino_ekle").removeClass("a");$("#vergino_ekle").addClass("hover");
        };


        function daire_ekle() {
            $("#bina_ekle_islem").hide();
            $("#blok_ekle_islem").hide();
            $("#daire_ekle_islem").show();
            $("#adres_ekle_islem").hide();
            $("#hesapno_ekle_islem").hide();
            $("#vergino_ekle_islem").hide();
            $("#bina_ekle").removeClass("a");$("#bina_ekle").addClass("hover");
            $("#blok_ekle").removeClass("a");$("#blok_ekle").addClass("hover");
            $("#daire_ekle").addClass("a");$("#daire_ekle").removeClass("hover");
            $("#adres_ekle").removeClass("a");$("#adres_ekle").addClass("hover");
            $("#hesapno_ekle").removeClass("a");$("#hesapno_ekle").addClass("hover");
            $("#vergino_ekle").removeClass("a");$("#vergino_ekle").addClass("hover");
        };

        function adres_ekle() {
            $("#bina_ekle_islem").hide();
            $("#blok_ekle_islem").hide();
            $("#daire_ekle_islem").hide();
            $("#adres_ekle_islem").show();
            $("#hesapno_ekle_islem").hide();
            $("#vergino_ekle_islem").hide();
            $("#bina_ekle").removeClass("a");$("#bina_ekle").addClass("hover");
            $("#blok_ekle").removeClass("a");$("#blok_ekle").addClass("hover");
            $("#daire_ekle").removeClass("a");$("#daire_ekle").addClass("hover");
            $("#adres_ekle").addClass("a");$("#adres_ekle").removeClass("hover");
            $("#hesapno_ekle").removeClass("a");$("#hesapno_ekle").addClass("hover");
            $("#vergino_ekle").removeClass("a");$("#vergino_ekle").addClass("hover");
        };

        function hesapno_ekle() {
            $("#bina_ekle_islem").hide();
            $("#blok_ekle_islem").hide();
            $("#daire_ekle_islem").hide();
            $("#adres_ekle_islem").hide();
            $("#hesapno_ekle_islem").show();
            $("#vergino_ekle_islem").hide();
            $("#bina_ekle").removeClass("a");$("#bina_ekle").addClass("hover");
            $("#blok_ekle").removeClass("a");$("#blok_ekle").addClass("hover");
            $("#daire_ekle").removeClass("a");$("#daire_ekle").addClass("hover");
            $("#adres_ekle").removeClass("a");$("#adres_ekle").addClass("hover");
            $("#hesapno_ekle").addClass("a");$("#hesapno_ekle").removeClass("hover");
            $("#vergino_ekle").removeClass("a");$("#vergino_ekle").addClass("hover");
        };

        function vergino_ekle() {
            $("#bina_ekle_islem").hide();
            $("#blok_ekle_islem").hide();
            $("#daire_ekle_islem").hide();
            $("#adres_ekle_islem").hide();
            $("#hesapno_ekle_islem").hide();
            $("#vergino_ekle_islem").show();
            $("#bina_ekle").removeClass("a");$("#bina_ekle").addClass("hover");
            $("#blok_ekle").removeClass("a");$("#blok_ekle").addClass("hover");
            $("#daire_ekle").removeClass("a");$("#daire_ekle").addClass("hover");
            $("#adres_ekle").removeClass("a");$("#adres_ekle").addClass("hover");
            $("#hesapno_ekle").removeClass("a");$("#hesapno_ekle").addClass("hover");
            $("#vergino_ekle").addClass("a");$("#vergino_ekle").removeClass("hover");
        };
    </script>
    <script>//********************************* Değişkenler ***********************************************************************************
        var bina = new Array();
        var bina1 = new Array();
        var bina2 = new Array();
        var blok = new Array();
        var blokadi = ""; 
        var blok2 = new Array();
        var daire = new Array();
        var ab; var bb;  var cb;var db; var eb; var fb; var gb; var hb;
        var blokid; var ablokid; var bblokid; var cblokid; var dblokid;var eblokid;var fblokid; var gblokid;var hblokid; 
    </script>
  
    <script> // //*********************************BİNA    İŞLEMLERİ ********************************************************************** 

        function binaekleme() { 
            var binaadi = $("#TextBox1").val();
            var yonetici = document.getElementById('yoneticiid').innerHTML;
                $.ajax({
                type: "POST",
                url: "admin.aspx/Kaydet",
                data: "{'binaadi':'" + binaadi + "', 'yonetici':'" + yonetici + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bina = msg.d;
                    $("#binaekleme").hide();
                    bina_goster();
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };
        function bina_goster() {
            $("#duzenle").show(); $("#sil").show();
            bina1.push(bina[0]);
            bina2.push(bina[1]);
            if (bina1[0] == "1") {
                alert("1 adet Bina Kaydetme Hakkınız Bulunmaktadır. Düzenleme/Silme yapabilirsiniz. Kayıtlı Bina İsminiz:" + bina2[0]) + "" + ""
                $("#TextBox1").val(bina2[0]);
            };
            if (bina1[0] != "1") {
                alert(bina2[0] + " İsimli Bina Kaydınız Başarılı");
                $("#TextBox1").val(bina2[0]);
            };
            bina = [];
            bina1 = [];
            bina2 = [];
        };
        function binadegistir() {
            var binaadi3 = $("#TextBox1").val();
            var yonetici3 = document.getElementById('yoneticiid').innerHTML;
            $.ajax({
                type: "POST",
                url: "admin.aspx/Guncelle",
                data: "{'binaadi3':'" + binaadi3 + "', 'yonetici3':'" + yonetici3 + "'}",
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

        function binasil() {
            var onay = confirm("Bu İşlemi Sonucunda Binanıza ait Tüm kayıtlar Silinecektir. Silmek İstediğinizden Eminmisiniz?");
            if (onay == true) {
                var binaadi3 = $("#TextBox1").val();
                var yonetici3 = document.getElementById('yoneticiid').innerHTML;
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Sil",
                    data: "{'binaadi3':'" + binaadi3 + "', 'yonetici3':'" + yonetici3 + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location.reload();
                       
                    },
                    error: function () {
                        alert("Yönetici İle Görüşünüz");
                    },
                });
            }
            else {
               

            }
        };

        function binagoster() {
            var binaadi = $("#TextBox1").val();
            var yonetici = document.getElementById('yoneticiid').innerHTML;
            $.ajax({
                type: "POST",
                url: "admin.aspx/Goster",
                data: "{'binaadi':'" + binaadi + "', 'yonetici':'" + yonetici + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") {
                        $("#duzenle").hide(); $("#sil").hide(); $("#binaekleme").show();
                    }
                    if (msg.d != "1") {
                        $("#duzenle").show(); $("#sil").show(); $("#binaekleme").hide();
                        $("#TextBox1").val(msg.d[0]);
                    }
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };
    </script>

    <script>   //*************************************** BLOK EKLEME İŞLEMLERİ*************************************************************

        function blokgoster() {
            var binaadi = $("#TextBox1").val();
            var yonetici = document.getElementById('yoneticiid').innerHTML;
            $.ajax({
                type: "POST",
                url: "admin.aspx/Goster",
                data: "{'binaadi':'" + binaadi + "', 'yonetici':'" + yonetici + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") {
                        alert("Öncelikle Bina Eklemeniz Gerekmektedir.");
                        window.location.reload();
                    }
                    if (msg.d != "1") {

                        document.getElementById("bloktakibinaadi").innerHTML = msg.d[0];
                        document.getElementById("binaid").innerHTML = msg.d[1];
                        blokgoster2();
                    }
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };
        function blokgoster2() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            var blokadi = document.getElementById("ablok").innerHTML;
            $.ajax({
                type: "POST",
                url: "admin.aspx/Blokgoster",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    blok = msg.d;
                    for (var i = 0; i < blok.length; i = i + 1) {
                        if (blok[i] == "A") { $("#ablok").removeClass("blok"); $("#ablok").addClass("bloksecili"); };
                        if (blok[i] == "B") { $("#bblok").removeClass("blok"); $("#bblok").addClass("bloksecili"); };
                        if (blok[i] == "C") { $("#cblok").removeClass("blok"); $("#cblok").addClass("bloksecili"); };
                        if (blok[i] == "D") { $("#dblok").removeClass("blok"); $("#dblok").addClass("bloksecili"); };
                        if (blok[i] == "E") { $("#eblok").removeClass("blok"); $("#eblok").addClass("bloksecili"); };
                        if (blok[i] == "F") { $("#fblok").removeClass("blok"); $("#fblok").addClass("bloksecili"); };
                        if (blok[i] == "G") { $("#gblok").removeClass("blok"); $("#gblok").addClass("bloksecili"); };
                        if (blok[i] == "H") { $("#hblok").removeClass("blok"); $("#hblok").addClass("bloksecili"); };
                    };
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };
        function blokkaydetA() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("ablok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = ablokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz"); },
            });
        };
        function blokkaydetB() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("bblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = bblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz"); },
            });
        };
        function blokkaydetC() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("cblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = cblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz"); },
            });
        };
        function blokkaydetD() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("dblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = dblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz");},
            });
        };
        function blokkaydetE() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("eblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil();  blokid = eblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz");},
            });
        };
        function blokkaydetF() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("fblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = fblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz");  },
            });
        };

        function blokkaydetG() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("gblok").innerHTML;
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = gblokid;}
                },
                error: function () { alert("Yönetici İle Görüşünüz"); },
            });
        };

        function blokkaydetH() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            blokadi = document.getElementById("hblok").innerHTML;
            
            var bloksilmebayrak = "";
            $.ajax({
                type: "POST", url: "admin.aspx/Blokkaydet",
                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokadi':'" + blokadi + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    bloksilmebayrak = msg.d;
                    if (bloksilmebayrak == "1") { alert("Kayıt Başarılı"); blokgoster2(); }
                    if (bloksilmebayrak == "2") { bloksil(); blokid = hblokid; }
                },
                error: function () { alert("Yönetici İle Görüşünüz"); },
            });
        };
        function bloksil() {
            $("#ana").hide();
            $("#bloksilmeonay").animate({
                margin: '15%',
                height: '150px',
                width: '250px',
                opacity: '0.8',
            });
            $("#bloksilmeonay").show();
        };
        function bloksilme() {
            if ($("#bloksilmedelete").val() == "DELETE") {
                var onay = confirm("Bu İşlemi Sonucunda Binanıza ait Tüm kayıtlar Silinecektir. Silmek İstediğinizden Eminmisiniz?");
            }
            else {
                alert("Silme Onay kutusuna DELETE yazınız !!!!");
            }
            if (onay == true) {
                var binaid = document.getElementById("binaid").innerHTML;
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Bloksil",
                    data: "{'binaid':'" + binaid + "', 'blokadi':'" + blokadi + "','blokid':'" + blokid + "'}",    
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert("Silme İşlemi Başarılı");
                        window.location.reload();
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                });
            }
            if (onay == false) {
                blokdon();
            }
        };

        function bloksilmeiptal() {
            blokdon();
        };
        function blokdon() {
            $("#ana").show();
            $("#bloksilmeonay").hide();
            blok_ekle();
            blokgoster();
        };
    </script>

    <script>   // **********************************************************Daire Ekleme İşlemleri***********************************************

  

        function blokgoster3() {
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            $.ajax({ // blok bilgileri  görüntüleme
                type: "POST",
                url: "admin.aspx/Blokgoster3",
                data: "{'yoneticiid':'" + yoneticiid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") { alert("Öncelikle Blok Eklemeniz Gereklidir"); window.location.reload();};
                    blok2 = msg.d;
                    document.getElementById('binaid').innerHTML = blok2[0];
                    for (var i = 0; i < blok2.length + 1; i = i + 1) {
                        if (blok2[i] == "A") {
                            ablokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster",
                                data: "{'blokid':'" + blok2[i + 1] + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $("#ablok2").val(msg.d); ab = msg.d; $("#ablok1").show(); $("#ablok2").show();
                                },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };
                        if (blok2[i] == "B") {
                            bblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#bblok2").val(msg.d); bb = msg.d; $("#bblok1").show(); $("#bblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                        if (blok2[i] == "C") {
                            cblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#cblok2").val(msg.d); cb = msg.d; $("#cblok1").show(); $("#cblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                        if (blok2[i] == "D") {
                            dblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#dblok2").val(msg.d); db = msg.d; $("#dblok1").show(); $("#dblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                        if (blok2[i] == "E") {
                            eblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#eblok2").val(msg.d); eb = msg.d; $("#eblok1").show(); $("#eblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                        if (blok2[i] == "F") {
                            fblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#fblok2").val(msg.d); fb = msg.d; $("#fblok1").show(); $("#fblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                        if (blok2[i] == "G") {
                            gblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#gblok2").val(msg.d); gb = msg.d; $("#gblok1").show(); $("#gblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };


                        if (blok2[i] == "H") {
                            hblokid = blok2[i + 1];
                            $.ajax({
                                type: "POST",
                                url: "admin.aspx/Dairegoster", data: "{'blokid':'" + blok2[i + 1] + "'}", contentType: "application/json; charset=utf-8", dataType: "json",
                                success: function (msg) { $("#hblok2").val(msg.d); hb = msg.d; $("#hblok1").show(); $("#hblok2").show(); },
                                error: function () { alert("Yönetici İle Görüşünüz"); },
                            });
                        };

                    };
                },
                error: function () {
                    alert("Yönetici İle Görüşünüz");
                },
            });
        };



        function daireekle() {
            var binaid = document.getElementById("binaid").innerHTML;
            var yoneticiid = document.getElementById("yoneticiid").innerHTML;
            var blokid;
            for (var i = 0; i < blok2.length; i = i + 1) {
                if (blok2[i] == "A") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#ablok2").val();
                    if (dairesayisi - ab > 0) {
                        for (var j = 0; j < dairesayisi - ab; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - ab) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - ab < 0) {
                        var onay = confirm("Sondan" + (ab - dairesayisi) + "   adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < ab - dairesayisi; j++) {
                                var daireno = ab - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = A ise 

                if (blok2[i] == "B") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#bblok2").val();
                    if (dairesayisi - bb > 0) {
                        for (var j = 0; j < dairesayisi - bb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - bb) + "  Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - bb < 0) {
                        var onay = confirm("Sondan" + (bb - dairesayisi) + "  adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < bb - dairesayisi; j++) {
                                var daireno = bb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = B  ise 

                if (blok2[i] == "C") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#cblok2").val();
                    if (dairesayisi - cb > 0) {
                        for (var j = 0; j < dairesayisi - cb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - cb) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - cb < 0) {
                        var onay = confirm("Sondan" + (cb - dairesayisi) + "   adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < cb - dairesayisi; j++) {
                                var daireno = cb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = C  ise 

                if (blok2[i] == "D") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#dblok2").val();
                    if (dairesayisi - db > 0) {
                        for (var j = 0; j < dairesayisi - db; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - db) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - db < 0) {
                        var onay = confirm("Sondan" + (db - dairesayisi) + " adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < db - dairesayisi; j++) {
                                var daireno = db - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if =D  ise 
                if (blok2[i] == "E") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#eblok2").val();
                    if (dairesayisi - eb > 0) {
                        for (var j = 0; j < dairesayisi - eb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - eb) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - eb < 0) {
                        var onay = confirm("Sondan" + (eb - dairesayisi) + " adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < eb - dairesayisi; j++) {
                                var daireno = eb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = E  ise 

                if (blok2[i] == "F") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#fblok2").val();
                    if (dairesayisi - fb > 0) {
                        for (var j = 0; j < dairesayisi - fb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - fb) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - fb < 0) {
                        var onay = confirm("Sondan" + (fb - dairesayisi) + " adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < fb - dairesayisi; j++) {
                                var daireno = fb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = F  ise 


                if (blok2[i] == "G") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#gblok2").val();
                    if (dairesayisi - gb > 0) {
                        for (var j = 0; j < dairesayisi - gb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - gb) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - gb < 0) {
                        var onay = confirm("Sondan" + (gb - dairesayisi) + " adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < gb - dairesayisi; j++) {
                                var daireno = gb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = B  ise 


                if (blok2[i] == "H") {
                    blokid = blok2[i + 1];
                    var dairesayisi = $("#hblok2").val();
                    if (dairesayisi - hb > 0) {
                        for (var j = 0; j < dairesayisi - hb; j++) {
                            var daireno = dairesayisi - j;
                            $.ajax({
                                type: "POST", url: "admin.aspx/Dairekaydet",
                                data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) { },
                                error: function () {
                                    alert("Yönetici İle Görüşünüz");
                                },
                            }); // ajax gönderme
                        };// FOR  daire sayısı kadar kaydetme
                        alert((dairesayisi - hb) + "   Adet Daire Başarı İle Kaydedilmiştir.");
                    }; // İF dareiseyısı pozitif ise
                    if (dairesayisi - hb < 0) {
                        var onay = confirm("Sondan" + (hb - dairesayisi) + " adet daire ve daire bilgileri silinecektir. Silmek istediğinizden eminmisiniz  !!!");
                        if (onay == true) {
                            for (var j = 0; j < hb - dairesayisi; j++) {
                                var daireno = hb - j;
                                $.ajax({
                                    type: "POST", url: "admin.aspx/Dairesil",
                                    data: "{'binaid':'" + binaid + "', 'yoneticiid':'" + yoneticiid + "', 'blokid':'" + blokid + "', 'daireno':'" + daireno + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) { },
                                    error: function () {
                                        alert("Yönetici İle Görüşünüz");
                                    },
                                }); // ajax gönderme
                            };// FOR  daire sayısı kadar silme
                        };// if onay kutusu
                        alert("Daireler Başarı İle Silinmiştir.");
                    }; // İF dareiseyısı negatif ise 
                };  // if = H ise 
            }; // blokları gösteren FOR için 
            blokgoster3();
        };   //daireekle  function

    </script>



    <script>  // **********************************************banka işlemleri********************************************************
      

function bankaguncelle(){
      var yoneticiid = document.getElementById("yoneticiid").innerHTML; 
     var bankaadi= $("#bankaismial").val();
     var iban= $("#ibanal").val();
         $.ajax({
             type: "POST",
             url: "admin.aspx/Bankaguncelle",
              data: "{'yoneticiid':'" + yoneticiid + "','bankaadi':'" + bankaadi + "','iban':'" + iban + "'}",
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
 function bankalisteleme(){
    var yoneticiid = document.getElementById("yoneticiid").innerHTML; 
         $.ajax({
             type: "POST",
             url: "admin.aspx/Bankalistele",
              data: "{'yoneticiid':'" + yoneticiid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                        
                 if (msg.d != "1") {
                     $("#bankaismial").val(msg.d[0]);
                     $("#ibanal").val(msg.d[1]);
                     $("#bankaguncelle").show();
                     $("#bankasil").show();
                     $("#bankaekleme").hide();
                 };  
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         }); 
         };   
 
 function bankakaydet(){
     var yoneticiid = document.getElementById("yoneticiid").innerHTML; 
     var bankaadi= $("#bankaismial").val();
     var iban = $("#ibanal").val();
     var binaid=$("#binaid").val();
         $.ajax({
             type: "POST",
             url: "admin.aspx/Bankakaydet",
              data: "{'yoneticiid':'" + yoneticiid + "','bankaadi':'" + bankaadi + "','iban':'" + iban + "','binaid':'" + binaid + "'}",
            
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 alert(msg.d);
                 window.location.reload();
                  
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");

             },
         }); 
           

 };

function bankasil(){  
                var yoneticiid = document.getElementById("yoneticiid").innerHTML;
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Bankasil",
                    data: "{'yoneticiid':'" + yoneticiid + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert("Silme İşlemi Başarılı"); 
                         window.location.reload();
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                }); 
          
         };

   </script>
     <script>  //  ***************************************ADRES EKLEME İŞLEMLERİ********************************************************


function adresekleme(){  
    var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var adres = $("#adresal").val();
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Adresekle",
                    data: "{'yoneticiid':'" + yoneticiid + "','adres':'" + adres + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location.reload(); 
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                }); 
          
         };

function adreslistele(){  
    var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var adres = $("#adresal").val();
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Adreslistele",
                    data: "{'yoneticiid':'" + yoneticiid + "','adres':'" + adres + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != 1) { $("#adresal").val(msg.d); $("#adresguncelleme").show(); $("#adressilme").show(); $("#adresekleme").hide();  };
                        if (msg.d==1) { $("#adresguncelleme").hide(); $("#adressilme").hide(); $("#adresekleme").show(); };
                
                    
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                }); 
         };
function adresguncelleme(){
     var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var adres = document.getElementById("adresal").innerHTML;
         $.ajax({
             type: "POST",
             url: "admin.aspx/Adresguncelle",
              data: "{'adres':'" + adres + "','yoneticiid':'" + yoneticiid + "'}",
           contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 alert(msg.d); 
                 window.location.reload();
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         });
    };
         
function adressilme(){
     var yoneticiid = document.getElementById("yoneticiid").innerHTML;
         $.ajax({
             type: "POST",
             url: "admin.aspx/Adressil",
             data: "{'yoneticiid':'" + yoneticiid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 alert(msg.d); 
                 window.location.reload();
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         });
    };
    </script>
    <script>//  ***************************************VERGİ EKLEME İŞLEMLERİ********************************************************

function vergiekleme(){  
    var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var vergino =  $("#verginoal").val();
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Vergiekle",
                    data: "{'yoneticiid':'" + yoneticiid + "','vergino':'" + vergino + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location.reload();
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                }); 
          
         };

function vergilisteleme(){  
    var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var vergino =$("#verginoal").val();
                $.ajax({
                    type: "POST",
                    url: "admin.aspx/Vergilistele",
                    data: "{'yoneticiid':'" + yoneticiid + "','vergino':'" + vergino + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d!=1) {  $("#verginoal").val(msg.d); $("#verginoekleme").hide();$("#verginoguncelleme").show();$("#verginosilme").show()  };
                        if (msg.d == 1) {   $("#verginoekleme").show();$("#verginoguncelleme").hide();$("#verginosilme").hide()};
                    },
                    error: function () {
                        alert("sıkıntı var");
                    },
                }); 
         };
 function vergiguncelleme(){
     var yoneticiid = document.getElementById("yoneticiid").innerHTML;
    var vergino = $("#verginoal").val();
         $.ajax({
             type: "POST",
             url: "admin.aspx/Vergiguncelle",
              data: "{'vergino':'" + vergino + "','yoneticiid':'" + yoneticiid + "'}",
           contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 alert(msg.d); 
                 window.location.reload();
              },
             error: function () {
                 alert("Yönetici İle Görüşünüz");
             },
         });
    };
         
function vergisilme(){
     var yoneticiid = document.getElementById("yoneticiid").innerHTML;
         $.ajax({
             type: "POST",
             url: "admin.aspx/Vergisil",
             data: "{'yoneticiid':'" + yoneticiid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (msg) {
                 alert(msg.d); 
                 window.location.reload();
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
margin: 5px;
      
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

            .blok:hover {
                opacity: 0.5;
                cursor: pointer;
            }
        .bloksecili { 
   background-color: #666;
  color: white;
  margin: 5px;
       cursor: pointer;
  font-size: 18px;
  float:left;
  text-align:center;
  vertical-align:central; 
border: none;
  outline: none;
  width:25px;
  height:25px;
  padding: 10px 16px;

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
            height: 200px;
            position: absolute;
            float: left;
            top: 23%;
            left: 0%;
        }

        #ust {
            background-color: #9933cc;
    color: #ffffff;
            top: 2%;
            right: 0%;
            left: 0%;
            bottom: 78%;
            width: 100%;
            height: 20%;
            font-size:24px;
              opacity:0.5;
            position: absolute;
            float: left;
        }

        #menu_items {
            width: 600px;
            height:500px;
            position: absolute;
            float: left;
            top: 23%;
            left: 200px;
            bottom: 78%;
        }

        .menu_items {
            width: 600px;
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

       .footer{
    background-color: #33b5e5;
    color: #ffffff;
    text-align: center;
    font-size: 12px;
    padding: 15px;
   width: 100%; height: 5%; top: 80%; right: 0%; left: 0%; bottom:15%;
   position:absolute;
   
}


           .alert {
  padding: 5px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}


.alert.info {background-color: #2196F3;}


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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="bloksilmeonay" hidden="hidden">
            Silme işlemi için aşağıdaki kutucuğa DELETE yazınız. Silme işlemi sonrası bloklara bağlı olan daireler ve alt bilgileri silinecektir.
             <input id="bloksilmedelete" type="text" autocomplete="off" />
            <div id="bloksilme" class="button" onclick="bloksilme()">Sil</div>
            <div id="bloksilmeiptal" class="button" onclick="bloksilmeiptal()">İptal</div>

            &nbsp;
        </div>
        <div id="ana">
            <div id="ust">
                <h1>Admin Paneli</h1>
                <div id="login">
                </div>
            </div>
            <div id="menu">
                <div id="bina_ekle" class="hover" onclick="binaekle(),binagoster()">BİNA EKLE</div>
                <div id="blok_ekle" class="hover" onclick="blok_ekle(),blokgoster()">BLOK EKLE</div>
                <div id="daire_ekle" class="hover" onclick="daire_ekle(),blokgoster3()">DAİRE EKLE</div>
                <div id="adres_ekle" class="hover" onclick="adres_ekle(),adreslistele()">ADRES EKLE</div>
                <div id="hesapno_ekle" class="hover" onclick="hesapno_ekle(),bankalisteleme()">HESAP NO EKLE</div>
                <div id="vergino_ekle" class="hover" onclick="vergino_ekle(),vergilisteleme()">VERGİ NO EKLE</div>
            </div>


            <div id="menu_items" class="menu_items">

                <div id="bina_ekle_islem" class="menu_items" hidden="hidden">

                    <h1 class="h">Bina İsmi Giriniz </h1>
                    
                    &nbsp;<input id="TextBox1" type="text" autocomplete="off" class="auto-style9" placeholder="Bina Adı" />



                    <br />
                    <div id="binaekleme" class="button" onclick="binaekleme()">KAYDET</div>
                    <div id="duzenle" class="button" hidden="hidden" onclick="binadegistir()">Düzenle</div>
                    <div id="sil" class="button" hidden="hidden" onclick="binasil()">Sil</div>



                    <div id="yoneticiid" hidden="hidden">5</div>



                    <div id="binaid" hidden="hidden"></div>
                    <br />
                </div>


                <div id="blok_ekle_islem" hidden="hidden" class="menu_items">

                 <h1 class="h"><asp:Label ID="bloktakibinaadi" runat="server" Font-Size="x-large" ForeColor="white"></asp:Label>
                    &nbsp;Binasındaki Blok Sayısı Kadar Blok Seçiniz  </h1>  
                        <div>
                            <div id="ablok" class="blok" onclick="blokkaydetA()">A</div>
                            <div id="bblok" class="blok" onclick="blokkaydetB()">B</div>
                            <div id="cblok" class="blok" onclick="blokkaydetC()">C</div>
                            <div id="dblok" class="blok" onclick="blokkaydetD()">D</div>
                            <div id="eblok" class="blok" onclick="blokkaydetE()">E</div>
                            <div id="fblok" class="blok" onclick="blokkaydetF()">F</div>
                            <div id="gblok" class="blok" onclick="blokkaydetG()">G</div>
                            <div id="hblok" class="blok" onclick="blokkaydetH()">H</div>

                        </div>
                    <br /> <br /> <br /><br /><br /><br />
                   
                     <div class="alert info">
  <span class="closebtn">&times;</span>  
  <strong>Info!</strong> Blokları silmek için tekrar üzerine tıklayınız. Silme işlemi bloklara bağlı daireleride kapsar.
</div>
                </div>

                <div id="daire_ekle_islem" class="menu_items" hidden="hidden"> 
                    <h1 class="h"> Bloktaki Daire Sayısı Seçiniz</h1>
                    <div style="clear: both">
                        <div id="ablok1" class="blok" hidden="hidden">A</div>
                        <div id="bblok1" class="blok" hidden="hidden">B</div>
                        <div id="cblok1" class="blok" hidden="hidden">C</div>
                        <div id="dblok1" class="blok" hidden="hidden">D</div>
                        <div id="eblok1" class="blok" hidden="hidden">E</div>
                        <div id="fblok1" class="blok" hidden="hidden">F</div>
                        <div id="gblok1" class="blok" hidden="hidden">G</div>
                        <div id="hblok1" class="blok" hidden="hidden">H</div>
                    </div>


                    <div style="clear: both">

                        <input id="ablok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="bblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="cblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="dblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="eblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="fblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="gblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                        <input id="hblok2" class="blok" type="text" autocomplete="off" maxlength="2" hidden="hidden" />
                    </div>


  <br />
                 
 <br />
                    <br />
                    <div id="daireekle" class="button" onclick="daireekle()">Daire Ekle</div>

                </div>

                <div id="hesapno_ekle_islem" class="menu_items" hidden="hidden">
                    <h1 class="h1">Banka İsmi  Giriniz</h1> 
                    <input id="bankaismial" type="text" /><br />
               
                    <h1 class="h1">IBAN Numarası:</h1> 
                    <input id="ibanal" type="text" /><br />
                    <div id="bankaekleme" class="button" onclick="bankakaydet()">Kaydet</div>
                    <div id="bankaguncelle" class="button" hidden="hidden" onclick="bankaguncelle()">Güncelle</div>
                    <div id="bankasil" class="button" hidden="hidden" onclick="bankasil()">Sil</div>

                </div>
                <div id="vergino_ekle_islem" class="menu_items" hidden="hidden">
                  <h1 class="h1">  Vergi numarası Giriniz</h1>
                        <input id="verginoal" type="text" /><br />

                  <div class="button" id="verginoekleme" onclick="vergiekleme()">Vergi No Ekle</div>
                     <div class="button" id="verginosilme" onclick="vergisilme()">Vergi No Sil</div>
                     <div class="button" id="verginoguncelleme" onclick="vergiguncelleme()">Vergi No Değiştir</div>
                </div>
             
                <div id="adres_ekle_islem" class="menu_items" hidden="hidden">
                    <h1 class="h1">  Bina Adresinizi Giriniz</h1>

                    <asp:TextBox ID="adresal" runat="server" Font-Size="Smaller" Width="384px" AutoCompleteType="Disabled" Height="118px" TextMode="MultiLine"></asp:TextBox>
                
                   <div id="adresekleme" class="button" onclick="adresekleme()">Adres Ekle</div>
                    <div id="adressilme" class="button" onclick="adressilme()">Adres Sil</div>
                     <div id="adresguncelleme" class="button" onclick="adresguncelleme()">Adres Değiştir</div>

                    </div>
            </div>
          
        </div>
 
                <div class="footer"> dsad</div>
    </form>
 
          
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

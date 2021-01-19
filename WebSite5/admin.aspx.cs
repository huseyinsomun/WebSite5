using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


 //**********************************************************BİNA KAYDETME**************************************************
    [WebMethod]
    public static ArrayList Kaydet(string binaadi, string yonetici)    {

        ArrayList liste = new ArrayList();  DataSet ds = new DataSet(); DataSet dt = new DataSet(); string bina = "1";
       
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open(); 
        SqlDataAdapter da = new SqlDataAdapter("SELECT binaadi,yoneticiid FROM [bina] WHERE [yoneticiid]  = ('" + yonetici + "')", conn);
        da.Fill(ds); string bina1 = "";       
        if (ds.Tables[0].Rows.Count == 1){  bina1= ds.Tables[0].Rows[0][0].ToString(); }
         if (ds.Tables[0].Rows.Count <1) { 
  SqlCommand kaydt = new SqlCommand("insert into [bina](binaadi,yoneticiid) values (@donem,@daire)", conn);
            kaydt.Parameters.AddWithValue("@donem", binaadi);
            kaydt.Parameters.AddWithValue("@daire", yonetici);
            kaydt.ExecuteNonQuery(); bina = "Kayıt Yapıldı";bina1 = binaadi;  }
           
   conn.Close();  liste.Add(bina); liste.Add(bina1);
    
        return liste; }

    //**********************************************************BİNA GÜNCELLEME**************************************************   
    [WebMethod]
    public static string Guncelle (string binaadi3, string yonetici3)
    {
      
        string liste = "Güncellendi";
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("UPDATE bina SET binaadi = @binaadi WHERE yoneticiid = @yonetici", conn);
        
            kaydt.Parameters.AddWithValue("@binaadi", binaadi3);
            kaydt.Parameters.AddWithValue("@yonetici", yonetici3);
        kaydt.ExecuteNonQuery();

        conn.Close(); 
 
        return liste;
    }


    //**********************************************************BİNA SİLME**************************************************   
    [WebMethod]
    public static string Sil(string binaadi3, string yonetici3)
    {
        string liste = "Tüm Kayıtlar Başarı ile Silinmiştir.";
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from bina where binaadi = @binaadi and yoneticiid = @yonetici3", conn);
        SqlCommand kaydt2 = new SqlCommand("DELETE from adres where yoneticiid = @yonetici3", conn);
        SqlCommand kaydt3 = new SqlCommand("DELETE from banka where yoneticiid = @yonetici3", conn);
        SqlCommand kaydt4 = new SqlCommand("DELETE from blok where yoneticiid = @yonetici3", conn);
        SqlCommand kaydt5 = new SqlCommand("DELETE from daire where yoneticiid = @yonetici3", conn);
        SqlCommand kaydt6 = new SqlCommand("DELETE from vergi where yoneticiid = @yonetici3", conn);
        kaydt.Parameters.AddWithValue("@binaadi", binaadi3);
        kaydt.Parameters.AddWithValue("@yonetici3", yonetici3);

        kaydt2.Parameters.AddWithValue("@yonetici3", yonetici3);
        kaydt3.Parameters.AddWithValue("@yonetici3", yonetici3);
        kaydt4.Parameters.AddWithValue("@yonetici3", yonetici3);
        kaydt5.Parameters.AddWithValue("@yonetici3", yonetici3);
        kaydt6.Parameters.AddWithValue("@yonetici3", yonetici3);
        kaydt.ExecuteNonQuery();
        kaydt2.ExecuteNonQuery();
        kaydt3.ExecuteNonQuery();
        kaydt4.ExecuteNonQuery();
        kaydt5.ExecuteNonQuery();
        kaydt6.ExecuteNonQuery();
        conn.Close();

        return liste;
    }
    //**********************************************************BİNA GÖSTERME**************************************************   
    [WebMethod]
    public static ArrayList Goster(string binaadi, string yonetici){

        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
       
        SqlDataAdapter da = new SqlDataAdapter("SELECT binaadi,yoneticiid,id FROM [bina] WHERE [yoneticiid]  = ('" + yonetici + "')", conn);
        da.Fill(ds);

 if (ds.Tables[0].Rows.Count > 0) {


        liste.Add(ds.Tables[0].Rows[0][0].ToString());
            liste.Add(ds.Tables[0].Rows[0][2].ToString());
        } 
        else{ liste.Add("1"); };

        return liste;
    }
    //**********************************************************BLOK  GÖSTERME**************************************************   

    [WebMethod]
    public static ArrayList Blokgoster(string binaid, string yoneticiid, string blokadi)
    {
        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT blokadi,binaid,yoneticiid FROM [blok] WHERE [binaid]  = ('" + binaid + "')", conn);
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int say = 0; say < ds.Tables[0].Rows.Count; say++)
            {
                liste.Add(ds.Tables[0].Rows[say][0].ToString());
                               
            } //for 

        }
        else { liste.Add("1"); };
 
        return liste;


    }

    //**********************************************************BLOK  Kaydetme**************************************************   

    [WebMethod]
    public static string Blokkaydet(string binaid, string yoneticiid, string blokadi)
    {
        string bayrak = "1";
        ArrayList liste = new ArrayList();
        DataSet ds = new DataSet();
        DataSet dt = new DataSet();
    
      
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT blokadi FROM [blok] WHERE [binaid]  = ('" + binaid + "')", conn);
        da.Fill(ds);


       
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++) {
 

            if (ds.Tables[0].Rows[i][0].ToString() == blokadi)
            {
                bayrak = "2"; 
            };
        };
        
        if (bayrak=="1") {
        SqlCommand kaydt = new SqlCommand("insert into [blok](blokadi,binaid,yoneticiid) values (@blokadi,@binaid,@yoneticiid)", conn);
            kaydt.Parameters.AddWithValue("@blokadi", blokadi);
            kaydt.Parameters.AddWithValue("@binaid", binaid);
            kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
            kaydt.ExecuteNonQuery();
   
 };
        conn.Close(); 

        return bayrak;
    }



    //**********************************************************BLOK SİLME**************************************************   
    [WebMethod]
    public static string Bloksil(string blokadi, string binaid,string blokid)
    {
         
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from blok where blokadi = @blokadi and binaid = @binaid", conn);
        SqlCommand kaydt2 = new SqlCommand("DELETE from daire where blokid = @blokid", conn);

        kaydt.Parameters.AddWithValue("@blokadi", blokadi);
        kaydt.Parameters.AddWithValue("@binaid", binaid);
        kaydt2.Parameters.AddWithValue("@blokid", blokid);
        kaydt.ExecuteNonQuery();
        kaydt2.ExecuteNonQuery();
        conn.Close();

        return blokadi+binaid;
    }
    //**********************************************************               **************************************************   


    //**********************************************************Daire Ekleme için BLOK  GÖSTERME**************************************************   

    [WebMethod]
    public static ArrayList Blokgoster3 (string yoneticiid)
    {
        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT id,blokadi,binaid,yoneticiid FROM [blok] WHERE [yoneticiid]  = ('" + yoneticiid + "')", conn);
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
 liste.Add(ds.Tables[0].Rows[0][2].ToString());
            for (int say = 0; say < ds.Tables[0].Rows.Count; say++)
            {

                liste.Add(ds.Tables[0].Rows[say][1].ToString());
                liste.Add(ds.Tables[0].Rows[say][0].ToString());
            } //for 
           
        }
        else { liste.Add("1"); };

        return liste;


    }


    //**********************************************************Daire Goster**************************************************


    [WebMethod]
    public static int Dairegoster(string blokid)
    {
        int dairesayisi = 0;
         DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
         SqlDataAdapter da = new SqlDataAdapter("SELECT daireno FROM [daire] WHERE [blokid]  = ('" + blokid + "')", conn);
        da.Fill(ds);
        dairesayisi = Convert.ToInt32(ds.Tables[0].Rows.Count); 
            return dairesayisi;
    }



    //**********************************************************BLOK  Kaydetme**************************************************   

    [WebMethod]
    public static string Dairekaydet(string binaid, string yoneticiid, string blokid, string daireno)
    {

        string bayrak = "başarılı";
        
        
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open(); 
            SqlCommand kaydt = new SqlCommand("insert into [daire](daireno,binaid,yoneticiid,blokid) values (@daireno,@binaid,@yoneticiid,@blokid)", conn);
            kaydt.Parameters.AddWithValue("@daireno", daireno);
            kaydt.Parameters.AddWithValue("@binaid", binaid);
            kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.Parameters.AddWithValue("@blokid", blokid);
        kaydt.ExecuteNonQuery(); 
        conn.Close();  
      
        return bayrak;
    }




    //**********************************************************BLOK  Silme**************************************************   

    [WebMethod]
    public static string Dairesil(string binaid, string yoneticiid, string blokid, string daireno)
    {
        string bayrak = "başarılı";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from daire where daireno = @daireno and blokid = @blokid", conn);
        kaydt.Parameters.AddWithValue("@daireno", daireno); 
        kaydt.Parameters.AddWithValue("@blokid", blokid);
        kaydt.ExecuteNonQuery();
        conn.Close();
        return bayrak;
    }

    //**********************************************************Daire Goster**************************************************


    [WebMethod]
    public static int Bankagoster(string binaid)
    {
        int dairesayisi = 0;
        DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT banka,iban FROM [banka] WHERE [binaid]  = ('" + binaid + "')", conn);
        da.Fill(ds);
        dairesayisi = Convert.ToInt32(ds.Tables[0].Rows.Count);
        return dairesayisi;
    }



    //**********************************************************Banka Göster Goster**************************************************
 

    [WebMethod]
    public static ArrayList Bankalistele(string yoneticiid)
    {
        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();

       
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT bankaadi,iban FROM [banka] WHERE [yoneticiid]  = ('" + yoneticiid + "')", conn);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {     liste.Add(ds.Tables[0].Rows[0][0].ToString());
                liste.Add(ds.Tables[0].Rows[0][1].ToString());

            }

        else { liste.Add("1"); };

        return liste;
   
    }

    //**********************************************************Banka Güncelle**************************************************


    [WebMethod]
    public static string Bankaguncelle(string yoneticiid, string bankaadi, string iban)
    { 
        string liste = "Güncellendi";
      

        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("UPDATE banka SET bankaadi = @banka, iban= @iban WHERE yoneticiid = @yonetici", conn);

        
kaydt.Parameters.AddWithValue("@banka", bankaadi);
        kaydt.Parameters.AddWithValue("@iban", iban);
        kaydt.Parameters.AddWithValue("@yonetici", yoneticiid);
        kaydt.ExecuteNonQuery();

        return liste;

    }
    //**********************************************************Banka Kaydet**************************************************


    [WebMethod]
    public static string Bankakaydet(string bankaadi, string yoneticiid, string iban, string binaid)
    {
        string bayrak1 = "başarılı";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("insert into [banka](bankaadi,iban,binaid,yoneticiid) values (@bankaadi,@iban,@binaid,@yoneticiid)", conn);
        kaydt.Parameters.AddWithValue("@bankaadi", bankaadi);
        kaydt.Parameters.AddWithValue("@iban", iban);
        kaydt.Parameters.AddWithValue("@binaid", binaid);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();

        return bayrak1;
    }

    

        //**********************************************************Banka  Silme**************************************************   

        [WebMethod]
    public static string Bankasil(string yoneticiid)
    {
        string bayrak2 = "başarılı";
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from banka where yoneticiid = @yoneticiid", conn);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();
        return bayrak2;
    }

    //*********************************************************Adres Ekleme**************************************************   

    [WebMethod]
    public static string Adresekle(string yoneticiid,string adres)
    {
        string bayrak1 = "başarılı";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("insert into [adres](adres,yoneticiid) values (@adres,@yoneticiid)", conn);
        kaydt.Parameters.AddWithValue("@adres", adres);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();

        return bayrak1;


    }


    //**********************************************************Adres Gösterme************************************************


    [WebMethod]
    public static ArrayList Adreslistele(string yoneticiid)
    {
        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT adres FROM [adres] WHERE [yoneticiid]  = ('" + yoneticiid + "')", conn);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            liste.Add(ds.Tables[0].Rows[0][0].ToString());
          
        }

        else { liste.Add("1"); };

        return liste;

         
    }

    //**********************************************************Adres Güncelle************************************************



    [WebMethod]
    public static string Adresguncelle(string adres,string yoneticiid)
    {
        string liste = "Güncellendi";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("UPDATE adres SET adres = @adres WHERE yoneticiid = @yonetici", conn); 
        kaydt.Parameters.AddWithValue("@adres", adres); 
        kaydt.Parameters.AddWithValue("@yonetici", yoneticiid);
        kaydt.ExecuteNonQuery();

        return liste;

    }


    //**********************************************************Adres  Silme**************************************************   

    [WebMethod]
    public static string Adressil(string yoneticiid)
    {
        string bayrak2 = "başarılı";
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from adres where yoneticiid = @yoneticiid", conn);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();
        return bayrak2;
    }

















    //*********************************************************Vergi Ekleme**************************************************   

    [WebMethod]
    public static string Vergiekle(string yoneticiid, string vergino)
    {
        string bayrak1 = "başarılı";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("insert into [vergi](vergino,yoneticiid) values (@vergino,@yoneticiid)", conn);
        kaydt.Parameters.AddWithValue("@vergino", vergino);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();

        return bayrak1;


    }


    //**********************************************************VErgi Gösterme************************************************


    [WebMethod]
    public static ArrayList Vergilistele(string yoneticiid)
    {
        ArrayList liste = new ArrayList(); DataSet ds = new DataSet();


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT vergino FROM [vergi] WHERE [yoneticiid]  = ('" + yoneticiid + "')", conn);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            liste.Add(ds.Tables[0].Rows[0][0].ToString());

        }

        else { liste.Add("1"); };

        return liste;


    }

    //**********************************************************VErgi Güncelle************************************************



    [WebMethod]
    public static string Vergiguncelle(string vergino, string yoneticiid)
    {
        string liste = "Güncellendi";


        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("UPDATE vergi SET vergino = @vergino WHERE yoneticiid = @yonetici", conn);
        kaydt.Parameters.AddWithValue("@vergino", vergino);
        kaydt.Parameters.AddWithValue("@yonetici", yoneticiid);
        kaydt.ExecuteNonQuery();

        return liste;

    }


    //**********************************************************Vergi  Silme**************************************************   

    [WebMethod]
    public static string Vergisil(string yoneticiid)
    {
        string bayrak2 = "başarılı";
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30");
        conn.Open();
        SqlCommand kaydt = new SqlCommand("DELETE from vergi where yoneticiid = @yoneticiid", conn);
        kaydt.Parameters.AddWithValue("@yoneticiid", yoneticiid);
        kaydt.ExecuteNonQuery();
        conn.Close();
        return bayrak2;
    }



}
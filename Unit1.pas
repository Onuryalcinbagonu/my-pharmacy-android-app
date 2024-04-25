unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, FMX.ScrollBox, FMX.Memo, FMX.Objects,IdSSLOpenSSLHeaders,System.IOUTils,
  System.ImageList, FMX.ImgList, FMX.Layouts, FMX.ListBox, FireDAC.Stan.Intf,
  FireDAC.Comp.Client, FMX.WebBrowser, FMX.Platform, FMX.PhoneDialer;

type
  TForm1 = class(TForm)
    Image1: TImage;
    NetHTTPClient1: TNetHTTPClient;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    Rectangle1: TRectangle;
    Image2: TImage;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle7: TRectangle;
    WebBrowser1: TWebBrowser;
    Image5: TImage;
    Rectangle3: TRectangle;
    Image3: TImage;
    Rectangle4: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image4: TImage;
    Rectangle5: TRectangle;
    Image6: TImage;
    Rectangle6: TRectangle;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image7: TImage;

    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);

    procedure Image4Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

    html, A,G ,TarihDuzenli: string;
  Tarih : TDateTime;
  Yil, Ay, Gun : Word;//Word olmak zorunda
  x,I,Num: Integer;
   varmi:Byte;
    PhoneDialerService: IFMXPhoneDialerService;
implementation

{$R *.fmx}

  type
list=TstringList;


procedure TForm1.Button1Click(Sender: TObject);

begin


    Tarih := Now;
    DecodeDate(Tarih, Yil, Ay, Gun); // Tarihi par�alara ay�r
    if Length(Ay.ToString) =1 then
    begin
      A:='0'+Ay.ToString;
    end
    else
    begin
        A:=Ay.ToString;
    end;
      if Length(Gun.ToString) =1 then
    begin
      G:='0'+Gun.ToString;
    end
    else
    begin
          G:=Gun.ToString;
    end;

   TarihDuzenli:=IntToStr(StrToInt(G)-1)+'/'+A+'/'+Yil.ToString;
   I:=0;
    varmi:=0;
    Rectangle1.Visible:=False;
    Rectangle3.Visible:=False;
    Rectangle5.Visible:=False;
     While I <=listbox1.Count-1 do
    Begin
          If TarihDuzenli = listbox1.Items[I] Then
           begin

           if varmi=0 then
           begin

                Rectangle1.Visible:=True;
                Label1.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label2.Text:=  listbox1.Items[I+3];
                Label3.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=1 then
           begin
                Rectangle3.Visible:=True;
                Label4.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label5.Text:= listbox1.Items[I+3];
                Label6.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=2 then
           begin
                Rectangle5.Visible:=True;
                Label7.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label8.Text:= listbox1.Items[I+3];
                Label9.Text:= '0378 '+listbox1.Items[I+4];
           end;
             if((TarihDuzenli.Substring(0,2)) <> (listbox1.Items[I+5].Substring(0,2)))  then
             begin
               I:=I+listbox1.Count;
             end;
           end;

          I:=I+5;
     End;
     varmi:=0;



end;



procedure TForm1.Button2Click(Sender: TObject);

begin



    Tarih := Now;
    DecodeDate(Tarih, Yil, Ay, Gun); // Tarihi par�alara ay�r
    if Length(Ay.ToString) =1 then
    begin
      A:='0'+Ay.ToString;
    end
    else
    begin
        A:=Ay.ToString;
    end;
      if Length(Gun.ToString) =1 then
    begin
      G:='0'+Gun.ToString;
    end
    else
    begin
          G:=Gun.ToString;
    end;

   TarihDuzenli:=G+'/'+A+'/'+Yil.ToString;
   I:=0;

     varmi:=0;
    Rectangle1.Visible:=False;
    Rectangle3.Visible:=False;
    Rectangle5.Visible:=False;
     While I <=listbox1.Count-1 do
    Begin
          If TarihDuzenli = listbox1.Items[I] Then
           begin

           if varmi=0 then
           begin

                Rectangle1.Visible:=True;
                Label1.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label2.Text:= listbox1.Items[I+3];
                Label3.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=1 then
           begin
                Rectangle3.Visible:=True;
                Label4.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label5.Text:= listbox1.Items[I+3];
                Label6.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=2 then
           begin
                Rectangle5.Visible:=True;
                Label7.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label8.Text:= listbox1.Items[I+3];
                Label9.Text:= '0378 '+listbox1.Items[I+4];
           end;
             if((TarihDuzenli.Substring(0,2)) <> (listbox1.Items[I+5].Substring(0,2)))  then
             begin
               I:=I+listbox1.Count;
             end;
           end;

          I:=I+5;
     End;
     varmi:=0;


end;

procedure TForm1.Button4Click(Sender: TObject);

begin


    Tarih := Now;
    DecodeDate(Tarih, Yil, Ay, Gun); // Tarihi par�alara ay�r
    if Length(Ay.ToString) =1 then
    begin
      A:='0'+Ay.ToString;
    end
    else
    begin
        A:=Ay.ToString;
    end;
      if Length(Gun.ToString) =1 then
    begin
      G:='0'+Gun.ToString;
    end
    else
    begin
          G:=Gun.ToString;
    end;

   TarihDuzenli:=IntToStr(StrToInt(G)+1)+'/'+A+'/'+Yil.ToString;
   I:=0;
    varmi:=0;
    Rectangle1.Visible:=False;
    Rectangle3.Visible:=False;
    Rectangle5.Visible:=False;
     While I <=listbox1.Count-1 do
    Begin
          If TarihDuzenli = listbox1.Items[I] Then
           begin

           if varmi=0 then
           begin

                Rectangle1.Visible:=True;
                Label1.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label2.Text:= listbox1.Items[I+3];
                Label3.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=1 then
           begin
                Rectangle3.Visible:=True;
                Label4.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label5.Text:= listbox1.Items[I+3];
                Label6.Text:= '0378 '+listbox1.Items[I+4];
                varmi:=varmi+1;
           end
           else if varmi=2 then
           begin
                Rectangle5.Visible:=True;
                Label7.Text:= listbox1.Items[I+2]+' ECZANES�';
                Label8.Text:= listbox1.Items[I+3];
                Label9.Text:= '0378 '+listbox1.Items[I+4];
           end;
             if((TarihDuzenli.Substring(0,2)) <> (listbox1.Items[I+5].Substring(0,2)))  then
             begin
               I:=I+listbox1.Count;
             end;
           end;

          I:=I+5;
     End;
     varmi:=0;

end;


procedure TForm1.FormCreate(Sender: TObject);
var
  html, A,G ,TarihDuzenli : string;
 list:TstringList;
  Tarih : TDateTime;
  Yil, Ay, Gun : Word;//Word olmak zorunda
  x,I,Num,z: Integer;

begin



  list:=TstringList.Create;

   try
 try
  html := NetHTTPClient1.Get( 'https://webdenemedeneme.com/eczane/' ).ContentAsString();

    list.Delimiter := '*';
    list.StrictDelimiter := True;
    list.DelimitedText := html;
    FormatSettings.ShortDateFormat:='dd/mm/yy';

    Tarih := Now;
    DecodeDate(Tarih, Yil, Ay, Gun); // Tarihi par�alara ay�r
    if Length(Ay.ToString) =1 then
    begin
      A:='0'+Ay.ToString;
    end
    else
    begin
        A:=Ay.ToString;
    end;
      if Length(Gun.ToString) =1 then
    begin
      G:='0'+Gun.ToString;
    end
    else
    begin
          G:=Gun.ToString;
    end;

   TarihDuzenli:=G+'/'+A+'/'+Yil.ToString;
   I:=0;
  // for I := 0 to list.Count-1 do
   //  begin

     //     If TarihDuzenli = list.Strings[I] Then
     //     begin


       //      for x := I to I+4 do
       //      begin
          //         Memo1.Lines.Add(list.Strings[x]);
        //
        //     end;
          //   if StrToDate (TarihDuzenli) >StrToDate (list.Strings[I+5])  then exit;

        //  end;


     //end;

     for z := 0 to list.Count-1 do
      begin
        ListBox1.Items.Add(list.Strings[z]);
      end;




      Button2Click(nil);

    except


 MessageDlg('�nternet Ba�lant�n�z Yok ', System.UITypes.TMsgDlgType.mtInformation,
    [
      System.UITypes.TMsgDlgBtn.mbOK

    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
    if Aresult=mrOK then

         Application.MainForm.Close;

    end);

 end;
 finally
   list.Destroy;
 NetHTTPClient1.Free;

 end;

end;



procedure TForm1.Image5Click(Sender: TObject);
begin

  WebBrowser1.Navigate('https://www.google.com/maps/search/'+Label2.Text+' '+Label1.Text);

end;

procedure TForm1.Image4Click(Sender: TObject);
begin
          WebBrowser1.Navigate('https://www.google.com/maps/search/'+Label5.Text+' '+Label7.Text);
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  WebBrowser1.Navigate('https://www.google.com/maps/search/'+Label8.Text+' '+Label4.Text);
  end;

end.

   {                                          }
   {           Sqlite Encrypter v1.0          }
   {                Main Form                 }
   {                                          }
   {         MIT Licence                      }
   {               by Greg Bayes,             }
   {                                          }
   {                                          }
   {******************************************}
unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.Buttons, Vcl.StdCtrls,
  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanExprFuncs,
  uADPhysSQLite, Data.DB, uADCompClient, Vcl.ExtCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    FileOpenDialog1: TFileOpenDialog;
     Button2: TButton;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    SpeedButton2: TSpeedButton;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Button3: TButton;
    ComboBox3: TComboBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Shape2: TShape;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Edit7: TEdit;
    Button4: TButton;
    Label1: TLabel;
    ImageList2: TImageList;
    Image1: TImage;
    ADConnection1: TADConnection;
    ADSQLiteSecurity1: TADSQLiteSecurity;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    private
     { Private declarations }
  public
    { Public declarations }
  end;

  Const
  unencryptedpassword= '';

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
 adConnection1.Params.Clear;
adConnection1.Connected := False;
adConnection1.Params.add('DriverID=SQLite');
adConnection1.Params.add('Database=' + edit1.text);
adPhysSQLiteDriverLink1.DriverID:= 'SQLite';
adsqlitesecurity1.Database:= edit1.Text;
adsqlitesecurity1.DriverLink:= adPhysSQLiteDriverLink1;

if( Combobox2.ItemIndex = 0) or (combobox2.itemindex = 1) then
begin
adsqlitesecurity1.Password:=edit3.Text;
label3.caption:=edit3.Text;
end
else
begin
label3.caption:=combobox2.Items[combobox2.ItemIndex]+':'+edit3.text;
adsqlitesecurity1.Password:=combobox2.Items[combobox2.ItemIndex]+':'+edit3.text;
end;

label3.caption:='no password';
adsqlitesecurity1.removepassword;
adConnection1.Params.add('Password='+unencryptedpassword);
adConnection1.Connected := True;
adsqlitesecurity1.password:= '';
Showmessage('The Encryption level is: '+adsqlitesecurity1.CheckEncryption);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Label2.caption:='';
adConnection1.Params.Clear;
adConnection1.Connected := False;
adConnection1.Params.add('DriverID=SQLite');
adConnection1.Params.add('Database=' + edit4.text);
adConnection1.Params.add('password='+unencryptedpassword);
adPhysSQLiteDriverLink1.DriverID:= 'SQLite';
adsqlitesecurity1.Database:= edit4.Text;
adsqlitesecurity1.DriverLink:= adPhysSQLiteDriverLink1;
if (combobox1.Itemindex = 0 )or (combobox1.Itemindex = 1 )then
begin
Label2.Caption:= edit2.text;
adsqlitesecurity1.Password:= Edit2.Text;
end
else
begin
adsqlitesecurity1.Password:= combobox1.Items[combobox1.itemindex]+':'+edit2.text;
Label2.Caption:=combobox1.Items[combobox1.itemindex]+':'+edit2.text;
end;
adsqlitesecurity1.SetPassword;
adConnection1.Params.Clear;
adConnection1.Connected := False;
adConnection1.Params.add('DriverID=SQLite');
adConnection1.Params.add('Database=' + edit4.text);
if (combobox1.Itemindex = 0)and (combobox1.Itemindex = 1) then
adConnection1.Params.add('password='+edit2.text)
else
adConnection1.Params.add('password='+combobox1.Items[combobox1.itemindex]+':'+edit2.text);
adconnection1.connected:=true;
Showmessage('The Encryption level is: '+adsqlitesecurity1.CheckEncryption);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
adConnection1.Params.Clear;
adConnection1.Connected := False;
adConnection1.Params.add('DriverID=SQLite');
adPhysSQLiteDriverLink1.DriverID:= 'SQLite';
adSQLiteSecurity1.DriverLink := adPhysSQLiteDriverLink1;
adSQLiteSecurity1.Database := edit6.Text;;
if( Combobox3.ItemIndex = 0) or (combobox3.itemindex = 1) then
begin
adsqlitesecurity1.Password:=edit5.Text;
label5.caption:=edit5.Text;;
end
else
begin
label5.caption:=combobox3.Items[combobox3.ItemIndex]+':'+edit5.text;
adsqlitesecurity1.Password:=combobox3.Items[combobox3.ItemIndex]+':'+edit5.text;
end;

if( Combobox3.ItemIndex = 0) or (combobox3.itemindex = 1) then
begin
adConnection1.Params.add('password='+edit7.text);
adsqlitesecurity1.toPassword:=edit7.Text;
label5.caption:=edit7.Text;;
end
else
begin
adConnection1.Params.add('password='+combobox3.Items[combobox3.ItemIndex]+':'+edit7.text);
label5.caption:=combobox3.Items[combobox3.ItemIndex]+':'+edit7.text;
adsqlitesecurity1.toPassword:=combobox3.Items[combobox3.ItemIndex]+':'+edit7.text;
adSQLiteSecurity1.ChangePassword;
adconnection1.connected:=true;
Showmessage('The Encryption level is: '+adsqlitesecurity1.CheckEncryption);
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     form1.Close;
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
   Edit2.Text:='';
end;

procedure TForm1.Edit3Enter(Sender: TObject);
begin
   Edit3.Text:='';
end;

procedure TForm1.Edit5Enter(Sender: TObject);
begin
    Edit5.text:='';
end;

procedure TForm1.Edit7Enter(Sender: TObject);
begin
    Edit7.Text:='';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   imagelist1.GetBitmap(0,speedbutton1.Glyph);
    imagelist1.GetBitmap(0,speedbutton2.Glyph);
    imagelist1.GetBitmap(0,speedbutton3.Glyph);
    shape1.Brush.Color:= clsilver;
    shape2.Brush.Color:= clsilver;
    Label2.Caption:='';
    combobox1.ItemIndex:=0;
    label3.Caption:='';
    label5.Caption:='';
    label2.Caption:='';
    combobox2.ItemIndex:=0;
    combobox3.ItemIndex:=0;
    imagelist2.Geticon(0,image1.Picture.icon);

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
      fileopendialog1.Title:= 'Open SQLite Database File';
    edit1.Text:='';
    if fileopendialog1.execute then
    edit1.text:= fileopendialog1.FileName;
end;

 procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
       fileopendialog1.Title:= 'Open SQLite Database File';
     edit4.Text:='';
    if fileopendialog1.execute then
    edit4.text:= fileopendialog1.FileName;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
     fileopendialog1.Title:= 'Open SQLite Database File';
      edit6.Text:='';
    if fileopendialog1.execute then
    edit6.text:= fileopendialog1.FileName;
end;
end.

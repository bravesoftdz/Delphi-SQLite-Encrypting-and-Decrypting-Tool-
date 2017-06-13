program SQqliteEncrypter;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Main in 'General\Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.Run;
end.

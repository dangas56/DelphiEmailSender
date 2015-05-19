program DelphiEmailSender;

uses
  Vcl.Forms,
  Main in '..\System\Main.pas' {frmMain},
  xEmail_I in '..\Common\xEmail_I.pas',
  xEmail_U in '..\Common\xEmail_U.pas',
  xEmailSender_I in '..\Common\xEmailSender_I.pas',
  xEmailSenderMAPI_U in '..\Common\xEmailSenderMAPI_U.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

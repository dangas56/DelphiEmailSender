unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    eSendTo: TEdit;
    btnSend: TButton;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses xEmailSender_I, xEmailSenderMAPI_U, xEmail_U;

{$R *.dfm}

procedure TfrmMain.btnSendClick(Sender: TObject);
var EmailSender : IEmailSender;
    Email : TEmail;
begin
  EmailSender := TEmailSenderMAPI.create;
  Email := TEmail.Create;
  Email.AddSendToEmailAddress(eSendTo.Text);
  case EmailSender.SendEmail(Email) of
    esEmailUnknown   : ShowMessage('esEmailUnknown');
    esEmailSendError : ShowMessage('esEmailSendError');
    esEmailSent      : ShowMessage('esEmailSent');
  end;
end;

end.

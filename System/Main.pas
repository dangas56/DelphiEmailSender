unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    eSendTo: TEdit;
    btnSend: TButton;
    lblSendTo: TLabel;
    lblSubject: TLabel;
    eSubject: TEdit;
    procedure btnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
begin
  EmailSender := TEmailSenderMAPI.create;
  case EmailSender.SendEmail( TEmail.CreateSendToSub( eSendTo.Text, eSubject.Text)  ) of
    esEmailUnknown   : ShowMessage('esEmailUnknown');
    esEmailSendError : ShowMessage('esEmailSendError');
    esEmailSent      : ShowMessage('esEmailSent');
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.

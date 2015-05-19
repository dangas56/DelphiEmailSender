unit xEmail_U;

interface
uses system.classes, xEmail_I;

type
  TEmail = class (TInterfacedObject, IEmail, IEmailSendTo, IEmailSubject)
  strict private
    slSendTo            : TStringList;
    sSubject            : String;
    sBodyPlainText      : String;
  private
    procedure SetBodyPlainText(const Value: String);
    function GetSubject : String;
    procedure SetSubject(const Value: String);
    function getSendTo : TStringList;
  public
    procedure AddSendToEmailAddress(const SendTo : String);
    property SendTo : TStringList read slSendTo ;
    property Subject : String read GetSubject write SetSubject;
    property BodyPlainText : String read sBodyPlainText write SetBodyPlainText;

    constructor CreateSendToSub(EmailSendTo, EmailSubject : String);
    destructor Destroy; Override;
  end;

implementation

{ TEmail }

procedure TEmail.AddSendToEmailAddress(const SendTo: String);
begin
  slSendTo.Add( SendTo );
end;

constructor TEmail.CreateSendToSub(EmailSendTo, EmailSubject : String);
begin
  sSubject        := '';
  sBodyPlainText  := '';
  slSendTo        := TStringList.Create;
  if EmailSendTo <> '' then
    AddSendToEmailAddress( EmailSendTo );
  if EmailSubject <> '' then
    SetSubject( EmailSubject );
end;

destructor TEmail.Destroy;
begin
  slSendTo.Free;
  inherited;
end;

function TEmail.getSendTo: TStringList;
begin
  result := slSendTo;
end;

function TEmail.GetSubject: String;
begin
  result := sSubject;
end;

procedure TEmail.SetBodyPlainText(const Value: String);
begin
  sBodyPlainText := Value;
end;

procedure TEmail.SetSubject(const Value: String);
begin
  sSubject := Value;
end;

end.

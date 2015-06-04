unit xEmail_U;

interface
uses system.classes, xEmail_I;

type
  TEmail = class (TInterfacedObject, IEmail, IEmailSendTo, IEmailSubject, iEmailBodyPlainText)
  strict private
    slSendTo            : TStringList;
    sSubject            : String;
    sBodyPlainText      : String;
  private
    function GetSubject : String;
    procedure SetSubject(const Value: String);
    function getSendTo : TStringList;
    procedure SetBodyPlainText(const Value: String);
    function GetBodyPlainText : String;
    procedure DefaultVariables;
  public
    procedure AddSendToEmailAddress(const SendTo : String);
    property SendTo : TStringList read slSendTo ;
    property Subject : String read GetSubject write SetSubject;
    property BodyPlainText : String read sBodyPlainText write SetBodyPlainText;

    constructor Create;
    constructor CreateBasic(EmailSendTo, EmailSubject, EmailBody : String);
    destructor Destroy; Override;
  end;

implementation

{ TEmail }

procedure TEmail.AddSendToEmailAddress(const SendTo: String);
begin
  slSendTo.Add( SendTo );
end;

constructor TEmail.Create;
begin
  inherited;
  DefaultVariables;
end;

constructor TEmail.CreateBasic(EmailSendTo, EmailSubject, EmailBody : String);
begin
  DefaultVariables;
  if EmailSendTo <> '' then
    AddSendToEmailAddress( EmailSendTo );
  if EmailSubject <> '' then
    SetSubject( EmailSubject );
  if EmailBody <> '' then
    SetBodyPlainText(EmailBody);
end;

procedure TEmail.DefaultVariables;
begin
  sSubject        := '';
  sBodyPlainText  := '';
  if not assigned(slSendTo) then begin
    slSendTo := TStringList.Create;
    slSendTo.Duplicates := dupIgnore;
    slSendTo.CaseSensitive := False;
    slSendTo.Sorted := True;
  end else begin
    slSendTo.Clear;
  end;
end;

destructor TEmail.Destroy;
begin
  slSendTo.Free;
  inherited;
end;

function TEmail.GetBodyPlainText: String;
begin
  result := sBodyPlainText;
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

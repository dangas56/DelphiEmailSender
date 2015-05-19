unit xEmail_U;

interface
uses system.classes, xEmail_I;

type
  TEmail = class (TInterfacedObject, IEmail, IEmailSendTo)
  strict private
    slSendTo             : TStringList;
    sSubject            : String;
    sBodyPlainText      : String;
  private
    procedure SetBodyPlainText(const Value: String);
    procedure SetSubject(const Value: String);
  public
    procedure AddSendToEmailAddress(SendTo : String);
    function getSendTo : TStringList;
    property SendTo : TStringList read slSendTo ;
    property Subject : String read sSubject write SetSubject;
    property BodyPlainText : String read sBodyPlainText write SetBodyPlainText;

    constructor Create();
    destructor Destroy; Override;
  end;

implementation

{ TBasicEmail }

procedure TEmail.AddSendToEmailAddress(SendTo: String);
begin
  slSendTo.Add( SendTo );
end;

constructor TEmail.Create;
begin
  inherited;
  slSendTo := TStringList.Create;
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

procedure TEmail.SetBodyPlainText(const Value: String);
begin
  sBodyPlainText := Value;
end;

procedure TEmail.SetSubject(const Value: String);
begin
  sSubject := Value;
end;

end.

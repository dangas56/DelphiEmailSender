unit xEmail_I;

interface
uses classes;

type
  IEmail = interface
    ['{02530911-5BB4-492A-ADF2-556563B69A69}']
  end;

  IEmailSendTo = Interface
    ['{621F5FEF-0B5B-4D4A-A041-3C9A04B45D30}']
    procedure AddSendToEmailAddress(const SendTo : String);
    function  GetSendTo() : TStringList;
    property SendTo : TStringList read GetSendTo;
  End;

  IEmailSubject = Interface
    ['{373827B1-EB0C-46CF-BA58-02329CDB6CDE}']
    procedure SetSubject(const value : String);
    function GetSubject : String;
    property Subject : String read GetSubject write SetSubject;
  End;

  iEmailBodyPlainText = interface
    ['{33A02A39-A0D7-4750-8E4C-7EC637D96195}']
    procedure SetBodyPlainText(const value : String);
    function GetBodyPlainText : String;
    property BodyPlainText : String read GetBodyplainText write setBodyPlainText;
  end;

implementation

end.

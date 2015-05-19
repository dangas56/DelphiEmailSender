unit xEmail_I;

interface
uses classes;

type
  IEmail = interface
    ['{02530911-5BB4-492A-ADF2-556563B69A69}']
  end;

  IEmailSendTo = Interface
    ['{621F5FEF-0B5B-4D4A-A041-3C9A04B45D30}']
    procedure AddSendToEmailAddress(SendTo : String);
    function  GetSendTo() : TStringList;
    property SendTo : TStringList read GetSendTo;
  End;

implementation



end.

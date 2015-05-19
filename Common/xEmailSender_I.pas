unit xEmailSender_I;

interface
uses xEmail_I;

type
  TEmailSendResult = (esEmailUnknown, esEmailSendError, esEmailSent);

  IEmailSender = interface
    ['{02530911-5BB4-492A-ADF2-556563B69A69}']
    function SendEmail( Email : IEmail ) : TEmailSendResult;
  end;

implementation

end.

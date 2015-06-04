unit xEmailSender_UT;

interface
uses
  DUnitX.TestFramework, xEmailSender_I, xEmailSenderMAPI_U, xEmail_I, delphi.mocks;

type
  TIEmailMock_Blank = class (TInterfacedObject, IEmail)

  end;

  [TestFixture]
  xEmailSenderUT = class(TObject)
  public
    FemSend : TEmailSenderMAPI;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestMockSend;
  end;

implementation
uses typInfo;

procedure xEmailSenderUT.Setup;
begin
  FemSend := TEmailSenderMAPI.create;
end;

procedure xEmailSenderUT.TearDown;
begin
  FemSend.Free;
end;


procedure xEmailSenderUT.TestMockSend;
var MockEmail : IEmail;
    res : TEmailSendResult;
begin
  MockEmail := TIEmailMock_Blank.create;
  Assert.WillRaise(procedure begin FemSend.SendEmail( MockEmail );end, Exception_EmailSender_NoRecipients);
end;

initialization
  TDUnitX.RegisterTestFixture(xEmailSenderUT);
end.

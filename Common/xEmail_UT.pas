unit xEmail_UT;

interface
uses
  DUnitX.TestFramework, xEmail_I, xEmail_U;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    FEmail : TEmail;
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure Teardown;
    [Test]
    procedure TestAddSendToEmailAddress;
    [Test]
    procedure TestAddTwoDifferentEmailAddresses;
    [Test]
    procedure TestAddSameEmailAddressTwice_ShouldOnlyHaveOneAddress;
    [Test]
    [TestCase('Subject Test 1', 'Test 1')]
    procedure TestAddSubject(sSubject : String);
    [Test]
    procedure TestAddMessage;

  end;

implementation
uses system.Classes, spring.collections;

{ TMyTestObject }

procedure TMyTestObject.setup;
begin
  FEmail := TEmail.Create;
end;

procedure TMyTestObject.teardown;
begin
 FEmail.Free;
end;

procedure TMyTestObject.TestAddMessage;
const EMAIL_BODY = 'This is a email body message test';
begin
  FEmail.BodyPlainText := EMAIL_BODY;
  assert.AreEqual(EMAIL_BODY, FEmail.BodyPlainText);
end;

procedure TMyTestObject.TestAddSameEmailAddressTwice_ShouldOnlyHaveOneAddress;
Const EMAIL_ADDRESS = 'Test@Email.com';
begin
  FEmail.AddSendToEmailAddress(EMAIL_ADDRESS);
  FEmail.AddSendToEmailAddress(EMAIL_ADDRESS);
  assert.AreEqual(1, FEmail.SendTo.Count, 'Unexpected amount of Email Addresses');
  assert.AreEqual(EMAIL_ADDRESS, FEmail.SendTo[0]);
end;

procedure TMyTestObject.TestAddSendToEmailAddress;
Const EMAIL_ADDRESS = 'Test@Email.com';
begin
  FEmail.AddSendToEmailAddress(EMAIL_ADDRESS);
  assert.AreEqual(EMAIL_ADDRESS, FEmail.SendTo[0]);
end;

procedure TMyTestObject.TestAddSubject(sSubject : String);
begin
 FEmail.Subject := sSubject;
 assert.AreEqual(sSubject, FEmail.Subject);
end;

procedure TMyTestObject.TestAddTwoDifferentEmailAddresses;
Const EMAIL_ADDRESS1 = 'Test1@Email.com';
      EMAIL_ADDRESS2 = 'Test2@Email.com';
begin
  FEmail.AddSendToEmailAddress(EMAIL_ADDRESS1);
  FEmail.AddSendToEmailAddress(EMAIL_ADDRESS2);
  assert.AreEqual(2, FEmail.SendTo.Count, 'Unexpected amount of Email Addresses');
  assert.AreEqual(EMAIL_ADDRESS1, FEmail.SendTo[0]);
  assert.AreEqual(EMAIL_ADDRESS2, FEmail.SendTo[1]);
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.

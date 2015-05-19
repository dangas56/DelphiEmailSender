unit xEmailSenderMAPI_U;

interface
uses xEmailSender_i, xEmail_I, winapi.mapi, sysutils, windows, forms;

type
  Exception_EmailSender = class(Exception);
  Exception_EmailSender_NoRecipients = class(Exception_EmailSender);
  Exception_EmailSender_CouldNotLoadMAPIDLL = class(Exception_EmailSender);

  TEmailSenderMAPI = class(TInterfacedObject, IEmailSender)
  public
    Email : IEmail;
    function SendEmail(email : IEmail): TEmailSendResult;
  end;


implementation

{ TEmailSenderMAPI }

function TEmailSenderMAPI.SendEmail(email : IEmail): TEmailSendResult;
var MAPIModule          : HModule;
    MAPImessage         : TMapiMessage;
    lpSender            : TMapiRecipDesc;
    PRecip, Recipients  : PMapiRecipDesc;
    SM                  : TFNMapiSendMail;
    smResult            : Integer;

    em_SendTo           : IEmailSendTo;

    i : Integer;
    RecipientsCount : integer;
begin
  result := TEmailSendResult.esEmailUnknown;
  try
    RecipientsCount := 0;

    if Supports(email, iEmailSendTo, em_SendTo) and (em_SendTo.SendTo <> Nil) and
       (em_SendTo.SendTo.Count > 0) then begin
      inc(RecipientsCount, em_SendTo.SendTo.Count);
    end;

    if RecipientsCount > 0 then begin
      FillChar(MAPImessage, SizeOf(MAPImessage), 0);
      if Assigned(em_SendTo) then begin
        MAPImessage.nRecipCount := em_SendTo.SendTo.Count;

        GetMem(Recipients, MapiMessage.nRecipCount * sizeof(TMapiRecipDesc));
        PRecip := Recipients;
        for i := 0 to (em_SendTo.SendTo.Count - 1) do begin
          Recipients^.ulRecipClass := MAPI_TO;
          Recipients^.lpszName := strNew(PansiChar(ansistring(em_SendTo.SendTo[i])));
          Recipients^.lpszAddress := nil;
          Recipients^.ulReserved := 0;
          Recipients^.ulEIDSize := 0;
          Recipients^.lpEntryID := nil;
        end;
      end;

      MAPImessage.lpRecips := PRecip;
      MAPImessage.nFileCount := 0;

      MAPIModule := LoadLibrary(PChar(MAPIDLL));
      if MAPIModule = 0 then begin
        raise Exception_EmailSender_CouldNotLoadMAPIDLL.Create('');
      end else begin
        try
          @SM := GetProcAddress(MAPIModule, 'MAPISendMail');
          if @SM<>nil then begin
            smResult := SM(0, Application.Handle, MAPImessage, 0, 0);
            if smResult <> 0 then begin
              Result := TEmailSendResult.esEmailSendError ;
            end else
              Result := TEmailSendResult.esEmailSent ;
          end  else begin
            Result := TEmailSendResult.esEmailSendError ;
          end;
        finally
          FreeLibrary(MAPIModule);
        end;
      end;
    end else
      raise Exception_EmailSender_NoRecipients.Create('');
  except
    on E:Exception do begin
      result := TEmailSendResult.esEmailSendError;
      raise;
    end;
  end;
end;

end.

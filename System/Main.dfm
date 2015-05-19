object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi Email Sender'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSendTo: TLabel
    Left = 16
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Send To'
  end
  object lblSubject: TLabel
    Left = 19
    Top = 54
    Width = 36
    Height = 13
    Caption = 'Subject'
  end
  object eSendTo: TEdit
    Left = 61
    Top = 21
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSend: TButton
    Left = 61
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Send Email'
    TabOrder = 1
    OnClick = btnSendClick
  end
  object eSubject: TEdit
    Left = 61
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Test Email'
  end
end

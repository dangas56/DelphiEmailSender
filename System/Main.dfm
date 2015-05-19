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
  PixelsPerInch = 96
  TextHeight = 13
  object eSendTo: TEdit
    Left = 120
    Top = 80
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnSend: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'btnSend'
    TabOrder = 1
    OnClick = btnSendClick
  end
end

object frmHardware: TfrmHardware
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmHardware'
  ClientHeight = 492
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 762
    Top = 458
    Width = 129
    Height = 16
    Caption = 'Usuario conectado: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 24
    Top = 14
    Width = 297
    Height = 33
    AutoSize = False
    Caption = 'Gesti'#243'n de Hardware'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btnCerrar: TButton
    Left = 861
    Top = 8
    Width = 30
    Height = 28
    ImageIndex = 2
    Images = dmDatos.ilIconosChicos
    TabOrder = 0
    OnClick = btnCerrarClick
  end
end

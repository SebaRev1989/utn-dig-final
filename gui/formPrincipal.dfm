object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gestion de Sistemas'
  ClientHeight = 414
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tlbOpciones: TToolBar
    Left = 0
    Top = 0
    Width = 360
    Height = 81
    ButtonHeight = 81
    ButtonWidth = 89
    Caption = 'tlbOpciones'
    TabOrder = 0
    object btnIngresar: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnIngresar'
      ImageIndex = 0
    end
  end
  object pnlVentanas: TPanel
    Left = 0
    Top = 81
    Width = 360
    Height = 333
    Align = alClient
    Caption = 'pnlVentanas'
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 160
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end

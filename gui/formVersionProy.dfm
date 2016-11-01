object frmVersionProy: TfrmVersionProy
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmVersionProy'
  ClientHeight = 492
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 24
    Top = 14
    Width = 377
    Height = 33
    AutoSize = False
    Caption = 'Nueva Versi'#243'n de Proyecto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
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
  object lblProyecto: TLabel
    Left = 54
    Top = 80
    Width = 171
    Height = 19
    Caption = 'Nombre del Proyecto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEstadoSoftware: TLabel
    Left = 54
    Top = 128
    Width = 130
    Height = 16
    Caption = 'Estado del proyecto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVersionMay: TLabel
    Left = 54
    Top = 215
    Width = 99
    Height = 16
    Caption = 'Versi'#243'n Mayor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVersionMen: TLabel
    Left = 264
    Top = 218
    Width = 99
    Height = 16
    Caption = 'Versi'#243'n Menor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblInfo: TLabel
    Left = 54
    Top = 280
    Width = 192
    Height = 13
    Caption = 'Las versiones solo pueden ser n'#250'meros.'
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
  object cbbEstadoSoft: TComboBox
    Left = 54
    Top = 150
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object edtVersionMay: TEdit
    Left = 54
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = edtVersionMayExit
  end
  object edtVersionMen: TEdit
    Left = 264
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 3
    OnExit = edtVersionMenExit
  end
  object btnActualizar: TButton
    Left = 680
    Top = 150
    Width = 130
    Height = 70
    Caption = 'Actualizar'
    ImageIndex = 17
    Images = dmDatos.ilIconos
    TabOrder = 4
    OnClick = btnActualizarClick
  end
  object btnCancelar: TButton
    Left = 680
    Top = 296
    Width = 130
    Height = 70
    Caption = 'Cancelar'
    ImageIndex = 15
    Images = dmDatos.ilIconos
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end

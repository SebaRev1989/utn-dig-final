object frmIngresar: TfrmIngresar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmIngresar'
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
    Width = 273
    Height = 33
    AutoSize = False
    Caption = 'Ingreso al Sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object cbbUsuarios: TComboBox
    Left = 354
    Top = 80
    Width = 201
    Height = 21
    TabOrder = 0
    Text = 'Seleccione su usuario...'
  end
  object lbledtContrasena: TLabeledEdit
    Left = 354
    Top = 189
    Width = 201
    Height = 21
    EditLabel.Width = 108
    EditLabel.Height = 13
    EditLabel.Caption = 'Ingrese su contrase'#241'a'
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnIngresar: TButton
    Left = 286
    Top = 296
    Width = 130
    Height = 70
    Caption = 'Ingresar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImageIndex = 16
    Images = dmDatos.ilIconos
    ParentFont = False
    TabOrder = 2
    OnClick = btnIngresarClick
  end
  object btnCancelar: TButton
    Left = 486
    Top = 296
    Width = 130
    Height = 70
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImageIndex = 15
    Images = dmDatos.ilIconos
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end

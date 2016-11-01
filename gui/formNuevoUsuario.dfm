object frmNuevoUsuario: TfrmNuevoUsuario
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderStyle = bsNone
  Caption = 'frmNuevoUsuario'
  ClientHeight = 492
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 24
    Top = 24
    Width = 205
    Height = 33
    AutoSize = False
    Caption = 'Nuevo Usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 232
    Top = 106
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 232
    Top = 164
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 232
    Top = 226
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 232
    Top = 288
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 472
    Top = 106
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 472
    Top = 288
    Width = 10
    Height = 19
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCancelar: TButton
    Left = 752
    Top = 400
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
    TabOrder = 8
    OnClick = btnCancelarClick
  end
  object lbledtApellido: TLabeledEdit
    Left = 64
    Top = 104
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Apellido'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 0
  end
  object lbledtNombre: TLabeledEdit
    Left = 64
    Top = 166
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Nombre'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 1
  end
  object lbledtContacto: TLabeledEdit
    Left = 64
    Top = 352
    Width = 393
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Contacto'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 6
  end
  object lbledtUsuario: TLabeledEdit
    Left = 64
    Top = 228
    Width = 153
    Height = 21
    EditLabel.Width = 107
    EditLabel.Height = 13
    EditLabel.Caption = 'Nombre de Usuario'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 3
  end
  object lbledtContrasena: TLabeledEdit
    Left = 64
    Top = 290
    Width = 153
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Contrase'#241'a'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 4
  end
  object cbbRol: TComboBox
    Left = 304
    Top = 104
    Width = 153
    Height = 21
    TabOrder = 2
    Text = 'Seleccione su rol...'
  end
  object btnAceptar: TButton
    Left = 160
    Top = 400
    Width = 130
    Height = 70
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImageIndex = 16
    Images = dmDatos.ilIconos
    ParentFont = False
    TabOrder = 7
    OnClick = btnAceptarClick
  end
  object mmoAyuda: TMemo
    Left = 552
    Top = 104
    Width = 330
    Height = 193
    TabStop = False
    BorderStyle = bsNone
    Lines.Strings = (
      
        'Para crear un nuevo usuario complete los campos que se solicitan' +
        ' a '
      'la izquierda.'
      ''
      'Aquellos marcados con un "*" son de caracter obligatorio.'
      ''
      'El nombre de usuario puede contener caracteres alfanum'#233'ricos '
      
        'pero no espacios, barras ("/" o "\"), asteriscos ("*") o guiones' +
        ' '
      'medios ("-").'
      ''
      'Los campos literales tampoco pueden contener los caracteres '
      'excluidos del nombre de usuario.'
      ''
      'El campo contacto puede ser rellenado con un n'#250'mero de tel'#233'fono '
      'o una direcci'#243'n de correo electr'#243'nico y es opcional.')
    ReadOnly = True
    TabOrder = 9
  end
  object lbledtVerifContrasena: TLabeledEdit
    Left = 304
    Top = 290
    Width = 153
    Height = 21
    EditLabel.Width = 200
    EditLabel.Height = 13
    EditLabel.Caption = 'Ingrese nuevamente la Contrase'#241'a'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 5
  end
end

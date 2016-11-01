object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gesti'#243'n de Sistemas - Versi'#243'n '
  ClientHeight = 562
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmOpciones
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlbOpciones: TToolBar
    Left = 0
    Top = 0
    Width = 910
    Height = 70
    ButtonHeight = 70
    ButtonWidth = 89
    Caption = 'tlbOpciones'
    TabOrder = 0
    object btnLogin: TButton
      Left = 0
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Ingresar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object btnNuevoUsuario: TButton
      Left = 130
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Registrarse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 1
      OnClick = btnNuevoUsuarioClick
    end
    object btnProyectos: TButton
      Left = 260
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Proyectos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 2
      OnClick = btnProyectosClick
    end
    object btnPedidos: TButton
      Left = 390
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Pedidos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 3
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 3
      OnClick = btnPedidosClick
    end
    object btnHardware: TButton
      Left = 520
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Hardware'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 14
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 4
      OnClick = btnHardwareClick
    end
    object btnInformes: TButton
      Left = 650
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Informes'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 12
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 5
      OnClick = btnInformesClick
    end
    object btnSalir: TButton
      Left = 780
      Top = 0
      Width = 130
      Height = 70
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 11
      Images = dmDatos.ilIconos
      ParentFont = False
      TabOrder = 6
      OnClick = btnSalirClick
    end
  end
  object pnlVentanas: TPanel
    Left = 0
    Top = 70
    Width = 910
    Height = 492
    Align = alClient
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 8
      Top = 16
      Width = 705
      Height = 33
      AutoSize = False
      Caption = 'Seleccione una de las opciones de la barra superior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblUsuario: TLabel
      Left = 762
      Top = 386
      Width = 129
      Height = 16
      Caption = 'Usuario conectado: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnDesconectar: TButton
      Left = 761
      Top = 408
      Width = 130
      Height = 70
      Caption = 'Desconectar'
      ImageIndex = 15
      Images = dmDatos.ilIconos
      TabOrder = 0
      Visible = False
      OnClick = btnDesconectarClick
    end
  end
  object mmOpciones: TMainMenu
    Left = 656
    Top = 230
    object mniUsuarios: TMenuItem
      Caption = 'Usuarios'
      object mniIngresar: TMenuItem
        Caption = 'Ingresar'
        OnClick = mniIngresarClick
      end
      object mniNuevoUsuario: TMenuItem
        Caption = 'Nuevo Usuario'
        OnClick = mniNuevoUsuarioClick
      end
      object mniModificarDatosUser: TMenuItem
        Caption = 'Modificar Datos'
        Enabled = False
        OnClick = mniModificarDatosUserClick
      end
    end
    object mniProyectos: TMenuItem
      Caption = 'Proyectos'
      object mniVerProyectos: TMenuItem
        Caption = 'Ver Proyectos'
        Enabled = False
        OnClick = mniVerProyectosClick
      end
      object mniVerPedidos: TMenuItem
        Caption = 'Ver Pedidos'
        Enabled = False
        OnClick = mniVerPedidosClick
      end
    end
    object mniHardware: TMenuItem
      Caption = 'Hardware'
      Enabled = False
      OnClick = mniHardwareClick
    end
    object mniInformes: TMenuItem
      Caption = 'Informes'
      Enabled = False
      OnClick = mniInformesClick
    end
    object mniAcercaDe: TMenuItem
      Caption = 'Acerca de...'
      OnClick = mniAcercaDeClick
    end
  end
end

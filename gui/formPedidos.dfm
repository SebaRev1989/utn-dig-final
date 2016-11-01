object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmPedidos'
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
    Width = 561
    Height = 33
    AutoSize = False
    Caption = 'Pedidos de desarrollos o modificaciones'
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
    TabOrder = 1
    OnClick = btnCerrarClick
  end
  object pgcPedidos: TPageControl
    Left = 24
    Top = 53
    Width = 867
    Height = 388
    ActivePage = tsListarPedidos
    Style = tsFlatButtons
    TabOrder = 0
    object tsNuevoPedido: TTabSheet
      Caption = 'Nuevo Pedido'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblPedido: TLabel
        Left = 3
        Top = 53
        Width = 144
        Height = 16
        Caption = 'Descripci'#243'n del pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblcontador: TLabel
        Left = 423
        Top = 335
        Width = 181
        Height = 16
        Caption = 'Caracteres restantes: 1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNombrePedido: TLabel
        Left = 3
        Top = 7
        Width = 119
        Height = 16
        Caption = 'Nombre del pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mmoAyuda: TMemo
        Left = 610
        Top = 75
        Width = 243
        Height = 126
        TabStop = False
        BorderStyle = bsNone
        Lines.Strings = (
          'En el campo de la izquierda debe describir su '
          'pedido.  Agregue la mayor cantidad de detalles '
          'posibles.  En caso de ser una modificaci'#243'n o '
          'adici'#243'n a un sistema que se encuentra en '
          'funcionamiento, ind'#237'quelo claramente.'
          'Usted cuenta con 1000 caracteres para su '
          'descripci'#243'n, un contador le indicar'#225' la cantidad '
          'restante.')
        ReadOnly = True
        TabOrder = 3
      end
      object mmoDescripcion: TMemo
        Left = 3
        Top = 75
        Width = 601
        Height = 254
        TabOrder = 1
        OnChange = mmoDescripcionChange
      end
      object btnNuevoPedido: TButton
        Left = 721
        Top = 284
        Width = 135
        Height = 70
        Caption = 'Crear Pedido'
        ImageIndex = 5
        Images = dmDatos.ilIconos
        TabOrder = 2
        OnClick = btnNuevoPedidoClick
      end
      object edtNombrePedido: TEdit
        Left = 3
        Top = 26
        Width = 158
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object tsListarPedidos: TTabSheet
      Caption = 'Listar Pedidos'
      ImageIndex = 1
      OnShow = tsListarPedidosShow
      object lblPedidosEspera: TLabel
        Left = 3
        Top = 18
        Width = 118
        Height = 16
        Caption = 'Pedidos en Espera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPedidosAtendidos: TLabel
        Left = 327
        Top = 18
        Width = 120
        Height = 16
        Caption = 'Pedidos Atendidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDetalle: TLabel
        Left = 651
        Top = 18
        Width = 115
        Height = 16
        Caption = 'Detalle del Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrdPedidosEspera: TDBGrid
        Left = 3
        Top = 40
        Width = 318
        Height = 281
        DataSource = dmDatos.dsPedidosEspera
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdPedidosEsperaDblClick
      end
      object dbgrdPedidosAtendidos: TDBGrid
        Left = 327
        Top = 40
        Width = 318
        Height = 281
        DataSource = dmDatos.dsPedidosAtendidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object mmoDetalle: TMemo
        Left = 651
        Top = 40
        Width = 206
        Height = 281
        TabOrder = 2
      end
    end
  end
  object ppmOpciones: TPopupMenu
    Left = 216
    Top = 448
    object mniAtenderPedido: TMenuItem
      Caption = 'Atender Pedido'
      OnClick = mniAtenderPedidoClick
    end
    object mniEliminarPedido: TMenuItem
      Caption = 'Eliminar Pedido'
      OnClick = mniEliminarPedidoClick
    end
  end
end

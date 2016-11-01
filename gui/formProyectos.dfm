object frmProyectos: TfrmProyectos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmProyectos'
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
    Width = 345
    Height = 33
    AutoSize = False
    Caption = 'Proyectos de Desarrollo'
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
  object pgcProyectos: TPageControl
    Left = 24
    Top = 64
    Width = 867
    Height = 388
    ActivePage = tsListarProyectos
    Style = tsFlatButtons
    TabOrder = 1
    object tsNuevoProyecto: TTabSheet
      Caption = 'Nuevo Proyecto'
      object lblNombreProyecto: TLabel
        Left = 16
        Top = 11
        Width = 140
        Height = 16
        Caption = 'Nombre del proyecto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstadoSoftware: TLabel
        Left = 240
        Top = 11
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
      object lblProyecto: TLabel
        Left = 16
        Top = 64
        Width = 160
        Height = 16
        Caption = 'Descripci'#243'n del Proyecto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContador: TLabel
        Left = 420
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
      object lblFecha: TLabel
        Left = 480
        Top = 11
        Width = 100
        Height = 16
        Caption = 'Fecha de Inicio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNombreProyecto: TEdit
        Left = 16
        Top = 30
        Width = 161
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object cbbEstadoSoft: TComboBox
        Left = 240
        Top = 30
        Width = 169
        Height = 21
        TabOrder = 1
      end
      object mmoDescripcion: TMemo
        Left = 16
        Top = 86
        Width = 585
        Height = 243
        TabOrder = 2
        OnChange = mmoDescripcionChange
      end
      object btnNuevoProyecto: TButton
        Left = 704
        Top = 284
        Width = 152
        Height = 70
        Caption = 'Crear Proyecto'
        ImageIndex = 5
        Images = dmDatos.ilIconos
        TabOrder = 3
        OnClick = btnNuevoProyectoClick
      end
      object mmoAyuda: TMemo
        Left = 607
        Top = 86
        Width = 250
        Height = 163
        TabStop = False
        Lines.Strings = (
          'En el campo de la izquierda debe describir el'
          'nuevo proyecto.  Agregue la mayor cantidad de '
          'detalles posibles.  Usted cuenta con 1000 '
          'caracteres para su descripci'#243'n, un contador le '
          'indicar'#225' la cantidad restante.  Recuede que '
          'puede modificar el estado inicial del proyecto '
          'seleccionando una opci'#243'n en el men'#250' desplegable '
          'correspondiente.')
        ReadOnly = True
        TabOrder = 4
      end
      object dtpFecha: TDateTimePicker
        Left = 480
        Top = 30
        Width = 186
        Height = 21
        Date = 42319.536434189820000000
        Time = 42319.536434189820000000
        TabOrder = 5
      end
    end
    object tsListarProyectos: TTabSheet
      Caption = 'Listar Proyectos'
      ImageIndex = 1
      OnShow = tsListarProyectosShow
      object lblDetalle: TLabel
        Left = 608
        Top = 3
        Width = 131
        Height = 16
        Caption = 'Detalle del Proyecto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrdProyectos: TDBGrid
        Left = 12
        Top = 3
        Width = 590
        Height = 334
        DataSource = dmDatos.dsProyectos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdProyectosDblClick
      end
      object mmoDetalle: TMemo
        Left = 608
        Top = 25
        Width = 248
        Height = 312
        TabOrder = 1
      end
    end
  end
  object ppmOpciones: TPopupMenu
    Left = 528
    Top = 216
    object mniGenerarVerProy: TMenuItem
      Caption = 'Generar Nueva Versi'#243'n'
      OnClick = mniGenerarVerProyClick
    end
    object mniEliminarProy: TMenuItem
      Caption = 'Eliminar Proyecto'
      OnClick = mniEliminarProyClick
    end
  end
end

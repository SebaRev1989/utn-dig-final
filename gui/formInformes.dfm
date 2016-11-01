object frmInformes: TfrmInformes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmInformes'
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
    Caption = 'Generaci'#243'n de Informes'
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
  object btnGenerarInforme: TButton
    Left = 390
    Top = 336
    Width = 130
    Height = 70
    Caption = 'Generar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImageIndex = 4
    Images = dmDatos.ilIconos
    ParentFont = False
    TabOrder = 1
    OnClick = btnGenerarInformeClick
  end
  object rgListados: TRadioGroup
    Left = 363
    Top = 120
    Width = 185
    Height = 105
    Caption = 'Listados posibles'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Usuarios'
      'Pedidos'
      'Proyectos')
    ParentFont = False
    TabOrder = 2
  end
  object frxRepUsuarios: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42324.535171550920000000
    ReportOptions.LastChange = 42324.535171550920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 40
    Datasets = <
      item
        DataSet = frxDBdsUsuarios
        DataSetName = 'frxDBdsUsuarios'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 166.299320000000000000
          Width = 423.307360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            'UTN, FRT - Gesti'#243'n de Sistemas - Listado de Usuarios')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdsUsuarios
        DataSetName = 'frxDBdsUsuarios'
        RowCount = 0
        object frxDBDataset1NOMBRE: TfrxMemoView
          Width = 396.850650000000000000
          Height = 22.677180000000000000
          DataField = 'NOMBRE'
          DataSet = frxDBdsUsuarios
          DataSetName = 'frxDBdsUsuarios'
          Memo.UTF8W = (
            '[frxDBdsUsuarios."NOMBRE"]')
        end
        object frxDBDataset1ROL: TfrxMemoView
          Left = 411.968770000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          DataField = 'ROL'
          DataSet = frxDBdsUsuarios
          DataSetName = 'frxDBdsUsuarios'
          Memo.UTF8W = (
            '[frxDBdsUsuarios."ROL"]')
        end
        object frxDBDataset1USUARIO: TfrxMemoView
          Left = 582.047620000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          DataField = 'USUARIO'
          DataSet = frxDBdsUsuarios
          DataSetName = 'frxDBdsUsuarios'
          Memo.UTF8W = (
            '[frxDBdsUsuarios."USUARIO"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 411.968770000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'NOMBRE:')
        end
        object Memo3: TfrxMemoView
          Left = 411.968770000000000000
          Width = 170.078850000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'ROL:')
        end
        object Memo4: TfrxMemoView
          Left = 582.047620000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'USUARIO:')
        end
      end
    end
  end
  object frxRepPedidos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42324.535539756940000000
    ReportOptions.LastChange = 42324.535539756940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 136
    Datasets = <
      item
        DataSet = frxDBdsPedidosAtend
        DataSetName = 'frxDBdsPedidosAtend'
      end
      item
        DataSet = frxDBdsPedidosEspera
        DataSetName = 'frxDBdsPedidosEspera'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 151.181200000000000000
          Width = 411.968770000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            'UTN, FRT - Gesti'#243'n de Sistemas - Listado de Pedidos')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 102.047310000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8W = (
            'PEDIDOS EN ESPERA')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'FECHA:')
        end
        object Memo4: TfrxMemoView
          Left = 162.519790000000000000
          Top = 18.897650000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'PEDIDO:')
        end
        object Memo5: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'SOLICITADO POR:')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 162.519790000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdsPedidosEspera
        DataSetName = 'frxDBdsPedidosEspera'
        RowCount = 0
        object frxDBdsPedidosEsperaFECHA: TfrxMemoView
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DataField = 'FECHA'
          DataSet = frxDBdsPedidosEspera
          DataSetName = 'frxDBdsPedidosEspera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosEspera."FECHA"]')
          ParentFont = False
        end
        object frxDBdsPedidosEsperapedido: TfrxMemoView
          Left = 162.519790000000000000
          Width = 313.700990000000000000
          Height = 22.677180000000000000
          DataField = 'pedido'
          DataSet = frxDBdsPedidosEspera
          DataSetName = 'frxDBdsPedidosEspera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosEspera."pedido"]')
          ParentFont = False
        end
        object frxDBdsPedidosEsperaSOLICITANTE: TfrxMemoView
          Left = 491.338900000000000000
          Width = 249.448980000000000000
          Height = 22.677180000000000000
          DataField = 'SOLICITANTE'
          DataSet = frxDBdsPedidosEspera
          DataSetName = 'frxDBdsPedidosEspera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosEspera."SOLICITANTE"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 207.874150000000000000
        Width = 740.409927000000000000
        object Memo6: TfrxMemoView
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Memo.UTF8W = (
            'PEDIDOS ATENDIDOS')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'FECHA:')
        end
        object Memo8: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'ATENDIDO:')
        end
        object Memo9: TfrxMemoView
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'PEDIDO:')
        end
        object Memo10: TfrxMemoView
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'TOMADO POR:')
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdsPedidosAtend
        DataSetName = 'frxDBdsPedidosAtend'
        RowCount = 0
        object frxDBdsPedidosAtendFECHA: TfrxMemoView
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DataField = 'FECHA'
          DataSet = frxDBdsPedidosAtend
          DataSetName = 'frxDBdsPedidosAtend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosAtend."FECHA"]')
          ParentFont = False
        end
        object frxDBdsPedidosAtendRECIBIDO: TfrxMemoView
          Left = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DataField = 'RECIBIDO'
          DataSet = frxDBdsPedidosAtend
          DataSetName = 'frxDBdsPedidosAtend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosAtend."RECIBIDO"]')
          ParentFont = False
        end
        object frxDBdsPedidosAtendpedido: TfrxMemoView
          Left = 264.567100000000000000
          Width = 226.771800000000000000
          Height = 22.677180000000000000
          DataField = 'pedido'
          DataSet = frxDBdsPedidosAtend
          DataSetName = 'frxDBdsPedidosAtend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosAtend."pedido"]')
          ParentFont = False
        end
        object frxDBdsPedidosAtendRECEPTOR: TfrxMemoView
          Left = 506.457020000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          DataField = 'RECEPTOR'
          DataSet = frxDBdsPedidosAtend
          DataSetName = 'frxDBdsPedidosAtend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsPedidosAtend."RECEPTOR"]')
          ParentFont = False
        end
      end
    end
  end
  object frxRepProyectos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42324.535585150500000000
    ReportOptions.LastChange = 42324.535585150500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 280
    Datasets = <
      item
        DataSet = frxDBdsProyectos
        DataSetName = 'frxDBdsProyectos'
      end
      item
        DataSet = frxDBdsVerProy
        DataSetName = 'frxDBdsVerProy'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 147.401670000000000000
          Width = 430.866420000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            'UTN, FRT - Gesti'#243'n de Sistemas - Listado de Proyectos')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdsProyectos
        DataSetName = 'frxDBdsProyectos'
        RowCount = 0
        object frxDBdsProyectosproyecto: TfrxMemoView
          Width = 166.299320000000000000
          Height = 22.677180000000000000
          DataField = 'proyecto'
          DataSet = frxDBdsProyectos
          DataSetName = 'frxDBdsProyectos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsProyectos."proyecto"]')
          ParentFont = False
        end
        object frxDBdsProyectosINICIADO: TfrxMemoView
          Left = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DataField = 'INICIADO'
          DataSet = frxDBdsProyectos
          DataSetName = 'frxDBdsProyectos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsProyectos."INICIADO"]')
          ParentFont = False
        end
        object frxDBdsProyectosGESTOR: TfrxMemoView
          Left = 359.055350000000000000
          Width = 200.315090000000000000
          Height = 22.677180000000000000
          DataField = 'GESTOR'
          DataSet = frxDBdsProyectos
          DataSetName = 'frxDBdsProyectos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsProyectos."GESTOR"]')
          ParentFont = False
        end
        object frxDBdsProyectosESTADO: TfrxMemoView
          Left = 612.283860000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          DataField = 'ESTADO'
          DataSet = frxDBdsProyectos
          DataSetName = 'frxDBdsProyectos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsProyectos."ESTADO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 181.417440000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Iniciado:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 313.700990000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Gestor:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 570.709030000000000000
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Estado:')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdsVerProy
        DataSetName = 'frxDBdsVerProy'
        Filter = '<frxDBdsVerProy."ID_PROYECTO">=<frxDBdsProyectos."ID">'
        RowCount = 0
        object frxDBdsVerProyversion: TfrxMemoView
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DataField = 'version'
          DataSet = frxDBdsVerProy
          DataSetName = 'frxDBdsVerProy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsVerProy."version"]')
          ParentFont = False
        end
        object frxDBdsVerProygeneradapor: TfrxMemoView
          Left = 408.189240000000000000
          Width = 207.874150000000000000
          Height = 22.677180000000000000
          DataField = 'generada por'
          DataSet = frxDBdsVerProy
          DataSetName = 'frxDBdsVerProy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsVerProy."generada por"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 313.700990000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Actualizado por:')
          ParentFont = False
        end
        object frxDBdsVerProyFECHA: TfrxMemoView
          Left = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DataField = 'FECHA'
          DataSet = frxDBdsVerProy
          DataSetName = 'frxDBdsVerProy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdsVerProy."FECHA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 124.724490000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Versi'#243'n generada el:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBdsUsuarios: TfrxDBDataset
    UserName = 'frxDBdsUsuarios'
    CloseDataSource = False
    DataSource = dmDatos.dsRepoUsuarios
    BCDToCurrency = False
    Left = 800
    Top = 40
  end
  object frxDBdsPedidosEspera: TfrxDBDataset
    UserName = 'frxDBdsPedidosEspera'
    CloseDataSource = False
    DataSource = dmDatos.dsRepoPedidosEspera
    BCDToCurrency = False
    Left = 800
    Top = 112
  end
  object frxDBdsProyectos: TfrxDBDataset
    UserName = 'frxDBdsProyectos'
    CloseDataSource = False
    DataSource = dmDatos.dsRepoProyectos
    BCDToCurrency = False
    Left = 800
    Top = 240
  end
  object frxDBdsPedidosAtend: TfrxDBDataset
    UserName = 'frxDBdsPedidosAtend'
    CloseDataSource = False
    DataSource = dmDatos.dsRepoPedidosAtend
    BCDToCurrency = False
    Left = 800
    Top = 168
  end
  object frxDBdsVerProy: TfrxDBDataset
    UserName = 'frxDBdsVerProy'
    CloseDataSource = False
    DataSource = dmDatos.dsRepoVerProy
    BCDToCurrency = False
    Left = 800
    Top = 304
  end
end

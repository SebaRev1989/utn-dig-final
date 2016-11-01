unit moduloDatos;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, System.ImageList, Vcl.ImgList, Vcl.Controls, Datasnap.DBClient,
  Datasnap.Provider;

type
  TdmDatos = class(TDataModule)
    conGestionSist: TSQLConnection;
    qryUsuarios: TSQLQuery;
    ilIconos: TImageList;
    qryRol: TSQLQuery;
    spAltaPersona: TSQLStoredProc;
    qryConsultas: TSQLQuery;
    ilIconosChicos: TImageList;
    spAltaPedido: TSQLStoredProc;
    qryPedidosEspera: TSQLQuery;
    qryPedidosAtendidos: TSQLQuery;
    dsPedidosEspera: TDataSource;
    dsPedidosAtendidos: TDataSource;
    dspPedidosEspera: TDataSetProvider;
    cdsPedidosEspera: TClientDataSet;
    dspPedidosAtendidos: TDataSetProvider;
    cdsPedidosAtendidos: TClientDataSet;
    spAtenderPedido: TSQLStoredProc;
    qryProyectos: TSQLQuery;
    dspProyectos: TDataSetProvider;
    cdsProyectos: TClientDataSet;
    dsProyectos: TDataSource;
    spAltaProyecto: TSQLStoredProc;
    spAltaVersionProy: TSQLStoredProc;
    spActualizarProyecto: TSQLStoredProc;
    spBajaPedido: TSQLStoredProc;
    spBajaProyecto: TSQLStoredProc;
    spModifContrasena: TSQLStoredProc;
    spModifRol: TSQLStoredProc;
    qryRepoUsuarios: TSQLQuery;
    qryRepoPedidosEspera: TSQLQuery;
    qryRepoProyectos: TSQLQuery;
    dsRepoUsuarios: TDataSource;
    dsRepoPedidosEspera: TDataSource;
    dsRepoProyectos: TDataSource;
    qryRepoPedidosAtend: TSQLQuery;
    dsRepoPedidosAtend: TDataSource;
    qryRepoVerProy: TSQLQuery;
    dsRepoVerProy: TDataSource;
    procedure cdsPedidosEsperaAfterScroll(DataSet: TDataSet);
    procedure cdsPedidosAtendidosAfterScroll(DataSet: TDataSet);
    procedure cdsProyectosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses formPedidos, formProyectos;

{$R *.dfm}

procedure TdmDatos.cdsPedidosAtendidosAfterScroll(DataSet: TDataSet);
begin
  qryConsultas.Close;
  qryConsultas.SQL.Text := 'SELECT pedido.descripcion AS descripcion FROM pedido'
    + ' WHERE pedido.id = ' + frmPedidos.dbgrdPedidosAtendidos.Fields[3].AsString;
  qryConsultas.Open;

  frmPedidos.mmoDetalle.Clear;
  frmPedidos.mmoDetalle.Text := qryConsultas.FieldByName('descripcion').AsString;
end;

procedure TdmDatos.cdsPedidosEsperaAfterScroll(DataSet: TDataSet);
begin
  qryConsultas.Close;
  qryConsultas.SQL.Text := 'SELECT pedido.descripcion AS descripcion FROM pedido'
    + ' WHERE pedido.id = ' + frmPedidos.dbgrdPedidosEspera.Fields[3].AsString;
  qryConsultas.Open;

  frmPedidos.mmoDetalle.Clear;
  frmPedidos.mmoDetalle.Text := qryConsultas.FieldByName('descripcion').AsString;
end;

procedure TdmDatos.cdsProyectosAfterScroll(DataSet: TDataSet);
begin
  qryConsultas.Close;
  qryConsultas.SQL.Text := 'SELECT proyecto.descripcion AS descripcion FROM proyecto'
    + ' WHERE proyecto.id = ' + frmProyectos.dbgrdProyectos.Fields[5].AsString;
  qryConsultas.Open;

  frmProyectos.mmoDetalle.Clear;
  frmProyectos.mmoDetalle.Text := qryConsultas.FieldByName('descripcion').AsString;
end;

end.

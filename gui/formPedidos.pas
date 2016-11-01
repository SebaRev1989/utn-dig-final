unit formPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Menus;

type
  TfrmPedidos = class(TForm)
    lblUsuario: TLabel;
    btnCerrar: TButton;
    lblTitulo: TLabel;
    pgcPedidos: TPageControl;
    tsNuevoPedido: TTabSheet;
    tsListarPedidos: TTabSheet;
    lblPedido: TLabel;
    mmoAyuda: TMemo;
    mmoDescripcion: TMemo;
    lblcontador: TLabel;
    btnNuevoPedido: TButton;
    edtNombrePedido: TEdit;
    lblNombrePedido: TLabel;
    dbgrdPedidosEspera: TDBGrid;
    dbgrdPedidosAtendidos: TDBGrid;
    mmoDetalle: TMemo;
    lblPedidosEspera: TLabel;
    lblPedidosAtendidos: TLabel;
    lblDetalle: TLabel;
    ppmOpciones: TPopupMenu;
    mniAtenderPedido: TMenuItem;
    mniEliminarPedido: TMenuItem;
    procedure btnCerrarClick(Sender: TObject);
    procedure mmoDescripcionChange(Sender: TObject);
    procedure btnNuevoPedidoClick(Sender: TObject);
    procedure tsListarPedidosShow(Sender: TObject);
    procedure dbgrdPedidosEsperaDblClick(Sender: TObject);
    procedure mostrarPedidos(Sender: TObject);
    procedure mniAtenderPedidoClick(Sender: TObject);
    procedure mniEliminarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses moduloDatos, formPrincipal, RutinasCompartidas;

procedure TfrmPedidos.btnCerrarClick(Sender: TObject);
begin
  mmoDescripcion.Clear;
  Close;
end;

procedure TfrmPedidos.btnNuevoPedidoClick(Sender: TObject);
var
  descripcion : string;
begin
  descripcion := Trim(mmoDescripcion.Lines.Text);
  if ((Length(descripcion) = 0) or (edtNombrePedido.Text = '')) then
  begin
    Application.MessageBox('El nombre y la descripción del pedido no pueden estar vacíos.',
      'ERROR', MB_OK + MB_ICONSTOP);

    if edtNombrePedido.Text = ''
    then edtNombrePedido.SetFocus
    else mmoAyuda.SetFocus;
  end
  else
  begin
    with dmDatos do
    begin
      if not conGestionSist.Connected then conGestionSist.Open;
      spAltaPedido.ParamByName('P_NOMBRE_PEDIDO').AsString := Trim(edtNombrePedido.Text);
      spAltaPedido.ParamByName('P_USUARIO_SOLICITUD').AsString := usuarioConectado;
      spAltaPedido.ParamByName('P_DESCRIPCION').AsString := Trim(mmoDescripcion.Lines.Text);
      spAltaPedido.ExecProc;

      ShowMessage(spAltaPedido.ParamByName('P_MENSAJE').AsString);

      edtNombrePedido.Clear;
      mmoDescripcion.Clear;
      tsListarPedidos.Show;
    end;
  end;
end;

procedure TfrmPedidos.dbgrdPedidosEsperaDblClick(Sender: TObject);
begin
  ppmOpciones.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmPedidos.mmoDescripcionChange(Sender: TObject);
begin
  lblcontador.Caption := 'Caracteres restantes: '
    + IntToStr(1000 - Length(mmoDescripcion.Text));

  if (Length(mmoDescripcion.Text) >= 950)
  then lblcontador.Font.Color := clRed
  else lblcontador.Font.Color := clBlack;

  if (Length(mmoDescripcion.Text) = 1000)
  then Application.MessageBox('Alcanzó el límite de caracteres.' + #13#10 +
          'Recuerde que solo se registrarán los primeros 1000 caracteres.',
          'ADVERTENCIA', MB_OK + MB_ICONWARNING);
end;

procedure TfrmPedidos.mniAtenderPedidoClick(Sender: TObject);
begin
  case Application.MessageBox('Desea atender el pedido?', 'ATENCION',
    MB_OKCANCEL + MB_ICONWARNING) of
    IDOK:
      begin
        with dmDatos do
        begin
          qryConsultas.Close;
          qryConsultas.SQL.Text := 'SELECT rol.rol AS rol FROM rol WHERE rol.id = '
            + '(SELECT persona.id_rol FROM persona WHERE persona.usuario = '
            + QuotedStr(usuarioConectado) + ')';
          qryConsultas.Open;

          if qryConsultas.FieldByName('rol').AsString = 'DESARROLLADOR' then
          begin
            spAtenderPedido.ParamByName('P_USUARIO').AsString := usuarioConectado;
            spAtenderPedido.ParamByName('P_ID_PEDIDO').AsInteger
              := dbgrdPedidosEspera.Fields[3].AsInteger;
            spAtenderPedido.ExecProc;
            ShowMessage(spAtenderPedido.ParamByName('P_MENSAJE').AsString);
            mostrarPedidos(Self);
          end
          else
          begin
            Application.MessageBox('Solo los desarrolladores pueden atender los pedidos.',
              'ERROR', MB_OK + MB_ICONSTOP);
          end;
        end;
      end;
    IDCANCEL:
      begin
        dbgrdPedidosEspera.SetFocus;
      end;
  end;
end;

procedure TfrmPedidos.mniEliminarPedidoClick(Sender: TObject);
begin
case Application.MessageBox('¿Desea eliminar el pedido?' + #13#10 +
  'Esta operación no puede revertirse.', 'ATENCION', MB_YESNO +
  MB_ICONWARNING) of
  IDYES:
    begin
      with dmDatos do
        begin
          qryConsultas.Close;
          qryConsultas.SQL.Text := 'SELECT rol.rol AS rol FROM rol WHERE rol.id = '
            + '(SELECT persona.id_rol FROM persona WHERE persona.usuario = '
            + QuotedStr(usuarioConectado) + ')';
          qryConsultas.Open;

          if qryConsultas.FieldByName('rol').AsString = 'DESARROLLADOR' then
          begin
            spBajaPedido.ParamByName('P_PEDIDO').AsString := dbgrdPedidosEspera.Fields[1].AsString;
            spBajaPedido.ExecProc;
            ShowMessage(spBajaPedido.ParamByName('P_MENSAJE').AsString);
            mostrarPedidos(Self);
          end
          else
          begin
            qryConsultas.Close;
            qryConsultas.SQL.Text := 'SELECT persona.usuario AS usuario FROM persona '
              + ' WHERE persona.id = (SELECT pedido.id_persona_solic FROM pedido WHERE '
              + ' pedido.id = ' + IntToStr(dbgrdPedidosEspera.Fields[3].AsInteger) + ')';
            qryConsultas.Open;

            if qryConsultas.FieldByName('usuario').AsString = formPrincipal.usuarioConectado then
            begin
              spBajaPedido.ParamByName('P_PEDIDO').AsString := dbgrdPedidosEspera.Fields[1].AsString;
              spBajaPedido.ExecProc;
              ShowMessage(spBajaPedido.ParamByName('P_MENSAJE').AsString);
              mostrarPedidos(Self);
            end
            else
            begin
              Application.MessageBox('Solo los desarrolladores y los usuarios que '
                + 'crearon el pedido pueden eliminarlos.', 'ERROR', MB_OK + MB_ICONSTOP);
            end;
          end;
        end;
    end;
  IDNO:
    begin
      dbgrdPedidosEspera.SetFocus;
    end;
end;

end;

procedure TfrmPedidos.tsListarPedidosShow(Sender: TObject);
begin
  mostrarPedidos(Self);
end;

procedure TfrmPedidos.mostrarPedidos(Sender: TObject);
begin
  with dmDatos do
  begin
    if not conGestionSist.Connected then conGestionSist.Open;
    cdsPedidosEspera.Close;
    qryPedidosEspera.Close;
    qryPedidosEspera.Open;
    if qryPedidosEspera.RecordCount <> 0
    then cdsPedidosEspera.Open;

    cdsPedidosAtendidos.Close;
    qryPedidosAtendidos.Close;
    qryPedidosAtendidos.Open;
    if qryPedidosAtendidos.RecordCount <> 0
    then cdsPedidosAtendidos.Open;
  end;
  dbgrdPedidosEspera.Refresh;
  dbgrdPedidosEspera.Columns[3].Visible := False;
  dbgrdPedidosEspera.Refresh;
  dbgrdPedidosAtendidos.Columns[3].Visible := False;
end;

end.

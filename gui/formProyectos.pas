unit formProyectos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TfrmProyectos = class(TForm)
    btnCerrar: TButton;
    lblUsuario: TLabel;
    pgcProyectos: TPageControl;
    tsNuevoProyecto: TTabSheet;
    tsListarProyectos: TTabSheet;
    lblTitulo: TLabel;
    dbgrdProyectos: TDBGrid;
    mmoDetalle: TMemo;
    lblDetalle: TLabel;
    edtNombreProyecto: TEdit;
    lblNombreProyecto: TLabel;
    cbbEstadoSoft: TComboBox;
    lblEstadoSoftware: TLabel;
    mmoDescripcion: TMemo;
    lblProyecto: TLabel;
    btnNuevoProyecto: TButton;
    lblContador: TLabel;
    mmoAyuda: TMemo;
    lblFecha: TLabel;
    dtpFecha: TDateTimePicker;
    ppmOpciones: TPopupMenu;
    mniEliminarProy: TMenuItem;
    mniGenerarVerProy: TMenuItem;
    procedure btnCerrarClick(Sender: TObject);
    procedure mostrarProyectos(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmoDescripcionChange(Sender: TObject);
    procedure btnNuevoProyectoClick(Sender: TObject);
    procedure dbgrdProyectosDblClick(Sender: TObject);
    procedure tsListarProyectosShow(Sender: TObject);
    procedure mniGenerarVerProyClick(Sender: TObject);
    procedure mniEliminarProyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProyectos: TfrmProyectos;

implementation

{$R *.dfm}

uses moduloDatos, formPrincipal, formVersionProy;

procedure TfrmProyectos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProyectos.btnNuevoProyectoClick(Sender: TObject);
var
  descripcion : string;
begin
  descripcion := Trim(mmoDescripcion.Lines.Text);
  if ((Length(descripcion) = 0) or (edtNombreProyecto.Text = '')) then
  begin
    Application.MessageBox('El nombre y la descripción del pedido no pueden estar vacíos.',
      'ERROR', MB_OK + MB_ICONSTOP);

    if edtNombreProyecto.Text = ''
    then edtNombreProyecto.SetFocus
    else mmoAyuda.SetFocus;
  end
  else
  begin
    with dmDatos do
    begin
      if not conGestionSist.Connected then conGestionSist.Open;

      qryConsultas.Close;
      qryConsultas.SQL.Text := 'SELECT rol.rol AS rol FROM rol WHERE rol.id = '
        + '(SELECT persona.id_rol FROM persona WHERE persona.usuario = '
        + QuotedStr(usuarioConectado) + ')';
      qryConsultas.Open;

      if qryConsultas.FieldByName('rol').AsString = 'DESARROLLADOR' then
      begin
        spAltaProyecto.ParamByName('P_USUARIO').AsString := usuarioConectado;
        spAltaProyecto.ParamByName('P_ESTADO_SOFT').AsString :=
          cbbEstadoSoft.Items[cbbEstadoSoft.ItemIndex];
        spAltaProyecto.ParamByName('P_NOMBRE').AsString := Trim(edtNombreProyecto.Text);
        spAltaProyecto.ParamByName('P_DESCRIPCION').AsString := descripcion;
        spAltaProyecto.ParamByName('P_FECHA_INICIO').AsDate := dtpFecha.Date;
        spAltaProyecto.ExecProc;

        ShowMessage(spAltaProyecto.ParamByName('P_MENSAJE').AsString);

        spAltaVersionProy.ParamByName('P_PROYECTO').AsString := Trim(edtNombreProyecto.Text);
        spAltaVersionProy.ParamByName('P_VERSION_MAYOR').AsInteger := 0;
        spAltaVersionProy.ParamByName('P_VERSION_MENOR').AsInteger := 1;
        spAltaVersionProy.ParamByName('P_USUARIO').AsString := usuarioConectado;

        ShowMessage(spAltaVersionProy.ParamByName('P_MENSAJE').AsString);

        edtNombreProyecto.Clear;
        mmoDescripcion.Clear;
        tsListarProyectos.Show;
      end
      else
      begin
        Application.MessageBox('Solo los desarrolladores pueden crear proyectos.',
          'ERROR', MB_OK + MB_ICONSTOP);
        edtNombreProyecto.Clear;
        mmoDescripcion.Clear;
        tsListarProyectos.Show;
      end;
    end;
  end;
end;

procedure TfrmProyectos.dbgrdProyectosDblClick(Sender: TObject);
begin
  ppmOpciones.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmProyectos.FormShow(Sender: TObject);
begin
  dtpFecha.Date := Now;
  cbbEstadoSoft.Clear;
  with dmDatos do
  begin
    if not (conGestionSist.Connected)
    then conGestionSist.Open;

    qryConsultas.Close;
    qryConsultas.SQL.Text := 'SELECT estado_soft.estado_soft FROM estado_soft';
    qryConsultas.Open;

    while not (qryConsultas.Eof) do
    begin
      cbbEstadoSoft.Items.Add(qryConsultas.Fields.Fields[0].AsString);
      qryConsultas.Next;
    end;

    qryConsultas.Close;
    cbbEstadoSoft.ItemIndex := 0;
  end;
end;

procedure TfrmProyectos.mmoDescripcionChange(Sender: TObject);
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

procedure TfrmProyectos.mniEliminarProyClick(Sender: TObject);
begin
  case Application.MessageBox('¿Está seguro que desea eliminar este proyecto?'
    + #13#10 + 'Este cambio no se puede deshacer.', 'ADVERTENCIA', MB_YESNO +
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
            spBajaProyecto.ParamByName('P_PROYECTO').AsString := dbgrdProyectos.Fields[0].AsString;
            spBajaProyecto.ExecProc;
            ShowMessage(spBajaProyecto.ParamByName('P_MENSAJE').AsString);
            mostrarProyectos(Self);
          end
          else
          begin
            Application.MessageBox('Solo los desarrolladores pueden generar versiones de los proyectos.',
              'ERROR', MB_OK + MB_ICONSTOP);
            dbgrdProyectos.SetFocus;
          end;
        end;
      end;
    IDNO:
      begin
        ShowMessage('Eliminación cancelada.');
        dbgrdProyectos.SetFocus;
      end;
  end;

end;

procedure TfrmProyectos.mniGenerarVerProyClick(Sender: TObject);
begin
  case
    Application.MessageBox('¿Desea generar una nueva versión de este proyecto?',
    'ATENCION', MB_YESNO + MB_ICONWARNING) of
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
            frmVersionProy.Parent := frmPrincipal.pnlVentanas;
            frmVersionProy.Align := alClient;
            frmVersionProy.BorderIcons := [];
            frmVersionProy.BorderStyle := bsNone;
            frmVersionProy.lblProyecto.Caption := dbgrdProyectos.Fields[0].AsString;
            frmVersionProy.Show;
          end
          else
          begin
            Application.MessageBox('Solo los desarrolladores pueden generar versiones de los proyectos.',
              'ERROR', MB_OK + MB_ICONSTOP);
            dbgrdProyectos.SetFocus;
          end;
        end;
      end;
    IDNO:
      begin
        dbgrdProyectos.SetFocus;
      end;
  end;
end;

procedure TfrmProyectos.mostrarProyectos(Sender: TObject);
begin
  with dmDatos do
  begin
    if not conGestionSist.Connected then conGestionSist.Open;
    cdsProyectos.Close;
    qryProyectos.Close;
    qryProyectos.Open;
    if qryProyectos.RecordCount <> 0 
    then cdsProyectos.Open;
  end;
  dbgrdProyectos.Refresh;
  dbgrdProyectos.Columns[5].Visible := False;
end;

procedure TfrmProyectos.tsListarProyectosShow(Sender: TObject);
begin
  mostrarProyectos(Self);
end;

end.

unit formVersionProy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmVersionProy = class(TForm)
    lblTitulo: TLabel;
    btnCerrar: TButton;
    lblUsuario: TLabel;
    lblProyecto: TLabel;
    lblEstadoSoftware: TLabel;
    cbbEstadoSoft: TComboBox;
    edtVersionMay: TEdit;
    edtVersionMen: TEdit;
    lblVersionMay: TLabel;
    lblVersionMen: TLabel;
    lblInfo: TLabel;
    btnActualizar: TButton;
    btnCancelar: TButton;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function verificarNumero(cadena: string): Boolean;
    procedure edtVersionMayExit(Sender: TObject);
    procedure edtVersionMenExit(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersionProy: TfrmVersionProy;
  versionMayor, versionMenor : Integer;

implementation

{$R *.dfm}

uses moduloDatos, formProyectos, formPrincipal;

procedure TfrmVersionProy.btnActualizarClick(Sender: TObject);
begin
  if ((cbbEstadoSoft.Items[cbbEstadoSoft.ItemIndex] = frmProyectos.dbgrdProyectos.Fields[4].AsString)
      and (StrToInt(Trim(edtVersionMay.Text)) = versionMayor)
      and (StrToInt(Trim(edtVersionMen.Text)) = versionMenor))
  then
  begin
    case
      Application.MessageBox('No se realizaron modificaciones en el proyecto.'
      + #13#10 + '¿Desea volver y realizar las modificaciones?', 'ERROR',
      MB_YESNO + MB_ICONSTOP) of
      IDYES:
        begin
          cbbEstadoSoft.SetFocus;
        end;
      IDNO:
        begin
          btnCerrarClick(Self);
        end;
    end;
  end
  else
  begin
    if (StrToInt(Trim(edtVersionMay.Text)) < versionMayor) then
    begin
      Application.MessageBox('Las versión mayor es inferior a la última registrada.'
        + #13#10 + 'Por favor modifique ese valor.', 'ERROR', MB_OK +
        MB_ICONSTOP);
      edtVersionMay.Text := IntToStr(versionMayor);
      edtVersionMay.SetFocus;
    end
    else
    begin
      if ((StrToInt(Trim(edtVersionMay.Text)) = versionMayor)
          and (StrToInt(Trim(edtVersionMen.Text)) < versionMenor))
      then
      begin
        Application.MessageBox('Las versión menor es inferior a la última registrada.'
          + #13#10 + 'Por favor modifique ese valor.', 'ERROR', MB_OK +
          MB_ICONSTOP);
        edtVersionMen.Text := IntToStr(versionMenor);
        edtVersionMen.SetFocus;
      end
      else
      begin
        with dmDatos do
        begin
          spAltaVersionProy.ParamByName('P_PROYECTO').AsString := lblProyecto.Caption;
          spAltaVersionProy.ParamByName('P_VERSION_MAYOR').AsInteger := StrToInt(Trim(edtVersionMay.Text));
          spAltaVersionProy.ParamByName('P_VERSION_MENOR').AsInteger := StrToInt(Trim(edtVersionMen.Text));
          spAltaVersionProy.ParamByName('P_USUARIO').AsString := usuarioConectado;
          spAltaVersionProy.ExecProc;

          ShowMessage(spAltaVersionProy.ParamByName('P_MENSAJE').AsString);

          spActualizarProyecto.ParamByName('P_PROYECTO').AsString := lblProyecto.Caption;
          spActualizarProyecto.ParamByName('P_ESTADO_SOFT').AsString :=
            cbbEstadoSoft.Items[cbbEstadoSoft.ItemIndex];
          spActualizarProyecto.ExecProc;

          ShowMessage(spActualizarProyecto.ParamByName('P_MENSAJE').AsString);

          btnCerrarClick(Self);
        end;
      end;
    end;
  end;
end;

procedure TfrmVersionProy.btnCancelarClick(Sender: TObject);
begin
  btnCerrarClick(Self);
end;

procedure TfrmVersionProy.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVersionProy.edtVersionMayExit(Sender: TObject);
begin
  if (Length(Trim(edtVersionMay.Text)) <> 0) then
  begin
    if not verificarNumero(edtVersionMay.Text) then
    begin
      Application.MessageBox('Las versiones solo pueden contener números.',
        'ERROR', MB_OK + MB_ICONSTOP);
      edtVersionMay.SetFocus;
    end;
  end;
end;

procedure TfrmVersionProy.edtVersionMenExit(Sender: TObject);
begin
  if (Length(Trim(edtVersionMen.Text)) <> 0) then
  begin
    if not verificarNumero(edtVersionMen.Text) then
    begin
      Application.MessageBox('Las versiones solo pueden contener números.',
        'ERROR', MB_OK + MB_ICONSTOP);
      edtVersionMen.SetFocus;
    end;
  end;
end;

procedure TfrmVersionProy.FormShow(Sender: TObject);
begin
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

    cbbEstadoSoft.ItemIndex := cbbEstadoSoft.Items.IndexOf(frmProyectos.dbgrdProyectos.Fields[4].AsString);

    qryConsultas.Close;
    qryConsultas.SQL.Text  := 'SELECT FIRST 1 (version_proy.version_mayor) AS verMay FROM version_proy '
      + ' WHERE version_proy.id_proyecto = ' + IntToStr(frmProyectos.dbgrdProyectos.Fields[5].AsInteger)
      + ' ORDER BY version_proy.fecha_actualizacion DESC';
    qryConsultas.Open;

    versionMayor := qryConsultas.FieldByName('verMay').AsInteger;
    edtVersionMay.Text := IntToStr(versionMayor);

    qryConsultas.Close;
    qryConsultas.SQL.Text  := 'SELECT FIRST 1 (version_proy.version_menor) AS verMen FROM version_proy '
      + ' WHERE version_proy.id_proyecto = ' + IntToStr(frmProyectos.dbgrdProyectos.Fields[5].AsInteger)
      + ' ORDER BY version_proy.fecha_actualizacion DESC';
    qryConsultas.Open;

    versionMenor := qryConsultas.FieldByName('verMen').AsInteger;
    edtVersionMen.Text := IntToStr(versionMenor);

    qryConsultas.Close;
  end;
end;

function TfrmVersionProy.verificarNumero(cadena: string): Boolean;
var
  soloNum : Boolean;
  I: Integer;
begin
  soloNum := True;

  for I := 1 to Length(cadena)
  do soloNum := soloNum and (CharInSet(cadena[I], ['0'..'9']));

  Result := soloNum;
end;

end.

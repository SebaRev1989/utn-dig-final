unit formIngresar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmIngresar = class(TForm)
    cbbUsuarios: TComboBox;
    lbledtContrasena: TLabeledEdit;
    btnIngresar: TButton;
    btnCancelar: TButton;
    lblTitulo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIngresarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIngresar: TfrmIngresar;

implementation

{$R *.dfm}

uses moduloDatos, formPrincipal;

procedure TfrmIngresar.btnCancelarClick(Sender: TObject);
begin
  lbledtContrasena.Clear;
  cbbUsuarios.ItemIndex := -1;
  Close;
end;

procedure TfrmIngresar.btnIngresarClick(Sender: TObject);
begin
  if lbledtContrasena.Text = '' then
  begin
    Application.MessageBox('No ingresó la contraseña.', 'ERROR', MB_OK +
      MB_ICONSTOP);

    lbledtContrasena.SetFocus;
  end
  else
  begin
    with dmDatos do
    begin
      if not conGestionSist.Connected
      then conGestionSist.Open;

      qryConsultas.Close;
      qryConsultas.SQL.Text := 'SELECT persona.contrasena AS contrasena FROM persona '
        + ' WHERE (persona.usuario = ' + QuotedStr(cbbUsuarios.Items[cbbUsuarios.ItemIndex]) + ')';
      qryConsultas.Open;

      if lbledtContrasena.Text = qryConsultas.FieldByName('contrasena').AsString then
      begin
        Application.MessageBox('Ingreso correcto.' + #13#10 + 'Bienvenido.',
          '', MB_OK + MB_ICONINFORMATION);

        qryConsultas.Close;
        qryConsultas.SQL.Text := 'SELECT persona.apellido AS apellido, persona.nombre AS nombre '
          + ' FROM persona WHERE (persona.usuario = ' + QuotedStr(cbbUsuarios.Items[cbbUsuarios.ItemIndex])
          + ')';
        qryConsultas.Open;

        with frmPrincipal do
        begin
          usuarioConectado := cbbUsuarios.Items[cbbUsuarios.ItemIndex];
          apellidoConectado := qryConsultas.FieldByName('apellido').AsString;
          nombreConectado := qryConsultas.FieldByName('nombre').AsString;
          conectar(Self);
        end;

        cbbUsuarios.ItemIndex := -1;
        lbledtContrasena.Clear;

        Close;
      end
      else
      begin
        Application.MessageBox('Contraseña incorrecta.' + #13#10 +
          'Intente nuevamente.', 'ERROR', MB_OK + MB_ICONSTOP);

        lbledtContrasena.Clear;
        lbledtContrasena.SetFocus;
      end;

      qryConsultas.Close;
    end;
  end;
end;

procedure TfrmIngresar.FormShow(Sender: TObject);
begin
  cbbUsuarios.Clear;
  cbbUsuarios.Text := 'Seleccione su usuario...';
  with dmDatos do
  begin
    if not (conGestionSist.Connected)
    then conGestionSist.Open;

    qryUsuarios.Open;

    while not qryUsuarios.Eof do
    begin
      cbbUsuarios.Items.Add(qryUsuarios.Fields.Fields[0].AsString);
      qryUsuarios.Next;
    end;

    qryUsuarios.Close;
  end;
  cbbUsuarios.SetFocus;
end;

end.

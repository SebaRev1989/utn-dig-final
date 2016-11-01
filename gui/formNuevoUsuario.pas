unit formNuevoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmNuevoUsuario = class(TForm)
    lblTitulo: TLabel;
    btnCancelar: TButton;
    lbledtApellido: TLabeledEdit;
    lbledtNombre: TLabeledEdit;
    lbledtContacto: TLabeledEdit;
    lbledtUsuario: TLabeledEdit;
    lbledtContrasena: TLabeledEdit;
    cbbRol: TComboBox;
    btnAceptar: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    mmoAyuda: TMemo;
    lbledtVerifContrasena: TLabeledEdit;
    lbl6: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    function verificarCampos(Sender: TObject) : Boolean;
    procedure limpiarCampos(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNuevoUsuario: TfrmNuevoUsuario;

implementation

{$R *.dfm}

uses moduloDatos, formIngresar;

procedure TfrmNuevoUsuario.btnAceptarClick(Sender: TObject);
begin
  if ((lbledtApellido.Text = '') or (lbledtNombre.Text = '')
    or (lbledtUsuario.Text = '') or (lbledtContrasena.Text = '')
    or (cbbRol.ItemIndex = -1) or (lbledtVerifContrasena.Text = ''))
  then Application.MessageBox('No completó todos los campos obligatorios.',
          'ERROR', MB_OK + MB_ICONSTOP)
  else
  begin
    if verificarCampos(Self) then
    begin
      if lbledtContrasena.Text = lbledtVerifContrasena.Text then
      begin
        with dmDatos do
        begin
          if not conGestionSist.Connected then conGestionSist.Open;
          spAltaPersona.ParamByName('P_APELLIDO').AsString := Trim(lbledtApellido.Text);
          spAltaPersona.ParamByName('P_NOMBRE').AsString := Trim(lbledtNombre.Text);
          spAltaPersona.ParamByName('P_ROL').AsString := cbbRol.Items[cbbRol.ItemIndex];

          if lbledtContacto.Text <> ''
          then spAltaPersona.ParamByName('P_CONTACTO').AsString := Trim(lbledtContacto.Text);

          spAltaPersona.ParamByName('P_USUARIO').AsString := Trim(lbledtUsuario.Text);
          spAltaPersona.ParamByName('P_CONTRASENA').AsString := Trim(lbledtContrasena.Text);

          spAltaPersona.ExecProc;
          ShowMessage(spAltaPersona.ParamByName('P_MENSAJE').AsString);
          limpiarCampos(Self);
          Close;
        end;
      end
      else
      begin
        Application.MessageBox('Las contraseñas no coinciden.', 'ERROR', MB_OK +
          MB_ICONSTOP);

        lbledtContrasena.Clear;
        lbledtVerifContrasena.Clear;
        lbledtContrasena.SetFocus;
      end;
    end
    else Application.MessageBox('Corrija los campos erroneos e intente nuevamente.',
            'ATENCION', MB_OK + MB_ICONWARNING);
  end;
end;

procedure TfrmNuevoUsuario.btnCancelarClick(Sender: TObject);
begin
  cbbRol.ItemIndex := -1;
  lbledtApellido.Clear;
  lbledtNombre.Clear;
  lbledtUsuario.Clear;
  lbledtContrasena.Clear;
  lbledtVerifContrasena.Clear;
  lbledtContacto.Clear;
  Close;
end;

procedure TfrmNuevoUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  limpiarCampos(Self);
end;

procedure TfrmNuevoUsuario.FormShow(Sender: TObject);
begin
  cbbRol.Clear;
  cbbRol.Text := 'Seleccione su rol...';
  with dmDatos do
  begin
    if not (conGestionSist.Connected)
    then conGestionSist.Open;

    qryRol.Open;

    while not qryRol.Eof do
    begin
      cbbRol.Items.Add(qryRol.Fields.Fields[0].AsString);
      qryRol.Next;
    end;

    qryRol.Close;
  end;
end;

function TfrmNuevoUsuario.verificarCampos(Sender: TObject) : Boolean;
var
  apellidoOK, nombreOK, usuarioOK, contrasenaOK, contactoOK : Boolean;
  I: Integer;
begin
  apellidoOK := True;
  nombreOK := True;
  usuarioOK := True;
  contrasenaOK := True;
  contactoOK := True;

  for I := 1 to Length(lbledtApellido.Text)
  do apellidoOK := apellidoOK and not (CharInSet(lbledtApellido.Text[I], ['0'..'9','-','/','\','*','@']));

  if not apellidoOK
  then Application.MessageBox('El apellido tiene caracteres inválidos.',
         'ERROR', MB_OK + MB_ICONSTOP);

  for I := 1 to Length(lbledtNombre.Text)
  do nombreOK := nombreOK and not (CharInSet(lbledtNombre.Text[I], ['0'..'9','-','/','\','*','@']));

  if not apellidoOK
  then Application.MessageBox('El nombre tiene caracteres inválidos.',
         'ERROR', MB_OK + MB_ICONSTOP);

  for I := 1 to Length(lbledtUsuario.Text)
  do usuarioOK := usuarioOK and not (CharInSet(lbledtUsuario.Text[I], ['-','/','\','*',' ']));

  if not apellidoOK
  then Application.MessageBox('El nombre de usuario tiene caracteres inválidos.',
         'ERROR', MB_OK + MB_ICONSTOP);

  for I := 1 to Length(lbledtContrasena.Text)
  do contrasenaOK := contrasenaOK and not (CharInSet(lbledtContrasena.Text[I], ['-','/','\','*']));

  if not apellidoOK
  then Application.MessageBox('La contraseña tiene caracteres inválidos.',
         'ERROR', MB_OK + MB_ICONSTOP);

  for I := 1 to Length(lbledtContacto.Text)
  do contactoOK := contactoOK and not (CharInSet(lbledtContacto.Text[I], ['-','/','\','*']));

  if not apellidoOK
  then Application.MessageBox('El contacto tiene caracteres inválidos.',
         'ERROR', MB_OK + MB_ICONSTOP);

  Result := apellidoOK and nombreOK and usuarioOK and contrasenaOK and contactoOK
end;

procedure TfrmNuevoUsuario.limpiarCampos(Sender: TObject);
begin
  lbledtApellido.Text := '';
  lbledtNombre.Text := '';
  cbbRol.ItemIndex := -1;
  lbledtContacto.Text := '';
  lbledtUsuario.Text := '';
  lbledtContrasena.Text := '';
  lbledtVerifContrasena.Text := '';
end;

end.

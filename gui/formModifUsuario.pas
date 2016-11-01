unit formModifUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmModifUsuario = class(TForm)
    btnCerrar: TButton;
    lblTitulo: TLabel;
    lblUsuario: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    btnRol: TButton;
    btnPassword: TButton;
    lbledtContrasena: TLabeledEdit;
    lbledtVerifContrasena: TLabeledEdit;
    cbbRol: TComboBox;
    lblRol: TLabel;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnRolClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPasswordClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModifUsuario: TfrmModifUsuario;

implementation

{$R *.dfm}

uses formPrincipal, moduloDatos;

procedure TfrmModifUsuario.btnCancelarClick(Sender: TObject);
begin
  btnCerrarClick(Self);
end;

procedure TfrmModifUsuario.btnCerrarClick(Sender: TObject);
begin
  btnConfirmar.Enabled := False;
  lbledtContrasena.Visible := False;
  lbledtVerifContrasena.Visible := False;
  lblRol.Visible := False;
  cbbRol.Visible := False;
  Close;
end;

procedure TfrmModifUsuario.btnConfirmarClick(Sender: TObject);
begin
  case Application.MessageBox('¿Desea modificar sus datos?', 'ATENCION',
    MB_YESNO + MB_ICONWARNING) of
    IDYES:
      begin
        if cbbRol.Visible then
        begin
          with dmDatos do
          begin
            spModifRol.ParamByName('P_USUARIO').AsString := usuarioConectado;
            spModifRol.ParamByName('P_ROL').AsString := cbbRol.Items[cbbRol.ItemIndex];
            spModifRol.ExecProc;
            ShowMessage(spModifRol.ParamByName('P_MENSAJE').AsString);
            btnCerrarClick(Self);
          end;
        end
        else
        begin
          if Trim(lbledtContrasena.Text) = Trim(lbledtVerifContrasena.Text) then
          begin
            with dmDatos do
            begin
              spModifContrasena.ParamByName('P_USUARIO').AsString := usuarioConectado;
              spModifContrasena.ParamByName('P_CONTRASENA').AsString
                := lbledtContrasena.Text;
              spModifContrasena.ExecProc;
              ShowMessage(spModifContrasena.ParamByName('P_MENSAJE').AsString);
              btnCerrarClick(Self);
            end;
          end
          else
          begin
            case Application.MessageBox('Las contraseñas no coinciden.' +
              #13#10 + '¿Desea intentarlo nuevamente?', 'ERROR',
              MB_RETRYCANCEL + MB_ICONSTOP) of
              IDCANCEL:
                begin
                  ShowMessage('Datos sin modificaciones.');
                  btnCerrarClick(Self);
                end;
              IDRETRY:
                begin
                  lbledtContrasena.Text := '';
                  lbledtVerifContrasena.Text := '';
                  lbledtContrasena.SetFocus;
                end;
            end;
          end;
        end;
      end;
    IDNO:
      begin
        ShowMessage('Datos sin modificaciones.');
        btnCerrarClick(Self);
      end;
  end;
end;

procedure TfrmModifUsuario.btnPasswordClick(Sender: TObject);
begin
  lbledtContrasena.Visible := True;
  lbledtVerifContrasena.Visible := True;
  btnConfirmar.Enabled := True;
end;

procedure TfrmModifUsuario.btnRolClick(Sender: TObject);
begin
  lblRol.Visible := True;
  cbbRol.Visible := True;
  btnConfirmar.Enabled := True;
end;

procedure TfrmModifUsuario.FormShow(Sender: TObject);
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

end.

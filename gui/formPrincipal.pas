unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.Buttons, Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    tlbOpciones: TToolBar;
    pnlVentanas: TPanel;
    btnLogin: TButton;
    btnNuevoUsuario: TButton;
    btnProyectos: TButton;
    btnPedidos: TButton;
    btnHardware: TButton;
    btnInformes: TButton;
    btnSalir: TButton;
    lblTitulo: TLabel;
    lblUsuario: TLabel;
    btnDesconectar: TButton;
    mmOpciones: TMainMenu;
    mniUsuarios: TMenuItem;
    mniProyectos: TMenuItem;
    mniHardware: TMenuItem;
    mniInformes: TMenuItem;
    mniAcercaDe: TMenuItem;
    mniIngresar: TMenuItem;
    mniNuevoUsuario: TMenuItem;
    mniVerProyectos: TMenuItem;
    mniVerPedidos: TMenuItem;
    mniModificarDatosUser: TMenuItem;
    procedure btnSalirClick(Sender: TObject);
    procedure btnNuevoUsuarioClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDesconectarClick(Sender: TObject);
    procedure conectar(Sender: TObject);
    procedure desconectar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
    procedure btnProyectosClick(Sender: TObject);
    procedure btnHardwareClick(Sender: TObject);
    procedure btnInformesClick(Sender: TObject);
    procedure mniAcercaDeClick(Sender: TObject);
    procedure mniIngresarClick(Sender: TObject);
    procedure mniNuevoUsuarioClick(Sender: TObject);
    procedure mniVerProyectosClick(Sender: TObject);
    procedure mniVerPedidosClick(Sender: TObject);
    procedure mniHardwareClick(Sender: TObject);
    procedure mniInformesClick(Sender: TObject);
    procedure mniModificarDatosUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  usuarioConectado : string = '';
  apellidoConectado : string = '';
  nombreConectado : string = '';

implementation

{$R *.dfm}

uses formNuevoUsuario, moduloDatos, formIngresar, RutinasCompartidas,
  formPedidos, formHardware, formInformes, formProyectos, formVersionProy,
  formModifUsuario;

procedure TfrmPrincipal.btnDesconectarClick(Sender: TObject);
begin
  desconectar(Self);
end;

procedure TfrmPrincipal.btnHardwareClick(Sender: TObject);
begin
  frmHardware.Parent := pnlVentanas;
  frmHardware.Align := alClient;
  frmHardware.BorderIcons := [];
  frmHardware.BorderStyle := bsNone;
  frmHardware.Show;
end;

procedure TfrmPrincipal.btnInformesClick(Sender: TObject);
begin
  frmInformes.Parent := pnlVentanas;
  frmInformes.Align := alClient;
  frmInformes.BorderIcons := [];
  frmInformes.BorderStyle := bsNone;
  frmInformes.Show;
end;

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  frmIngresar.Parent := pnlVentanas;
  frmIngresar.Align := alClient;
  frmIngresar.BorderIcons := [];
  frmIngresar.BorderStyle := bsNone;
  frmIngresar.Show;
end;

procedure TfrmPrincipal.btnNuevoUsuarioClick(Sender: TObject);
begin
  frmNuevoUsuario.Parent := pnlVentanas;
  frmNuevoUsuario.Align := alClient;
  frmNuevoUsuario.BorderIcons := [];
  frmNuevoUsuario.BorderStyle := bsNone;
  frmNuevoUsuario.Show;
end;

procedure TfrmPrincipal.btnPedidosClick(Sender: TObject);
begin
  frmPedidos.Parent := pnlVentanas;
  frmPedidos.Align := alClient;
  frmPedidos.BorderIcons := [];
  frmPedidos.BorderStyle := bsNone;
  frmPedidos.Show;
end;

procedure TfrmPrincipal.btnProyectosClick(Sender: TObject);
begin
  frmProyectos.Parent := pnlVentanas;
  frmProyectos.Align := alClient;
  frmProyectos.BorderIcons := [];
  frmProyectos.BorderStyle := bsNone;
  frmProyectos.Show;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
  if dmDatos.conGestionSist.Connected
  then dmDatos.conGestionSist.Close;

  desconectar(Self);
  Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDatos.conGestionSist.Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.Caption := frmPrincipal.Caption + GetFileVersion();
  dmDatos.conGestionSist.Params.Values['DataBase'] := LeerIni('.\Config.ini','Parametros','camino-db');
end;

procedure TfrmPrincipal.mniAcercaDeClick(Sender: TObject);
begin
  Application.MessageBox('Desarrollador: Reverso, Sebastián.' + #13#10
    + #13#10 + 'Legajo Nro: 41.785' + #13#10 +
    'Materia: Diseño de Interfaz Gráfica.' + #13#10 + 'UTN - FRT' + #13#10 +
    '2015', 'ACERCA DE "GESTION DE SISTEMAS"', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmPrincipal.mniHardwareClick(Sender: TObject);
begin
  btnHardwareClick(Self);
end;

procedure TfrmPrincipal.mniInformesClick(Sender: TObject);
begin
  btnInformesClick(Self);
end;

procedure TfrmPrincipal.mniIngresarClick(Sender: TObject);
begin
  btnLoginClick(Self);
end;

procedure TfrmPrincipal.mniModificarDatosUserClick(Sender: TObject);
begin
  frmModifUsuario.Parent := pnlVentanas;
  frmModifUsuario.Align := alClient;
  frmModifUsuario.BorderIcons := [];
  frmModifUsuario.BorderStyle := bsNone;
  frmModifUsuario.Show;
end;

procedure TfrmPrincipal.mniNuevoUsuarioClick(Sender: TObject);
begin
  btnNuevoUsuarioClick(Self);
end;

procedure TfrmPrincipal.mniVerPedidosClick(Sender: TObject);
begin
  btnPedidosClick(Self);
end;

procedure TfrmPrincipal.mniVerProyectosClick(Sender: TObject);
begin
  btnProyectosClick(Self);
end;

procedure TfrmPrincipal.conectar(Sender: TObject);
begin
  btnProyectos.Enabled := True;
  btnPedidos.Enabled := True;
  btnHardware.Enabled := True;
  btnInformes.Enabled := True;
  btnLogin.Enabled := False;
  btnNuevoUsuario.Enabled := False;
  lblUsuario.Caption := lblUsuario.Caption + ' "' + apellidoConectado + ', '
    + nombreConectado + '"';
  lblUsuario.Left := 891 - lblUsuario.Width;
  lblUsuario.Visible := True;
  btnDesconectar.Visible := True;

  mniProyectos.Enabled := True;
  mniHardware.Enabled := True;
  mniInformes.Enabled := True;
  mniModificarDatosUser.Enabled := True;
  mniVerPedidos.Enabled := True;
  mniVerProyectos.Enabled := True;
  mniIngresar.Enabled := False;
  mniNuevoUsuario.Enabled := False;

  frmPedidos.lblUsuario.Caption := lblUsuario.Caption;
  frmPedidos.lblUsuario.Left := lblUsuario.Left;

  frmProyectos.lblUsuario.Caption := lblUsuario.Caption;
  frmProyectos.lblUsuario.Left := lblUsuario.Left;

  frmHardware.lblUsuario.Caption := lblUsuario.Caption;
  frmHardware.lblUsuario.Left := lblUsuario.Left;

  frmInformes.lblUsuario.Caption := lblUsuario.Caption;
  frmInformes.lblUsuario.Left := lblUsuario.Left;

  frmVersionProy.lblUsuario.Caption := lblUsuario.Caption;
  frmVersionProy.lblUsuario.Left := lblUsuario.Left;

  frmModifUsuario.lblUsuario.Caption := lblUsuario.Caption;
  frmModifUsuario.lblUsuario.Left := lblUsuario.Left;
end;

procedure TfrmPrincipal.desconectar(Sender: TObject);
begin
  usuarioConectado := '';
  apellidoConectado := '';
  nombreConectado := '';
  lblUsuario.Caption := 'Usuario conectado:';
  lblUsuario.Visible := False;
  btnDesconectar.Visible := False;

  btnProyectos.Enabled := False;
  btnPedidos.Enabled := False;
  btnHardware.Enabled := False;
  btnInformes.Enabled := False;
  btnLogin.Enabled := True;
  btnNuevoUsuario.Enabled := True;

  mniProyectos.Enabled := False;
  mniHardware.Enabled := False;
  mniInformes.Enabled := False;
  mniModificarDatosUser.Enabled := False;
  mniVerPedidos.Enabled := False;
  mniVerProyectos.Enabled := False;
  mniIngresar.Enabled := True;
  mniNuevoUsuario.Enabled := True;
end;

end.

program gestionSistemas;

uses
  Vcl.Forms,
  formPrincipal in 'formPrincipal.pas' {frmPrincipal},
  moduloDatos in 'moduloDatos.pas' {dmDatos: TDataModule},
  formNuevoUsuario in 'formNuevoUsuario.pas' {frmNuevoUsuario},
  formIngresar in 'formIngresar.pas' {frmIngresar},
  formPedidos in 'formPedidos.pas' {frmPedidos},
  formProyectos in 'formProyectos.pas' {frmProyectos},
  formHardware in 'formHardware.pas' {frmHardware},
  formInformes in 'formInformes.pas' {frmInformes},
  formVersionProy in 'formVersionProy.pas' {frmVersionProy},
  formModifUsuario in 'formModifUsuario.pas' {frmModifUsuario},
  RutinasCompartidas in 'RutinasCompartidas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TfrmNuevoUsuario, frmNuevoUsuario);
  Application.CreateForm(TfrmIngresar, frmIngresar);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmProyectos, frmProyectos);
  Application.CreateForm(TfrmHardware, frmHardware);
  Application.CreateForm(TfrmInformes, frmInformes);
  Application.CreateForm(TfrmVersionProy, frmVersionProy);
  Application.CreateForm(TfrmModifUsuario, frmModifUsuario);
  Application.Run;
end.

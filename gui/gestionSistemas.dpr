program gestionSistemas;

uses
  Vcl.Forms,
  formPrincipal in 'formPrincipal.pas' {frmPrincipal},
  moduloDatos in 'moduloDatos.pas' {dmDatos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.Run;
end.

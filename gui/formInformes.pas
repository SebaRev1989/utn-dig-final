unit formInformes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxDBSet,
  Vcl.ExtCtrls;

type
  TfrmInformes = class(TForm)
    btnCerrar: TButton;
    lblUsuario: TLabel;
    lblTitulo: TLabel;
    btnGenerarInforme: TButton;
    frxRepUsuarios: TfrxReport;
    frxRepPedidos: TfrxReport;
    frxRepProyectos: TfrxReport;
    frxDBdsUsuarios: TfrxDBDataset;
    frxDBdsPedidosEspera: TfrxDBDataset;
    frxDBdsProyectos: TfrxDBDataset;
    rgListados: TRadioGroup;
    frxDBdsPedidosAtend: TfrxDBDataset;
    frxDBdsVerProy: TfrxDBDataset;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGenerarInformeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformes: TfrmInformes;

implementation

{$R *.dfm}

uses moduloDatos;

procedure TfrmInformes.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInformes.btnGenerarInformeClick(Sender: TObject);
begin
  case rgListados.ItemIndex of
    -1 :
      begin
        Application.MessageBox('Debe seleccionar una opción válida.', 'ERROR',
          MB_OK + MB_ICONSTOP);
        rgListados.SetFocus;
      end;
    0 :
      begin
        dmDatos.qryRepoUsuarios.Open;
        frxRepUsuarios.ShowReport();
        dmDatos.qryRepoUsuarios.Close;
      end;
    1 :
      begin
        dmDatos.qryRepoPedidosEspera.Open;
        dmDatos.qryRepoPedidosAtend.Open;
        frxRepPedidos.ShowReport();
        dmDatos.qryRepoPedidosEspera.Close;
        dmDatos.qryRepoPedidosAtend.Close;
      end;
    2 :
      begin
        dmDatos.qryRepoProyectos.Open;
        frxRepProyectos.ShowReport();
        dmDatos.qryRepoProyectos.Close;
      end;
  end;
end;

procedure TfrmInformes.FormShow(Sender: TObject);
begin
  rgListados.ItemIndex := -1;
end;

end.

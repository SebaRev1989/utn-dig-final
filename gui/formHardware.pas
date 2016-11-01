unit formHardware;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmHardware = class(TForm)
    btnCerrar: TButton;
    lblUsuario: TLabel;
    lblTitulo: TLabel;
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHardware: TfrmHardware;

implementation

{$R *.dfm}

uses moduloDatos;

procedure TfrmHardware.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.

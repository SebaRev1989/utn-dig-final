unit moduloDatos;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDatos = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

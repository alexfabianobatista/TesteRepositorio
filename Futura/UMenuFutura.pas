unit UMenuFutura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuFutura = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    LiberaPedidos1: TMenuItem;
    ExportaDadosParaFutura1: TMenuItem;
    ImportaDadosdoFutura2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LiberaPedidos1Click(Sender: TObject);
    procedure ExportaDadosParaFutura1Click(Sender: TObject);
    procedure ImportaDadosdoFutura2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuFutura: TFMenuFutura;

implementation

uses UExporta_Futura, UImporta_Futura, ULiberaPedidos, UTela_cl;

{$R *.DFM}

procedure TFMenuFutura.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuFutura.pModulo:='FUTURA';
end;

procedure TFMenuFutura.LiberaPedidos1Click(Sender: TObject);
begin
  inherited;
  If FLiberaPedidos = Nil Then
     FLiberaPedidos := TFLiberaPedidos.Create(Application);
  DMTela.VerificaTela(pModulo,FLiberaPedidos.Caption,FLiberaPedidos.Name);
  FLiberaPedidos.ShowModal;
end;

procedure TFMenuFutura.ExportaDadosParaFutura1Click(Sender: TObject);
begin
  inherited;
  If FExporta_Futura = Nil then
     FExporta_Futura := TFExporta_Futura.Create(Application);
  FExporta_Futura.ShowModal;

end;

procedure TFMenuFutura.ImportaDadosdoFutura2Click(Sender: TObject);
begin
  inherited;
  If FImporta_Futura = Nil then
     FImporta_Futura := TFImporta_Futura.Create(Application);
  FImporta_Futura.ShowModal;

end;

end.

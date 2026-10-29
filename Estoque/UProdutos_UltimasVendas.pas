unit UProdutos_UltimasVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ActnList, ComCtrls;

type
  TFProdutos_UltimasVendas = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DSUltVenda: TDataSource;
    LbDiasUltimasVendas: TLabel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    LBValorTotal: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LBQtdeTodal: TLabel;
    procedure Action1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutos_UltimasVendas: TFProdutos_UltimasVendas;

implementation
uses uProduto_cl, UParamSistema_cl, UImpressoraFiscal;
{$R *.dfm}


procedure TFProdutos_UltimasVendas.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFProdutos_UltimasVendas.FormActivate(Sender: TObject);
begin

  if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA') then
  begin
    Label2.Visible := true;
    LBQtdeTodal.Visible := true;
  end;

end;

end.

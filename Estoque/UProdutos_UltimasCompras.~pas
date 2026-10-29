unit UProdutos_UltimasCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ActnList;

type
  TFProdutos_UltimasCompras = class(TForm)
    DSUltCompra: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    LbDiasUltimasCompras: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutos_UltimasCompras: TFProdutos_UltimasCompras;

implementation

uses UImpressoraFiscal, UParamSistema_cl, UUsuario_cl;

{$R *.dfm}

procedure TFProdutos_UltimasCompras.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFProdutos_UltimasCompras.FormActivate(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') and (DMUsuario.Privilegiado = false) then //Aparecer vlr unitario e custo apenas para usuario privilegiado. Solicitado pela Dani. Junior 18/06/2020
  begin
    DBGrid1.Columns.Items[4].Visible := False;
    DBGrid1.Columns.Items[5].Visible := False;
  end;
//Kelly da Pateli solicitou que o valor do custo apareça somente para usuários privilegiados. Alex 22/08/2023
  if (DMParamSistema.CodEmpresa = 'PATELI') and (DMUsuario.Privilegiado = false) then
    DBGrid1.Columns.Items[5].Visible := False;

end;

end.

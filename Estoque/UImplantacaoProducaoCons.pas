unit UImplantacaoProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFImplantaProducaoCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    EDCodFilial: TEdit;
    EDCodProduto: TEdit;
    EDNumControle: TEdit;
    BTFilialCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImplantaProducaoCons: TFImplantaProducaoCons;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFImplantaProducaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEstoque do
  Begin
    QEstoqueProducaoCons.Close;
    if trim(EDCodFilial.Text)<> '' then
      QEstoqueProducaoCons.SetVariable('COD_FILIAL',Trim(EDCodFilial.Text))
    else
      QEstoqueProducaoCons.SetVariable('COD_FILIAL',null);
    if trim(EDCodProduto.Text)<> '' then
      QEstoqueProducaoCons.SetVariable('COD_PRODUTO',Trim(EDCodProduto.Text))
    else
      QEstoqueProducaoCons.SetVariable('COD_PRODUTO',null);
    if trim(EDNumControle.Text)<> '' then
      QEstoqueProducaoCons.SetVariable('NUM_CONTROLE',Trim(EDNumControle.Text))
    else
      QEstoqueProducaoCons.SetVariable('NUM_CONTROLE',null);
    QEstoqueProducaoCons.Open;
  End;
end;

end.

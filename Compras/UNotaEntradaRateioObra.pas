unit UNotaEntradaRateioObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, Buttons, DB;

type
  TFNotaEntradaRateioObra = class(TForm)
    DBGrid1: TDBGrid;
    DsNotaRateioObra: TDataSource;
    DBGrid2: TDBGrid;
    BtIncluiReceita: TBitBtn;
    BtExcluiReceita: TBitBtn;
    MeObra: TMaskEdit;
    BtObraCons: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    MeQuantidade: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtObraConsClick(Sender: TObject);
    procedure BtIncluiReceitaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtExcluiReceitaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaEntradaRateioObra: TFNotaEntradaRateioObra;

implementation

uses UNotaEntrada_cl, UObraCons, UOracle_cl, UObra_cl, ConvUtils;

{$R *.dfm}

procedure TFNotaEntradaRateioObra.BtObraConsClick(Sender: TObject);
begin
  if FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = mrOk then
    MeObra.Text := DMObra.QObra_ConsCod_Obra.Text;

end;

procedure TFNotaEntradaRateioObra.BtIncluiReceitaClick(Sender: TObject);
var
  wMeQuantidade: double ;
begin
  wMeQuantidade := StrToFloat(Trim(MeQuantidade.Text)); //Precisei jogar na variável a quantade, mesmo atendendo o IF entrava no Raise. Junior 24.06.2021
  If Trim(MeObra.Text) = '' Then
     Raise exception.Create('Informar Obra');
  If Trim(DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = ' + Trim(MeObra.Text), True)) = '' then
     raise exception.Create('ATENÇÃO - Obra não cadastrada, Verifique!');
  If Trim(MeQuantidade.Text) = '' Then
     Raise exception.Create('Informar Quantidade');
  If wMeQuantidade > DMNotaEntrada.QItemNFQT_QUANTIDADE.Value Then  //precisei utilizar a
     Raise exception.Create('Quantidade informada maior que quantidade da nota fiscal');

  DMNotaEntrada.CdsNotaRateioObra.Insert;
  DMNotaEntrada.CdsNotaRateioObracod_obra.Value := StrToInt(Trim(MeObra.Text));
  DMNotaEntrada.CdsNotaRateioObracod_produto.Value := Trunc(DMNotaEntrada.QItemNFCOD_PRODUTO.Value);
  DMNotaEntrada.CdsNotaRateioObraqt_quantidade.Value := StrToFloat(Trim(MeQuantidade.Text));
  DMNotaEntrada.CdsNotaRateioObravl_unitario.Value := (DMNotaEntrada.QItemNFVAL_TOTAL.Value-DMNotaEntrada.QItemNFVAL_DESCONTO_RATEIO.Value) / DMNotaEntrada.QItemNFQT_QUANTIDADE.Value;
  DMNotaEntrada.CdsNotaRateioObra.Post;
end;

procedure TFNotaEntradaRateioObra.FormActivate(Sender: TObject);
begin
  DMNotaEntrada.CdsNotaRateioObra.Open;
  DMNotaEntrada.CdsNotaRateioObra.EmptyDataSet;
end;

procedure TFNotaEntradaRateioObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMNotaEntrada.CdsNotaRateioObra.Close;
end;

procedure TFNotaEntradaRateioObra.BtExcluiReceitaClick(Sender: TObject);
begin
  DMNotaEntrada.CdsNotaRateioObra.Delete;
end;

procedure TFNotaEntradaRateioObra.BitBtn1Click(Sender: TObject);
Var wCod_Obra_Req_Cab : Integer;
begin
  DMNotaEntrada.QItemNF.DisableControls;
  DMNotaEntrada.CdsNotaRateioObra.First;
  DMObra.QObra_Req_Cab.Open;
  DMObra.QObra_Req_Item.Open;
  //wCod_Obra_Req_Cab := DMObra.Func_IncluiObra_Cab(DMNotaEntrada.QNotaEntradaDt_Emissao.Value,DMNotaEntrada.QNotaEntradaNum_Nota.Value,0,DMNotaEntrada.QNotaEntradaCod_Cadastro.Value,
  //                           DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Operacao.Value,DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value);
  wCod_Obra_Req_Cab := DMObra.Func_IncluiObra_Cab(DMNotaEntrada.QNotaEntradaDt_Emissao.Value,DMNotaEntrada.QNotaEntradaNum_Nota.Value,DMNotaEntrada.CdsNotaRateioObraCod_Obra.Value,DMNotaEntrada.QNotaEntradaCod_Cadastro.Value,
                             DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Operacao.Value,DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value);
  DMNotaEntrada.PContabiliza_Extra := 'X';
  DMNotaEntrada.QNotaEntrada.Edit;
  DMNotaEntrada.QNotaEntradaCod_Obra_Req_Cab.Value := wCod_Obra_Req_Cab;
  DMNotaEntrada.QNotaEntrada.Post;
  DMNotaEntrada.PContabiliza_Extra := 'N';
  DMObra.QObra_Req_Cab.Edit;
  while not DMNotaEntrada.CdsNotaRateioObra.Eof do
  begin
    DMObra.Proc_IncluiObra_Item(DMNotaEntrada.CdsNotaRateioObraCod_Obra.Value, DMNotaEntrada.CdsNotaRateioObraCod_Produto.Value, wCod_Obra_Req_Cab,
       DMNotaEntrada.CdsNotaRateioObraQt_Quantidade.Value, DMNotaEntrada.CdsNotaRateioObraVl_Unitario.Value, DMNotaEntrada.QNotaEntradaOBS_COMPLEMENTO.Value, 1);

    DMNotaEntrada.CdsNotaRateioObra.Next;
  end;
  DMObra.QObra_Req_CabIND_SITUACAO.Value := '2';
  DMObra.QObra_Req_Cab.Post;
  DMNotaEntrada.QItemNF.EnableControls;
  DMObra.QObra_Req_Cab.Close;
  DMObra.QObra_Req_Item.Close;
  Close;
end;

end.

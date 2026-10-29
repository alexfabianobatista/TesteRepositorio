unit UFormulaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus,
  UFmFilial;

type
  TFFormulaCons = class(TFTConsulta)
    MELote: TMaskEdit;
    Label2: TLabel;
    BtConsProduto: TBitBtn;
    MEProduto: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EdProdutoCons: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    FmFilial1: TFmFilial;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormulaCons: TFFormulaCons;

implementation

uses UFormula_cl, UTipoLoteCons, UTipoLote_cl, UProdutoCons, UProduto_cl,
  UOracle_cl;

{$R *.DFM}

procedure TFFormulaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMFormula do
  Begin
    QFormulaCons.Close;
    If Trim(MEProduto.Text) = '' then
      QFormulaCons.SetVariable('COD_PRODUTO',Null)
    Else
      QFormulaCons.SetVariable('COD_PRODUTO',Trim(MEProduto.Text));

    If Trim(MELote.Text) = '' then
      QFormulaCons.SetVariable('LOTE',Null)
    Else
      QFormulaCons.SetVariable('LOTE',MELote.Text);

    if ComboBox1.ItemIndex = 0 then
      QFormulaCons.SetVariable('IND_SITUACAO','ATIVA');
    if ComboBox1.ItemIndex = 1 then
      QFormulaCons.SetVariable('IND_SITUACAO','DESATIVADA');
    if ComboBox1.ItemIndex = 2 then
      QFormulaCons.SetVariable('IND_SITUACAO', null);

    if Trim(FmFilial1.MeFilial.Text) <> '' then
      QFormulaCons.SetVariable('COD_FORMULA',StrToInt(Trim(FmFilial1.MeFilial.Text)))
    else
      QFormulaCons.SetVariable('COD_FORMULA',null);


    QFormulaCons.Open;
  End;
end;

procedure TFFormulaCons.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    MELote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
end;

procedure TFFormulaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
  MEProdutoExit(self);
end;

procedure TFFormulaCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' Then
    EdProdutoCons.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                         'COD_PRODUTO = '+Trim(MEProduto.Text))
  Else
    EdProdutoCons.Text := 'Todos';
end;

end.

unit UProdutoSkyhubParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ComCtrls, ExtCtrls, Buttons, UFmFilial,
  UFmProduto, Mask, DBCtrls;

type
  TFProdutoSkyhubParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Memo2: TMemo;
    Label1: TLabel;
    Rg0itens: TRadioGroup;
    FmFilial1: TFmFilial;
    TabSheet2: TTabSheet;
    Rg1Status: TRadioGroup;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    FmFilial2: TFmFilial;
    Rg2Loja: TRadioGroup;
    Memo3: TMemo;
    Label2: TLabel;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    Bt3Produto: TBitBtn;
    ED3Produto: TEdit;
    GroupBox1: TGroupBox;
    Me3DtFinal: TMaskEdit;
    Me3DtInicial: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    ME3CodProduto: TMaskEdit;
    procedure Bt3ProdutoClick(Sender: TObject);
    procedure ME3CodProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSkyhubParam: TFProdutoSkyhubParam;

implementation

uses UProdutoSkyhubCons, UProdutoSkyhub_cl, UOracle_cl;

{$R *.dfm}

procedure TFProdutoSkyhubParam.Bt3ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSkyhubCons = nil then
    FProdutoSkyhubCons := TFProdutoSkyhubCons.Create(Application);
  if FProdutoSkyhubCons.ShowModal = mrOk then
    ME3CodProduto.Text := DMProdutoSkyhub.QProdutoSkyhubConsCOD_PRODUTO_SKYHUB.Text;  
end;

procedure TFProdutoSkyhubParam.ME3CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodProduto.Text) <> '' then
    ED3Produto.Text := DMoracle.FastSelect('DESC_PRODUTO','TB_PRODUTO_SKYHUB','COD_PRODUTO_SKYHUB = ' + Trim(ME3CodProduto.Text))
  else
    ED3Produto.Text := 'Todos';
end;

end.

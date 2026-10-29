unit UDescontoAgricolaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFDescontoAgricolaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    MEProduto: TMaskEdit;
    SpeedButton13: TSpeedButton;
    MECodProduto: TMaskEdit;
    Label21: TLabel;
    Label59: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton35: TSpeedButton;
    MeDescFilial: TMaskEdit;
    TabSheet2: TTabSheet;
    ME1Filial: TMaskEdit;
    SB1Filial: TSpeedButton;
    Ed1Filial: TEdit;
    Label88: TLabel;
    ME1Produto: TMaskEdit;
    SB1Produto: TSpeedButton;
    Ed1Produto: TEdit;
    Label1: TLabel;
    GroupBox10: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    ME1Dt_Inicial: TMaskEdit;
    ME1Dt_Final: TMaskEdit;
    procedure MECodProdutoExit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure SB1FilialClick(Sender: TObject);
    procedure SB1ProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoAgricolaParam: TFDescontoAgricolaParam;

implementation

uses UProdutoCons, UProduto_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFDescontoAgricolaParam.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodProduto.text)<>'' then
    MEProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+MECodProduto.text)
  else
    MEProduto.Clear;

end;

procedure TFDescontoAgricolaParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      MECodProduto.text:=DMProduto.QProdutoConsCod_Produto.text;
      MECodProdutoExit(Self);
    end;

end;

procedure TFDescontoAgricolaParam.MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeFilial.text) <> '' then
    MeDescFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  else
    MeDescFilial.text:='Todos';

end;

procedure TFDescontoAgricolaParam.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      MEFilial.text := DMfilial.QFilialConsCod_filial.text;
      MEFilialExit(Self);
    end;

end;

procedure TFDescontoAgricolaParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Produto.text)<>'' then
    Ed1Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME1Produto.text)
  else
    Ed1Produto.Text :='Todos';
end;

procedure TFDescontoAgricolaParam.SB1ProdutoClick(Sender: TObject);
begin
  inherited;
 if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME1Produto.Text:=DMProduto.QProdutoConsCod_Produto.Text;
      ME1ProdutoExit(Self);

end;

end;

procedure TFDescontoAgricolaParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.text)<>'' then
    Ed1Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1Filial.text)
  else
    Ed1Filial.Text :='Todos';

end;

procedure TFDescontoAgricolaParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME1Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME1FilialExit(Self);
    end;
End;
end.

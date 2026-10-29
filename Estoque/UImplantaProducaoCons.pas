unit UImplantaProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFImplantaProducaoCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    MEProduto: TMaskEdit;
    MEOrigem: TMaskEdit;
    MENumControle: TMaskEdit;
    GroupBox1: TGroupBox;
    MEData_I: TMaskEdit;
    MEData_F: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImplantaProducaoCons: TFImplantaProducaoCons;

implementation

uses UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl,
  UOrigemProducaoCons, UOrigemProducao_cl, UEstoque_cl;

{$R *.DFM}

procedure TFImplantaProducaoCons.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    begin
      MEFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    end;
end;

procedure TFImplantaProducaoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    begin
      MEProduto.Text:=DMProduto.QProdutoConsCod_Produto.Text;
    end;
end;

procedure TFImplantaProducaoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FOrigemProducaoCons = nil then
    FOrigemProducaoCons := TFOrigemProducaoCons.Create(Application);
  if FOrigemProducaoCons.ShowModal = MrOk then
    begin
      MEOrigem.Text:=DMOrigemProducao.QOrigemProducaoConsCod_Origem_Producao.Text;
    end;
end;

procedure TFImplantaProducaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEstoque do
  Begin
    if (Trim(MEData_I.Text) = '') or (Trim(MEData_F.Text) = '') then
      raise exception.create('É necessário informar um período');
    QEstoqueProducaoCons.Close;
    if Trim(MEFilial.Text) <> '' then
      QEstoqueProducaoCons.SetVariable('COD_FILIAL',Trim(MEFilial.Text))
    else
      QEstoqueProducaoCons.SetVariable('COD_FILIAL',null);

    if Trim(MEProduto.Text) <> '' then
      QEstoqueProducaoCons.SetVariable('COD_PRODUTO',Trim(MEProduto.Text))
    else
      QEstoqueProducaoCons.SetVariable('COD_PRODUTO',null);

    if Trim(MEOrigem.Text) <> '' then
      QEstoqueProducaoCons.SetVariable('COD_ORIGEM',Trim(MEOrigem.Text))
    else
      QEstoqueProducaoCons.SetVariable('COD_ORIGEM',null);

    if Trim(MENumControle.Text) <> '' then
      QEstoqueProducaoCons.SetVariable('NUM_CONTROLE',Trim(MENumControle.Text))
    else
      QEstoqueProducaoCons.SetVariable('NUM_CONTROLE',null);

    QEstoqueProducaoCons.SetVariable('DATA_I',Trim(MEData_I.Text));
    QEstoqueProducaoCons.SetVariable('DATA_F',Trim(MEData_F.Text));
    QEstoqueProducaoCons.Open;
  End;
end;

end.

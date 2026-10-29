unit USementeParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFSementeParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    MEPlantioSafra: TMaskEdit;
    BTClassePlantioCons: TBitBtn;
    Label2: TLabel;
    EDDesc_plantioSafra: TEdit;
    TabSheet2: TTabSheet;
    MEPlantioSafra1: TMaskEdit;
    BitBtn1: TBitBtn;
    EDDescPlantioSafra: TEdit;
    Label1: TLabel;
    MECodFilial: TMaskEdit;
    Label3: TLabel;
    EDDescFilial: TEdit;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    ME3Cod_Safra: TMaskEdit;
    BitBtn2: TBitBtn;
    ED3Desc_Safra: TEdit;
    MEDT_Emissao: TMaskEdit;
    Label5: TLabel;
    ME1Cultivar: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ED1Desc_Cultivar: TEdit;
    Label6: TLabel;
    TabSheet4: TTabSheet;
    ED4Safra: TEdit;
    BitBtn4: TBitBtn;
    Label8: TLabel;
    RGOrdem: TRadioGroup;
    ED4Desc_Safra: TEdit;
    TabSheet5: TTabSheet;
    ME5Safra: TMaskEdit;
    BitBtn3: TBitBtn;
    ED5Desc_Safra: TEdit;
    Label7: TLabel;
    Label10: TLabel;
    ME5Produto: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ED5Desc_Produto: TEdit;
    TabSheet6: TTabSheet;
    Label9: TLabel;
    ME6Safra: TMaskEdit;
    BitBtn5: TBitBtn;
    ED6Desc_Safra: TEdit;
    TabSheet7: TTabSheet;
    Label11: TLabel;
    ME7Safra: TMaskEdit;
    BTSafraCons: TBitBtn;
    ED7DescSafra: TEdit;
    TabSheet8: TTabSheet;
    Label12: TLabel;
    ME8Safra: TMaskEdit;
    BitBtn6: TBitBtn;
    ED8DescSafra: TEdit;
    Label13: TLabel;
    ME8Cultivar: TMaskEdit;
    SpeedButton3: TSpeedButton;
    ED8DescCultivar: TEdit;
    ME6DtEmissao: TMaskEdit;
    Label14: TLabel;
    procedure BTClassePlantioConsClick(Sender: TObject);
    procedure MEPlantioSafraExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEPlantioSafra1Exit(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure ME3Cod_SafraExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME1CultivarExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ED4SafraExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ME5SafraExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ME5ProdutoExit(Sender: TObject);
    procedure ME6SafraExit(Sender: TObject);
    procedure BTSafraConsClick(Sender: TObject);
    procedure ME7SafraExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ME8SafraExit(Sender: TObject);
    procedure ME8CultivarExit(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSementeParam: TFSementeParam;

implementation

uses UCampoPlantio_cl, UPlantioSafraCons, UOracle_cl, UPlantioSafra_cl,
  UFilial_cl, UFilialCons, UProdutoCons, UProduto_cl, ULaudoFloracaoCons,
  ULaudo_cl, ULaudoPreColheitaCons;

{$R *.DFM}

procedure TFSementeParam.BTClassePlantioConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
     Begin
       MEPlantioSafra.Text:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Text;
       MEPlantioSafraExit(Self);
     End;  
  end;
end;

procedure TFSementeParam.MEPlantioSafraExit(Sender: TObject);
begin
  inherited;
  if Trim(MEPlantioSafra.Text) <> '' then
  begin
    EDDesc_PlantioSafra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA ='+Trim(MEPlantioSafra.text));
    EDDescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL, TB_PLANTIO_SAFRA',' TB_FILIAL.COD_FILIAL = TB_PLANTIO_SAFRA.COD_FILIAL AND TB_PLANTIO_SAFRA.COD_PLANTIO_SAFRA = '+Trim(MEPlantioSafra.text));
    MECodFilial.Text:=DMOracle.BuscaNome('SELECT TB_FILIAL.COD_FILIAL FROM TB_FILIAL, TB_PLANTIO_SAFRA',' TB_FILIAL.COD_FILIAL = TB_PLANTIO_SAFRA.COD_FILIAL AND TB_PLANTIO_SAFRA.COD_PLANTIO_SAFRA = '+Trim(MEPlantioSafra.text));
  end;
end;

procedure TFSementeParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    MEPlantioSafra1.Text:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFSementeParam.MEPlantioSafra1Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEPlantioSafra1.Text) <> '' then
  begin
    EDDescPlantioSafra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA ='+ Trim(MEPlantioSafra1.text));
  end;

end;

procedure TFSementeParam.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  with DMFilial do
  begin
    if FFilialCons = nil then
      FFilialCons:= TFFilialCons.Create(Application);
    if FFilialCons.ShowModal = mrOk then
      MECodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
  end;
end;

procedure TFSementeParam.ME3Cod_SafraExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3Cod_Safra.Text) <> '' then
  begin
    ED3Desc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA ='+ Trim(ME3Cod_Safra.text));
  end;
end;
procedure TFSementeParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
   if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    ME3Cod_Safra.Text:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFSementeParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      FSementeParam.ME5Produto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFSementeParam.ME1CultivarExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Cultivar.Text) <> '' then
     ED1Desc_Cultivar.Text:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO ='+Trim(FSementeParam.ME1Cultivar.Text))
  else
    ED1Desc_Cultivar.Text:='Todos';
end;

procedure TFSementeParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:=TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.showmodal = mrOk then
    ED4Safra.Text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFSementeParam.ED4SafraExit(Sender: TObject);
begin
  inherited;
  if ED4Safra.text <> '' then
    ED4Desc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+ED4Safra.Text);
end;

procedure TFSementeParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:=TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.showmodal = mrOk then
    ME6Safra.Text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFSementeParam.ME5SafraExit(Sender: TObject);
begin
  inherited;
  if ME5Safra.text <> '' then
    ED5Desc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+ME5Safra.Text);
end;

procedure TFSementeParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:=TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.showmodal = mrOk then
    ME5Produto.Text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFSementeParam.ME5ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Produto.Text) <> '' then
     ED5Desc_Produto.Text:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO ='+Trim(FSementeParam.ME5Produto.Text))
  else
     ED5Desc_Produto.Text:='Todos';
end;

procedure TFSementeParam.ME6SafraExit(Sender: TObject);
begin
  inherited;
  if ME6Safra.text <> '' then
    ED6Desc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+ME6Safra.Text);
end;

procedure TFSementeParam.BTSafraConsClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:=TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.showmodal = mrOk then
    ME7Safra.Text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
    ME7SafraExit(self);
end;

procedure TFSementeParam.ME7SafraExit(Sender: TObject);
begin
  inherited;
  if ME7Safra.text <> '' then
    ED7DescSafra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+ME7Safra.Text);
end;

procedure TFSementeParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:=TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.showmodal = mrOk then
    ME8Safra.Text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
    ME8SafraExit(self);
end;

procedure TFSementeParam.ME8SafraExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Safra.text) <> '' then
    ED8DescSafra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+ME8Safra.Text);
end;

procedure TFSementeParam.ME8CultivarExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Cultivar.Text) <> '' then
     ED8DescCultivar.Text:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO ='+Trim(FSementeParam.ME8Cultivar.Text))
  else
     ED8DescCultivar.Text:='Todos';
end;

procedure TFSementeParam.TabSheet6Show(Sender: TObject);
begin
  inherited;
  ME6DtEmissao.text:=DateToStr(date);  
end;

end.

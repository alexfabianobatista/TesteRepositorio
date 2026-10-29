unit ULaudoFloracaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, DBCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  TFLaudoFloracaoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit12: TDBEdit;
    GroupBox2: TGroupBox;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    BTNCampo: TBitBtn;
    DBEdit17: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit21: TDBEdit;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    Label21: TLabel;
    DBEdit23: TDBEdit;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    DBEdit28: TDBEdit;
    DBEdit27: TDBEdit;
    Label25: TLabel;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    BTPraga: TBitBtn;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    BTClassePlantioCons: TBitBtn;
    Label27: TLabel;
    DBEdit29: TDBEdit;
    SpeedButton1: TSpeedButton;
    EmissoLaudoFlorao1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    Label23: TLabel;
    DBEdit25: TDBEdit;
    DBEdit24: TDBEdit;
    Label22: TLabel;
    Label28: TLabel;
    DBEdit30: TDBEdit;
    BTDoenca: TBitBtn;
    Label29: TLabel;
    DBEdit31: TDBEdit;
    Label30: TLabel;
    DBEdit32: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCampoClick(Sender: TObject);
    procedure BTPragaClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BTClassePlantioConsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure EmissoLaudoFlorao1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure BTDoencaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoFloracaoCad: TFLaudoFloracaoCad;

implementation

uses ULaudo_cl, UCampoPlantioCons, UCampoPlantio_cl, UPragaCons, UPraga_cl,
  ULaudoFloracaoCons, UPlantioSafraCons, UPlantioSafra_cl,
  ULaudoFloracaoItemCons, UOracle_cl, USementeParam, URPlantioSafra,
  URLaudoFloracao, UParamSistema_cl, UDoencaCons, UDoenca_cl;

{$R *.DFM}

procedure TFLaudoFloracaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoFloracao.Open;
    QLaudoFloracaoItem.Close;
    QLaudoFloracaoItem.Open;
  end;
end;

procedure TFLaudoFloracaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    BTNCampo.Enabled:=True;
    BTClassePlantioCons.Enabled:=True;
  end
  else
  begin
    BTNCampo.Enabled:=False;
    BTClassePlantioCons.Enabled:=False;
  end;
end;

procedure TFLaudoFloracaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoFloracao.Close;
    QLaudoFloracaoItem.Close;
  end;
  ACTION:= CAFREE;
  FLaudoFloracaoCad:=nil;
end;

procedure TFLaudoFloracaoCad.BTNCampoClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FCampoPlantioCons = nil then
      FCampoPlantioCons:=TFCampoPlantioCons.Create(Application);
    if FCampoPlantioCons.showmodal = mrOk then
      QLaudoFloracaoCod_Campo_Plantio_Cab.Value:=DMCampoPlantio.QCampoPlantioConsCod_Campo_Plantio_Cab.Value;
  end;
end;

procedure TFLaudoFloracaoCad.BTPragaClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FPragaCons = nil then
      FPragaCons:=TFPragaCons.Create(Application);
    if FPragaCons.showmodal = mrOk then
      QLaudoFloracaoItemCod_Praga.Value:=DMPraga.QPragaConsCod_Praga.Value;
  end;
end;

procedure TFLaudoFloracaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLaudoFloracaoCons = nil then
     FLaudoFloracaoCons:= TFLaudoFloracaoCons.Create(Application);
   if FLaudoFloracaoCons.ShowModal = mrOk then
   begin
     with  DMLaudo do
     begin
       QLaudoFloracao.Close;
       QLaudoFloracao.setVariable('PK',QLaudoFloracaoConsCod_Laudo_Floracao_Cab.Value);
       QLaudoFloracao.Open;
     end;
   end;
end;

procedure TFLaudoFloracaoCad.BTClassePlantioConsClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
    begin
      QLaudoFloracaoCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;
    end;
  end;
end;

procedure TFLaudoFloracaoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FLaudoFloracaoItemCons = nil then
     FLaudoFloracaoItemCons:= TFLaudoFloracaoItemCons.Create(Application);
   if FLaudoFloracaoItemCons.ShowModal = mrOk then
   begin
     with  DMLaudo do
     begin
       QLaudoFloracaoItem.Close;
       QLaudoFloracaoItem.setVariable('COD_LAUDO_FLORACAO_ITEM',QLaudoFloracaoItemConsCod_Laudo_Floracao_Item.Value);
       QLaudoFloracaoItem.Open;
     end;
   end;
end;

procedure TFLaudoFloracaoCad.SBCancelarClick(Sender: TObject);
begin
  DMLaudo.QLaudoFloracaoITem.Cancel;
  inherited;

end;

procedure TFLaudoFloracaoCad.EmissoLaudoFlorao1Click(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if QLaudoFloracaoNum_Laudo_Floracao.Text <> '' then
    begin
      QRLaudoFloracao.Close;
      QRLaudoFloracao.SetVariable('Cod_laudo',Trim(QLaudoFloracaoCod_Laudo_Floracao_Cab.Text));
      QRLaudoFloracao.Open;
      //-----passa parametro para query que lista pragas
      QRLaudoFloracaoPraga.Close;
      QRLaudoFloracaoPraga.SetVariable('Cod_laudo',Trim(QLaudoFloracaoCod_Laudo_Floracao_Cab.Text));
      QRLaudoFloracaoPraga.Open;
      //-----passa parametro para query que lista doencas
      QRLaudoFloracaoDoenca.Close;
      QRLaudoFloracaoDoenca.SetVariable('Cod_laudo',Trim(QLaudoFloracaoCod_Laudo_Floracao_Cab.Text));
      QRLaudoFloracaoDoenca.Open;

      if FRLaudoFloracao = nil then
        FRLaudoFloracao := TFRLaudoFloracao.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoFloracao.QRLEmpresa.Caption:='A.B. SEMENTES';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoFloracao.QRLEmpresa.Caption:='MOINHO IGUAÇU';
      end;
      FRLaudoFloracao.QRLTipoLaudo.Caption:='FLORAÇÃO';
      FRLaudoFloracao.QRLAno.Caption:=Copy(DMLaudo.QRLaudoFloracaoDT_Inspecao.Text,7,4);
      FRLaudoFloracao.QRLEndereco.Caption:=DMlaudo.QRLaudoFloracaoEndereco_Filial.Value+', '+DMlaudo.QRLaudoFloracaoCidade_Filial.Value+', '+DMlaudo.QRLaudoFloracaoEstado_Filial.Value;
      FRLaudoFloracao.QRLVia.Caption:='1ª - VIA SEAB';
      FRLaudoFloracao.QRPrimario.PreviewModal;
      FRLaudoFloracao.QRLVia.Caption:='2ª - VIA PRODUTOR';
      FRLaudoFloracao.QRPrimario.PreviewModal;
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoFloracao.QRLVia.Caption:='3ª VIA - FIXA A.B.';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoFloracao.QRLVia.Caption:='3ª VIA - FIXA MOINHO IGUAÇU';
      end;
      FRLaudoFloracao.QRPrimario.PreviewModal;
      DMLaudo.QRLaudoFloracao.Close;
    end
    else
      raise exception.create('É necessario carregar um Laudo');
  end;
end;
procedure TFLaudoFloracaoCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if QLaudoFloracao.State in [DSInsert] then
    begin
      QLaudoFloracaoDT_Plantio_Termino.Text:=(DMOracle.BuscaNome('SELECT DT_INICIO_PLANTIO FROM TB_CAMPO_PLANTIO_CAB','TB_CAMPO_PLANTIO_CAB.COD_CAMPO_PLANTIO_CAB = '+IntToStr(QLaudoFloracaoCod_Campo_Plantio_Cab.Value)));
      QLaudoFloracaoVal_Producao.Text:=(DMOracle.BuscaNome('SELECT TB_ESTIMATIVA_META.VAL_ESTIMATIVA*1000 FROM TB_CAMPO_PLANTIO_CAB, TB_ESTIMATIVA_META',
                      ' TB_ESTIMATIVA_META.COD_PRODUTO = TB_CAMPO_PLANTIO_CAB.COD_PRODUTO AND TB_ESTIMATIVA_META.COD_PLANTIO_SAFRA = TB_CAMPO_PLANTIO_CAB.COD_PLANTIO_SAFRA AND TB_CAMPO_PLANTIO_CAB.COD_CAMPO_PLANTIO_CAB = '
                      +IntToStr(QLaudoFloracaoCod_Campo_Plantio_Cab.Value)));
    end;
  end;
end;

procedure TFLaudoFloracaoCad.DBEdit2Change(Sender: TObject);
begin
  inherited;
  DBEdit2Exit(SELF);
end;

procedure TFLaudoFloracaoCad.BTDoencaClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FDoencaCons = nil then
      FDoencaCons:=TFDoencaCons.Create(Application);
    if FDoencaCons.showmodal = mrOk then
      QLaudoFloracaoItemCod_Doenca.Value:=DMDoenca.QDoencaConsCod_Doenca.Value;
  end;
end;

end.

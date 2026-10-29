unit ULaudoVistoriaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator;

type
  TFLaudoVistoriaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label14: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    BTPraga: TBitBtn;
    DBRadioGroup3: TDBRadioGroup;
    GroupBox4: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit56: TDBEdit;
    BTDoenca: TBitBtn;
    DBGrid1: TDBGrid;
    DBEdit52: TDBEdit;
    Label43: TLabel;
    SpeedButton2: TSpeedButton;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    Label44: TLabel;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    Label45: TLabel;
    DBEdit3: TDBEdit;
    EmissodoLaudo1: TMenuItem;
    Label46: TLabel;
    DBEdit57: TDBEdit;
    GroupBox2: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBDirceu10: TDBDirceu;
    Label15: TLabel;
    EdCultura: TEdit;
    DBNavigator1: TDBNavigator;
    DBEdit8: TDBEdit;
    DBEdit12: TDBEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BTPragaClick(Sender: TObject);
    procedure BTDoencaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissodoLaudo1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoVistoriaCad: TFLaudoVistoriaCad;

implementation

uses ULaudo_cl, UFFuncionarioCons, UCampoPlantioCons, UFuncionario_cl,
  UCampoPlantio_cl, UPragaCons, UDoencaCons, UOracle_cl, UPraga_cl,
  UDoenca_cl, UPlantioSafraCons, UPlantioSafra_cl, URLaudoVistoria,
  ULaudoVistoriaCons, UParamSistema_cl, USequencia_cl, USementeParam;

{$R *.DFM}

procedure TFLaudoVistoriaCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
    DMLaudo.QLaudoVistoriaCOD_FUNCIONARIO.Value := DMFuncionario.QFuncionarioConsCOD_FUNCIONARIO.Value;
end;

procedure TFLaudoVistoriaCad.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FCampoPlantioCons = Nil then
    FCampoPlantioCons := TFCampoPlantioCons.Create(Application);
  if FCampoPlantioCons.ShowModal = mrOk then
    DMLaudo.QLaudoVistoriaCOD_CAMPO_PLANTIO_CAB.Value := DMCampoPlantio.QCampoPlantioConsCOD_CAMPO_PLANTIO_CAB.Value;

end;

procedure TFLaudoVistoriaCad.BTPragaClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FPragaCons = nil then
      FPragaCons:=TFPragaCons.Create(Application);
    if FPragaCons.showmodal = mrOk then
      QLaudoVistoriaItemCod_Praga.Value:=DMPraga.QPragaConsCod_Praga.Value;
  end;
end;

procedure TFLaudoVistoriaCad.BTDoencaClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FDoencaCons = nil then
      FDoencaCons:=TFDoencaCons.Create(Application);
    if FDoencaCons.showmodal = mrOk then
      QLaudoVistoriaItemCod_Doenca.Value:=DMDoenca.QDoencaConsCod_Doenca.Value;
  end;
end;

procedure TFLaudoVistoriaCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoVistoria.Open;
    QLaudoVistoriaItem.Close;
    QLaudoVistoriaItem.Open;
  end;
end;

procedure TFLaudoVistoriaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoVistoria.Close;
    QLaudoVistoriaItem.Close;
  end;
  ACTION:= CAFREE;
  FLaudoVistoriaCad:=nil;

end;

procedure TFLaudoVistoriaCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
      QLaudoVistoriaCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;  
  end;
end;

procedure TFLaudoVistoriaCad.DBEdit6Change(Sender: TObject);
var wAux : String;
begin
  inherited;
  if DBEdit6.Text <> '' then
  Begin
    wAux := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA = 0' + trim(DMLaudo.QLaudoVistoriaCOD_PLANTIO_SAFRA.Text));
    EdCultura.Text := DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA','COD_CULTURA = 0'+ wAux);
  end;
end;

procedure TFLaudoVistoriaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMLaudo.QLaudoVistoriaDT_EMISSAO.Value := DMOracle.DataServ;
end;

procedure TFLaudoVistoriaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLaudoVistoriaCons = nil then
     FLaudoVistoriaCons:= TFLaudoVistoriaCons.Create(Application);
   if FLaudoVistoriaCons.ShowModal = mrOk then
   begin
     with  DMLaudo do
     begin
       QLaudoVistoria.Close;
       QLaudoVistoria.setVariable('PK',QLaudoVistoriaConsCod_Laudo_Vistoria.Value);
       QLaudoVistoria.Open;
     end;
   end;
end;

procedure TFLaudoVistoriaCad.EmissodoLaudo1Click(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if QLaudoVistoriaNum_Laudo_Vistoria.Text <> '' then
    begin
      QRLaudoVistoria.Close;
      QRLaudoVistoria.SetVariable('LAUDO',Trim(QLaudoVistoriaCod_Laudo_Vistoria.Text));
      QRLaudoVistoria.Open;
      //-----passa parametro para query que lista pragas
      //QRLaudoVistoriaPraga.Close;
      //QRLaudoVistoriaPraga.SetVariable('Cod_laudo',Trim(QLaudoVistoriaCod_Laudo_Vistoria.Text));
      //QRLaudoVistoriaPraga.Open;
      //-----passa parametro para query que lista doencas
      //QRLaudoVistoriaDoenca.Close;
      //QRLaudoVistoriaDoenca.SetVariable('Cod_laudo',Trim(QLaudoVistoriaCod_Laudo_Vistoria.Text));
      //QRLaudoVistoriaDoenca.Open;
      QRLaudoDoencaPraga.Close;
      QRLaudoDoencaPraga.SetVariable('Cod_laudo',Trim(QLaudoVistoriaCod_Laudo_Vistoria.Text));
      QRLaudoDoencaPraga.Open;

      if FRLaudoVistoria = nil then
        FRLaudoVistoria := TFRLaudoVistoria.Create(Application);

      if QRLaudoDoencaPraga.eof then //quando nao tiver doença ou praga o relatório ficava em branco, para nao acontecer isso o data set do relatório é associado a outra query
        FRLaudoVistoria.QRPrimario.DataSet := DMLaudo.QRLaudoVistoria
      else
        FRLaudoVistoria.QRPrimario.DataSet := DMLaudo.QRLaudoDoencaPraga;

      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoVistoria.QRLEmpresa.Caption:='A.B. SEMENTES';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoVistoria.QRLEmpresa.Caption:='MOINHO IGUAÇU';
      end;

      FRLaudoVistoria.QRLVia.Caption:='1ª - VIA MAPA';  //trocado SEAB por MAPA
      FRLaudoVistoria.QRPrimario.Preview;
      FRLaudoVistoria.QRLVia.Caption:='2ª - VIA PRODUTOR';
      FRLaudoVistoria.QRPrimario.Preview;
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoVistoria.QRLVia.Caption:='3ª VIA - FIXA A.B.';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoVistoria.QRLVia.Caption:='3ª VIA - FIXA MOINHO IGUAÇU';
      end;
      FRLaudoVistoria.QRPrimario.Preview;
      DMLaudo.QRLaudoVistoria.Close;
    end
    else
      raise exception.create('É necessario carregar um Laudo');
  end;

end;

procedure TFLaudoVistoriaCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if DBEdit6.Text <> '' then
  Begin
    if DMLaudo.QlaudoVistoria.State in [dsInsert, dsEdit] then
    begin
      DMLaudo.QLaudoVistoriaCOD_CADASTRO.Text := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CAMPO_PLANTIO_CAB ',' COD_CAMPO_PLANTIO_CAB = '+ DMLAUDO.QLaudoVistoriaCOD_CAMPO_PLANTIO_CAB.Text);
      DMLaudo.QLaudoVistoriaCOD_FILIAL.Text := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_CAMPO_PLANTIO_CAB ',' COD_CAMPO_PLANTIO_CAB = '+ DMLAUDO.QLaudoVistoriaCOD_CAMPO_PLANTIO_CAB.Text);
    end;
  end;
end;

end.

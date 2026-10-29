unit ULaudoPreColheitaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFLaudoPreColheitaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BTNLaudoFloracaoCons: TBitBtn;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    BTPraga: TBitBtn;
    DBNavigator1: TDBNavigator;
    EmissoLaudoPrColheita1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    BTDoenca: TBitBtn;
    Label6: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNLaudoFloracaoConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTPragaClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissoLaudoPrColheita1Click(Sender: TObject);
    procedure BTDoencaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoPreColheitaCad: TFLaudoPreColheitaCad;

implementation

uses ULaudo_cl, ULaudoFloracaoCons, UPragaCons, UPraga_cl, UOracle_cl,
  ULaudoPreColheitaCons, USementeParam, URLaudoPreColheita,
  UParamSistema_cl, URLaudoFloracao, UDoencaCons, UDoenca_cl;

{$R *.DFM}

procedure TFLaudoPreColheitaCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoPreColheita.Open;
    QLaudoPreColheitaItem.Open;
    QExibeItemPreColheita.Open;
  end;
end;

procedure TFLaudoPreColheitaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoPreColheita.Close;
    QLaudoPreColheitaItem.Close;
  end;
  Action:=CaFree;
  FLaudoPreColheitaCad:=nil;
end;

procedure TFLaudoPreColheitaCad.BTNLaudoFloracaoConsClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  Begin
    if FLaudoFloracaoCons = nil then
      FLaudoFloracaoCons:=TFLaudoFloracaoCons.Create(Application);
    if FLaudoFloracaoCons.ShowModal = mrOk then
      QLaudoPreColheitaCOD_LAUDO_FLORACAO_CAB.Value:=QLaudoFloracaoConsCod_Laudo_Floracao_Cab.Value
  end;
end;

procedure TFLaudoPreColheitaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    BTNLaudoFloracaoCons.Enabled:=True;
  end
  else
  begin
    BTNLaudoFloracaoCons.Enabled:=False;
  end;
end;

procedure TFLaudoPreColheitaCad.BTPragaClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FPragaCons = nil then
      FPragaCons:=TFPragaCons.Create(Application);
    if FPragaCons.showmodal = mrOk then
      QLaudoPreColheitaItemCod_Praga.Value:=DMPraga.QPragaConsCod_Praga.Value;
  end;
end;

procedure TFLaudoPreColheitaCad.SBCancelarClick(Sender: TObject);
begin
  DMLaudo.QLaudoPreColheitaItem.Cancel;
  inherited;

end;

procedure TFLaudoPreColheitaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLaudoPreColheitaCons = nil then
     FLaudoPreColheitaCons:= TFLaudoPreColheitaCons.Create(Application);
   if FLaudoPreColheitaCons.ShowModal = mrOk then
   begin
     with DMLaudo do
     begin
       QLaudoPreColheita.Close;
       QLaudoPreColheita.setVariable('PK',QLaudoPreColheitaConsCod_Laudo_Pre_Colheita_Cab.Value);
       QLaudoPreColheita.Open;
     end;
   end;
end;

procedure TFLaudoPreColheitaCad.EmissoLaudoPrColheita1Click(
  Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if Trim(QLaudoPreColheitaNum_Laudo_Pre_Colheita.Text) <> '' then
    begin
      QRLaudoPreColheita.Close;
      QRLaudoPreColheitaDoenca.Close;
      QRLaudoPreColheitaPraga.Close;
      QRLaudoPreColheita.SetVariable('COD_LAUDO',Trim(QLaudoPreColheitaCod_Laudo_Pre_Colheita_Cab.Text));
      QRLaudoPreColheitaDoenca.SetVariable('COD_LAUDO',Trim(QLaudoPreColheitaCod_Laudo_Pre_Colheita_Cab.Text));
      QRLaudoPreColheitaDoenca.SetVariable('COD_LAUDO_FLORACAO',Trim(QLaudoPreColheitaCod_Laudo_Floracao_Cab.Text));
      QRLaudoPreColheitaPraga.SetVariable('COD_LAUDO',Trim(QLaudoPreColheitaCod_Laudo_Pre_Colheita_Cab.Text));
      QRLaudoPreColheitaPraga.SetVariable('COD_LAUDO_FLORACAO',Trim(QLaudoPreColheitaCod_Laudo_Floracao_Cab.Text));
      QRLaudoPreColheita.Open;
      QRLaudoPreColheitaDoenca.Open;
      QRLaudoPreColheitaPraga.Open;
      if FRLaudoPreColheita = nil then
         FRLaudoPreColheita := TFRLaudoPreColheita.Create(Application);
      FRLaudoPreColheita.QRLAno.Caption:=Copy(DMLaudo.QRLaudoPreColheitaDT_Inspecao.Text,7,4);
      FRLaudoPreColheita.QRLEndereco.Caption:=DMlaudo.QRLaudoPreColheitaEndereco_Filial.Value+', '+DMlaudo.QRLaudoFloracaoCidade_Filial.Value+', '+DMlaudo.QRLaudoFloracaoEstado_Filial.Value;
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoPreColheita.QRLEmpresa.Caption:='A.B. SEMENTES';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoPreColheita.QRLEmpresa.Caption:='MOINHO IGUAÇU';
      end;
      FRLaudoPreColheita.QRLAno.Caption:=Copy(DMLaudo.QRLaudoPreColheitaDT_Inspecao.Text,7,4);
      FRLaudoPreColheita.QRLEndereco.Caption:=DMlaudo.QRLaudoPreColheitaEndereco_Filial.Value+', '+DMlaudo.QRLaudoFloracaoCidade_Filial.Value+', '+DMlaudo.QRLaudoFloracaoEstado_Filial.Value;
      FRLaudoPreColheita.QRLVia.Caption:='1ª - VIA SEAB';
      FRLaudoPreColheita.QRPrimario.PreviewModal;
      FRLaudoPreColheita.QRLVia.Caption:='2ª - VIA PRODUTOR';
      FRLaudoPreColheita.QRPrimario.PreviewModal;
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        FRLaudoPreColheita.QRLVia.Caption:='3ª VIA - FIXA A.B.';
      end;
      if  DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO' then
      begin
        FRLaudoPreColheita.QRLVia.Caption:='3ª VIA - FIXA MOINHO IGUAÇU';
      end;
      FRLaudoPreColheita.QRPrimario.PreviewModal;
      DMLaudo.QRLaudoPreColheita.Close;
    end
    else
      raise exception.create('É necessário escolher um Laudo!');
  end;
end;

procedure TFLaudoPreColheitaCad.BTDoencaClick(Sender: TObject);
begin
  inherited;
  if FDoencaCons = nil then
      FDoencaCons:=TFDoencaCons.Create(Application);
    if FDoencaCons.showmodal = mrOk then
      DMLaudo.QLaudoPreColheitaItemCod_Doenca.Value:=DMDoenca.QDoencaConsCod_Doenca.Value;
end;

end.

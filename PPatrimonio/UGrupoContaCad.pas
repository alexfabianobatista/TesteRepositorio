unit UGrupoContaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFGrupoContaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    SBContaContabil: TSpeedButton;
    SBHistoricoContabil: TSpeedButton;
    SBDebitoDepreciacao: TSpeedButton;
    SBCreditoDepreciacao: TSpeedButton;
    SBHistoricoDepreciacao: TSpeedButton;
    SBDebitoCIAP: TSpeedButton;
    SBCreditoCIAP: TSpeedButton;
    SBHistoricoCIAP: TSpeedButton;
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
    DBDirceu19: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu1: TDBDirceu;
    DBDirceu20: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu21: TDBDirceu;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SBDebitoDiferencaCIAP: TSpeedButton;
    SBCreditoDiferencaCIAP: TSpeedButton;
    SBHistoricoDifCIAP: TSpeedButton;
    SBDebitoBaixa: TSpeedButton;
    SBCreditoBaixa: TSpeedButton;
    SBHistoricoBaixa: TSpeedButton;
    SBDebitoEstornoDepreciacao: TSpeedButton;
    SBCreditoEstornoDepreciacao: TSpeedButton;
    SBHistoricoBaixaDep: TSpeedButton;
    SBDebitoICMS: TSpeedButton;
    SBCreditoICMS: TSpeedButton;
    SBHistoricoICMS: TSpeedButton;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBDirceu6: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu22: TDBDirceu;
    DBDirceu14: TDBDirceu;
    DBDirceu13: TDBDirceu;
    DBDirceu23: TDBDirceu;
    DBDirceu16: TDBDirceu;
    DBDirceu15: TDBDirceu;
    DBDirceu24: TDBDirceu;
    DBDirceu18: TDBDirceu;
    DBDirceu17: TDBDirceu;
    DBDirceu25: TDBDirceu;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure SBContaContabilClick(Sender: TObject);
    procedure SBDebitoDepreciacaoClick(Sender: TObject);
    procedure SBHistoricoDepreciacaoClick(Sender: TObject);
    procedure SBDebitoCIAPClick(Sender: TObject);
    procedure SBHistoricoCIAPClick(Sender: TObject);
    procedure SBDebitoDiferencaCIAPClick(Sender: TObject);
    procedure SBHistoricoDifCIAPClick(Sender: TObject);
    procedure SBDebitoBaixaClick(Sender: TObject);
    procedure SBHistoricoBaixaClick(Sender: TObject);
    procedure SBDebitoEstornoDepreciacaoClick(Sender: TObject);
    procedure SBHistoricoBaixaDepClick(Sender: TObject);
    procedure SBDebitoICMSClick(Sender: TObject);
    procedure SBHistoricoICMSClick(Sender: TObject);
    procedure SBHistoricoContabilClick(Sender: TObject);
    procedure SBCreditoDepreciacaoClick(Sender: TObject);
    procedure SBCreditoCIAPClick(Sender: TObject);
    procedure SBCreditoDiferencaCIAPClick(Sender: TObject);
    procedure SBCreditoBaixaClick(Sender: TObject);
    procedure SBCreditoEstornoDepreciacaoClick(Sender: TObject);
    procedure SBCreditoICMSClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoContaCad: TFGrupoContaCad;

implementation

uses UGrupoConta_cl, UParamSistema_cl, UPlanoContaCons, UHistContabilCons,
  UPlanoConta_cl, UHistContabil_cl, UGrupoContaCons;

{$R *.DFM}

procedure TFGrupoContaCad.FormCreate(Sender: TObject);
var wMask : string;
begin
  inherited;
  //--VERIFICA OS GRAUS CONTÁBEIS PARA APLICAR A MÁSCARA CORRETA------------
  wMask := '';
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
    4: wMask := '#.##.##.######;0;';
    5: wMask := '#.##.##.##.######;0;';
    6: wMask := '#.##.##.##.##.######;0;';
  End;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_DEPRECIACAO.EditMask := wMask;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_CIAP.EditMask        := wMask;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_DIF_CIAP.EditMask    := wMask;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_BAIXA.EditMask       := wMask;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_BAIXA_DEP.EditMask   := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_DEPRECIACAO.EditMask  := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_CIAP.EditMask         := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_DIF_CIAP.EditMask     := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_BAIXA.EditMask        := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_BAIXA_DEP.EditMask    := wMask;
  DMGrupoConta.QGrupoContaCONTA_CREDITO_ICMS.EditMask        := wMask;
  DMGrupoConta.QGrupoContaCONTA_DEBITO_ICMS.EditMask         := wMask;
  DMGrupoConta.QGrupoContaCONTA_CONTABIL_BEM.EditMask        := wMask;

  //--FIM VERIFICA GRAUS

  DMGrupoConta.QGrupoConta.close;
  DMGrupoConta.QGrupoConta.open;
end;

procedure TFGrupoContaCad.SBContaContabilClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CONTABIL_BEM.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBDebitoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_DEPRECIACAO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_DEPRECIACAO.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBDebitoCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoCIAPClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_CIAP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBDebitoDiferencaCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_DIF_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoDifCIAPClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_DIF_CIAP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBDebitoBaixaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_BAIXA.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoBaixaClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_BAIXA.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBDebitoEstornoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_BAIXA_DEP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoBaixaDepClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_BAIXA_DEP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBDebitoICMSClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_DEBITO_ICMS.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBHistoricoICMSClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCOD_HISTORICO_ICMS.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBHistoricoContabilClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaHISTORICO_CONTABIL.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFGrupoContaCad.SBCreditoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CREDITO_DEPRECIACAO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBCreditoCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CREDITO_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBCreditoDiferencaCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
   DMGrupoConta.QGrupoContaCONTA_CREDITO_DIF_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBCreditoBaixaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CREDITO_BAIXA.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBCreditoEstornoDepreciacaoClick(
  Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CREDITO_BAIXA_DEP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.SBCreditoICMSClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMGrupoConta.QGrupoContaCONTA_CREDITO_ICMS.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFGrupoContaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
  Begin
    SBCreditoDepreciacao.Enabled        := True;
    SBDebitoDepreciacao.Enabled         := True;
    SBCreditoCIAP.Enabled               := True;
    SBDebitoCIAP.Enabled                := True;
    SBCreditoDiferencaCIAP.Enabled      := True;
    SBDebitoDiferencaCIAP.Enabled       := True;
    SBCreditoBaixa.Enabled              := True;
    SBDebitoBaixa.Enabled               := True;
    SBCreditoEstornoDepreciacao.Enabled := True;
    SBDebitoEstornoDepreciacao.Enabled  := True;
    SBCreditoICMS.Enabled               := True;
    SBDebitoICMS.Enabled                := True;
    SBContaContabil.Enabled             := True;
    SBHistoricoContabil.Enabled         := True;

    SBHistoricoDepreciacao.Enabled      := True;
    SBHistoricoCIAP.Enabled             := True;
    SBHistoricoDifCIAP.Enabled          := True;
    SBHistoricoBaixa.Enabled            := True;
    SBHistoricoBaixaDep.Enabled         := True;
    SBHistoricoICMS.Enabled             := True;
  End
  Else
  Begin
    SBCreditoDepreciacao.Enabled        := False;
    SBDebitoDepreciacao.Enabled         := False;
    SBCreditoCIAP.Enabled               := False;
    SBDebitoCIAP.Enabled                := False;
    SBCreditoDiferencaCIAP.Enabled      := False;
    SBDebitoDiferencaCIAP.Enabled       := False;
    SBCreditoBaixa.Enabled              := False;
    SBDebitoBaixa.Enabled               := False;
    SBCreditoEstornoDepreciacao.Enabled := False;
    SBDebitoEstornoDepreciacao.Enabled  := False;
    SBCreditoICMS.Enabled               := False;
    SBDebitoICMS.Enabled                := False;
    SBContaContabil.Enabled             := False;
    SBHistoricoContabil.Enabled         := False;

    SBHistoricoDepreciacao.Enabled      := False;
    SBHistoricoCIAP.Enabled             := False;
    SBHistoricoDifCIAP.Enabled          := False;
    SBHistoricoBaixa.Enabled            := False;
    SBHistoricoBaixaDep.Enabled         := False;
    SBHistoricoICMS.Enabled             := False;
  End;
end;

procedure TFGrupoContaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FGrupoContaCons = nil Then
    FGrupoContaCons := TFGrupoContaCons.Create(Application);
  If FGrupoContaCons.ShowModal = mrOk Then
  Begin
    DMGrupoConta.QGrupoConta.Close;
    DMGrupoConta.QGrupoConta.SetVariable( ':PK', DMGrupoConta.QGrupoContaConsCOD_PATRIMONIO_GRUPO_CONTA.Value );
    DMGrupoConta.QGrupoConta.Open;
  End;
end;

end.

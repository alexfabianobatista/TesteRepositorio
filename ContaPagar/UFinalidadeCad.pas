unit UFinalidadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, Variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFFinalidadeCad = class(TFTCadSimples)
    Finalidades1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    BtMoeda: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BtCodHistoricoBaixa: TSpeedButton;
    BtCodHistoricoJuro: TSpeedButton;
    BtCodHistoricoDesc: TSpeedButton;
    BtCodHistoricoCheque: TSpeedButton;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label20: TLabel;
    BtVariacaoPos: TSpeedButton;
    BtVariacaoNeg: TSpeedButton;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit36: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    BtHistoricoContabil: TSpeedButton;
    BtContValorBaixaCred: TSpeedButton;
    BtContValorBaixaDeb: TSpeedButton;
    BtContValorJuroCred: TSpeedButton;
    BtContValorJuroDeb: TSpeedButton;
    BtContValorDescontoCred: TSpeedButton;
    BtContValorDescontoDeb: TSpeedButton;
    Label22: TLabel;
    BtVariacaoPosDeb: TSpeedButton;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit37: TDBEdit;
    Label23: TLabel;
    BtVariacaoPosCred: TSpeedButton;
    DBEdit39: TDBEdit;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    DBEdit45: TDBEdit;
    Label27: TLabel;
    DBEdit46: TDBEdit;
    BtDebitoInclusao: TSpeedButton;
    BtCreditoInclusao: TSpeedButton;
    Label28: TLabel;
    DBEdit49: TDBEdit;
    BtHistoricoInclusao: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    BtContValorDescontoFinCred: TSpeedButton;
    BtContValorDescontoComCred: TSpeedButton;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    TabSheet3: TTabSheet;
    DBEdit51: TDBEdit;
    Label29: TLabel;
    BtConsContaCredContabil: TSpeedButton;
    Label32: TLabel;
    DBEdit57: TDBEdit;
    Label33: TLabel;
    DBEdit58: TDBEdit;
    Label34: TLabel;
    DBEdit59: TDBEdit;
    BtConsBaixaDebContabil: TSpeedButton;
    BtConsJuroContabil: TSpeedButton;
    SBCentroCusto: TSpeedButton;
    Label35: TLabel;
    BtHistoricoCaixaDevolucao: TSpeedButton;
    DBEdit63: TDBEdit;
    DBRadioGroup7: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    DBDirceu13: TDBDirceu;
    DBDirceu14: TDBDirceu;
    DBDirceu16: TDBDirceu;
    DBDirceu17: TDBDirceu;
    DBDirceu18: TDBDirceu;
    DBDirceu19: TDBDirceu;
    DBDirceu20: TDBDirceu;
    DBDirceu22: TDBDirceu;
    DBDirceu23: TDBDirceu;
    DBDirceu24: TDBDirceu;
    DBDirceu25: TDBDirceu;
    DBDirceu26: TDBDirceu;
    DBDirceu27: TDBDirceu;
    DBDirceu28: TDBDirceu;
    DBDirceu29: TDBDirceu;
    Label36: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup8: TDBRadioGroup;
    Label37: TLabel;
    DBEdit21: TDBEdit;
    Label38: TLabel;
    BtConsIrDeb: TSpeedButton;
    DBEdit22: TDBEdit;
    DBDirceu30: TDBDirceu;
    Label39: TLabel;
    BtConsIRCred: TSpeedButton;
    DBEdit23: TDBEdit;
    DBDirceu31: TDBDirceu;
    Label24: TLabel;
    DBEdit41: TDBEdit;
    BtVariacaoNegDeb: TSpeedButton;
    DBDirceu15: TDBDirceu;
    DBEdit43: TDBEdit;
    Label25: TLabel;
    BtVariacaoNegCred: TSpeedButton;
    DBDirceu21: TDBDirceu;
    DBRadioGroup9: TDBRadioGroup;
    Label40: TLabel;
    DBEdit24: TDBEdit;
    SbHistoricoOutros: TSpeedButton;
    DBDirceu32: TDBDirceu;
    Label41: TLabel;
    SbOutrosDebito: TSpeedButton;
    Label42: TLabel;
    SbOutrosCredito: TSpeedButton;
    DBEdit25: TDBEdit;
    DBDirceu33: TDBDirceu;
    DBEdit26: TDBEdit;
    DBDirceu34: TDBDirceu;
    Label43: TLabel;
    DBEdit27: TDBEdit;
    DBRadioGroup10: TDBRadioGroup;
    Label44: TLabel;
    Label45: TLabel;
    BtHistoricoCartaoCredito: TSpeedButton;
    BtHistoricoCartaoDebito: TSpeedButton;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBDirceu35: TDBDirceu;
    DBDirceu36: TDBDirceu;
    Label47: TLabel;
    BtHistoricoJurosDebito: TSpeedButton;
    DBEdit31: TDBEdit;
    DBDirceu38: TDBDirceu;
    Label46: TLabel;
    BtHistoricoJurosCredito: TSpeedButton;
    DBEdit30: TDBEdit;
    DBDirceu37: TDBDirceu;
    Label48: TLabel;
    SBHistoricoCaixaCheque: TSpeedButton;
    Label49: TLabel;
    SBHistoricoJurosCheque: TSpeedButton;
    DBEdit32: TDBEdit;
    DBDirceu39: TDBDirceu;
    DBEdit34: TDBEdit;
    DBDirceu40: TDBDirceu;
    DbTipoCustoPollyana: TDBRadioGroup;
    Label50: TLabel;
    DBEdit35: TDBEdit;
    DBDirceu41: TDBDirceu;
    SpeedButton2: TSpeedButton;
    BtConsDescontoContabil: TSpeedButton;
    Label51: TLabel;
    DBEdit38: TDBEdit;
    SBHistoricoPIX: TSpeedButton;
    DBDirceu42: TDBDirceu;
    Label52: TLabel;
    DBEdit40: TDBEdit;
    SBHistoricoJurosPIX: TSpeedButton;
    DBDirceu43: TDBDirceu;
    DBRadioGroup11: TDBRadioGroup;
    procedure BtMoedaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtHistoricoContabilClick(Sender: TObject);
    procedure BtCodHistoricoBaixaClick(Sender: TObject);
    procedure BtCodHistoricoJuroClick(Sender: TObject);
    procedure BtContValorBaixaCredClick(Sender: TObject);
    procedure BtContValorBaixaDebClick(Sender: TObject);
    procedure BtContValorJuroCredClick(Sender: TObject);
    procedure BtContValorJuroDebClick(Sender: TObject);
    procedure BtContValorDescontoCredClick(Sender: TObject);
    procedure BtContValorDescontoDebClick(Sender: TObject);
    procedure BtCodHistoricoDescClick(Sender: TObject);
    procedure BtCodHistoricoChequeClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure Finalidades1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtContValorBancoCredClick(Sender: TObject);
    procedure BtContValorBancoDebClick(Sender: TObject);
    procedure BtContValorDescBcoCredClick(Sender: TObject);
    procedure BtContValorJuroBcoDebClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BtVariacaoPosClick(Sender: TObject);
    procedure BtVariacaoNegClick(Sender: TObject);
    procedure BtVariacaoPosDebClick(Sender: TObject);
    procedure BtVariacaoPosCredClick(Sender: TObject);
    procedure BtVariacaoNegDebClick(Sender: TObject);
    procedure BtVariacaoNegCredClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtDebitoInclusaoClick(Sender: TObject);
    procedure BtCreditoInclusaoClick(Sender: TObject);
    procedure BtHistoricoInclusaoClick(Sender: TObject);
    procedure BtConsContaCredContabilClick(Sender: TObject);
    procedure BtContValorDescontoFinCredClick(Sender: TObject);
    procedure BtContValorDescontoComCredClick(Sender: TObject);
    procedure BtConsBaixaDebContabilClick(Sender: TObject);
    procedure BtConsJuroContabilClick(Sender: TObject);
    procedure SBCentroCustoConsClick(Sender: TObject);
    procedure BtHistoricoCaixaDevolucaoClick(Sender: TObject);
    procedure BtConsIrDebClick(Sender: TObject);
    procedure BtConsIRCredClick(Sender: TObject);
    procedure SbHistoricoOutrosClick(Sender: TObject);
    procedure SbOutrosDebitoClick(Sender: TObject);
    procedure SbOutrosCreditoClick(Sender: TObject);
    procedure BtHistoricoCartaoCreditoClick(Sender: TObject);
    procedure BtHistoricoCartaoDebitoClick(Sender: TObject);
    procedure BtHistoricoJurosCreditoClick(Sender: TObject);
    procedure BtHistoricoJurosDebitoClick(Sender: TObject);
    procedure SBHistoricoJurosChequeClick(Sender: TObject);
    procedure SBHistoricoCaixaChequeClick(Sender: TObject);
    procedure SBCentroCustoClick(Sender: TObject);
    procedure SBHistoricoPIXClick(Sender: TObject);
    procedure SBHistoricoJurosPIXClick(Sender: TObject);
    function  ValidarIndFinalidadePreenchido: Boolean;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFinalidadeCad: TFFinalidadeCad;

implementation

uses UFinalidade_cl, UMoedaCons, UMoeda_cl, UFinalidadeCons,
  UHistContabilCons, UHistContabil_cl, UPlanoContaCons, UPlanoConta_cl,
  UHistoricoCons, UHistorico_cl, UFinalidadeParam, URFinalidade,
  UParamSistema_cl, UOracle_cl, UCentroCustoCons, UCentroCusto_cl;

{$R *.DFM}

procedure TFFinalidadeCad.BtMoedaClick(Sender: TObject);
begin
  inherited;
  If FMoedaCons=Nil then
    FMoedaCons:=TFMoedaCons.Create(Application);
  If FMoedaCons.Showmodal=mrOk then
     DMFinalidade.QFinalidadeCod_Moeda.Value:=DMMoeda.QMoedaConsCod_Moeda.value;
end;

procedure TFFinalidadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMFinalidade do
    Begin
      QFinalidade.Open;
      Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
        4: Begin
           QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_COM_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_BCO_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_BCO_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.EditMask:='#.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.EditMask:='#.##.##.######;0;';
           End;
        5: Begin
           QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_COM_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_BCO_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_BCO_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.EditMask:='#.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.EditMask:='#.##.##.##.######;0;';
           End;
        6: Begin
           QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_COM_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_BANCO_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_DESC_BCO_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_JURO_BCO_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_INCLUSAO_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_IR_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.EditMask:='#.##.##.##.##.######;0;';
           QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.EditMask:='#.##.##.##.##.######;0;';
           End;
      End;
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'POLLYANA' Then
     DbTipoCustoPollyana.Visible := True;
end;

procedure TFFinalidadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.Showmodal=mrOk then
    Begin
      With DMFinalidade do
        Begin
          QFinalidade.Close;
          QFinalidade.SetVariable('PK',QFinalidadeConsCod_Finalidade.Value);
          QFinalidade.Open;
        End;
    End;
end;

procedure TFFinalidadeCad.BtHistoricoContabilClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons=Nil then
    FHistContabilCons:=TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Contabil.Value:=DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;
end;

procedure TFFinalidadeCad.BtCodHistoricoBaixaClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Baixa.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtCodHistoricoJuroClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Juro.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtContValorBaixaCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit14.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit14.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Baixa_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorBaixaDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit15.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit15.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Baixa_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorJuroCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit16.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit16.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Juro_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorJuroDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit17.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit17.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Juro_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorDescontoCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit18.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit18.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorDescontoDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit19.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit19.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Desc_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtCodHistoricoDescClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Desc.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtCodHistoricoChequeClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Cheque.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo: Integer;
begin
  if not ValidarIndFinalidadePreenchido then
    Exit;
  wCodigo := DMFinalidade.QFinalidadeCod_Finalidade.Value;
  inherited;
  DMFinalidade.QFinalidade.Close;
  DMFinalidade.QFinalidade.SetVariable('PK', wCodigo);
  DMFinalidade.QFinalidade.Open;
end;


procedure TFFinalidadeCad.SBCancelarClick(Sender: TObject);
var
  wCodigo:Integer;
begin
  wCodigo:=DMFinalidade.QFinalidadeCod_Finalidade.Value;
  inherited;
  DMFinalidade.QFinalidade.Close;
  DMFinalidade.QFinalidade.SetVariable('PK',wCodigo);
  DMFinalidade.QFinalidade.Open;
end;

procedure TFFinalidadeCad.Finalidades1Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeParam = Nil then
    FFinalidadeParam:=TFFinalidadeParam.Create(Application);
  FFinalidadeParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FFinalidadeParam.ShowModal=mrOk then
    Begin
      With DMFinalidade do
        Begin
          QRFinalidade.Close;
          If FFinalidadeParam.Rg0Limite.ItemIndex = 0 Then
             QRFinalidade.SetVariable('Limite',0)
          Else
             QRFinalidade.SetVariable('Limite',Null);
          Case FFinalidadeParam.Rg0LiberadoUso.ItemIndex of
            0:QRFinalidade.SetVariable('IND_LIBERADO','SIM');
            1:QRFinalidade.SetVariable('IND_LIBERADO','NAO');
            2:QRFinalidade.SetVariable('IND_LIBERADO',NULL);
          End;
          QRFinalidade.SQL[QRFinalidade.SQL.Count-1]:='';
          If FFinalidadeParam.Rg0Ordem.ItemIndex = 0 Then
             QRFinalidade.Sql.Add('Order By Tb_finalidade.DESC_FINALIDADE')
          Else
             QRFinalidade.Sql.Add('Order By Tb_finalidade.COD_FINALIDADE');
          QRFinalidade.Open;
        End;
      If FRFinalidade=Nil then
        FRFinalidade:=TFRFinalidade.Create(Application);
      If FFinalidadeParam.RGPreview.ItemIndex=0 then
        FRFinalidade.QRPrimario.Preview
      Else
        FRFinalidade.QRPrimario.Print;
      DMFinalidade.QRFinalidade.Close;
    End;
end;

procedure TFFinalidadeCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert,DsEdit] then
    Begin
      BtMoeda.Enabled:=True;
      BtCodHistoricoBaixa.Enabled:=True;
      BtCodHistoricoJuro.Enabled:=True;
      BtCodHistoricoDesc.Enabled:=True;
      BtCodHistoricoCheque.Enabled:=True;
      BtHistoricoContabil.Enabled:=True;
      BtContValorBaixaCred.Enabled:=True;
      BtContValorBaixaDeb.Enabled:=True;
      BtContValorJuroCred.Enabled:=True;
      BtContValorJuroDeb.Enabled:=True;
      BtContValorDescontoCred.Enabled:=True;
      BtContValorDescontoDeb.Enabled:=True;
      BtVariacaoPos.Enabled:=True;
      BtVariacaoNeg.Enabled:=True;
      SpeedButton1.Enabled := True;
      BtVariacaoPosDeb.Enabled := True;
      BtVariacaoPosCred.Enabled := True;
      BtVariacaoNegDeb.Enabled := True;
      BtVariacaoNegCred.Enabled := True;
      BtDebitoInclusao.Enabled := True;
      BtCreditoInclusao.Enabled := True;
      BtHistoricoInclusao.Enabled := True;
      BtConsContaCredContabil.Enabled := True;
      BtContValorDescontoFinCred.Enabled := True;
      BtContValorDescontoComCred.Enabled := True;
      BtConsBaixaDebContabil.Enabled := True;
      BtConsJuroContabil.Enabled := True;
      BtConsDescontoContabil.Enabled := True;
      BtHistoricoCaixaDevolucao.Enabled := True;
      BtHistoricoCartaoCredito.Enabled := True;
      BtHistoricoCartaoDebito.Enabled := True;
      SBHistoricoCaixaCheque.Enabled := True;
      SBHistoricoJurosCheque.Enabled := True;
      BtHistoricoJurosCredito.Enabled := True;
      BtHistoricoJurosDebito.Enabled := True;
      SBHistoricoPIX.Enabled := True;
      SBHistoricoJurosPIX.Enabled := True;
      BtConsIrDeb.Enabled := True;
      BtConsIrCred.Enabled := True;
      SbHistoricoOutros.Enabled := True;
      SbOutrosDebito.Enabled := True;
      SbOutrosCredito.Enabled := True;
      SBCentroCusto.Enabled := True;
    End
  Else
    Begin
      BtMoeda.Enabled:=False;
      BtCodHistoricoBaixa.Enabled:=False;
      BtCodHistoricoJuro.Enabled:=False;
      BtCodHistoricoDesc.Enabled:=False;
      BtCodHistoricoCheque.Enabled:=False;
      BtHistoricoContabil.Enabled:=False;
      BtContValorBaixaCred.Enabled:=False;
      BtContValorBaixaDeb.Enabled:=False;
      BtContValorJuroCred.Enabled:=False;
      BtContValorJuroDeb.Enabled:=False;
      BtContValorDescontoCred.Enabled:=False;
      BtContValorDescontoDeb.Enabled:=False;
      BtVariacaoPos.Enabled:=False;
      BtVariacaoNeg.Enabled:=False;
      SpeedButton1.Enabled := False;
      BtVariacaoPosDeb.Enabled := False;
      BtVariacaoPosCred.Enabled := False;
      BtVariacaoNegDeb.Enabled := False;
      BtVariacaoNegCred.Enabled := False;
      BtDebitoInclusao.Enabled := False;
      BtCreditoInclusao.Enabled := False;
      BtHistoricoInclusao.Enabled := False;
      BtConsContaCredContabil.Enabled := False;
      BtContValorDescontoFinCred.Enabled := False;
      BtContValorDescontoComCred.Enabled := False;
      BtConsBaixaDebContabil.Enabled := False;
      BtConsJuroContabil.Enabled := False;
      BtConsDescontoContabil.Enabled := False;
      BtHistoricoCaixaDevolucao.Enabled := False;
      BtHistoricoCartaoCredito.Enabled := False;
      BtHistoricoCartaoDebito.Enabled := False;
      SBHistoricoCaixaCheque.Enabled := False;
      SBHistoricoJurosCheque.Enabled := False;
      BtHistoricoJurosCredito.Enabled := False;
      BtHistoricoJurosDebito.Enabled := False;
      SBHistoricoPIX.Enabled := False;
      SBHistoricoJurosPIX.Enabled := False;
      BtConsIrDeb.Enabled := False;
      BtConsIrCred.Enabled := False;
      SbHistoricoOutros.Enabled := False;
      SbOutrosDebito.Enabled := False;
      SbOutrosCredito.Enabled := False;
      SBCentroCusto.Enabled := False;
    End;
end;

procedure TFFinalidadeCad.BtContValorBancoCredClick(
  Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Banco_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorBancoDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Banco_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorDescBcoCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Desc_Bco_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorJuroBcoDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Juro_Bco_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (7);
end;

procedure TFFinalidadeCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Caixa_Inclusao.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
  try
    DSPrimario.DataSet.Delete;
    DMOracle.DBCemapa.Commit;
  except
    raise exception.Create('Não foi possivel excluir registro!');
  end;
end;

procedure TFFinalidadeCad.BtVariacaoPosClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Variacao_Pos.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtVariacaoNegClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Variacao_Neg.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtVariacaoPosDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit37.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit37.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtVariacaoPosCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit39.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit39.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtVariacaoNegDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit41.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit41.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal = MrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtVariacaoNegCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit43.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit43.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMFinalidade do
    QFinalidade.Close;
  Action := CaFree;
  FFinalidadeCad := Nil;
end;

procedure TFFinalidadeCad.BtDebitoInclusaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit45.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit45.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_INCLUSAO_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtCreditoInclusaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit46.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit46.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_INCLUSAO_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtHistoricoInclusaoClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons=Nil then
    FHistContabilCons:=TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Hist_Contabil_Inclusao.Value:=DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;

end;

procedure TFFinalidadeCad.BtConsContaCredContabilClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit51.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit51.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtContValorDescontoFinCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit53.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit53.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.BtContValorDescontoComCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit54.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit54.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCod_Contabil_Vl_Desc_Com_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.BtConsBaixaDebContabilClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit57.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit57.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.BtConsJuroContabilClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit58.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit58.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.SBCentroCustoConsClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit59.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit59.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=MrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;
end;

procedure TFFinalidadeCad.BtHistoricoCaixaDevolucaoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Caixa_Devolucao.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtConsIrDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit22.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit22.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=MrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_IR_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.BtConsIRCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit23.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit23.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal=MrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_IR_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.SbHistoricoOutrosClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
     FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCod_Historico_Outros.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;

end;

procedure TFFinalidadeCad.SbOutrosDebitoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit25.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit25.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal = MrOk then
   Begin
     DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
     DMPlanoConta.QPlanoContaCons.Close;
   End;
end;

procedure TFFinalidadeCad.SbOutrosCreditoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If DbEdit26.Text <> '' then
   Begin
     FPlanoContaCons.MeNumConta.Text := DbEdit26.Text;
     FPlanoContaCons.BtProcurarClick(Self);
   End;
  If FPlanoContaCons.ShowModal = MrOk then
    Begin
      DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
      DMPlanoConta.QPlanoContaCons.Close;
    End;

end;

procedure TFFinalidadeCad.BtHistoricoCartaoCreditoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_CARTAO_CREDITO.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtHistoricoCartaoDebitoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_CARTAO_DEBITO.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtHistoricoJurosCreditoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_CREDITO.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.BtHistoricoJurosDebitoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_DEBITO.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBHistoricoJurosChequeClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_CHEQUE.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBHistoricoCaixaChequeClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_CAIXA_CHEQUE.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBCentroCustoClick(Sender: TObject);
begin
  inherited;
 If FCentroCustoCons = Nil then
    FCentroCustoCons:= TFCentroCustoCons.Create(Application);

 If DbEdit35.Text <> '' then
 Begin
    FCentroCustoCons.MeTexto.Text := DbEdit35.Text;
    FCentroCustoCons.BtProcurarClick(Self);
 End;

 If FCentroCustoCons.Showmodal = MrOk then
    DMFinalidade.QFinalidadeCOD_CENTRO_CUSTO.Value := DMCentroCusto.QCentroCustoConsCod_Centro_Custo.Value;

end;


procedure TFFinalidadeCad.SBHistoricoPIXClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_PIX.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFFinalidadeCad.SBHistoricoJurosPIXClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
     DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_PIX.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

function TFFinalidadeCad.ValidarIndFinalidadePreenchido: Boolean;
begin
  Result := True;

  if Trim(DBRadioGroup11.Value) = '' then
  begin
    ShowMessage('Aviso: O campo "Pagar ou Receber" precisa ser informado.');
    Result := False;
  end;
end;

end.

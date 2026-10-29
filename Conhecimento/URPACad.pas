unit URPACad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls,OracleData, OraTeste, Grids, DBGrids, DBDirceu, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;
                                                            
type
  TFRPACad = class(TFTCadSimples)
    ImpressoRecibo1: TMenuItem;
    RelatrioServiosPrestados1: TMenuItem;
    ImpressoReciboRPAServio1: TMenuItem;
    RelatrioRPA1: TMenuItem;
    RelatrioFiscalICMSeINSSFrete1: TMenuItem;
    RelatrioFiscalICMSeINSSServios1: TMenuItem;
    Operaes1: TMenuItem;
    Confima1: TMenuItem;
    CancelarRpa1: TMenuItem;
    Voltarconfirmao1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    RelServioTransporteAutnomo1: TMenuItem;
    RelatTransporteAutnomoMunicipal1: TMenuItem;
    RelIRF1: TMenuItem;
    AcrescentarPesoChegada1: TMenuItem;
    RelGernciadeFretesIntermunicipais1: TMenuItem;
    RelAutnomosINSS1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SBNota: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    SBFilial: TSpeedButton;
    Label8: TLabel;
    SBMotorista: TSpeedButton;
    Label6: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Label19: TLabel;
    SBNotaEntrada: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Bevel2: TBevel;
    Label10: TLabel;
    SBOperacao: TSpeedButton;
    Label13: TLabel;
    Label27: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEDSest_Senat: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit18: TDBEdit;
    DBRGTipoRpa: TDBRadioGroup;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit20: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    SbContrato: TBitBtn;
    DsRpa_Alt: TDataSource;
    Label28: TLabel;
    DBEdit29: TDBEdit;
    Label29: TLabel;
    DBEdit30: TDBEdit;
    Label30: TLabel;
    DBEdit31: TDBEdit;
    Label31: TLabel;
    DBEdit32: TDBEdit;
    Label32: TLabel;
    DBEdit33: TDBEdit;
    Label33: TLabel;
    DBEdit34: TDBEdit;
    Label34: TLabel;
    DBEdit35: TDBEdit;
    Label35: TLabel;
    DBEdit36: TDBEdit;
    Label36: TLabel;
    DBEdit37: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Label37: TLabel;
    DBEdit38: TDBEdit;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBEdit11: TDBEdit;
    Label23: TLabel;
    DBEdit13: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit39: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    BitBtn1: TBitBtn;
    Label38: TLabel;
    DBEdit40: TDBEdit;
    RelRPAcContrato1: TMenuItem;
    RelRPAsContrato1: TMenuItem;
    Label39: TLabel;
    DBEdit41: TDBEdit;
    Label40: TLabel;
    DBEdit42: TDBEdit;
    Label41: TLabel;
    DBEdit43: TDBEdit;
    Label42: TLabel;
    DBEdit44: TDBEdit;
    SbEmbarque: TSpeedButton;
    RelatrioAcompanhamentoRPa1: TMenuItem;
    Label43: TLabel;
    DBEdit45: TDBEdit;
    SbEstado: TSpeedButton;
    Label44: TLabel;
    DBEdit46: TDBEdit;
    Label47: TLabel;
    DBEdit47: TDBEdit;
    Label48: TLabel;
    DBEdit48: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure ImpressoRecibo1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure RelatrioServiosPrestados1Click(Sender: TObject);
    procedure ImpressoReciboRPAServio1Click(Sender: TObject);
    procedure RelatrioRPA1Click(Sender: TObject);
    procedure RelatrioFiscalICMSeINSSFrete1Click(Sender: TObject);
    procedure RelatrioFiscalICMSeINSSServios1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBNotaEntradaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure Confima1Click(Sender: TObject);
    procedure Voltarconfirmao1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure CancelarRpa1Click(Sender: TObject);
    procedure DBEdit20Change(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure RelServioTransporteAutnomo1Click(Sender: TObject);
    procedure RelatTransporteAutnomoMunicipal1Click(Sender: TObject);
    procedure RelIRF1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure AcrescentarPesoChegada1Click(Sender: TObject);
    procedure RelGernciadeFretesIntermunicipais1Click(Sender: TObject);
    procedure RelAutnomosINSS1Click(Sender: TObject);
    procedure SBOperacaoClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit27Change(Sender: TObject);
    procedure SbContratoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RelRPAcContrato1Click(Sender: TObject);
    procedure RelRPAsContrato1Click(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure SbEmbarqueClick(Sender: TObject);
    procedure RelatrioAcompanhamentoRPa1Click(Sender: TObject);
    procedure SbEstadoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Emite_Rpa_Moinho;
  public
    { Public declarations }
  end;

var
  FRPACad: TFRPACad;

implementation

uses URPA_cl, UNotaSaidaCons, UMotoristaCons, UNotaSaida_cl, UMotorista_cl,
  URPACons, UFilialCons, UFilial_cl, URRPA, UBaseCalculoIRF_cl, UOracle_cl,
  URRelacaoServicoPrestado, UTParametro, UConhecimentoParam, UBiblioteca,
  URReciboRPA, USequencia_cl, UParamSistema_cl, URReciboRPAServico,
  URelatorioRPA, URRelatorioFiscalFrete, URRelatorioFiscalServico,
  UCadastroCons, UCadastro_cl, UNotaEntradaCons, UConhecimento_CP,
  UContasPagar_cl, UNotaEntrada_cl, UPlanilha_cl, UCaixaLanc_Cont, URRecibo,
  URTransporteAutonomo, URTransporteMunicipal, UUsuario_cl,
  URRelatorioIRF_RPA, UPesoChegada, URGerenciaRPA, URAutonomosINSS,
  UOperacaoCons, UOperacao_cl, UContratoVenda_Cons, Ucontrato_cl,
  URRPAContrato, URRPASemContrato, UBancoAgencia_cl, UEmbarqueCons,
  UEmbarque_cl, URRpaCarga, UEstadoCons, UEstado_cl;

{$R *.DFM}

procedure TFRPACad.FormActivate(Sender: TObject);
begin
  inherited;
  DMRPA.QRPA.Open;
  DMRPA.QRpa_Alt.Open;
end;

procedure TFRPACad.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
     FNotaSaidaCons:=TFNotaSaidaCons.create(application);
  if FNotaSaidaCons.showmodal = mrOk then
  begin
     If DMNotaSaida.QNotaSaidaConsInd_Situacao.value <> '2' Then
        Raise Exception.Create('Nota Fiscal Não Está Confirmada');
     If (DMNotaSaida.QNotaSaidaConsCod_Estado.Value <> 'PR') And (DMNotaSaida.QNotaSaidaConsInd_Entrada_Saida.Value = 'S') Then
        Raise Exception.Create('Não permite usar RPA para fora do estado');
     DMRPA.QRPACod_Nota_Cab.value:=DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.value;
     DMRPA.QRPACod_Filial.value:=DMNotaSaida.QNotaSaidaConsCod_Filial.value;
     DMRPA.QRPACod_Cadastro.value:=DMNotaSaida.QNotaSaidaConsCod_Transportador.value;
     DMRpa.QRpaDesc_Origem.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+DMNotaSaida.QNotaSaidaConsCod_Filial.Text);
     DMRpa.QRpaDesc_Destino.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '+DMNotaSaida.QNotaSaidaConsCod_Cadastro.Text);
     DMRpa.QRpaCod_Cadastro_Parceiro.Text := DMNotaSaida.QNotaSaidaConsCod_Cadastro_Parceiro.Text;
     DMRpa.QRpaCod_Estado.Text := DMNotaSaida.QNotaSaidaConsCod_Estado.Text;
     DMRpa.QRpaDesc_Placa.Text := DMNotaSaida.QNotaSaidaConsDesc_Placa.Text;
     If DMNotaSaida.QNotaSaidaConsCod_Ordem_Carregamento_Cab.Text <> '' Then
      Begin
        DMRpa.QRpaVal_Pedagio.Value:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_PEDAGIO FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaSaida.QNotaSaidaConsCod_Ordem_Carregamento_Cab.Text));
        DMRpa.QRpaVal_Frete_Ton.Value:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_FRETE_TON FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaSaida.QNotaSaidaConsCod_Ordem_Carregamento_Cab.Text));
        DMRpa.QRpaCod_Cadastro.Value:=StrToInt(DMOracle.BuscaNome('SELECT COD_MOTORISTA FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaSaida.QNotaSaidaConsCod_Ordem_Carregamento_Cab.Text));
      End;
  end;
end;

procedure TFRPACad.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMRPA.QRPACod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFRPACad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
  begin
    SBNota.Enabled:=True;
    SBMotorista.Enabled:=True;
    SBFilial.Enabled:=True;
    SBNotaEntrada.Enabled:=True;
  end
  else
  begin
    SBNota.Enabled:=False;
    SBMotorista.Enabled:=False;
    SBFilial.Enabled:=False;
    SBNotaEntrada.Enabled:=False;
  end;
end;

procedure TFRPACad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRPACons = nil then
    FRPACons := TFRPACons.create(application);
  If FRPACons.showmodal = mrOk then
  begin
    with DMRPA do
    begin
      QRPA.Close;
      QRPA.SetVariable('PK',QRPAConsCOD_RPA.Value);
      QRPA.Open;
    end;
  end;
end;

procedure TFRPACad.SBFilialClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
     DMRPA.QRPACod_Filial.value:=DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFRPACad.ImpressoRecibo1Click(Sender: TObject);
var
  wCont:Integer;
  wEntradaSaida,wTipoProduto:String;
begin
  inherited;
  with DMRPA do
  begin
    if QRpaInd_Situacao.Value <> '2' Then
      raise Exception.Create('Só é Permitido Imprimir Rpa Confirmado');
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       Emite_Rpa_Moinho
    Else
      if (QRPAInd_Tipo_RPA.Value = 'F') or (QRPAInd_Tipo_RPA.Value = 'M') then
      begin
        QRRPAFrete.close;
        QRRPAFrete.setVariable('Cod_RPA',QRPACOD_RPA.Value);
        QRRPAFrete.open;
        if FConhecimentoParam = nil then
          FConhecimentoParam := TFConhecimentoParam.create(application);
        if FReciboRPAFrete = nil then
          FReciboRPAFrete := TFReciboRPAFrete.create(application);
        If DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' Then
           FReciboRPAFrete.QRSestSenat.Enabled := False;
        if FConhecimentoParam.RGPreview.ItemIndex = 0 then
          FReciboRPAFrete.QRPrimario.preview //aqui
        else
          FReciboRPAFrete.QRPrimario.Print;
{          if (QRPAVal_Pedagio.Text <> '') or (QRPAVal_Pedagio.Text <> '0' )then
          begin
            if FRRecibo = nil then
              FRRecibo:=TFRRecibo.Create(Application);
            DMFilial.QFilial.Close;
            DMFilial.QFilial.SetVariable('PK',QRPACOD_Filial.Value);
            DMFilial.QFilial.Open;
            //------------- Inicio preenchimento dos campos label do recibo
            FRRecibo.QRLCliente.Caption:=DMFilial.QFilialDesc_Filial.Value;
            FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(QRPAVal_Pedagio.Value,'REAL');
            FRRecibo.pValor:=DMRPA.QRPAVAL_Pedagio.Value;
            FRRecibo.QRLNumRecibo.Caption:= IntToStr(DMSequencia.Sequencia(DMFilial.QFilialCod_Filial.Value,'RECIBO'));
            FRRecibo.QRLReferente.Caption:='prestação de serviços de Transporte Autônomo';
            FRRecibo.QRLData.Caption:=DateToStr(QRPADT_EMISSAO.VALUE);
            FRRecibo.QRLResponsavel.Caption:='Responsável';
            //----------------
            FRRecibo.QRPrimario.Preview;
            DMFilial.QFilial.Close;
          end;    }
        //end
        //else
//        begin
//          ---impressao formulário
//          if Imp = Nil Then
//            Imp := TImp.Create;
//          Imp.AbreImpressora;
//          Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
//          wCont := 0;
//          QRRPAInterMunicipal.close;
//          QRRPAInterMunicipal.setVariable('Cod_RPA',QRPACOD_RPA.Value);
//          QRRPAInterMunicipal.Open;
//
//          wEntradaSaida:=DMOracle.BuscaNome('SELECT TB_NOTA_CAB.IND_ENTRADA_SAIDA FROM TB_NOTA_CAB'
//                                            ,' COD_NOTA_CAB = '+Trim(QRPACod_Nota_cab.Text));
//
//          wTipoProduto:=DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO, TB_NOTA_CAB T1, TB_NOTA_ITEM T2 ',
//                                              ' T1.COD_NOTA_CAB = T2.COD_NOTA_CAB AND TB_PRODUTO.COD_PRODUTO = T2.COD_PRODUTO '+
//                                              ' AND T1.COD_NOTA_CAB = '+Trim(QRPACod_Nota_cab.Text));
//          ---inicio da impressao dos campos
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalDESC_FILIAL.Text);
//          inc(wCont);
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Text+' - '+QRRPAInterMunicipalESTADO_ORIGEM.Text+' TEL:'+QRRPAInterMunicipalDESC_TELEFONE.Text);
//          inc(wCont);
//          Imp.WriteXY(2.5,wCont,'C.N.P.J. '+QRRPAInterMunicipalNUM_CGC.Text+' I.E. '+QRRPAInterMunicipalDESC_INSCRICAO.Text);
//          Imp.WriteXY(10.3,wCont,QRRPAInterMunicipalNUM_RPA.Text);
//          Imp.WriteXY(13.0,wCont,QRRPAInterMunicipalDT_Emissao.Text);
//          wCont := wCont + 5;
//          Imp.WriteXY(2.7,wCont,QRRPAInterMunicipalNUM_NOTA.Text);
//          if wEntradaSaida = 'S' then
//          begin
//            Imp.WriteXY(7.2,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Value);
//            Imp.WriteXY(13.0,wCont,QRRPAInterMunicipalESTADO_ORIGEM.Value);
//          end
//          else
//          begin
//            Imp.WriteXY(7.2,wCont,QRRPAInterMunicipalCIDADE_DESTINO.Value);
//            Imp.WriteXY(13.0,wCont,QRRPAInterMunicipalESTADO_DESTINO.Value);
//          end;
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalDT_Emissao.Text);
//          if wEntradaSaida = 'S' then
//          begin
//            Imp.WriteXY(7.2,wCont,QRRPAInterMunicipalCIDADE_DESTINO.Value);
//            Imp.WriteXY(13.0,wCont,QRRPAInterMunicipalESTADO_DESTINO.Value);
//          end
//          else
//          begin
//            Imp.WriteXY(7.2,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Value);
//            Imp.WriteXY(13.0,wCont,QRRPAInterMunicipalESTADO_ORIGEM.Value);
//          end;
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalMOTORISTA.Text+' - '+QRRPAInterMunicipalCOD_MOTORISTA.Text);
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_SERVICO.Value,2,6));
//          wCont := wCont + 2;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalDESC_ENDERECO.Text);
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_ADIANTAMENTO.Value,2,6));
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalDESC_CIDADE.Text);
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_SEST_SENAT.Value,2,6));
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalNUM_CGC_CPF.Text);
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_IRF.Value,2,6));
//          wCont := wCont + 2;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalNUM_INSCRICAO.Text);
//          Imp.WriteXY(11,wCont,'INSS');
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_INSS_FORNECEDOR.Value,2,6));
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,QRRPAInterMunicipalDESC_INSCRICAO_INSS.Text);
//          Imp.WriteXY(13.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_LIQUIDO.Value,2,6));
//          wCont := wCont + 3;
//          Imp.WriteXY(1.0,wCont,'TRANSPORTADOR OPTANTE PELO CREDITO PRESUMIDO DE ICMS SOBRE SERVICOS DE TRANSPORTE CONFORME');
//          inc(wCont);
//          Imp.WriteXY(1.0,wCont,'ART.50 DO DECRETO 5.141/01 - RICMS TRANSFIRO O CREDITO PRESUMIDO DE ICMS SOBRE');
//          inc(wCont);
//          Imp.WriteXY(1.0,wCont,'SERVICOS DE TRANSPORTE PARA O TOMADOR DO SERVICO, NOS TERMOS DO ART. 500, § 2.');
//          inc(wCont);
//          Imp.WriteXY(1.0,wCont,'PLANTAO PAMCARY 24 Hrs - ACIDENTES  LIGACAO GRATUITA  0800-112521');
//          wCont := wCont + 3;
//          Imp.WriteXY(1.2,wCont,'24');
//          Imp.WriteXY(6.1,wCont,'0,25');
//          Imp.WriteXY(13.3,wCont,QRRPAInterMunicipalDESC_PLACA.Text);
//          wCont := wCont + 3;
//          if wTipoProduto <> 'AGRICOLA' then
//          begin
//            QCalculaPesoSaida.Close;
//            QCalculaPesoSaida.setVariable('COD_NOTA_CAB',QRPACod_Nota_cab.Value);
//            QCalculaPesoSaida.Open;
//            Imp.WriteXY(3.0,wCont,QCalculaPesoSaidaQuantidade.Text);
//          end
//          else
//            Imp.WriteXY(3.0,wCont,QRRPAInterMunicipalPeso_Saida.Text);
//
//          Imp.WriteXY(12.2,wCont,'0,3%');
//          wCont := wCont + 2;
//          Imp.WriteXY(3.2,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_FRETE_TON.Value,2,6));
//          wCont := wCont + 3;
//          Imp.WriteXY(2.5,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_PEDAGIO.Value,2,6));
//          Imp.WriteXY(9.5,wCont,QRRPAInterMunicipalMOTORISTA.Text);
//          wCont := wCont + 6;
//          if(QRRPAInterMunicipalVAL_PEDAGIO.Value <> 0) and (QRRPAInterMunicipalVAL_PEDAGIO.Text <> '') then
//          begin
//            Imp.WriteXY(2.5,wCont,'CONFORME MEDIDA PROVISORIA N 2025, DE 2 DE JULHO DE 2000, ATESTO QUE');
//            inc(wCont);
//            Imp.WriteXY(1.0,wCont,'RECEBI VALE-PEDAGIO OU VALOR CORRESPONDENTE.');
//          end;
//          wCont := wCont + 4;
//          Imp.WriteXY(2.5,wCont,'R$'+Bib.NumToTexto(QRRPAInterMunicipalVAL_PEDAGIO.Value,2,6)+
//                     ' ('+Bib.Extenso(QRRPAInterMunicipalVAL_PEDAGIO.Value,'REAL')+')');
//          wCont := wCont + 2;
//          if wEntradaSaida = 'S' then
//          begin
//            Imp.WriteXY(1.9,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Value);
//            Imp.WriteXY(6.2,wCont,QRRPAInterMunicipalESTADO_ORIGEM.Value);
//            Imp.WriteXY(9.2,wCont,QRRPAInterMunicipalCIDADE_DESTINO.Value);
//            Imp.WriteXY(14.0,wCont,QRRPAInterMunicipalESTADO_DESTINO.Value);
//          end
//          else
//          begin
//            Imp.WriteXY(1.9,wCont,QRRPAInterMunicipalCIDADE_DESTINO.Value);
//            Imp.WriteXY(6.2,wCont,QRRPAInterMunicipalESTADO_DESTINO.Value);
//            Imp.WriteXY(9.2,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Value);
//            Imp.WriteXY(14.0,wCont,QRRPAInterMunicipalESTADO_ORIGEM.Value);
//          end;
//          wCont := wCont + 3;
//          Imp.WriteXY(0.7,wCont,QRRPAInterMunicipalDESC_VIA.Value);
//          wCont := wCont + 3;
//          Imp.WriteXY(1.0,wCont,FormatDateTime(' dd "de" mmmm "de" yyyy',strToDate(QRRPAInterMunicipalDT_Emissao.Text)));
//          Imp.WriteXY(10.5,wCont,QRRPAInterMunicipalMOTORISTA.Text);
//          ---termino da impressao dos campos
//          {while wCont <= 65 do
//          begin
//            Imp.WriteXY(0.7,wCont,IntToStr(wCont));
//            inc(wCont);
//          end;}
//          Imp.SaltaPagina;
//          Imp.FechaImpressora;  // Finaliza os serviços de Impressao
//        end;
        QRRPAFrete.Close;
      end
      else
        showmessage('O RPA selecionado não pode ser impresso pois refere-se a um Serviço');
  end;
end;

procedure TFRPACad.SBConfirmarClick(Sender: TObject);
Begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMRPA.QRPACOD_FILIAL.Text),'CONHECIMENTO');
  If Trim(DbEdit12.Text) <> '' Then
   Begin
     DMCadastro.QCadastro.Close;
     DMCadastro.QCadastro.SetVariable('Pk',Trim(DbEdit12.Text));
     DMCadastro.QCadastro.Open;
     If DMCadastro.QCadastroNUM_CGC_CPF.Text = '' Then
        Raise Exception.Create('Cadastro Motorista sem CPF');
     If DMCadastro.QCadastroNUM_INSCRICAO.Text = '' Then
        Raise Exception.Create('Cadastro Motorista sem RG');
     If DMCadastro.QCadastroDESC_INSCRICAO_INSS.Text = '' Then
        Raise Exception.Create('Cadastro Motorista sem Inscrição INSS');
     If DMCadastro.QCadastroDESC_PLACA.Text = '' Then
        Raise Exception.Create('Cadastro Motorista sem Placa');
   End;

  if (Trim(DbEdit1.Text) = '') Or (Trim(DbEdit1.Text) = '0')then
  begin
    if DBRGTipoRpa.ItemIndex = 0 then
      DMRpa.QRPANUM_RPA.Value:=DMSequencia.Sequencia(Trunc(DMRpa.QRPACod_Filial.Value),'RPA_INTER_MUNICIPAL')
    else
      DMRpa.QRPANUM_RPA.Value:=DMSequencia.Sequencia(Trunc(DMRpa.QRPACod_Filial.Value),'RPA');
  end;
  DMRpa.QRpaVal_Liquido.Value := 0;
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFRPACad.RelatrioServiosPrestados1Click(Sender: TObject);
var
  wHoje,wData_I,wData_F :TDateTime;
  wDia,wMes,wAno :word;
begin
  inherited;
  with DMRPA do
  begin
    QRServicoPrestado.close;
    if FRRelacaoServicoPrestado = nil then
      FRRelacaoServicoPrestado:= TFRRelacaoServicoPrestado.create(application);
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[0].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.EDFilial.Text),'CONHECIMENTO');
      QRServicoPrestado.setvariable('Desc_Cidade', uppercase(FConhecimentoParam.EDCidade.Text));
      wHoje:=date;
      DecodeDate(wHoje,wAno,wMes,wDia);
      wData_I:=StrToDate('01/'+FConhecimentoParam.CBMes.text+'/'+trim(FConhecimentoParam.ME1Ano.text));
      wData_F:= DMOracle.UltimoDiaMes(StrToDate('01/'+FConhecimentoParam.CBMes.text+'/'+trim(FConhecimentoParam.ME1Ano.text)));
      QRServicoPrestado.setvariable('DT_EMISSAO_I',wData_I);
      QRServicoPrestado.setvariable('DT_EMISSAO_F',wData_F);
      if FconhecimentoParam.EDFilial.text <> '' then
        QRServicoPrestado.setvariable('COD_FILIAL',FConhecimentoParam.EDFilial.Text)
      else
        QRServicoPrestado.SetVariable('COD_FILIAL',null);

      QRServicoPrestado.Open;
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRRelacaoServicoPrestado.QRPrimario.Preview
      else
        FRRelacaoServicoPrestado.QRPrimario.Print;
     end;
  end;
end;

procedure TFRPACad.ImpressoReciboRPAServio1Click(Sender: TObject);
begin
  inherited;
   with DMRPA do
  begin
    If DMRpa.QRpaInd_Situacao.Value <> '2' Then
      raise Exception.Create('Só é Permitido Imprimir Rpa Confirmado');
    DmUsuario.Checar_Filial_Usuario( Trim(QRPACOD_FILIAL.Text),'CONHECIMENTO');
    if QRPAInd_Tipo_RPA.Value = 'S' then
    begin
      if FConhecimentoParam = nil then
         FConhecimentoParam := TFConhecimentoParam.create(application);
      if FReciboRPAServico = nil then
        FReciboRPAServico := TFReciboRPAServico.create(application);
      QRRPAServico.close;
      QRRPAServico.setVariable('COD_RPA',QRPACod_RPA.Value);
      QRRPAServico.open;
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FReciboRPAServico.QRPrimario.preview
      else
        FReciboRPAServico.QRPrimario.Print;
      QRRPAServico.Close;
    end
    else
      showmessage('O RPA selecionado não pode ser impresso pois refere-se a um Frete');
  end;
end;

procedure TFRPACad.RelatrioRPA1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
     FConhecimentoParam:=TFConhecimentoParam.create(application);
  FConhecimentoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FConhecimentoParam.showmodal = mrOk then
   begin
     with DMRPA do
     begin
      if FRelacaoRPA = nil then
        FRelacaoRPA := TFRelacaoRPA.create(application);
      FRelacaoRPA.QRLDescricao.Caption := '';
      QRRPA.close;
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME2Filial.Text),'CONHECIMENTO');
      if trim(FConhecimentoParam.ME2RPA.text) <> '' then
         QRRPA.SetVariable('Num_RPA',trim(FConhecimentoParam.ME2RPA.text))
      else
         QRRPA.SetVariable('Num_RPA',null);
      if trim(FConhecimentoParam.ME2Motorista.text) <> '' then
       Begin
         QRRPA.SetVariable('Cod_Cadastro',trim(FConhecimentoParam.ME2Motorista.text));
         FRelacaoRPA.QRLDescricao.Caption :=  'Motorista:'+Trim(FConhecimentoParam.ME2Motorista.text) +  ' - ' + FConhecimentoParam.Ed2Motorista.text;
       End
      else
         QRRPA.SetVariable('Cod_Cadastro',null);
      if trim(FConhecimentoParam.ME2DT_Emissao_I.text) <> '' then
         QRRPA.SetVariable('DT_EMISSAO_I',trim(FConhecimentoParam.ME2DT_Emissao_I.text));
      if trim(FConhecimentoParam.ME2DT_Emissao_F.text) <> '' then
         QRRPA.SetVariable('DT_EMISSAO_F',trim(FConhecimentoParam.ME2DT_Emissao_F.text));
      if trim(FConhecimentoParam.ME2Filial.text) <> '' then
         QRRPA.SetVariable('COD_FILIAL',trim(FConhecimentoParam.ME2Filial.text))
      else
         QRRPA.SetVariable('COD_FILIAL',null);
      Case FConhecimentoParam.Rg2Tipo.ItemIndex of
        0 : QRRPA.SetVariable('TIPO_RPA','F');
        1 : QRRPA.SetVariable('TIPO_RPA','M');
        2 : QRRPA.SetVariable('TIPO_RPA','S');
        3 : QRRPA.SetVariable('TIPO_RPA',Null);
      End;
      QRRPA.open;
      FRelacaoRPA.QrlTitulo.Caption :='Relação Recibos de Pagamento a Autônomo de ' +
                   FConhecimentoParam.ME2DT_Emissao_I.text + ' Até ' +
                   FConhecimentoParam.ME2DT_Emissao_F.text;
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRelacaoRPA.QRPrimario.Preview
      else
        FRelacaoRPA.QRPrimario.Print;
      QRRPA.close;
    End;
  End;
end;

procedure TFRPACad.RelatrioFiscalICMSeINSSFrete1Click(Sender: TObject);
var
  wHoje,wData_I,wData_F :TDateTime;
  wDia,wMes,wAno :word;
begin
inherited;
  with DMRPA do
  begin
    QRRelatorioFiscalServico.close;
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[3].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME4Filial.Text),'CONHECIMENTO');
      wHoje:=date;
      DecodeDate(wHoje,wAno,wMes,wDia);
      wData_I:=StrToDate('01/'+FConhecimentoParam.CB4Mes.text+'/'+trim(FConhecimentoParam.ME4Ano.text));
      wData_F:= DMOracle.UltimoDiaMes(StrToDate('01/'+FConhecimentoParam.CB4Mes.text+'/'+trim(FConhecimentoParam.ME4Ano.text)));
      QRRelatorioFiscalServico.setvariable('DT_EMISSAO_I',wData_I);
      QRRelatorioFiscalServico.setvariable('DT_EMISSAO_F',wData_F);
      If FConhecimentoParam.ME4Filial.Text = '' Then
        QRRelatorioFiscalServico.setvariable('COD_FILIAL',NULL)
      else
        QRRelatorioFiscalServico.setvariable('COD_FILIAL',FConhecimentoParam.ME4Filial.Text);
      //--------- passagem do tipo de ordenação
      QRRelatorioFiscalServico.SQL[QRRelatorioFiscalServico.SQL.Count -1]:='';
      if FConhecimentoParam.RGOrdem4.ItemIndex = 0 then
        QRRelatorioFiscalServico.SQL.Add('TB_RPA.DT_EMISSAO')
      else
        if FConhecimentoParam.RGOrdem4.ItemIndex = 1 then
          QRRelatorioFiscalServico.SQL.Add('TB_Cadastro.Nome')
        else
          QRRelatorioFiscalServico.SQL.Add('TB_RPA.NUM_RPA');
      QRRelatorioFiscalServico.Open;

      if FRelatorioFiscalServico = nil then
        FRelatorioFiscalServico:= TFRelatorioFiscalServico.create(application);
      FRelatorioFiscalServico.QRLCompetencia.Caption:= Bib.NomeMes(StrToInt(FConhecimentoParam.CB4Mes.text))+' /'+trim(FConhecimentoParam.ME4Ano.text);
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRelatorioFiscalServico.QRPrimario.Preview
      else
        FRelatorioFiscalServico.QRPrimario.Print;
      QRRelatorioFiscalServico.Close;
    end;
  end;
end;
procedure TFRPACad.RelatrioFiscalICMSeINSSServios1Click(Sender: TObject);
var
  wHoje,wData_I,wData_F :TDateTime;
  wDia,wMes,wAno :word;
begin
inherited;
  with DMRPA do
  begin
    QRRelatorioFiscalFrete.close;
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[2].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME3Filial.Text),'CONHECIMENTO');
      wHoje:=date;
      DecodeDate(wHoje,wAno,wMes,wDia);
      wData_I:=StrToDate('01/'+FConhecimentoParam.CB3Mes.text+'/'+trim(FConhecimentoParam.ME3Ano.text));
      wData_F:= DMOracle.UltimoDiaMes(StrToDate('01/'+FConhecimentoParam.CB3Mes.text+'/'+trim(FConhecimentoParam.ME3Ano.text)));
      QRRelatorioFiscalFrete.setvariable('DT_EMISSAO_I',wData_I);
      QRRelatorioFiscalFrete.setvariable('DT_EMISSAO_F',wData_F);
      If FConhecimentoParam.ME3Filial.Text = '' Then
        QRRelatorioFiscalFrete.setvariable('COD_FILIAL',NULL)
      else
        QRRelatorioFiscalFrete.setvariable('COD_FILIAL',FConhecimentoParam.ME3Filial.Text);
      //--------- passagem do tipo de ordenação
      QRRelatorioFiscalFrete.SQL[QRRelatorioFiscalFrete.SQL.Count -1]:='';
      if FConhecimentoParam.RGOrdem3.ItemIndex = 0 then
        QRRelatorioFiscalFrete.SQL.Add('TB_RPA.DT_EMISSAO')
      else
        if FConhecimentoParam.RGOrdem3.ItemIndex = 1 then
          QRRelatorioFiscalFrete.SQL.Add('TB_Cadastro.Nome')
        else
          QRRelatorioFiscalFrete.SQL.Add('TB_RPA.NUM_RPA');
      Case FConhecimentoParam.Rg3Tipo.ItemIndex Of
        0 : QRRelatorioFiscalFrete.setvariable('TIPO_RPA','F');
        1 : QRRelatorioFiscalFrete.setvariable('TIPO_RPA','M');
        2 : QRRelatorioFiscalFrete.setvariable('TIPO_RPA','S');
        3 : QRRelatorioFiscalFrete.setvariable('TIPO_RPA',Null);
      End;  
      QRRelatorioFiscalFrete.Open;

      if FRelatorioFiscalFrete = nil then
        FRelatorioFiscalFrete:= TFRelatorioFiscalFrete.create(application);
      FRelatorioFiscalFrete.QRLCompetencia.Caption:= Bib.NomeMes(StrToInt(FConhecimentoParam.CB3Mes.text))+'/'+trim(FConhecimentoParam.ME3Ano.text);

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRelatorioFiscalFrete.QRPrimario.Preview
      else
        FRelatorioFiscalFrete.QRPrimario.Print;
      QRRelatorioFiscalFrete.Close;
    end;
  end;
end;

procedure TFRPACad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMRPA do
  begin
    QRPA.Close;
    QRPACons.Close;
    DMRPA.QRpa_Alt.Close;
    Action:=CAFREE;
    FRPACAD:= Nil;
  end;
end;

procedure TFRPACad.SBNotaEntradaClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
     FNotaEntradaCons:=TFNotaEntradaCons.create(application);
  if FNotaEntradaCons.showmodal = mrOk then
  begin
     If DMNotaEntrada.QNotaEntradaConsInd_Situacao.value <> '2' Then
        Raise Exception.Create('Nota Fiscal Não Está Confirmada');
     If (DMNotaEntrada.QNotaEntradaConsCod_Estado.Value <> 'PR') And (DMNotaEntrada.QNotaEntradaConsInd_Entrada_Saida.Value = 'S') Then
        Raise Exception.Create('Não permite usar RPA para fora do estado');
     DMRPA.QRPACod_Nota_Cab.value:=DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.value;
     DMRPA.QRPACod_Filial.value:=DMNotaEntrada.QNotaEntradaConsCod_Filial.value;
     DMRPA.QRPACod_Cadastro.value:=DMNotaEntrada.QNotaEntradaConsCod_Transportador.value;
     DMRpa.QRpaDesc_Origem.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '+DMNotaEntrada.QNotaEntradaConsCod_Cadastro.Text);
     DMRpa.QRpaDesc_Destino.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+DMNotaEntrada.QNotaEntradaConsCod_Filial.Text);
     DMRpa.QRpaCod_Cadastro_Parceiro.Text := DMNotaEntrada.QNotaEntradaConsCod_Cadastro_Parceiro.Text;
     DMRpa.QRpaDesc_Placa.Text := DMNotaEntrada.QNotaEntradaConsDesc_Placa.Text;
     DMRpa.QRpaCod_Estado.Text := DMNotaEntrada.QNotaEntradaConsCod_Estado.Text;
     If DMNotaEntrada.QNotaEntradaConsCod_Ordem_Carregamento_Cab.Text <> '' Then
      Begin
        DMRpa.QRpaVal_Pedagio.Value:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_PEDAGIO FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaEntrada.QNotaEntradaConsCod_Ordem_Carregamento_Cab.Text));
        DMRpa.QRpaVal_Frete_Ton.Value:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_FRETE_TON FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaEntrada.QNotaEntradaConsCod_Ordem_Carregamento_Cab.Text));
        DMRpa.QRpaCod_Cadastro.Value:=StrToInt(DMOracle.BuscaNome('SELECT COD_MOTORISTA FROM TB_ORDEM_CARREGAMENTO_ITEM','COD_ORDEM_CARREGAMENTO_CAB = '+DMNotaEntrada.QNotaEntradaConsCod_Ordem_Carregamento_Cab.Text));
      End;
  end;
end;

procedure TFRPACad.SBExcluirClick(Sender: TObject);
begin
  If DMRpa.QRpaInd_Situacao.Value = '1' Then
   Begin
     DMOracle.DBCemapa.StartTransaction;
     inherited;
     DMOracle.DBCemapa.Commit;
   End
  else
    ShowMessage('Voltar Confirmação antes de Excluir Um Rpa');
end;

procedure TFRPACad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.RollBack;
end;

procedure TFRPACad.Confima1Click(Sender: TObject);
var
  wSaldo, wValor_Base, wValor_Base_1, wIRF,wSaldo_IRF,wVlInss,wVlInss_Pg :real;
  wMes,wAno,wDia :Word;
  wHoje,wData,wDtLancto :TDateTime;
  wFisica_Juridica,wCodNota,wNumDoc,wContaCred,wContaDeb,wVal_Inss:String;
  wCodDoc,wCodHistorico,wVlrLancto,wCodCompl:Real;
  wFilial : Integer;
  wEntradaSaida,wTipoProduto:String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMRPA.QRPACOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMRpa.QRpaDt_Emissao.Value Then
     raise Exception.Create('Não é Permitido Confirmar Esta RPA - Fechamento Contábil');
  If ((DBRGTipoRpa.ItemIndex = 0) or (DBRGTipoRpa.ItemIndex = 1)) And (DMRpa.QRpaCod_Nota_Cab.Text <> '') Then
     wCodNota := DMOracle.BuscaNome('SELECT NUM_CONHECIMENTO FROM TB_CONHECIMENTO','COD_NOTA_CAB = '+DMRpa.QRpaCod_Nota_Cab.Text);
  If wCodNota <> '' Then
     Raise Exception.Create('Nota Com Conhecimento Frete');
  DBEdit18.SetFocus;
  wHoje:=Date;
  wIrf := 0;
  wVlInss := 0;
  DecodeDate(wHoje,wAno,wMes,wDia);
  wData := StrToDate('01/'+(IntToStr(wMes))+'/'+(IntToStr(wAno)));
  wVal_Inss := DMOracle.BuscaNome('SELECT SUM(VAL_INSS_FORNECEDOR) FROM TB_RPA','IND_SITUACAO = ' + Chr(39) + '2' + Chr(39) +
                 ' AND COD_CADASTRO = ' + DMRPA.QRPACod_Cadastro.Text +
                 ' and DT_EMISSAO >= ' + Chr(39) + DateToStr(wData) + Chr(39) +
                 ' AND DT_EMISSAO <= ' + Chr(39) + DateToStr(DMOracle.UltimoDiaMes(Date)) + chr(39));
  If wVal_Inss <> '' Then
     wVlInss_Pg := StrToFloat(wVal_Inss)
  Else
     wVlInss_Pg := 0;
//  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
//  Begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk',DMRPA.QRPACOD_OPERACAO.Value);
    DMOperacao.QOperacao.Open;
//  End;
  Try
    DMOracle.DBCemapa.StartTransaction;
    DMRpa.QRpa.Edit;
    With DMRPA do
    begin

      if Trim(QRPACod_Nota_cab.Text) <> '' then
       begin
         //verifica se a RPA é referente a uma nota de entrada e o produto da nota é do tipo agricola
         wEntradaSaida:=DMOracle.BuscaNome('SELECT TB_NOTA_CAB.IND_ENTRADA_SAIDA FROM TB_NOTA_CAB',
                                           ' COD_NOTA_CAB = '+Trim(QRPACod_Nota_cab.Text));
         wTipoProduto:=DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO, TB_NOTA_CAB T1, TB_NOTA_ITEM T2 ',
                                          ' T1.COD_NOTA_CAB = T2.COD_NOTA_CAB AND TB_PRODUTO.COD_PRODUTO = T2.COD_PRODUTO '+
                                          ' AND T1.COD_NOTA_CAB = '+Trim(QRPACod_Nota_cab.Text));

         // este if verifica se o valor do servico foi informado caso isso seja verdadeiro é feita a
         //   verificacao do valor do frete tonelada, caso seja maior de zero ocorrerá um erro pois não pode
         //  existir RPA´s com valor de serviço e de Frete/Ton ao mesmo tempo
         //o valor do servico deve ser informado ou calculado, uma vez informado ele não pode ser calculado
         if (QRPAVal_Servico.Value > 0) then
          begin
            if (QRPAVal_Frete_Ton.Value > 0) then
               raise exception.create('Não é possivel informar o valor do Frete/Ton. e Valor do Serviço juntos.')
            else
             begin
               // caso o produto seja comercial a quantidade do produto na nota deve ser multiplicado pela embalagem p/ calcular o frete/Ton
               if (wTipoProduto <> 'AGRICOLA') Then
                begin
                  QCalculaQuantidade.Close;
                  QCalculaQuantidade.setVariable('COD_NOTA_CAB',QRPACod_Nota_cab.Value);
                  QCalculaQuantidade.Open;
                  QRPAVal_Frete_Ton.Value:=QRPAVal_Servico.Value/QCalculaQuantidadeQuantidade.Value;
                end
               else
                 QRPAVal_Frete_Ton.Value:=QRPAVal_Servico.Value/((StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                          ' COD_NOTA_CAB = '+Trim(QRPACod_Nota_cab.Text))))/1000);
             end;
          end
         else
           begin
             if (QRPAVal_Frete_Ton.Value <= 0) or (QRPAVal_Frete_Ton.Text = '') then
                raise exception.create('Deve ser informado o valor do Serviço ou o Valor do Frete/Ton.')
             else
               if (wTipoProduto <> 'AGRICOLA') Then
                begin
                  QCalculaQuantidade.Close;
                  QCalculaQuantidade.setVariable('COD_NOTA_CAB',QRPACod_Nota_cab.Value);
                  QCalculaQuantidade.Open;
                  QRPAVal_Servico.Value:=QCalculaQuantidadeQuantidade.Value*QRPAVal_Frete_Ton.Value
                end
               else
                 QRPAVal_Servico.Value:=(StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_ITEM',' COD_NOTA_CAB = '+
                                         Trim(QRPACod_Nota_cab.Text)))/1000)*QRPAVal_Frete_Ton.Value;

{             if (DBRGTipoRpa.ItemIndex = 0) Then //verifica se a RPA é intermunicipal pq o adiantamento apenas é calculado em rpa intermunicipal
               if ((QRPAVal_Adiantamento.text = '') or (QRPAVal_Adiantamento.Value <= 0))then //verifica se o valor do adiantamento foi preenchido caso nao tenha sido preenchido o programa calcula o adiantamento
                 if (wEntradaSaida = 'E') then //caso a nota seja de entrada o adiantamento recebe zero
                    QRPAVal_Adiantamento.Value:=0
                 else
                    QRPAVal_Adiantamento.Value:=(QRPAVal_Servico.Value*0.85);//calculo do adiantamento padrao de 85% caso não informado ele é calculado
}           end;
       End;
      If QRPAVal_Servico.Value = 0 Then
         Raise Exception.Create('Deve ser informado o valor do servico');
      QRPAVal_ICMS_Devido.Value:=((((QRPAVal_Servico.Value * DMParamSistema.QParamSistemaPERC_Base_ICMS_DEVIDO.Value)/100)* DMParamSistema.QParamSistemaPERC_ALIQ_ICMS_DEVIDO.Value)/100);
      QRPAVal_ICMS_Presumido.Value:=((((QRPAVal_Servico.Value * DMParamSistema.QParamSistemaPerc_Base_ICMS_Presumido.value)/100)*DMParamSistema.QParamSistemaPerc_ALIQ_ICMS_Presumido.value)/100);
      QRPAVal_ICMS_Recolhido.Value:=(QRPAVal_ICMS_Devido.Value - QRPAVal_ICMS_Presumido.value);
      If QRPAIND_TIPO_RPA.Value <> 'S' Then
       Begin
         QRPAVal_SEST_SENAT.VALUE:=((QRPAVAL_SERVICO.VALUE * 0.2 * DMParamSistema.QParamSistemaPerc_Sest_Senat.value)/100);    // ESTE FICOU SOMENTE PARA SEST - CESAR 03/04/2021
         QRPAVal_SENAT.VALUE:=((QRPAVAL_SERVICO.VALUE * 0.2 * DMParamSistema.QParamSistemaPerc_Senat.value)/100);
         QRPAVal_INSS.Value:=(((QRPAVal_Servico.Value*DMParamSistema.QParamSistemaPERC_Base_INSS_FRETE.Value)/100)*((DMParamSistema.QParamSistemaPerc_ALIQ_INSS_Frete.Value)/100));
         wVlInss:=wVlInss + (((QRPAVal_Servico.Value*DMParamSistema.QParamSistemaPERC_Base_INSS_FRETE.Value)/100)*((DMParamSistema.QParamSistemaPerc_ALIQ_INSS_Frete_Fre.Value)/100));
       End
      Else
       Begin
         QRPAVal_INSS.Value:=(((QRPAVal_Servico.Value*DMParamSistema.QParamSistemaPERC_BASE_INSS_SERVICO.Value)/100)*((DMParamSistema.QParamSistemaPERC_ALIQ_INSS_SERVICO.Value)/100));
         wVlInss:=wVlInss + (((QRPAVal_Servico.Value*DMParamSistema.QParamSistemaPERC_BASE_INSS_SERVICO.Value)/100)*((DMParamSistema.QParamSistemaPERC_ALIQ_INSS_SERV_FRE.Value)/100));
         QRPAVal_SEST_SENAT.VALUE:=0;
         QRPAVal_SENAT.VALUE:=0;
       End;
      If (wVlInss + wVlInss_Pg + QRPAVal_Inss_Pg_Outras_Empresas.value) > DMParamSistema.QParamSistemaVal_Inss_Maximo_Mes.Value Then
         wVlInss := DMParamSistema.QParamSistemaVal_Inss_Maximo_Mes.Value - (wVlInss_Pg + QRPAVal_Inss_Pg_Outras_Empresas.value);
      If wVlInss < 0 Then
         wVlInss := 0;
      QRPAVal_Inss_Fornecedor.Value := wVlInss;
      wFisica_Juridica := DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO','COD_CADASTRO = '+QRPACod_Cadastro.Text);
      If wFisica_Juridica = 'F' Then
       begin
         DMIRF.QCalculaSaldo.Close;
         DMIRF.QCalculaSaldo.SetVariable('Cod_Cadastro',DMRPA.QRPACod_Cadastro.Value);
         DMIRF.QCalculaSaldo.SetVariable('DT_Emissao_I',wData);
         DMIRF.QCalculaSaldo.SetVariable('DT_Emissao_F',DMOracle.UltimoDiaMes(Date));
         DMIRF.QCalculaSaldo.Open;
         If QRPAIND_TIPO_RPA.Value <> 'S' Then
            wSaldo:=((DMIRF.QCalculaSaldoSaldo.value + DMRPA.QRPAVal_Servico.value)*0.1)  //era 40% alterado seguindo a nova lei de rpa
         Else
            wSaldo:=(DMIRF.QCalculaSaldoSaldo.value + DMRPA.QRPAVal_Servico.value);
         wSaldo := wSaldo - wVlInss;
         //---------CALCULA SALDO IRF
         DMIRF.QCalculaIRFPago.Close;
         DMIRF.QCalculaIRFPago.SetVariable('Cod_Cadastro',DMRPA.QRPACod_Cadastro.Value);
         DMIRF.QCalculaIRFPago.SetVariable('DT_Emissao_I',wData);
         DMIRF.QCalculaIRFPago.SetVariable('DT_Emissao_F',DMOracle.UltimoDiaMes(Date));
         DMIRF.QCalculaIRFPago.Open;
         wSaldo_IRF:=(DMIRF.QCalculaIRFPagoSaldo_IRF.value);

         DMIRF.QListaBaseCalc.close;
         DMIRF.QListaBaseCalc.open;
         while Not DMIRF.QListaBaseCalc.Eof do
         begin
           wValor_Base:=DMIRF.QListaBaseCalcVal_Base_Calc.value;
           wValor_Base_1:=DMIRF.QListaBaseCalcVal_Base_Calc_1.value;
           case DMIRF.QlistaBaseCalcCod_Opcao.value of
             0: if wSaldo <= wValor_Base_1 then
                wIRF:=((wSaldo*DMIRF.QListaBaseCalcAliquota.value)/100) - DMIRF.QListaBaseCalcVal_Deducao.value;
             1: if ((wSaldo > wValor_Base)and(wSaldo <=wValor_Base_1)) then
                wIRF:=((wSaldo*DMIRF.QListaBaseCalcAliquota.value)/100) - DMIRF.QListaBaseCalcVal_Deducao.value;
             2: if (wSaldo > wValor_Base) then
                wIRF:=((wSaldo*DMIRF.QListaBaseCalcAliquota.value)/100) - DMIRF.QListaBaseCalcVal_Deducao.value;
           end;
           DMIRF.QListaBaseCalc.next;
         end;
         QRPAVal_IRF.VALUE:=(wIRF-wSaldo_IRF);
       End;
       QRPAVal_LIQUIDO.VALUE:=QRPAVal_Servico.value - QRPAVal_IRF.Value  - QRPAVal_Inss_Fornecedor.Value;  // a pedido da Daniele da Grasel retirado desconto de Sest e Senat do Valor liquido - Cesar 07/05/2021
    If FConhecimento_CP = Nil then
      FConhecimento_CP := TFConhecimento_CP.Create(Application);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     Begin
       FConhecimento_CP.MECodDepartamento.Text := '6';
       Case QRPACod_Operacao.Value of
         402 : FConhecimento_CP.MECodFinalidade.Text := '144';
         407 : FConhecimento_CP.MECodFinalidade.Text := '145';
         408 : FConhecimento_CP.MECodFinalidade.Text := '134';
         409 : FConhecimento_CP.MECodFinalidade.Text := '128';
         410,414 : FConhecimento_CP.MECodFinalidade.Text := '132';
         411,427 : FConhecimento_CP.MECodFinalidade.Text := '133';
         412 : FConhecimento_CP.MECodFinalidade.Text := '131';
         413,415 : FConhecimento_CP.MECodFinalidade.Text := '130';
         416 : FConhecimento_CP.MECodFinalidade.Text := '135';
         419,422..426 : FConhecimento_CP.MECodFinalidade.Text := '17';
         421 : FConhecimento_CP.MECodFinalidade.Text := '143';
         428 : FConhecimento_CP.MECodFinalidade.Text := '299';
         1441 : FConhecimento_CP.MECodFinalidade.Text := '123';
       End;
       FConhecimento_CP.BitBtn1.Visible := False;
       FConhecimento_CP.MeCodFinalidadePedagio.Visible := False;
       FConhecimento_CP.LblPedagio.Visible := False;
       FConhecimento_CP.SBPedagio.Visible := False;
       FConhecimento_CP.MeFinalidadePedagio.Visible := False;
       FConhecimento_CP.Label5.Visible := False;
       FConhecimento_CP.MeFinalidadeICMS.Visible := False;
       FConhecimento_CP.SBFinalidadeICMS.Visible := False;
       FConhecimento_CP.EdFinalidadeICMS.Visible := False;
       FConhecimento_CP.MeCodBanco.Visible := False;
       FConhecimento_CP.LblBanco.Visible := False;
       FConhecimento_CP.SbCodBanco.Visible := False;
       FConhecimento_CP.MeBanco.Visible := False;
     End;
    If FConhecimento_CP.ShowModal = MrOk Then
    Begin
      With DMContasPagar do
      Begin
        QContasPagar_Mov.Close;
        QContasPagar_cab.Close;
        QContasPagar_cab.Open;
        QContasPagar_Mov.Open;
        QContasPagar_Cab.Insert;
        if Trim(FConhecimento_CP.MECodFinalidade.Text)<>'' then
          QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(FConhecimento_CP.MECodFinalidade.text));
        if Trim(FConhecimento_CP.MECodBanco.Text)<>'' then
          QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(FConhecimento_CP.MECodBanco.text));
        if Trim(FConhecimento_CP.MECodDepartamento.Text)<>'' then
          QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text));
        QContasPagar_CabCod_Cadastro.Value:=QRpaCod_Cadastro.Value;
        QContasPagar_CabCod_Filial.Value:=QRpaCod_Filial.Value;
        QContasPagar_CabCod_Rpa.Value:=QRpaCod_Rpa.Value;
        QContasPagar_CabDesc_tipo_Documento.Value:='RPA';
        QContasPagar_CabDT_EMISSAO.Value:=QRpaDT_EMISSAO.value;
        QContasPagar_CabDT_VENCIMENTO.Value:=QRpaDT_Emissao.value;
        QContasPagar_CabVAL_TITULO.Value:=QRpaVal_Liquido.Value;
        QContasPagar_CabNUM_TITULO.Value:=QRpaNum_Rpa.Value;
        QContasPagar_CabIND_ACEITE.Value:='NAO';
        QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
        QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao Rpa nr.'+QRpaNum_Rpa.Text;
        QCOntasPagar_Cab.Post;
        DMRpa.QRpaCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        QContasPagar_Mov.Close;
        QContasPagar_cab.Close;
      End;
      If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
      Begin
        If (DMOperacao.QOperacaoCod_Contabil_Irrf_Cred.Text <> '') And
           (DMOperacao.QOperacaoCod_Contabil_Irrf_Deb.Text <> '') And
           (DMRpa.QRpaVal_Irf.Value <> 0) Then
         begin
           wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
           wFilial:=DMRpa.QRpaCod_Filial.Value;
           wContaCred:=DMOperacao.QOperacaoCod_Contabil_Irrf_Cred.Value;
           wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Irrf_Deb.Value;
           wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
           wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
           wVlrLancto:=DMRpa.QRpaVal_Irf.Value;
           wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
         End;
// CONTABILIZACAO DE SEST - FOI SEPARADO SEST E SENAT - CESAR 03/05/2021
        If (DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Text <> '') And
           (DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Text <> '') And
           (DMRpa.QRpaVal_Sest_Senat.Value <> 0) Then
         begin
           wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
           wFilial:=DMRpa.QRpaCod_Filial.Value;
           wContaCred:=DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Value;
           wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Value;
           wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
           wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
           wVlrLancto:=DMRpa.QRpaVal_Sest_Senat.Value;
           wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
         End;
// CONTABILIZACAO DE SENAT - FOI SEPARADO SEST E SENAT - CESAR 03/05/2021
        If (DMOperacao.QOperacaoCod_Contabil_Senat_Cred.Text <> '') And
           (DMOperacao.QOperacaoCod_Contabil_Senat_Deb.Text <> '') And
           (DMRpa.QRpaVal_Senat.Value <> 0) Then
         begin
           wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
           wFilial:=DMRpa.QRpaCod_Filial.Value;
           wContaCred:=DMOperacao.QOperacaoCod_Contabil_Senat_Cred.Value;
           wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Senat_Deb.Value;
           wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
           wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
           wVlrLancto:=DMRpa.QRpaVal_Senat.Value;
           wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
         End;
        If (DMOperacao.QOperacaoCod_Contabil_Inss_Cred.Text <> '') And
           (DMOperacao.QOperacaoCod_Contabil_Inss_Deb.Text <> '') And
           (DMRpa.QRPAVal_Inss_Fornecedor.Value <> 0) Then
         begin
           wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
           wFilial:=DMRpa.QRpaCod_Filial.Value;
           wContaCred:=DMOperacao.QOperacaoCod_Contabil_Inss_Cred.Value;
           wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Inss_Deb.Value;
           wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
           wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
           wVlrLancto:=DMRpa.QRPAVal_Inss_Fornecedor.Value;
           wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
         End;


         If (DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Text <> '') And
            (DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Text <> '') And
            (DMRpa.QRpaVal_Pedagio.Value <> 0) Then
           begin
             wContaCred:=DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Value;
             wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Value;
             wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//             wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
             wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
             wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
             wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
             wVlrLancto:=DMRpa.QRpaVal_Pedagio.Value;
             wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
             wFilial:=1;
             DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
             wFilial:=DMRpa.QRpaCod_Filial.Value;
             DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
           End;
        If (DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Text <> '') And
           (DMOperacao.QOperacaoCod_Contabil_Frete_Deb.Text <> '') And
           (DMRpa.QRpaVal_Servico.Value <> 0) Then
         begin
           wContaCred:=DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Value;
           wContaDeb:=DMOperacao.QOperacaoCod_Contabil_Frete_Deb.Value;
           wCodDoc:=DMRpa.QRpaCod_Rpa.Value;
//           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+Trim(DBDirceu3.Text); Alterado para a linha abaixo, pedido de Joao - Moinho. Diego A. S. 26/11/2008
           wNumDoc:=FloatToStr(DMRpa.QRpaNum_Rpa.Value)+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRPACOD_CADASTRO.Text);
           wFilial:=DMRpa.QRpaCod_Filial.Value;
           wCodCompl:=DMRpa.QRpaCod_Cadastro.Value;
           wCodHistorico:=DMOperacao.QOperacaoCod_Historico_Contabil.Value;
           If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
              wVlrLancto:=DMRpa.QRpaVal_Servico.Value
           Else
              wVlrLancto:=DMRpa.QRpaVal_Liquido.Value;
           wDtLancto:=DMRpa.QRpaDt_Emissao.Value;
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
           DMPlanilha.GravaLanc('RPA',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
         End;
        If (DMRpa.QRpaVal_Pedagio.Value <> 0) And
           (Trim(FConhecimento_CP.FmHistorico.MEHistorico.Text) <> '')  Then
         begin
           DMBancoAgencia.IncluiBanco(StrToInt(Trim(FConhecimento_CP.FmHistorico.MeHistorico.Text)),
                             StrToInt(Trim(FConhecimento_CP.FmContaCorrente.MeContaCorrente.Text)),
                             DMRpa.QRpaNum_Rpa.Value,
                             DMRpa.QRpaCod_Cadastro.Value,
                             StrToInt(Trim(FConhecimento_CP.MeCodDepartamento.Text)),
                             DMRpa.QRpaDt_Emissao.Value,
                             DMRpa.QRpaVal_Pedagio.Value,
                             'Pedagio Conhecimento',
                             ' ',
                             '','','N','');
           DMRpa.QRpaCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
         End;
      End;
      DMRpa.QRpaInd_Situacao.Value := '2';
      DMRpa.QRpa.Post;
      DMOracle.DBCemapa.Commit;
    end
   Else
    Begin
      DMRpa.QRpa.Cancel;
      DMOracle.DBCemapa.Rollback;
    End;
   End;
  Except
    DMOracle.DBCemapa.Rollback;
    DMRpa.QRpa.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMContasPagar.QContasPagar_cab.Cancel;
    DMPlanilha.QLcto1.Cancel;
    Raise;
  End;
end;

procedure TFRPACad.Voltarconfirmao1Click(Sender: TObject);
Var wConta_Pagar_Cab,wComando : String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMRPA.QRPACOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMRpa.QRpaDt_Emissao.Value Then
     raise Exception.Create('Não é Permitido Voltar Confirmação Desta RPa - Fechamento Contabil');
  if DMRpa.QRpaNum_Rpa.Value <> 0 then
   begin
     DMOracle.DBCemapa.StartTransaction;
     Try
       With DMRpa do
        Begin
          QRpa_CP.Close;
          QRpa_CP.SetVariable('Cod_Rpa',QRpaCod_Rpa.Value);
          QRpa_CP.Open;
          While not (QRpa_CP.Eof) do
           Begin
             wConta_Pagar_Cab:= DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_MOV',
                    'IND_TIPO_MOVIMENTO <> '+ Chr(39) + 'PRINCIPAL' + Chr(39) + ' AND COD_CONTA_PAGAR_CAB = '+QRpa_CPCod_Conta_Pagar_cab.Text);
             If wConta_Pagar_Cab <> '' Then
                Raise Exception.Create ('Contas a Pagar Com Movimentação - Baixas');
             With DMOracle do
              Begin
                QExecSQL.Close;
                QExecSQL.SQL.Clear;
                wComando := 'DELETE FROM TB_CONTA_PAGAR_MOV';
                wComando := wComando + ' WHERE COD_CONTA_PAGAR_CAB = '+QRpa_CPCod_Conta_Pagar_cab.Text;
                QExecSQL.SQL.Add(wComando);
                QExecSQL.ExecSQL;
              End;
             QRpa_CP.Delete;
           End;
          QRpa_CP.Close;
          DMPlanilha.Descontabiliza(QRpaCod_Rpa.Value,'RPA');
          If DMRpa.QRPACod_Bco_Movimento.Value <> Null Then
           Begin
             DMBancoAgencia.QBancoMovimento.Close;
             DMBancoAgencia.QBancoMovimento.SetVariable('Pk',DMRpa.QRPACod_Bco_Movimento.Value);
             DMBancoAgencia.QBancoMovimento.Open;
             If Not(DMBancoAgencia.QBancoMovimento.Eof) Then
                DMBancoAgencia.QBancoMovimento.Delete;
           End;
          DMOracle.Audit(TOracleDataset1 (DSPrimario.Dataset ), 'Alteração' );
          QRpa.Edit;
          QRpaInd_Situacao.Value := '1';
          QRpaVal_IRF.Value := 0;
          QRpa.Post;
          QRpa.Close;
          QRpa.OPen;
          DMOracle.DBCemapa.Commit;
        End;
     Except
        DMOracle.DBCemapa.Rollback;
        Raise;
     End;
   end;
end;

procedure TFRPACad.SBAlterarClick(Sender: TObject);
begin
  If DMRpa.QRpaInd_Situacao.Value = '1' Then
    inherited
  else
    ShowMessage('Voltar Confirmação Antes de Alterar Um Rpa');
  DBRGTipoRpa.Enabled := False;
end;

procedure TFRPACad.CancelarRpa1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMRPA.QRPACOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMRpa.QRpaDt_Emissao.Value Then
     raise Exception.Create('Não é Permitido Cancelar Esta RPa - Fechamento Contabil');
  If DMRpa.QRpaInd_Situacao.Value = '1' Then
   Begin
    DMRpa.QRpa.Edit;
    DMRpa.QRpaInd_Situacao.Value := '3';
    DMRpa.QRpa.Post;
    DMOracle.DBCemapa.Commit;
   End
  Else
   Raise Exception.Create('Somente Cancelar Rpa Digitados');

end;

procedure TFRPACad.DBEdit20Change(Sender: TObject);
begin
  inherited;
  With DMRpa do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QRpaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QRpaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QRpaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QRpaInd_Situacao.Value = '3';
    MMCadSimples.Items[2].Items[4].Enabled := QRpaInd_Situacao.Value = '2';
  End;
end;

procedure TFRPACad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMRPA.QRPACOD_FILIAL.Text),'CONHECIMENTO');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMRpa.QRpaDt_Emissao.Value Then
     raise Exception.Create('Não é Permitido Cancelar Esta RPa - Fechamento Contabil');
  If DMRpa.QRpaInd_Situacao.Value = '3' Then
   Begin
    DMRpa.QRpa.Edit;
    DMRpa.QRpaInd_Situacao.Value := '1';
    DMRpa.QRpa.Post;
    DMOracle.DBCemapa.Commit;
   End
  Else
   Raise Exception.Create('Somente Voltar Cancelamento Rpa cancelados');

end;

procedure TFRPACad.RelServioTransporteAutnomo1Click(Sender: TObject);
begin
  inherited;
   with DMRPA do
   begin
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[8].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME9CodFilial.Text),'CONHECIMENTO');
      if (trim(FConhecimentoParam.ME9DT_I.text) <> '') and (trim(FConhecimentoParam.ME9DT_F.text) <> '')then
      begin
        QRTransporteAutonomo.close;
        if trim(FConhecimentoParam.ME9CodProprietario.text) <> '' then
          QRTransporteAutonomo.SetVariable('Cod_Cadastro',trim(FConhecimentoParam.ME9CodProprietario.text))
        else
          QRTransporteAutonomo.SetVariable('Cod_Cadastro',null);
        QRTransporteAutonomo.SetVariable('DATA_I',trim(FConhecimentoParam.ME9DT_I.text));
        QRTransporteAutonomo.SetVariable('DATA_F',trim(FConhecimentoParam.ME9DT_F.text));
        if trim(FConhecimentoParam.ME9CodFilial.text) <> '' then
          QRTransporteAutonomo.SetVariable('COD_FILIAL',trim(FConhecimentoParam.ME9CodFilial.text))
        else
          QRTransporteAutonomo.SetVariable('COD_FILIAL',null);
        QRTransporteAutonomo.open;
        if FRelTransporteAutonomo = nil then
          FRelTransporteAutonomo:= TFRelTransporteAutonomo.create(application);
        if Trim(FConhecimentoParam.ME9CodFilial.text) <> '' then
        begin
          FRelTransporteAutonomo.QRLFilial.Caption:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME9CodFilial.text));
          FRelTransporteAutonomo.QRLCNPJ.Caption:='CNPJ: '+DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME9CodFilial.text));
          FRelTransporteAutonomo.QRLINSCRICAO.Caption:='INSCRIÇÃO ESTADUAL: '+DMOracle.BuscaNome('SELECT DESC_INSCRICAO FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME9CodFilial.text));
        end;
        if FConhecimentoParam.RGPreview.ItemIndex = 0 then
          FRelTransporteAutonomo.QRPrimario.Preview
        else
          FRelTransporteAutonomo.QRPrimario.Print;
        QRTransporteAutonomo.close;
      end
      else
        showmessage('Deve ser informadas as datas e Início e Fim');
    end;
  end;
end;
procedure TFRPACad.RelatTransporteAutnomoMunicipal1Click(Sender: TObject);
begin
  inherited;
  with DMRPA do
   begin
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[9].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME10CodFilial.Text),'CONHECIMENTO');
      if (trim(FConhecimentoParam.ME10DT_I.text) <> '') and (trim(FConhecimentoParam.ME10DT_F.text) <> '')then
      begin
        QRTransporteMunicipal.close;
        if trim(FConhecimentoParam.ME10CodProprietario.text) <> '' then
          QRTransporteMunicipal.SetVariable('Cod_Cadastro',trim(FConhecimentoParam.ME10CodProprietario.text))
        else
          QRTransporteMunicipal.SetVariable('COD_CADASTRO',null);
        QRTransporteMunicipal.SetVariable('DATA_I',trim(FConhecimentoParam.ME10DT_I.text));
        QRTransporteMunicipal.SetVariable('DATA_F',trim(FConhecimentoParam.ME10DT_F.text));
        if trim(FConhecimentoParam.ME10CodFilial.text) <> '' then
          QRTransporteMunicipal.SetVariable('COD_FILIAL',trim(FConhecimentoParam.ME10CodFilial.text))
        else
          QRTransporteMunicipal.SetVariable('COD_FILIAL',null);
        QRTransporteMunicipal.open;
        if FRTransporteMunicipal = nil then
          FRTransporteMunicipal:= TFRTransporteMunicipal.create(application);
        if Trim(FConhecimentoParam.ME10CodFilial.text) <> '' then
        begin
          FRTransporteMunicipal.QRLFilial.Caption:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME10CodFilial.text));
          FRTransporteMunicipal.QRLCNPJ.Caption:='CNPJ: '+DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME10CodFilial.text));
          FRTransporteMunicipal.QRLINSCRICAO.Caption:='INSCRIÇÃO ESTADUAL: '+DMOracle.BuscaNome('SELECT DESC_INSCRICAO FROM TB_FILIAL','COD_FILIAl = '+Trim(FConhecimentoParam.ME10CodFilial.text));
        end;
        if FConhecimentoParam.RGPreview.ItemIndex = 0 then
          FRTransporteMunicipal.QRPrimario.Preview
        else
          FRTransporteMunicipal.QRPrimario.Print;
        QRTransporteMunicipal.close;
      end
      else
        showmessage('Deve ser informadas as datas e Início e Fim');
    end;
  end;
end;

procedure TFRPACad.RelIRF1Click(Sender: TObject);
begin
  inherited;
  with DMRPA do
  begin
    QRRelatorioIRF_RPA.close;
    if FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[11].TabVisible := True;
    if FConhecimentoParam.showmodal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME12CodFilial.Text),'CONHECIMENTO');
      If(Trim(FConhecimentoParam.ME12Dt_Inicial.Text)='')OR(Trim(FConhecimentoParam.ME12Dt_Final.Text)='')Then
        raise Exception.Create('É necessário Informar um período');

      If(Trim(FConhecimentoParam.ME12CodFilial.Text)<>'')Then
        QRRelatorioIRF_RPA.SetVariable('FILIAL',Trim(FConhecimentoParam.ME12CodFilial.Text))
      Else
        QRRelatorioIRF_RPA.SetVariable('FILIAL',null);

      If(Trim(FConhecimentoParam.ME12CodMotorista.Text)<>'')Then
        QRRelatorioIRF_RPA.SetVariable('MOTORISTA',Trim(FConhecimentoParam.ME12CodMotorista.Text))
      Else
        QRRelatorioIRF_RPA.SetVariable('MOTORISTA',null);

      If(Trim(FConhecimentoParam.ME12CodRPA.Text)<>'')Then
        QRRelatorioIRF_RPA.SetVariable('RPA',Trim(FConhecimentoParam.ME12CodRPA.Text))
      Else
        QRRelatorioIRF_RPA.SetVariable('RPA',null);

      QRRelatorioIRF_RPA.SetVariable('DT_INICIAL',Trim(FConhecimentoParam.ME12Dt_Inicial.Text));
      QRRelatorioIRF_RPA.SetVariable('DT_FINAL',Trim(FConhecimentoParam.ME12Dt_Final.Text));
      QRRelatorioIRF_RPA.open;

      if FRRelatorioIRF_RPA = nil then
        FRRelatorioIRF_RPA:= TFRRelatorioIRF_RPA.create(application);
      FRRelatorioIRF_RPA.QRLFilial.Caption := 'Filial: ' + FConhecimentoParam.Ed12DescFilial.Text;
      FRRelatorioIRF_RPA.QRLPeriodo.Caption := 'Período: ' + FConhecimentoParam.ME12Dt_Inicial.Text + ' até ' + FConhecimentoParam.ME12Dt_Final.Text;
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRRelatorioIRF_RPA.QRPrimario.Preview
      else
        FRRelatorioIRF_RPA.QRPrimario.Print;
      QRRelatorioIRF_RPA.close;
    End;
  End;
end;

procedure TFRPACad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBRGTipoRpa.Enabled := True;
end;

procedure TFRPACad.AcrescentarPesoChegada1Click(Sender: TObject);
begin
  inherited;
  If(FPesoChegada=nil)Then
    FPesoChegada := TFPesoChegada.Create(Application);
  If(DMRPA.QRPA.IsEmpty)Then
    raise Exception.Create('É necessário escolher uma RPA');
  FPesoChegada.showmodal;
end;

procedure TFRPACad.RelGernciadeFretesIntermunicipais1Click(
  Sender: TObject);
Var
  wstrAux : String;
begin
  inherited;
  with DMRPA do
  begin
    QRGerenciaRPA.close;
    If FConhecimentoParam = nil then
      FConhecimentoParam:=TFConhecimentoParam.create(application);
    FConhecimentoParam.Me14DtInicio.Text := '01/' + FormatDateTime('MM/YYYY', Date);
    FConhecimentoParam.Me14DtFim.Text := DateToStr(Date);
    FConhecimentoParam.PGRelatorio.Pages[13].TabVisible := True;
    If FConhecimentoParam.showmodal = mrOk then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME14CodFilial.Text),'CONHECIMENTO');
      If(Trim(FConhecimentoParam.ME14CodFilial.Text)<>'')Then
        QRGerenciaRPA.SetVariable('FILIAL',Trim(FConhecimentoParam.ME14CodFilial.Text))
      Else
        QRGerenciaRPA.SetVariable('FILIAL',null);
      If(Trim(FConhecimentoParam.ME14CodProduto.Text)<>'')Then
        QRGerenciaRPA.SetVariable('PRODUTO',Trim(FConhecimentoParam.ME14CodProduto.Text))
      Else
        QRGerenciaRPA.SetVariable('PRODUTO',null);
      If(Trim(FConhecimentoParam.Me14Motorista.Text)<>'')Then
        QRGerenciaRPA.SetVariable('COD_CADASTRO',Trim(FConhecimentoParam.Me14Motorista.Text))
      Else
        QRGerenciaRPA.SetVariable('COD_CADASTRO',null);
      If(Trim(FConhecimentoParam.Me14Placa.Text)<>'')Then
        QRGerenciaRPA.SetVariable('DESC_PLACA',Trim(FConhecimentoParam.Me14Placa.Text))
      Else
        QRGerenciaRPA.SetVariable('DESC_PLACA',null);
      If(Trim(FConhecimentoParam.Me14CadastroNF.Text)<>'')Then
        QRGerenciaRPA.SetVariable('COD_CADASTRO_NF',Trim(FConhecimentoParam.Me14CadastroNF.Text))
      Else
        QRGerenciaRPA.SetVariable('COD_CADASTRO_NF',null);
      wstrAux := '';
      Case FConhecimentoParam.Rg14Situacao.ItemIndex Of
        0: Begin
             QRGerenciaRPA.SetVariable('SITUACAO','E');
             wstrAux := 'ENTRADAS';
           End;
        1: Begin
             QRGerenciaRPA.SetVariable('SITUACAO','S');
             wstrAux := 'SAÍDAS';
           End;
        2: Begin
             QRGerenciaRPA.SetVariable('SITUACAO',null);
             wstrAux := 'TODAS';
           End;
      End;
      QRGerenciaRPA.SetVariable('DT_INICIAL',Trim(FConhecimentoParam.ME14DtInicio.Text));
      QRGerenciaRPA.SetVariable('DT_FINAL',Trim(FConhecimentoParam.ME14DtFim.Text));
      QRGerenciaRPA.open;
      if FRGerenciaRPA = nil then
        FRGerenciaRPA:= TFRGerenciaRPA.create(application);
      FRGerenciaRPA.QRLbFilial.Caption := 'Unidade: ' + Trim(FConhecimentoParam.Ed14Filial.Text);
      FRGerenciaRPA.QRLbPeriodo.Caption := FConhecimentoParam.ME14DtInicio.Text + ' Até ' + FConhecimentoParam.ME14DtFim.Text;
      FRGerenciaRPA.QRLbFrete.Caption := 'Frete: ' + wstrAux;
      If (Trim(FConhecimentoParam.Me14CadastroNF.Text) <> '')Then
         FRGerenciaRPA.QRLbFrete.Caption := FRGerenciaRPA.QRLbFrete.Caption + ' Cadastro Nf.:'+Trim(FConhecimentoParam.Ed14CadastroNF.Text);
      FRGerenciaRPA.QRLbProduto.Caption := 'Código Produto: ' + Trim(FConhecimentoParam.Me14CodProduto.Text) + ' ' + FConhecimentoParam.Ed14Produto.Text;
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRGerenciaRPA.QRPrimario.Preview
      else
        FRGerenciaRPA.QRPrimario.Print;
      QRGerenciaRPA.close;
    End;
  End;
end;

procedure TFRPACad.RelAutnomosINSS1Click(Sender: TObject);
var
  wHoje,wData_I,wData_F :TDateTime;
  wDia,wMes,wAno :word;
begin
  inherited;
  with DMRPA do
  begin
    QRAutonomosINSS.close;
    If FConhecimentoParam = Nil then
      FConhecimentoParam := TFConhecimentoParam.create(application);
    FConhecimentoParam.PGRelatorio.Pages[2].TabVisible := True;
    FConhecimentoParam.RGOrdem3.Visible := False;
    If FConhecimentoParam.showmodal = MrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.ME3Filial.Text),'CONHECIMENTO');
      wHoje:=date;
      DecodeDate(wHoje,wAno,wMes,wDia);
      wData_I:=StrToDate('01/'+FConhecimentoParam.CB3Mes.text+'/'+trim(FConhecimentoParam.ME3Ano.text));
      wData_F:= DMOracle.UltimoDiaMes(StrToDate('01/'+FConhecimentoParam.CB3Mes.Text+'/'+Trim(FConhecimentoParam.ME3Ano.Text)));
      QRAutonomosINSS.setvariable('DT_EMISSAO_I',DateToStr(wData_I));
      QRAutonomosINSS.setvariable('DT_EMISSAO_F',DateToStr(wData_F));
      If FConhecimentoParam.ME3Filial.Text = '' Then
        QRAutonomosINSS.setvariable('COD_FILIAL',Null)
      else
        QRAutonomosINSS.setvariable('COD_FILIAL',FConhecimentoParam.ME3Filial.Text);
      If FConhecimentoParam.Rg3Tipo.ItemIndex = 0 Then
         QRAutonomosINSS.setvariable('TIPO_RPA','F')
      Else
         QRAutonomosINSS.setvariable('TIPO_RPA','M');
      QRAutonomosINSS.Open;
      If FRAutonomosINSS = Nil then
        FRAutonomosINSS := TFRAutonomosINSS.create(application);
      FRAutonomosINSS.QRLCompetencia.Caption:= Bib.NomeMes(StrToInt(FConhecimentoParam.CB3Mes.text))+'/'+trim(FConhecimentoParam.ME3Ano.text);
      If FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRAutonomosINSS.QRPrimario.Preview
      Else
        FRAutonomosINSS.QRPrimario.Print;
      QRAutonomosINSS.Close;
    end;
  end;
  FConhecimentoParam.RGOrdem3.Visible := True;
end;

procedure TFRPACad.Emite_Rpa_Moinho;
Var wCont : Integer;
    wProduto,wMens,wEspecie,wUsuario : String;
begin
  if Imp = Nil Then
    Imp := TImp.Create;
  Imp.AbreImpressora;//----------abre impressora
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',51);//-----configurar pagina
  With DMRpa do
  Begin
    QRRPAInterMunicipal.close;
    QRRPAInterMunicipal.setVariable('Cod_RPA',QRPACOD_RPA.Value);
    QRRPAInterMunicipal.Open;

    wCont:=1;
    Imp.WriteXY(4.0,wCont,QRRPAInterMunicipalDESC_FILIAL.Value);
    wCont:=WCont+1;
    Imp.WriteXY(4.0,wCont,(QRRPAInterMunicipalDESC_ENDERECO_FILIAL.Value +' '+'FONE/FAX'+QRRPAInterMunicipalDESC_TELEFONE.Value));

    Imp.WriteXY(16,wCont,QRRPAInterMunicipalNatureza.Text);
    wCont:=WCont+1;
    Imp.WriteXY(4.0,wCont,('CEP '+QRRPAInterMunicipalDESC_CEP.Value+' '+QRRPAInterMunicipalCIDADE_ORIGEM.Value+' - '+QRRPAInterMunicipalESTADO_ORIGEM.Value));
    Imp.WriteXY(11.5,wCont,QRRPAInterMunicipalDESC_OPERACAO.Value);
    wCont:=WCont+1;
    Imp.WriteXY(4.0,wCont,('CGC '+QRRPAInterMunicipalNUM_CGC.Value+'  I.E '+QRRPAInterMunicipalDESC_INSCRICAO.Value));
    Imp.WriteXY(12.5,wCont,DateToStr(QRRPAInterMunicipalDT_EMISSAO.Value));
    Imp.WriteXY(15,wCont,TimeToStr(Time));
    Imp.WriteXY(18.3,wCont,Bib.NumToTexto(QRRPAInterMunicipalNUM_RPA.Value,0,6) );
    wCont:=WCont+2;
    Imp.WriteXY(1.7,wCont,QRRPAInterMunicipalDESC_FILIAL.Value);
    Imp.WriteXY(12.4,wCont,QRRPAInterMunicipalNOME_NOTA.Value);
    wCont:=WCont+1;
    Imp.WriteXY(1.7,wCont,QRRPAInterMunicipalDESC_ENDERECO_FILIAL.Value);
    Imp.WriteXY(12.4,wCont,QRRPAInterMunicipalDESC_ENDERECO_NOTA.Value);
    wCont:=WCont+1;
    Imp.WriteXY(1.7,wCont,QRRPAInterMunicipalCIDADE_ORIGEM.Value+' - '+QRRPAInterMunicipalESTADO_ORIGEM.Value);
    Imp.WriteXY(12.4,wCont,QRRPAInterMunicipalDESC_CIDADE_NOTA.Value+' - '+QRRPAInterMunicipalCOD_ESTADO_NOTA.Value);
    wCont:=WCont+1;
    Imp.WriteXY(1.7,wCont,QRRPAInterMunicipalNUM_CGC.Value);
    Imp.WriteXY(7.5,wCont,QRRPAInterMunicipalDESC_INSCRICAO.Value);
    Imp.WriteXY(12.4,wCont,QRRPAInterMunicipalNUM_CGC_CPF_NOTA.Value);
    Imp.WriteXY(17.5,wCont,QRRPAInterMunicipalDESC_INSCRICAO_NOTA.Value);
    wCont:=WCont+2;
    if QRRPAInterMunicipalCod_Nota_Cab.Text <> ''then
    begin
      wProduto:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+IntToStr(QRRPAInterMunicipalCod_Nota_Cab.Value));
      wMens:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+wProduto);
    end;
    Imp.WriteXY(0.3,wCont,wMens);
    Imp.WriteXY(4.2,wCont,Bib.NumToTexto(QRRPAInterMunicipalNUM_NOTA.Value,0,6));
    Imp.WriteXY(7.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_TOTAL.Value,2,11));
    Imp.WriteXY(10.0,wCont,Bib.NumToTexto(QRRPAInterMunicipalPESO_SAIDA.Value,0,11));
    Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QRRPAInterMunicipalPESO_SAIDA.Value,0,11));
    if QRRPAInterMunicipalCod_Nota_Cab.Text <> '' then
    begin
      wEspecie:=DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+wProduto);
      Imp.WriteXY(15.1,wCont,wEspecie);
    end;
    wCont:=13;
    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_FRETE_TON.Value,2,11));
    Imp.WriteXY(3.5,wCont,QRRPAInterMunicipalDESC_ORIGEM.Value);
    Imp.WriteXY(10.0,wCont,QRRPAInterMunicipalDESC_DESTINO.Value);
//    Imp.WriteXY(16.5,wCont,QRRPAInterMunicipalDESC_SEGURADORA.Value);
    wCont:=15;
    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalMOTORISTA.Value);
    wUsuario:=DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente));
    Imp.WriteXY(16.5,wCont,wUsuario);
    Inc(wCont);
    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalDESC_CARTEIRA.Value);
    Imp.WriteXY(7.6,wCont,QRRPAInterMunicipalDT_EXPEDICAO_CARTEIRA.Text);
    Inc(wCont);
    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalDESC_PLACA.Value);
    Inc(wCont);
//    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalProprietario.Value);
    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalDESC_INSCRICAO_INSS.Value);
    Imp.WriteXY(7.6,wCont,QRRPAInterMunicipalNUM_INSCRICAO.Value);
    Inc(wCont,2);
    Imp.WriteXY(2.2,wCont,QRRPAInterMunicipalNUM_CGC_CPF.Value);
    Inc(wCont,2);
    Imp.WriteXY(2.2,wCont,'Cartao Pedagio:'+QRRPAInterMunicipalDESC_CARTAO_PEDAGIO.Value);
    wCont:=wCont+1;
    Imp.WriteXY(0.4,wCont,QRRPAInterMunicipalDESC_OBSERVACAO.Value);
    If QRRPAInterMunicipalCod_Embarque.Text <> '' Then
     Begin
       Inc(wCont);
       Imp.WriteXY(0.4,wCont,QRRPAInterMunicipalCod_Embarque.Text);
     End;
    wCont:=28;
    Imp.WriteXY(4.0,wCont,QRRPAInterMunicipalDESC_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(4.0,wCont,(QRRPAInterMunicipalDESC_ENDERECO_FILIAL.Value +' '+'FONE/FAX'+QRRPAInterMunicipalDESC_TELEFONE.Value));
    Inc(wCont);
    Imp.WriteXY(4.0,wCont,('CEP '+QRRPAInterMunicipalDESC_CEP.Value+' '+QRRPAInterMunicipalCIDADE_ORIGEM.Value+' - '+QRRPAInterMunicipalESTADO_ORIGEM.Value));
    Imp.WriteXY(11.1,wCont,Bib.NumToTexto(QRRPAInterMunicipalNUM_RPA.Value,0,6) );
    Inc(wCont);
    Imp.WriteXY(4.0,wCont,('CGC '+QRRPAInterMunicipalNUM_CGC.Value+'  I.E '+QRRPAInterMunicipalDESC_INSCRICAO.Value));
    Imp.WriteXY(12.5,wCont,DateToStr(QRRPAInterMunicipalDT_EMISSAO.Value));
    Inc(wCont,2);
    Imp.WriteXY(1.8,wCont,QRRPAInterMunicipalDESC_FILIAL.Value);
    Imp.WriteXY(12.2,wCont,QRRPAInterMunicipalNOME_NOTA.Value);
    Inc(wCont,2);
    Imp.WriteXY(0.3,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_FRETE_TON.Value,2,11));
    Imp.WriteXY(4.5,wCont,Bib.NumToTexto(QRRPAInterMunicipalPESO_SAIDA.Value,0,11));
//    Imp.WriteXY(8.5,wCont,Bib.NumToTexto(QRRPAInterMunicipalPERC_TOLERANCIA.Value,2,11));
    Imp.WriteXY(12.2,wCont,Bib.NumToTexto(QRRPAInterMunicipalQT_PESO_CHEGADA.Value,0,11));
    Imp.WriteXY(16.5,wCont,Bib.NumToTexto(QRRPAInterMunicipalNUM_RPA.Value,0,6) );
    Inc(wCont,2);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_SERVICO.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_ADIANTAMENTO.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_PEDAGIO.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_IRF.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_INSS_FORNECEDOR.Value,2,11));
    Inc(wCont);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_SEST_SENAT.Value,2,11));
    Inc(wCont,2);
//    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_FALTA_MERCADORIA_CHEGADA.Value,2,11));
    Inc(wCont,1);
    Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRRPAInterMunicipalVAL_SERVICO.Value -
//                                         wDesconto -
                                         QRRPAInterMunicipalVAL_IRF.Value -
                                         QRRPAInterMunicipalVal_Adiantamento.Value -
                                         QRRPAInterMunicipalVAL_SEST_SENAT.Value -
                                         QRRPAInterMunicipalVAL_INSS_FORNECEDOR.Value,2,11));
//                                         -QRRPAInterMunicipalVAL_FALTA_MERCADORIA_CHEGADA.Value,2,11));
    Imp.SaltaPagina;
    Imp.FechaImpressora;  // Finaliza os serviços de Impressao
    QRRPAInterMunicipal.close;
  end;
End;

procedure TFRPACad.SBOperacaoClick(Sender: TObject);
begin
  inherited;
   if FOperacaoCons = nil then
     FOperacaoCons:=TFOperacaoCons.create(application);
   if FOperacaoCons.showmodal = mrOk then
     DMRPA.QRpaCod_Operacao.value:=DMOperacao.QOperacaoConsCod_Operacao.value;
end;

procedure TFRPACad.DBEdit3Change(Sender: TObject);
Begin
  inherited;
  {If (Trim(DbEdit3.Text) <> '') And (DSPrimario.State in [DsInsert, DsEdit]) Then  //retirei a divisao por 1000 para ficar igual ao peso de chegada (cesar-daiana solicitou 21/12/2007)
     DMRpa.QrpaQt_Peso_Nota.Value:=StrtoFloat('0'+DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                          ' COD_NOTA_CAB = '+Trim(DbEdit3.Text))); }
  if (trim(DBEdit3.Text) <> '') And (DSPrimario.State in [DsInsert, DsEdit]) Then
  begin
    DMRpa.QrpaQt_Peso_Nota.Text := DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_ITEM',
                                                      ' COD_NOTA_CAB = '+Trim(DbEdit3.Text));
    if DMRpa.QrpaQt_Peso_Nota.Text = '' then
      DMRpa.QrpaQt_Peso_Nota.Value := 0;
  end;
End;

procedure TFRPACad.DBEdit27Change(Sender: TObject);
begin
  inherited;
  With DMRPA do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QRPaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QRPaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QRPaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QRPaInd_Situacao.Value = '3';
  End;

end;

procedure TFRPACad.SbContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    DMRpa.QRpaCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;

end;

procedure TFRPACad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMRPA.QRPA_AltCod_Cadastro_Descarga.Value:=DMCadastro.QCadastroConsCod_Cadastro.value;

end;

procedure TFRPACad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    DMRPA.QRPA_AltCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFRPACad.RelRPAcContrato1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = Nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[15].TabVisible := True;
  if FConhecimentoParam.ShowModal = MrOk then
  begin
    with DMRPA do
    begin
      QRRPAContrato.Close;
      if Trim(FConhecimentoParam.Me16CodFilial.Text) <> '' then
        QRRPAContrato.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.Me16CodFilial.Text))
      else
        QRRPAContrato.SetVariable('COD_FILIAL',null);

      if Trim(FconhecimentoParam.Me16CodContrato.Text) <> '' then
        QRRPAContrato.SetVariable('COD_CONTRATO',Trim(FconhecimentoParam.Me16CodContrato.Text))
      else
        QRRPAContrato.SetVariable('COD_CONTRATO',null);

      if Trim(FConhecimentoParam.Me16CodProduto.Text) <> '' then
        QRRPAContrato.SetVariable('COD_PRODUTO',Trim(FConhecimentoParam.Me16CodProduto.Text))
      else
        QRRPAContrato.SetVariable('COD_PRODUTO',null);

      if Trim(FConhecimentoParam.Me16CodParceiro.Text) <> '' then
        QRRPAContrato.SetVariable('COD_CADASTRO_PARCEIRO',Trim(FConhecimentoParam.Me16CodParceiro.Text))
      else
        QRRPAContrato.SetVariable('COD_CADASTRO_PARCEIRO',null);

      QRRPAContrato.SetVariable('DATA_I',Trim(FConhecimentoParam.Me16DTInicial.Text));
      QRRPAContrato.SetVariable('DATA_F',Trim(FConhecimentoParam.Me16DTFinal.Text));

      QRRPAContrato.open;

      If FRRPAContrato = Nil then
         FRRPAContrato := TFRRPAContrato.Create(Application);
      FRRPAContrato.QrlDtInicial.Caption := Trim(FConhecimentoParam.Me16DTInicial.Text);
      FRRPAContrato.QrlDtFinal.Caption := Trim(FConhecimentoParam.Me16DTFinal.Text);
      If Trim(FconhecimentoParam.Me16CodContrato.Text) <> '' then
       Begin
         FRRPAContrato.QrlContrato.Caption := 'Nome:'+DMOracle.BuscaNome('SELECT NOME FROM TB_CONTRATO_VEND,TB_CADASTRO','TB_CONTRATO_VEND.COD_CADASTRO=TB_CADASTRO.COD_CADASTRO AND COD_CONTRATO_VEND =' +Trim(FconhecimentoParam.Me16CodContrato.Text));
         FRRPAContrato.QrlContrato.Caption := FRRPAContrato.QrlContrato.Caption + ' - Nr. Contrato:'+DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +Trim(FconhecimentoParam.Me16CodContrato.Text));
         FRRPAContrato.QrlContrato.Caption := FRRPAContrato.QrlContrato.Caption + ' - Quantidade:'+DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +Trim(FconhecimentoParam.Me16CodContrato.Text));
       End
      Else
       FRRPAContrato.QrlContrato.Caption := '';
      If FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRRPAContrato.QRPrimario.Preview
      else
        FRRPAContrato.QRPrimario.Print;
      QRRPAContrato.Close;
    end;
  end;
end;

procedure TFRPACad.RelRPAsContrato1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = Nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[16].TabVisible := True;
  if FConhecimentoParam.ShowModal = MrOk then
  begin
    with DMRPA do
    begin
      QRRPASemContrato.Close;

      if Trim(FConhecimentoParam.Me17CodFilial.Text) <> '' then
        QRRPASemContrato.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.Me17CodFilial.Text))
      else
        QRRPASemContrato.SetVariable('COD_FILIAL',null);

      if Trim(FConhecimentoParam.Me17CodCadastro.Text) <> '' then
        QRRPASemContrato.SetVariable('COD_CADASTRO',Trim(FConhecimentoParam.Me17CodCadastro.Text))
      else
        QRRPASemContrato.SetVariable('COD_CADASTRO',null);

      if Trim(FConhecimentoParam.Me17CodProduto.Text) <> '' then
        QRRPASemContrato.SetVariable('COD_PRODUTO',Trim(FConhecimentoParam.Me17CodProduto.Text))
      else
        QRRPASemContrato.SetVariable('COD_PRODUTO',null);

      if Trim(FConhecimentoParam.Me17CodParceiro.Text) <> '' then
        QRRPASemContrato.SetVariable('COD_CADASTRO_PARCEIRO',Trim(FConhecimentoParam.Me17CodParceiro.Text))
      else
        QRRPASemContrato.SetVariable('COD_CADASTRO_PARCEIRO',null);

      QRRPASemContrato.SetVariable('DATA_I', Trim(FConhecimentoParam.Me17DTInicial.Text));
      QRRPASemContrato.SetVariable('DATA_F', Trim(FConhecimentoParam.Me17DTFinal.Text));

      QRRPASemContrato.Open;

      If FRRPASemContrato = Nil then
          FRRPASemContrato := TFRRPASemContrato.Create(Application);

      FRRPASemContrato.QrlDtInicial.Caption := Trim(FConhecimentoParam.Me16DTInicial.Text);
      FRRPASemContrato.QrlDtFinal.Caption := Trim(FConhecimentoParam.Me16DTFinal.Text);

      If FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRRPASemContrato.QRPrimario.Preview
      else
        FRRPASemContrato.QRPrimario.Print;
      QRRPASemContrato.Close;
    end;
  end;
end;

procedure TFRPACad.DBEdit21Exit(Sender: TObject);
//Var wProduto : String;
begin
  inherited;
{  If (DMRPA.QRPACod_Nota_Cab.Text <> '') And (DMRPA.QRPAQT_PESO_NOTA.Text <> '') And (DMRPA.QRPAVAL_FRETE_TON.Text <> '') Then
   Begin
     DMNotaSaida.QItemNFCons.Close;
     DMNotaSaida.QItemNFCons.SetVariable('Cod_Nota_Cab',DMRPA.QRPACod_Nota_Cab.Value);
     DMNotaSaida.QItemNFCons.Open;
     If DMNotaSaida.QItemNFConsInd_Tipo_Produto.Value = 'AGRICOLA' Then
       DMRPA.QRPAVAL_SERVICO.Value := DMRPA.QRPAQT_PESO_NOTA.Value * DMRPA.QRPAVAL_FRETE_TON.Value;
   End;
}
end;

procedure TFRPACad.SbEmbarqueClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = nil then
     FEmbarqueCons:=TFEmbarqueCons.create(application);
  if FEmbarqueCons.showmodal = mrOk then
   Begin
     DMRPA.QRPACod_Embarque.value:=DMEmbarque.QEmbarqueConsCod_Embarque.value;
     DMRpa.QRPADESC_PLACA.Value := DMEmbarque.QEmbarqueConsDesc_placa.Value;
   End;  

end;

procedure TFRPACad.RelatrioAcompanhamentoRPa1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
     FConhecimentoParam:=TFConhecimentoParam.create(application);
  FConhecimentoParam.PGRelatorio.Pages[17].TabVisible := True;
  if FConhecimentoParam.showmodal = mrOk then
   begin
     with DMRPA do
     begin
      if FRRpaCarga = nil then
        FRRpaCarga := TFRRpaCarga.create(application);
      QRRPA_Carga.close;
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.Fm17Filial.MeFilial.Text),'CONHECIMENTO');
      if trim(FConhecimentoParam.Fm17Filial.MeFilial.text) <> '' then
         QRRPA_Carga.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.Fm17Filial.MeFilial.Text))
      else
         QRRPA_Carga.SetVariable('COD_FILIAL',null);

      if trim(FConhecimentoParam.Fm17Parceiro.MeCadastro.text) <> '' then
         QRRPA_Carga.SetVariable('COD_CADASTRO_PARCEIRO',Trim(FConhecimentoParam.Fm17Parceiro.MeCadastro.Text))
      else
         QRRPA_Carga.SetVariable('COD_CADASTRO_PARCEIRO',null);

      if trim(FConhecimentoParam.Fm17Finalidade.MeFinalidade.text) <> '' then
         QRRPA_Carga.SetVariable('COD_FINALIDADE',Trim(FConhecimentoParam.Fm17Finalidade.MeFinalidade.Text))
      else
         QRRPA_Carga.SetVariable('COD_FINALIDADE',null);

      if trim(FConhecimentoParam.Fm17Contrato.MeContrato.text) <> '' then
         QRRPA_Carga.SetVariable('COD_CONTRATO',Trim(FConhecimentoParam.Fm17Contrato.MeContrato.Text))
      else
         QRRPA_Carga.SetVariable('COD_CONTRATO',null);

      if trim(FConhecimentoParam.Fm17Cadastro.MeCadastro.Text) <> '' then
         QRRPA_Carga.SetVariable('COD_CADASTRO',trim(FConhecimentoParam.Fm17Cadastro.MeCadastro.Text))
      else
         QRRPA_Carga.SetVariable('COD_CADASTRO',null);

      if trim(FConhecimentoParam.Fm17Produto.MeProduto.Text) <> '' then
         QRRPA_Carga.SetVariable('COD_PRODUTO',trim(FConhecimentoParam.Fm17Produto.MeProduto.Text))
      else
         QRRPA_Carga.SetVariable('COD_PRODUTO',null);

      if trim(FConhecimentoParam.Fm17Datas.MeDtInicial.text) <> '' then
         QRRPA_Carga.SetVariable('DATA_I',trim(FConhecimentoParam.Fm17Datas.MeDtInicial.text));
      if trim(FConhecimentoParam.Fm17Datas.MeDtFinal.text) <> '' then
         QRRPA_Carga.SetVariable('DATA_F',trim(FConhecimentoParam.Fm17Datas.MeDtFinal.text));
      QRRPA_Carga.open;

      FRRpaCarga.QrlTitulo.Caption :='Relação Rpa ' +
                   FConhecimentoParam.Fm17Datas.MeDtInicial.text + ' Até ' +
                   FConhecimentoParam.Fm17Datas.MeDtFinal.text;
      FRRpaCarga.QRLParametros.Caption := 'Filial:'+Trim(FConhecimentoParam.Fm17Filial.MeFilial.Text) + ' Cadastro:'+Trim(FConhecimentoParam.Fm17Parceiro.MeCadastro.Text);
      FRRpaCarga.QRLParametros.Caption := FRRpaCarga.QRLParametros.Caption + ' Finalidade:'+trim(FConhecimentoParam.Fm17Finalidade.MeFinalidade.text);
      FRRpaCarga.QRLParametros.Caption := FRRpaCarga.QRLParametros.Caption + ' Contrato:'+Trim(FConhecimentoParam.Fm17Contrato.MeContrato.Text);
      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRRpaCarga.QRPrimario.Preview
      else
        FRRpaCarga.QRPrimario.Print;
      QRRPA_Carga.close;
    End;
  End;

end;

procedure TFRPACad.SbEstadoClick(Sender: TObject);
begin
  inherited;
   if FEstadoCons = nil then
     FEstadoCons:=TFEstadoCons.create(application);
   if FEstadoCons.showmodal = mrOk then
     DMRPA.QRPACod_Estado.value:=DMEstado.QEstadoConsCod_Estado.value;

end;

end.

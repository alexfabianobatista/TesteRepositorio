unit UConhecimentoFreteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFConhecimentoFreteCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtConsNota: TBitBtn;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    RelatrioConhecimentoFretePContrato1: TMenuItem;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    BitBtn2: TBitBtn;
    DBDirceu1: TDBDirceu;
    Opes1: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    VoltaContasaPagar1: TMenuItem;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    BitBtn3: TBitBtn;
    DBDirceu2: TDBDirceu;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    GeraContsaPagarComplemento1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    DBEPesoNota: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    BitBtn4: TBitBtn;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    BtConsEntrada: TBitBtn;
    DBEdit28: TDBEdit;
    RelatrioGerencialdeFretesIntermunicipais1: TMenuItem;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label28: TLabel;
    DBEdit29: TDBEdit;
    SBNotaCorrecao: TSpeedButton;
    Label29: TLabel;
    DBEdit30: TDBEdit;
    BtTributacao: TBitBtn;
    DBEdit31: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit32: TDBEdit;
    Label32: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    MEPorcentagem: TMaskEdit;
    Label35: TLabel;
    RelatrioConhecimentoFreteTransportador1: TMenuItem;
    RelatriodeTtulosAbertos1: TMenuItem;
    MEQuebra: TMaskEdit;
    RelatrioFretePorDataRecebimento1: TMenuItem;
    Label36: TLabel;
    DBEdit8: TDBEdit;
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioConhecimentoFretePContrato1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure VoltaContasaPagar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtConsNotaClick(Sender: TObject);
    procedure GeraContsaPagarComplemento1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtConsEntradaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBEdit28Change(Sender: TObject);
    procedure RelatrioGerencialdeFretesIntermunicipais1Click(
      Sender: TObject);
    procedure SBNotaCorrecaoClick(Sender: TObject);
    procedure BtTributacaoClick(Sender: TObject);
    procedure DBEdit30Change(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure RelatrioConhecimentoFreteTransportador1Click(
      Sender: TObject);
    procedure RelatriodeTtulosAbertos1Click(Sender: TObject);
    procedure DBEPesoNotaChange(Sender: TObject);
    procedure RelatrioFretePorDataRecebimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteCad: TFConhecimentoFreteCad;

implementation

uses UConhecimentoFrete_cl, UNotaSaidaCons, UContratoVenda_Cons,
  UNotaSaida_cl, Ucontrato_cl, UConhecimentoFretecons,
  UConhecimentoFreteParam, UrConhecimentoFrete, {UContrato_Param,}
  UrConhecimentoFreteSContrato, UOracle_cl, UCadastroCons, UContrato_CP,
  UCadastro_cl, UFilialCons, UFilial_cl, UOperacaoCons, UOperacao_cl,
  UPlanilha_cl, UNotaEntradaCons, UNotaEntrada_cl, UUsuario_cl,
  UParamSistema_cl, URGerenciaConhecimento, UNotaCorrecao, UNotaCorrecao_cl,
  UTributacaoCons, UTributacao_cl,
  URConhecimentoFreteTransportador, URTitulosAbertosConhecimento,
  URConhecimentoFreteData;

{$R *.DFM}

procedure TFConhecimentoFreteCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFConhecimentoFreteCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFConhecimentoFreteCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimentoFrete.QConhecimentoFrete.Open;
end;

procedure TFConhecimentoFreteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimentoFrete.QConhecimentoFrete.Close;
  Action := CaFree;
  FConhecimentoFreteCad := Nil;
end;

procedure TFConhecimentoFreteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteCons = nil then
    FConhecimentoFreteCons := TFConhecimentoFreteCons.Create(Application);
  if FConhecimentoFreteCons.ShowModal = mrOk then
   begin
     with DMConhecimentoFrete do
      begin
        QConhecimentoFrete.Close;
        QConhecimentoFrete.SetVariable('PK',QConhecimentoFreteConsCOD_CONHECIMENTO_FRETE.Value);
        QConhecimentoFrete.Open;
      end;
   end;
end;

procedure TFConhecimentoFreteCad.RelatrioConhecimentoFretePContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FConhecimentoFreteParam.ShowModal =  mrOk then
   begin
     with DMConhecimentoFrete do
       begin
        QRConhecimentoFrete.Close;
        If Trim(FConhecimentoFreteParam.ME1CodContrato.text) <>'' then
          QRConhecimentoFrete.SetVariable('COD_CONTRATO',FConhecimentoFreteParam.ME1CodContrato.text)
        else
          QRConhecimentoFrete.SetVariable('COD_CONTRATO',Null);
        QRConhecimentoFrete.Open;
        If FRConhecimentoFrete = Nil then
          FRConhecimentoFrete := TFRConhecimentoFrete.Create(Application);
        If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
          FRConhecimentoFrete.QRPrimario.Preview
        else
          FRConhecimentoFrete.QRPrimario.Print;
        QRConhecimentoFrete.Close;
       end;
   end;
end;

procedure TFConhecimentoFreteCad.SBConfirmarClick(Sender: TObject);
Var wCod_Conhecimento_Frete,wCodNota : String;
    wQuebraTolerada, wValUnitario, wValQuebra : real;
    wNumEmbalagem : real;
    wCodProduto : integer;
    wVal : string;
Begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
  wCodNota := DMOracle.BuscaNome('SELECT NUM_RPA FROM TB_RPA','COD_NOTA_CAB = '+DBEdit2.Text);
  If wCodNota <> '' Then
     Raise Exception.Create('Nota Com RPA');

  //-------CALCULA O VALOR DA QUEBRA TECNICA------------------------------------
  if DMConhecimentoFrete.QConhecimentoFreteqt_dif_peso.Text <> '' then
  begin
    //**pega o código do produto**
    wVal := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+DBEdit2.Text);
    wCodProduto := 0;
    if wVal <> '' then
       wCodProduto := StrToInt(wVal);
    //********
    wQuebraTolerada := DMConhecimentoFrete.QConhecimentoFreteqt_peso_notas.Value * (strToFloat(MEPorcentagem.Text)/100); //calculo da quebra técnica tolerada.
    //**pega a quantidade do produto na embalagem
    wVal := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = ' + IntToStr(wCodProduto));
    if wVal <> '' then
      wNumEmbalagem := strtofloat(wVal)
    else
      wNumEmbalagem := 0; //se nao encontrar atribui 0
    //**********

    wValQuebra := 0;

    //se a quebra técnica for maior que a permitida.
    if DMConhecimentoFrete.QConhecimentoFreteQT_PESO_CHEGADA.Value < (DMConhecimentoFrete.QConhecimentoFreteqt_peso_notas.Value - wQuebraTolerada) then
    begin
      //**pega o valor efeito seguro
      wVal := DMOracle.BuscaNome('SELECT VAL_EFEITO_SEGURO FROM TB_VALOR_EFEITO_SEGURO',
                                 'COD_PRODUTO = ' + IntToStr(wCodProduto) +
                                 ' AND DT_REFERENCIA = '+Chr(39)+DateToStr(DMConhecimentoFrete.QConhecimentoFreteDT_EMISSAO_CONHECIMENTO.Value)+Chr(39));
      if wVal <> '' then
        wValUnitario := StrToFloat(wVal)
      else
      begin
        wValUnitario := 0;
        raise Exception.Create('Erro ao calcular o Valor da Quebra Técnica.'+#13+#13+
                             'Não existe Valor para Efeito de Seguro para o Produto desta nota.');
      end;
      //**********/

      wValQuebra := (-DMConhecimentoFrete.QConhecimentoFreteqt_dif_peso.Value - wQuebraTolerada)
                     / wNumEmbalagem * wValUnitario;

      MessageDlg('Quebra técnica maior que a tolerada.',mtInformation,[mbOk],0);
    end;
    DMConhecimentoFrete.QConhecimentoFreteVAL_QUEBRA_TECNICA.Value := wValQuebra;
  end;
  //----------------------------------------------------------------------------


  If DBEdit2.Text <> '' Then
   Begin
     wCod_Conhecimento_Frete :=DMOracle.BuscaNome('SELECT COD_CONHECIMENTO_FRETE FROM TB_CONHECIMENTO_FRETE','COD_NOTA_CAB=' +DBEdit2.Text);
     If (wCod_Conhecimento_Frete <> '') And (wCod_Conhecimento_Frete <> DBEdit1.Text) Then   // na alteração cod_nota_cab da tela = cod_nota_tela no banco de dados
      Begin                                                              // esta rotina preve inclusao e alteração
        Raise Exception.Create('Nota Fiscal com Conhecimento de Frete Já Lançado');
        DSPrimario.DataSet.Cancel;
      End
     Else
       Inherited
   End
  Else    
   Inherited;
end;

procedure TFConhecimentoFreteCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFConhecimentoFreteCad.GeraContasaPagar1Click(Sender: TObject);
Var wNome : String;
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value <> 0 then
  Begin
    Try
      DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMConhecimentoFrete.QConhecimentoFreteDt_Recebimento.Value Then
        Raise Exception.Create('Não é Permitido Lançar Este Conhecimento - Fechamento Contabil');
      If not(DMOracle.DBcemapa.InTransaction) then
        DMOracle.DBCemapa.StartTransaction;
      If DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB','COD_CONHECIMENTO_FRETE =' +FloatToStr(DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.VALUE)+' AND NUM_PARCELA=1') = '' Then
      begin
        If FContrato_CP = Nil then
          FContrato_CP := TFContrato_CP.Create(Application);
        FContrato_CP.pTipo:='CNH'; // CONHECIMENTO DE FRETES
        If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
          FContrato_CP.MeValTotal.Text := FloatToStr(DMConhecimentoFrete.QConhecimentoFreteval_frete_total_tela.Value)
        else
          FContrato_CP.MeValTotal.Text:=floatToStr(DMConhecimentoFrete.QConhecimentoFreteVAL_FRETE.Value + DMConhecimentoFrete.QConhecimentoFreteVAL_PEDAGIO.Value - DMConhecimentoFrete.QConhecimentoFreteVAL_DESCONTO.Value + DMConhecimentoFrete.QConhecimentoFreteVAL_ICMS.Value);
        If FContrato_CP.ShowModal = MrCancel Then
           Raise Exception.Create('Contas a Pagar Não Confirmado');
      End;
      With DMOperacao do
      Begin
        QOperacao.Close;
        QOperacao.SetVariable('PK',DMConhecimentoFrete.QConhecimentoFreteCod_Operacao.Value);
        QOperacao.Open;
      End;
      DMConhecimentoFrete.QConhecimentoFrete.Edit;
      DMConhecimentoFrete.QConhecimentoFreteInd_Situacao.Value := '2';
      If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
        DMConhecimentoFrete.QConhecimentoFreteVal_Pis.Value := ((DMConhecimentoFrete.QConhecimentoFreteVAL_FRETE.Value +
                DMConhecimentoFrete.QConhecimentoFreteVAL_PEDAGIO.Value) * DMParamSistema.QParamSistemaPerc_Pis.Value *
                (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) /100;
      If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
        DMConhecimentoFrete.QConhecimentoFreteVal_Cofins.Value := ((DMConhecimentoFrete.QConhecimentoFreteVAL_FRETE.Value +
                 DMConhecimentoFrete.QConhecimentoFreteVAL_PEDAGIO.Value) * DMParamSistema.QParamSistemaPerc_Cofins.Value *
                (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) /100;
      DMConhecimentoFrete.QConhecimentoFrete.Post;
      wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMConhecimentoFrete.QConhecimentoFreteCod_Cadastro.Value),True);
      With DMConhecimentoFrete do
      Begin
        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value,
                             'DEBITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVal_frete_total_tela.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value);
        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value,
                             'CREDITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVal_frete_total_tela.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value);
        If QConhecimentoFreteVal_Icms.Value <> 0 Then
        Begin
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_DEB.Value,
                               'DEBITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               QConhecimentoFreteVal_Icms.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_CRED.Value);
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_CRED.Value,
                               'CREDITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               QConhecimentoFreteVal_Icms.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_VAL_ICMS_DEB.Value);
        End;
        If QConhecimentoFreteVal_Pis.Value <> 0 Then
        Begin
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value,
                               'DEBITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                               QConhecimentoFreteVal_Pis.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value);
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value,
                               'CREDITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                               QConhecimentoFreteVal_Pis.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_Pis_DEB.Value);
        End;
        If QConhecimentoFreteVal_Cofins.Value <> 0 Then
        Begin
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value,
                               'DEBITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                               QConhecimentoFreteVal_Cofins.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value);
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value)+' - '+wNome,
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value,
                               'CREDITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                               QConhecimentoFreteVal_Cofins.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value);
        End;
      End;
      DMOracle.DBCemapa.Commit;
     Except
        DMOracle.DBcemapa.Rollback;
        Raise;
     End;
  End
  Else
    ShowMessage('Erro! Conhecimento de frete, Selecione um contrato.');
end;

procedure TFConhecimentoFreteCad.VoltaContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCod_Conhecimento_Frete.Value<>0 then
    begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMConhecimentoFrete do
            begin
              QContaPagarCab.Close;
              QContaPagarCab.SetVariable('COD_CONHECIMENTO_FRETE',QConhecimentoFreteCod_Conhecimento_Frete.Value);
              QContaPagarCab.Open;
              QContaPagarMov.Close;
              QContaPagarMov.Open;
              While not QContaPagarCab.Eof do
                Begin
                  While not QContaPagarMov.Eof Do
                     If (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                     Else
                        QContaPagarMov.Delete;
                  QContaPagarCab.Delete;
                End;
              DMPlanilha.DesContabiliza(Trunc(QConhecimentoFreteCod_Conhecimento_Frete.Value),'CNH');
              DMConhecimentoFrete.QConhecimentoFrete.Edit;
              DMConhecimentoFrete.QConhecimentoFreteInd_Situacao.Value := '1';
              DMConhecimentoFrete.QConhecimentoFrete.Post;
              DMOracle.DBCemapa.Commit;
           end;
        Except
          DMOracle.DBCemapa.Rollback;
          DMConhecimentoFrete.QContaPagarMov.Cancel;
          DMConhecimentoFrete.QContaPagarCab.Cancel;
//          ShowMessage('Não foi possivel voltar Contas a Pagar!');
          Raise;
        End;
    end;
end;

procedure TFConhecimentoFreteCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFConhecimentoFreteCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BitBtn1.Enabled:=True;
      BitBtn2.Enabled:=True;
      BitBtn3.Enabled:=True;
      BitBtn4.Enabled:=True;
      BtConsNota.Enabled:=True;
      BtConsEntrada.Enabled:=True;
      BtTributacao.Enabled:=True;
    end
  else
    begin
      BitBtn1.Enabled:=False;
      BitBtn2.Enabled:=False;
      BitBtn3.Enabled:=False;
      BitBtn4.Enabled:=False;
      BtConsNota.Enabled:=False;
      BtConsEntrada.Enabled:=False;
      BtTributacao.Enabled:=False;
    end;

end;

procedure TFConhecimentoFreteCad.BtConsNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFConhecimentoFreteCad.GeraContsaPagarComplemento1Click(
  Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value<>0 then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMConhecimentoFrete.QConhecimentoFreteCOD_FILIAL.Text),'AGRICOLA');
      If DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB','COD_CONHECIMENTO_FRETE =' +FloatToStr(DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.VALUE)+' AND NUM_PARCELA=2') = '' Then
        begin
          If not(DMOracle.DBcemapa.InTransaction) then
            DMOracle.DBCemapa.StartTransaction;
          If FContrato_CP=Nil then
            FContrato_CP := TFContrato_CP.Create(Application);
          FContrato_CP.pTipo:='CFC'; // CONHECIMENTO DE FRETES COMPLEMENTO
          FContrato_CP.ShowModal;
          If DMOracle.DBcemapa.InTransaction then
            Begin
              DMOracle.DBcemapa.Rollback;
              ShowMessage('Atenção! Este Contrato não gerou um Contas a Pagar.');
            End;
        End
      Else
        ShowMessage('Erro! Este Conhecimento de frete já gerou um Contas a Pagar.');
    End
  Else
    ShowMessage('Erro! Conhecimento de frete, Selecione um contrato.');
end;
procedure TFConhecimentoFreteCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFConhecimentoFreteCad.BtConsEntradaClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
    DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Value := DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Value;
end;

procedure TFConhecimentoFreteCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFConhecimentoFreteCad.DBEdit28Change(Sender: TObject);
begin
  inherited;
  With DMConhecimentoFrete do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QConhecimentoFreteInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QConhecimentoFreteInd_Situacao.Value = '2';
  End;
end;

procedure TFConhecimentoFreteCad.RelatrioGerencialdeFretesIntermunicipais1Click(
  Sender: TObject);
Var wStrAux : String;
begin
  inherited;
  with DMConhecimentoFrete do
  begin
    QRGerenciaConhecimento.close;
    If FConhecimentoFreteParam = nil then
    Begin
      FConhecimentoFreteParam:=TFConhecimentoFreteParam.create(application);
      FConhecimentoFreteParam.Me3DtInicio.Text := '01/' + FormatDateTime('MM/YYYY', Date);
      FConhecimentoFreteParam.Me3DtFim.Text := DateToStr(Date);
    End;
    FConhecimentoFreteParam.PGRelatorio.Pages[2].TabVisible := True;
    If FConhecimentoFreteParam.showmodal = mrOk then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoFreteParam.ME3CodFilial.Text),'CONHECIMENTO');
      If(Trim(FConhecimentoFreteParam.ME3CodFilial.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('FILIAL',Trim(FConhecimentoFreteParam.ME3CodFilial.Text))
      Else
        QRGerenciaConhecimento.SetVariable('FILIAL',null);
      If(Trim(FConhecimentoFreteParam.ME3CodProduto.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('PRODUTO',Trim(FConhecimentoFreteParam.ME3CodProduto.Text))
      Else
        QRGerenciaConhecimento.SetVariable('PRODUTO',null);
      If(Trim(FConhecimentoFreteParam.Me3Transportador.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('COD_CADASTRO',Trim(FConhecimentoFreteParam.Me3Transportador.Text))
      Else
        QRGerenciaConhecimento.SetVariable('COD_CADASTRO',null);
      If(Trim(FConhecimentoFreteParam.Me3CadastroNF.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('COD_CADASTRO_NF',Trim(FConhecimentoFreteParam.Me3CadastroNF.Text))
      Else
        QRGerenciaConhecimento.SetVariable('COD_CADASTRO_NF',null);
      If(Trim(FConhecimentoFreteParam.Me3Placa.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('DESC_PLACA',Trim(FConhecimentoFreteParam.Me3Placa.Text))
      Else
        QRGerenciaConhecimento.SetVariable('DESC_PLACA',null);
      If(Trim(FConhecimentoFreteParam.Me3DtInicioNF.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('DT_INICIAL_NF',Trim(FConhecimentoFreteParam.Me3DtInicioNF.Text))
      Else
        QRGerenciaConhecimento.SetVariable('DT_INICIAL_NF',null);
      If(Trim(FConhecimentoFreteParam.Me3DtFinalNF.Text)<>'')Then
        QRGerenciaConhecimento.SetVariable('DT_FINAL_NF',Trim(FConhecimentoFreteParam.Me3DtFinalNF.Text))
      Else
        QRGerenciaConhecimento.SetVariable('DT_FINAL_NF',null);
      wstrAux := '';
      Case FConhecimentoFreteParam.Rg3Situacao.ItemIndex Of
        0: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO','E');
             wstrAux := 'ENTRADAS';
           End;
        1: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO','S');
             wstrAux := 'SAÍDAS';
           End;
        2: Begin
             QRGerenciaConhecimento.SetVariable('SITUACAO',null);
             wstrAux := 'TODAS';
           End;
      End;
      QRGerenciaConhecimento.SetVariable('DT_INICIAL',Trim(FConhecimentoFreteParam.ME3DtInicio.Text));
      QRGerenciaConhecimento.SetVariable('DT_FINAL',Trim(FConhecimentoFreteParam.ME3DtFim.Text));
      QRGerenciaConhecimento.open;
      if FRGerenciaConhecimento = nil then
        FRGerenciaConhecimento := TFRGerenciaConhecimento.create(application);
      FRGerenciaConhecimento.QRLbFilial.Caption := 'Unidade: ' + Trim(FConhecimentoFreteParam.Ed3Filial.Text);
      FRGerenciaConhecimento.QRLbPeriodo.Caption := FConhecimentoFreteParam.ME3DtInicio.Text + ' Até ' + FConhecimentoFreteParam.ME3DtFim.Text;
      FRGerenciaConhecimento.QRLbFrete.Caption := 'Frete: ' + wstrAux;
      If(Trim(FConhecimentoFreteParam.Me3CadastroNF.Text) <> '')Then
         FRGerenciaConhecimento.QRLbFrete.Caption := FRGerenciaConhecimento.QRLbFrete.Caption + ' Destino/Origem:'+FConhecimentoFreteParam.Ed3CadastroNf.Text;
      FRGerenciaConhecimento.QRLbProduto.Caption := 'Código Produto: ' + Trim(FConhecimentoFreteParam.Me3CodProduto.Text) + ' ' + FConhecimentoFreteParam.Ed3Produto.Text;
      if FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
        FRGerenciaConhecimento.QRPrimario.Preview
      else
        FRGerenciaConhecimento.QRPrimario.Print;
      QRGerenciaConhecimento.Close;
    End;
  End;
end;

procedure TFConhecimentoFreteCad.SBNotaCorrecaoClick(Sender: TObject);
begin
  inherited;
  if DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value = 0 then
    raise Exception.Create('É necessário escolher um Registro para emitir uma Carta Corretiva');
  if FNotaCorrecao = nil then
    FNotaCorrecao := TFNotaCorrecao.Create(application);
  DMNotaCorrecao.pCodNota := DMConhecimentoFrete.QConhecimentoFreteCOD_NOTA_CAB.Value;
  DMNotaCorrecao.pCodConhecimentoFrete := DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value;
  FNotaCorrecao.ShowModal;
end;

procedure TFConhecimentoFreteCad.BtTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = nil then
     FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOK then
     DMConhecimentoFrete.QConhecimentoFreteCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
end;

procedure TFConhecimentoFreteCad.DBEdit30Change(Sender: TObject);
Var wBase,wAliq : Real;
begin
  inherited;
  With DMConhecimentoFrete do
  Begin
    If (Trim(DBEdit30.Text) <> '') And (DsPrimario.State In [DsInsert,DsEdit]) Then
     Begin
       wBase := StrtoFloat(DMOracle.BuscaNome('SELECT Perc_Tributado FROM TB_Tributacao','COD_Tributacao = '+DBEdit30.Text));
       wAliq := StrtoFloat(DMOracle.BuscaNome('SELECT Perc_Aliquota FROM TB_Tributacao','COD_Tributacao = '+DBEdit30.Text));
       If wAliq > 0 Then
          QConhecimentoFreteVal_Icms.Value := (QConhecimentoFreteVal_Frete.Value * wBase / 100) * wAliq / 100
       Else
          QConhecimentoFreteVal_Icms.Value := 0;   
     End;
  End;

end;

procedure TFConhecimentoFreteCad.SBAlterarClick(Sender: TObject);
begin
  If DMConhecimentoFrete.QConhecimentoFreteInd_Situacao.Value = '2' Then
     Raise Exception.Create('Não Permite Alterar Frete Confirmados!');
  inherited;
end;

procedure TFConhecimentoFreteCad.RelatrioConhecimentoFreteTransportador1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[3].TabVisible:=True;
  if FConhecimentoFreteParam.ShowModal =  mrOk then
    begin
      with DMConhecimentoFrete do
        begin
          QRConhecimentoFreteTransp.Close;
          QRConhecimentoFreteTransp.SetVariable('DATA_I',FConhecimentoFreteParam.ME4DtInicio.Text);
          QRConhecimentoFreteTransp.SetVariable('DATA_F',FConhecimentoFreteParam.ME4DtFim.Text);

          If trim(FConhecimentoFreteParam.ME4Filial.Text) <> '' then
             QRConhecimentoFreteTransp.SetVariable('COD_FILIAL',strtoint(trim(FConhecimentoFreteParam.ME4Filial.Text)))
          Else
             QRConhecimentoFreteTransp.SetVariable('COD_FILIAL',Null);

          If trim(FConhecimentoFreteParam.ME4CadastroNF.Text) <> '' then
             QRConhecimentoFreteTransp.SetVariable('COD_CADASTRO',strtoint(trim(FConhecimentoFreteParam.ME4CadastroNF.Text)))
          Else
             QRConhecimentoFreteTransp.SetVariable('COD_CADASTRO',Null);

          If trim(FConhecimentoFreteParam.ME4Transportador.Text) <> '' then
             QRConhecimentoFreteTransp.SetVariable('COD_TRANSPORTADOR',strtoint(trim(FConhecimentoFreteParam.ME4Transportador.Text)))
          Else
             QRConhecimentoFreteTransp.SetVariable('COD_TRANSPORTADOR',Null);

          If trim(FConhecimentoFreteParam.ME4Produto.Text) <> '' then
             QRConhecimentoFreteTransp.SetVariable('COD_PRODUTO',strtoint(trim(FConhecimentoFreteParam.ME4Produto.Text)))
          Else
             QRConhecimentoFreteTransp.SetVariable('COD_PRODUTO',Null);

          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 0 then
             QRConhecimentoFreteTransp.SetVariable('IND_SITUACAO','1');
          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 1 then
             QRConhecimentoFreteTransp.SetVariable('IND_SITUACAO','2');
          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 2 then
             QRConhecimentoFreteTransp.SetVariable('IND_SITUACAO',Null);

          QRConhecimentoFreteTransp.Open;

          If FRConhecimentoFreteTransportador = Nil then
            FRConhecimentoFreteTransportador := TFRConhecimentoFreteTransportador.Create(Application);
          FRConhecimentoFreteTransportador.QRLTitulo.Caption := 'Relatório de Conhecimentos de Frete de ' + FConhecimentoFreteParam.ME4DtInicio.Text + ' Até ' + FConhecimentoFreteParam.ME4DtFim.Text;
          FRConhecimentoFreteTransportador.QRLFilial.Caption := 'Filial: ' + FConhecimentoFreteParam.Ed4Filial.Text;
          FRConhecimentoFreteTransportador.QRLTransportador.Caption := 'Transportador: ' + FConhecimentoFreteParam.Ed4Transportador.Text;
          FRConhecimentoFreteTransportador.QRLCadastroNF.Caption := 'Cadastro NF: ' + FConhecimentoFreteParam.Ed4CadastroNF.Text;
          FRConhecimentoFreteTransportador.QRLProduto.Caption := 'Produto: ' + FConhecimentoFreteParam.Ed4Produto.Text;
          FRConhecimentoFreteTransportador.QRLClasse.Caption := 'Classe/Sub-classe: ';// + FConhecimentoFreteParam.Ed4Filial.Text
          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 0 then
             FRConhecimentoFreteTransportador.QRLSituacao.Caption := 'Situação: Digitado';
          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 1 then
             FRConhecimentoFreteTransportador.QRLSituacao.Caption := 'Situação: Confirmado';
          if FConhecimentoFreteParam.RG4Situacao.ItemIndex = 2 then
             FRConhecimentoFreteTransportador.QRLSituacao.Caption := 'Situação: Todos';

          If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
            FRConhecimentoFreteTransportador.QRPrimario.Preview
          else
            FRConhecimentoFreteTransportador.QRPrimario.Print;
          QRConhecimentoFreteTransp.Close;
        end;
    end;
end;

procedure TFConhecimentoFreteCad.RelatriodeTtulosAbertos1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[4].TabVisible:=True;
  if FConhecimentoFreteParam.ShowModal =  mrOk then
  begin
    with DMConhecimentoFrete do
    begin
      QRTituloAbertoConhecimento.Close;

      QRTituloAbertoConhecimento.SetVariable('DATA_I',FConhecimentoFreteParam.ME5DtInicio.Text);
      QRTituloAbertoConhecimento.SetVariable('DATA_F',FConhecimentoFreteParam.ME5DtFim.Text);

      If trim(FConhecimentoFreteParam.ME5Filial.Text) <> '' then
        QRTituloAbertoConhecimento.SetVariable('COD_FILIAL',strtoint(trim(FConhecimentoFreteParam.ME5Filial.Text)))
      Else
        QRTituloAbertoConhecimento.SetVariable('COD_FILIAL',Null);

      If trim(FConhecimentoFreteParam.ME5Transportador.Text) <> '' then
        QRTituloAbertoConhecimento.SetVariable('COD_TRANSPORTADOR',strtoint(trim(FConhecimentoFreteParam.ME5Transportador.Text)))
      Else
        QRTituloAbertoConhecimento.SetVariable('COD_TRANSPORTADOR',Null);

      QRTituloAbertoConhecimento.Open;

      If FRTitulosAbertosConhecimento = Nil then
        FRTitulosAbertosConhecimento := TFRTitulosAbertosConhecimento.Create(Application);

      FRTitulosAbertosConhecimento.QRLPeriodo.Caption := 'Período: ' + FConhecimentoFreteParam.ME5DtInicio.Text + ' Até ' + FConhecimentoFreteParam.ME5DtFim.Text;
      FRTitulosAbertosConhecimento.QRLFilial.Caption := 'Filial: ' + FConhecimentoFreteParam.Ed5Filial.Text;
      FRTitulosAbertosConhecimento.QRLTransportador.Caption := 'Transportador: ' + FConhecimentoFreteParam.Ed5Transportador.Text;

      If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
        FRTitulosAbertosConhecimento.QRPrimario.Preview
      else
        FRTitulosAbertosConhecimento.QRPrimario.Print;
      QRTituloAbertoConhecimento.Close;
    end;
  end;
end;

procedure TFConhecimentoFreteCad.DBEPesoNotaChange(Sender: TObject);
begin
  inherited;
  try
     MEQuebra.Text := floattostr(- DMConhecimentoFrete.QConhecimentoFreteqt_peso_notas.value *
                      strtofloat(MEPorcentagem.Text)/100)
  except
     MEQuebra.Text := '';
  end;

end;

procedure TFConhecimentoFreteCad.RelatrioFretePorDataRecebimento1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteParam = Nil then
    FConhecimentoFreteParam:= TFConhecimentoFreteParam.Create(Application);
  FConhecimentoFreteParam.PGRelatorio.Pages[5].TabVisible:=True;
  If FConhecimentoFreteParam.ShowModal =  mrOk then
   begin
     with DMConhecimentoFrete do
       begin
        QRConhecimentoData.Close;
        If Trim(FConhecimentoFreteParam.Me6CodFilial.text) <> '' then
          QRConhecimentoData.SetVariable('COD_FILIAL',FConhecimentoFreteParam.Me6CodFilial.text)
        else
          QRConhecimentoData.SetVariable('COD_FILIAL',Null);
        QRConhecimentoData.SetVariable('DT_INICIAL',FConhecimentoFreteParam.Me6DtInicial.text);
        QRConhecimentoData.SetVariable('DT_FINAL',FConhecimentoFreteParam.Me6DtFinal.text);
        QRConhecimentoData.Open;
        If FRConhecimentoFreteData = Nil then
          FRConhecimentoFreteData := TFRConhecimentoFreteData.Create(Application);
        If FConhecimentoFreteParam.RGPreview.ItemIndex = 0 then
          FRConhecimentoFreteData.QRPrimario.Preview
        else
          FRConhecimentoFreteData.QRPrimario.Print;
        QRConhecimentoData.Close;
       end;
   end;

end;

End.

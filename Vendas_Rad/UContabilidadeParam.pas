unit UContabilidadeParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, variants;

type
  TFContabilidadeParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label93: TLabel;
    Me0Filial: TMaskEdit;
    BT0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox19: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Me0DataI: TMaskEdit;
    Me0DataF: TMaskEdit;
    PB: TProgressBar;
    RG0Tipo: TRadioGroup;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Me1DataI: TMaskEdit;
    Me1DataF: TMaskEdit;
    BitBtn2: TBitBtn;
    procedure Me0FilialChange(Sender: TObject);
    procedure BT0ConsFilialClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilidadeParam: TFContabilidadeParam;

implementation

uses UFilial_cl, UFilialCons, UContabiliza_cl, UOracle_cl, UNotaSaida_cl,
  UNotaEntrada_cl, UUsuario_cl, UOperacao_cl, UParamSistema_cl,
  UPlanilha_cl;

{$R *.DFM}

procedure TFContabilidadeParam.Me0FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';

end;

procedure TFContabilidadeParam.BT0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialChange(Self);
  End;

end;

procedure TFContabilidadeParam.BtOkClick(Sender: TObject);
Var wCont : Integer;
begin
  inherited;
{  With DMContabiliza do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(Me0Filial.Text),'CONTABIL');
    QContabiliza.Close;

    If Trim(FContabilidadeParam.ME0Filial.Text) = '' then
      QContabiliza.SetVariable('COD_FILIAL',Null)
    Else
      QContabiliza.SetVariable('COD_FILIAL',StrToInt(Trim((FContabilidadeParam.ME0Filial.Text))));
    If Rg0Tipo.ItemIndex = 0 Then
       QContabiliza.SetVariable('TIPO_NOTA','E')
    Else
       QContabiliza.SetVariable('TIPO_NOTA','S');
    QContabiliza.SetVariable('DATA_INICIAL',StrToDate(FContabilidadeParam.ME0DataI.Text));
    QContabiliza.SetVariable('DATA_FINAL',StrToDate(FContabilidadeParam.ME0DataF.Text));
    QContabiliza.Open;
    wCont := 0;
    Pb.Position := QContabiliza.RecordCount;
    If Rg0Tipo.ItemIndex = 1 Then
     Begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While Not QContabiliza.Eof Do
        Begin
          With DMNotaSaida do
          Begin
            QNotaSaida.Close;
            QNotaSaida.SetVariable('PK',QContabilizaCod_Nota_Cab.Value);
            QNotaSaida.Open;
            QItemNf.Close;
            QItemNf.Open;
            Contabiliza;  // rotina de contabilização de notas de saída
          End;
          Inc(wCont);
          PB.Position := wCont;
          QContabiliza.Next;
        End;
      Except
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;
     End
    Else
     Begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        DMNotaEntrada.PContabiliza_Extra := 'S';
        While Not QContabiliza.Eof Do
        Begin
          With DMNotaEntrada do
          Begin
            QNotaEntrada.Close;
            QNotaEntrada.SetVariable('PK',QContabilizaCod_Nota_Cab.Value);
            QNotaEntrada.Open;
            QItemNf.Close;
            QItemNf.Open;
            DMNotaEntrada.Contabiliza(QNotaEntradaCod_Nota_Cab.Value);
          End;
          Inc(wCont);
          PB.Position := wCont;
          QContabiliza.Next;
        End;
      Except
        DMNotaEntrada.PContabiliza_Extra := 'N';
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;
    End;
    DMNotaEntrada.PContabiliza_Extra := 'N';
    DMOracle.DBCemapa.Commit;
    Pb.Position := 0;
  End;
}  
end;

procedure TFContabilidadeParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FContabilidadeParam := Nil;
end;

procedure TFContabilidadeParam.BitBtn1Click(Sender: TObject);
Var wPis,wCofins : Real;
    wCont : Integer;
    wComando : String;
begin
  inherited;
  With DMContabiliza do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(Me0Filial.Text),'CONTABIL');
    QContabiliza.Close;
    If Trim(FContabilidadeParam.ME0Filial.Text) = '' then
      QContabiliza.SetVariable('COD_FILIAL',Null)
    Else
      QContabiliza.SetVariable('COD_FILIAL',StrToInt(Trim((FContabilidadeParam.ME0Filial.Text))));
    If Rg0Tipo.ItemIndex = 0 Then
       QContabiliza.SetVariable('TIPO_NOTA','E')
    Else
       QContabiliza.SetVariable('TIPO_NOTA','S');
    QContabiliza.SetVariable('DATA_INICIAL',StrToDate(FContabilidadeParam.ME0DataI.Text));
    QContabiliza.SetVariable('DATA_FINAL',StrToDate(FContabilidadeParam.ME0DataF.Text));
    QContabiliza.Open;
    wCont := 0;
    Pb.Position := QContabiliza.RecordCount;
    If Rg0Tipo.ItemIndex = 1 Then
     Begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While Not QContabiliza.Eof Do
        Begin
          With DMNotaSaida do
          Begin
            QNotaSaida.Close;
            QNotaSaida.SetVariable('PK',QContabilizaCod_Nota_Cab.Value);
            QNotaSaida.Open;
            DMOperacao.QOperacao.Close;
            DMOperacao.QOperacao.SetVariable('pk',QNotasaidaCod_Operacao.Value);
            DMOperacao.QOperacao.Open;
            QItemNf.Close;
            QItemNf.Open;
            While not (QItemNf.Eof) Do
             Begin
               If (QItemNFVal_Pis.Value = 0) And
                  (QItemNFVal_Confins.Value = 0) Then
               Begin
                 wPis := 0;
                 wCofins := 0;
                 If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
                    wPis := ((DMNotaSaida.QItemNFVal_Total.Value - DMNotaSaida.QItemNFVal_Desconto.Value) *
                             DMParamSistema.QParamSistemaPerc_Pis.Value *
                            (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) /100;
                 If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
                    wCofins := ((QItemNFVal_Total.Value - DMNotaSaida.QItemNFVal_Desconto.Value) *
                                DMParamSistema.QParamSistemaPerc_Cofins.Value *
                               (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) /100;
                 If (wPis <> 0) or (wCofins <> 0) Then
                  Begin
                    QAtualiza_Nota.Close;
                    QAtualiza_Nota.SetVariable('Pis',wPis);
                    QAtualiza_Nota.SetVariable('Cofins',wCofins);
                    QAtualiza_Nota.SetVariable('COD_NOTA_ITEM',QItemNFCod_Nota_Item.Value);
                    QAtualiza_Nota.ExecSQL;
                  End;

                // contabilizacao do pis
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Deb.Value,
                                     'DEBITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                                     wPis,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Cred.Value);

                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Cred.Value,
                                     'CREDITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                                     wPis,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Deb.Value);
                // contabilizacao do COFINS
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Deb.Value,
                                     'DEBITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                                     wCofins,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Cred.Value);
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Cred.Value,
                                     'CREDITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                                     wCofins,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Deb.Value);
               End;
              QItemNf.Next;
             End;
          End;
          Inc(wCont);
          PB.Position := wCont;
          QContabiliza.Next;
        End;
        DMOracle.DBCemapa.Commit;
      Except
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;
     End
    Else
     Begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        DMNotaEntrada.PContabiliza_Extra := 'S';
        While Not QContabiliza.Eof Do
        Begin
          With DMNotaEntrada do
          Begin
            QNotaEntrada.Close;
            QNotaEntrada.SetVariable('PK',QContabilizaCod_Nota_Cab.Value);
            QNotaEntrada.Open;
            DMOperacao.QOperacao.Close;
            DMOperacao.QOperacao.SetVariable('pk',QNotaEntradaCod_Operacao.Value);
            DMOperacao.QOperacao.Open;
            QItemNf.Close;
            QItemNf.Open;
            While not (QItemNf.Eof) Do
             Begin
               If (QItemNFVal_Pis.Value = 0) And
                  (QItemNFVal_Confins.Value = 0) Then
               Begin
                 wPis := 0;
                 wCofins := 0;
                 If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
                    wPis := ((QItemNFVal_Total.Value - DMNotaEntrada.QItemNFVal_Desconto.Value) *
                             DMParamSistema.QParamSistemaPerc_Pis.Value *
                            (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) /100;
                 If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
                    wCofins := ((QItemNFVal_Total.Value - DMNotaEntrada.QItemNFVal_Desconto.Value) *
                                DMParamSistema.QParamSistemaPerc_Cofins.Value *
                               (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) /100;
                 If (wPis <> 0) or (wCofins <> 0) Then
                  Begin
                    QAtualiza_Nota.Close;
                    QAtualiza_Nota.SetVariable('Pis',wPis);
                    QAtualiza_Nota.SetVariable('Cofins',wCofins);
                    QAtualiza_Nota.SetVariable('COD_NOTA_ITEM',QItemNFCod_Nota_Item.Value);
                    QAtualiza_Nota.ExecSQL;
                  End;
                // contabilizacao do pis
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Deb.Value,
                                     'DEBITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                                     wPis,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Cred.Value);

                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Cred.Value,
                                     'CREDITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
                                     wPis,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Pis_Deb.Value);
                // contabilizacao do COFINS
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Deb.Value,
                                     'DEBITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                                     wCofins,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Cred.Value);
                DMPlanilha.GravaLanc('NFE',
                                     QContabilizaCod_Nota_Cab.Value,
                                     FloatToStr(QContabilizaNum_Nota.Value)+'-'+QContabilizaCod_Serie.Value,
                                     QContabilizaCod_Filial.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Cred.Value,
                                     'CREDITO',
                                     QContabilizaCod_Cadastro.Value,
                                     DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                                     wCofins,
                                     QContabilizaDt_Recebimento.Value,
                                     DMOperacao.QOperacaoCod_Contabil_Cofins_Deb.Value);
               End;
              QItemNf.Next;
             End;
          End;
          Inc(wCont);
          PB.Position := wCont;
          QContabiliza.Next;
        End;
      Except
        DMNotaEntrada.PContabiliza_Extra := 'N';
        DMOracle.DBCemapa.RollBack;
        Raise;
      End;
    End;
    DMNotaEntrada.PContabiliza_Extra := 'N';
    DMOracle.DBCemapa.Commit;
    Pb.Position := 0;
  End;

end;

procedure TFContabilidadeParam.BitBtn2Click(Sender: TObject);
Var wPis,wCofins : Real;
    wCont : Integer;
    wComando : String;
begin
  inherited;
  With DMContabiliza do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(Me0Filial.Text),'CONTABIL');
    QConhecimentoFrete.Close;
    QConhecimentoFrete.SetVariable('DT_INICIAL',StrToDate(FContabilidadeParam.Me1DataI.Text));
    QConhecimentoFrete.SetVariable('DT_FINAL',StrToDate(FContabilidadeParam.Me1DataF.Text));
    QConhecimentoFrete.Open;
    wCont := 0;
    Pb.Position := QConhecimentoFrete.RecordCount;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While Not QConhecimentoFrete.Eof Do
      Begin
        wPis := 0;
        wCofins := 0;
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('pk',QConhecimentoFreteCod_Operacao.Value);
        DMOperacao.QOperacao.Open;
        If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
           wPis := (QConhecimentoFreteVAL_FRETE.Value *
                                  DMParamSistema.QParamSistemaPerc_Pis.Value *
                                 (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) /100;
        If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
           wCofins := (QConhecimentoFreteVAL_FRETE.Value *
                                     DMParamSistema.QParamSistemaPerc_Cofins.Value *
                                    (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) /100;
        If (wPis <> 0) or (wCofins <> 0) Then
         Begin
           QConhecimentoFrete.Edit;
           QConhecimentoFreteVal_Pis.Value :=wPis;
           QConhecimentoFreteVal_Cofins.Value:=wCofins;
           QConhecimentoFrete.Post;
         End;
{        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value),
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value,
                             'DEBITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVAL_FRETE.Value + QConhecimentoFreteVal_Pedagio.Value + QConhecimentoFreteVAL_FRETE_COMPLEMENTO.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value);
        DMPlanilha.GravaLanc('CNH',
                             QConhecimentoFreteCod_Conhecimento_Frete.Value,
                             FloatToStr(QConhecimentoFreteNum_Frete.Value),
                             QConhecimentoFreteCod_Filial.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value,
                             'CREDITO',
                             QConhecimentoFreteCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QConhecimentoFreteVAL_FRETE.Value + QConhecimentoFreteVal_Pedagio.Value + QConhecimentoFreteVAL_FRETE_COMPLEMENTO.Value,
                             QConhecimentoFreteDt_Recebimento.Value,
                             DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value);
        If QConhecimentoFreteVal_Icms.Value <> 0 Then
        Begin
          DMPlanilha.GravaLanc('CNH',
                               QConhecimentoFreteCod_Conhecimento_Frete.Value,
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
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
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
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
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
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
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
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
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
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
                               FloatToStr(QConhecimentoFreteNum_Frete.Value),
                               QConhecimentoFreteCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value,
                               'CREDITO',
                               QConhecimentoFreteCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                               QConhecimentoFreteVal_Cofins.Value,
                               QConhecimentoFreteDt_Recebimento.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value);
        End;
}
        Inc(wCont);
        PB.Position := wCont;
        QConhecimentoFrete.Next;
      End;
      DMOracle.DBCemapa.Commit;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
    DMOracle.DBCemapa.Commit;
    Pb.Position := 0;
  End;
end;


end.

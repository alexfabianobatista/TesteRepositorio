unit UContrato_CP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFContrato_CP = class(TForm)
    MECodFinalidade: TMaskEdit;
    SbFinalidade: TSpeedButton;
    MEFinalidade: TMaskEdit;
    MECodbanco: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEBanco: TMaskEdit;
    MECodDepartamento: TMaskEdit;
    SbDepartamento: TSpeedButton;
    MEDepartamento: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    LBContaPagar: TListBox;
    MEDiasCP: TMaskEdit;
    Label20: TLabel;
    Label4: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    Label5: TLabel;
    BtApagaParcela: TBitBtn;
    Label6: TLabel;
    MeValTotal: TMaskEdit;
    RgFinalidade: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure SbFinalidadeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SbDepartamentoClick(Sender: TObject);
    procedure MECodFinalidadeExit(Sender: TObject);
    procedure MECodbancoExit(Sender: TObject);
    procedure MECodDepartamentoExit(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RgFinalidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    FTipo : String;
    property pTipo : String Read FTipo write FTipo;
    { Public declarations }
  end;

var
  FContrato_CP: TFContrato_CP;

implementation

uses UContasPagar_cl, Ucontrato_cl, UOracle_cl, UFinalidadeCons,
  UFinalidade_cl, UBancosCons, UBancoAgencia_cl, UDepartamentoCons,UBiblioteca,
  UDepartamento_cl, UProduto_cl, UConhecimentoFrete_cl, UParamSistema_cl,
  UContrato_Pjuridica_cl, UContratoCPR_cl;

{$R *.DFM}

procedure TFContrato_CP.Button1Click(Sender: TObject);
Var wCont : Integer;
    wValor,wValor1,wQt_Dpi,wVal_Dpi : Real;
    wAux,wPerc_Dpi,wNum_Nota : String;
begin
  wValor := 0;
  Try
    with DMContasPagar do
      begin
        QContasPagar_cab.Close;
        QContasPagar_Mov.Close;
        If pTipo = 'CON' then
          Begin
            DMProduto.QProduto.Close;
            DMProduto.QProduto.SetVariable('PK',DMContrato.QContratoCOD_Produto.Value);
            DMProduto.QProduto.Open;
            QContasPagar_cab.Open;
            QContasPagar_Mov.Open;
            QContasPagar_Cab.Insert;
            if Trim(MECodFinalidade.Text)<>'' then
              QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
            if Trim(MECodBanco.Text)<>'' then
              QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
            if Trim(MECodDepartamento.Text)<>'' then
              QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
            QContasPagar_CabCod_Cadastro.Value:=DMContrato.QContratoCod_Cadastro.Value;
            QContasPagar_CabCod_Filial.Value:=DMContrato.QContratoCod_Filial.Value;
            QContasPagar_CabDesc_tipo_Documento.Value:='CON';
            QContasPagar_CabDT_VENCIMENTO.Value:=DMContrato.QContratoDT_VENCIMENTO.value;
            QContasPagar_CabDT_EMISSAO.Value:=DMContrato.QContratoDT_EMISSAO.value;
            wVal_Dpi := 0;
            If DMContrato.QContratoIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then
              If DMContrato.QContratoQT_CREDITO_TRANSGENICOS.Text <> '' Then
               Begin
                 wQt_DPI := DMContrato.QContratoQT_QUANTIDADE.Value - DMContrato.QContratoQT_CREDITO_TRANSGENICOS.Value;
                 If wQt_DPI > 0 Then
                  Begin
                    wPerc_Dpi := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(DMContrato.QContratoCod_Produto.Text));
                    If (Trim(wPerc_Dpi) <> '') And (Trim(wPerc_Dpi) <> '0')  Then
                       wVal_Dpi := DMContrato.QContratoPRECO.value * wQt_DPI / DMProduto.QprodutoNum_Embalagem.Value * StrToFloat(Trim(wPerc_Dpi)) / 100;
                 End;
               End;
            QContasPagar_CabVAL_TITULO.Value:=(DMContrato.QContratoQT_QUANTIDADE.Value/DMProduto.QprodutoNum_Embalagem.Value)*DMContrato.QContratoPRECO.value*((100-DMContrato.QContratoPerc_FunRural.Value)/100) - wVal_Dpi;
            QContasPagar_CabIND_ACEITE.Value:='NAO';
            QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
            QContasPagar_CabCOD_CONTRATO.Value:=DMContrato.QContratoCOD_CONTRATO.Value;
            QContasPagar_CabNUM_TITULO.Value:=DMCOntrato.QContratoNum_Contrato.Value;
            QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao contrato nr.'+DMCOntrato.QContratoNum_Contrato.Text;
            QCOntasPagar_Cab.Post;
            DMContrato.QContrato.Edit;
            DMContrato.QContratoInd_CP.value:=1;
            DMContrato.QContrato.Post;
          End
        else
          if pTipo = 'CNH' then  // CONHECIMENTO DE FRETE
            Begin
              wValor := 0;
              For wCont := 0 To LBContaPagar.Items.Count - 1 do
              Begin
                wAux := Copy(LBContaPagar.Items[wCont],11,15);
                wAux := Bib.LimpaString(wAux,'.');
                wValor := wValor + StrToFloat(wAux)
              End;
              wValor1 := StrToFloat(Trim(MeValTotal.Text));
              If wValor <> wValor1 Then
                 Raise Exception.Create('Valor das Parcelas Diferente do Total');
              QContasPagar_cab.Open;
              QContasPagar_Mov.Open;
              For wCont := 0 to LBContaPagar.Items.Count - 1 do
              Begin
                QContasPagar_Cab.Insert;
                if Trim(MECodFinalidade.Text)<>'' then
                  QContasPagar_cabCod_finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
                if Trim(MECodBanco.Text)<>'' then
                  QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
                if Trim(MECodDepartamento.Text)<>'' then
                  QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
                QContasPagar_CabCod_Cadastro.Value:=DMConhecimentoFrete.QConhecimentoFreteCod_Cadastro.Value;
                QContasPagar_CabCod_Filial.Value:=DMConhecimentoFrete.QConhecimentoFreteCod_Filial.Value;
                QContasPagar_CabDesc_tipo_Documento.Value:='CNH';
                QContasPagar_CabDT_VENCIMENTO.Value:=StrToDate(Copy(LBContaPagar.Items[wCont],1,10) );
                QContasPagar_CabDt_Movimento.Value:=DMConhecimentoFrete.QConhecimentoFreteDt_Recebimento.Value;
                QContasPagar_CabDT_EMISSAO.Value:=DMConhecimentoFrete.QConhecimentoFreteDt_Recebimento.value;
                QContasPagar_CabNUM_TITULO.Value:=DMConhecimentoFrete.QConhecimentoFreteNUM_FRETE.value;
                QContasPagar_CabNUM_PARCELA.Value:=wCont + 1;
                wAux := Copy(LBContaPagar.Items[wCont],11,15);
                wAux := Bib.LimpaString(wAux,'.');
                QContasPagar_CabVAL_TITULO.Value:=StrToFloat(wAux);
                QContasPagar_CabIND_ACEITE.Value:='NAO';
                QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
                QContasPagar_CabCOD_CONHECIMENTO_FRETE.Value:=DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value;
                wNum_Nota := DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB='+Trim(DMConhecimentoFrete.QConhecimentoFreteCod_Nota_Cab.Text));
                QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao conhecimento Frete nr.'+DMConhecimentoFrete.QConhecimentoFreteNum_Frete.Text+' e Nf. Nr.'+wNum_Nota;
                QCOntasPagar_Cab.Post;
              End;
            End
        else
          if pTipo = 'CFC' then  // CONHECIMENTO DE FRETE COMPLEMENTO
            Begin
              QContasPagar_cab.Open;
              QContasPagar_Mov.Open;
              QContasPagar_Cab.Insert;
              if Trim(MECodFinalidade.Text)<>'' then
                QContasPagar_cabCod_finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
              if Trim(MECodBanco.Text)<>'' then
                QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
              if Trim(MECodDepartamento.Text)<>'' then
                QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
              QContasPagar_CabCod_Cadastro.Value:=DMConhecimentoFrete.QConhecimentoFreteCod_Cadastro.Value;
              QContasPagar_CabCod_Filial.Value:=DMConhecimentoFrete.QConhecimentoFreteCod_Filial.Value;
              QContasPagar_CabDesc_tipo_Documento.Value:='CNF';
              QContasPagar_CabDT_VENCIMENTO.Value:=DMConhecimentoFrete.QConhecimentoFreteDT_PAGAMENTO.value;
              QContasPagar_CabDT_EMISSAO.Value:=DMConhecimentoFrete.QConhecimentoFreteDT_PAGAMENTO.value;
              QContasPagar_CabNUM_TITULO.Value:=DMConhecimentoFrete.QConhecimentoFreteNUM_FRETE.value;
              QContasPagar_CabNUM_PARCELA.Value:=2;
              QContasPagar_CabVAL_TITULO.Value:=DMConhecimentoFrete.QConhecimentoFreteVAL_FRETE_COMPLEMENTO.Value;
              QContasPagar_CabIND_ACEITE.Value:='NAO';
              QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
              QContasPagar_CabCOD_CONHECIMENTO_FRETE.Value:=DMConhecimentoFrete.QConhecimentoFreteCOD_CONHECIMENTO_FRETE.Value;
              QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao conhecimento Frete nr.'+DMConhecimentoFrete.QConhecimentoFreteNum_Frete.Text;
              QCOntasPagar_Cab.Post;
            End
          else
            if pTipo = 'CCJ' then  // CONTRATO COMPRA PESSOA JURIDICA
              Begin
                QContasPagar_cab.Open;
                QContasPagar_Mov.Open;
                QContasPagar_Cab.Insert;
                if Trim(MECodFinalidade.Text)<>'' then
                  QContasPagar_cabCod_finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
                if Trim(MECodBanco.Text)<>'' then
                  QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
                if Trim(MECodDepartamento.Text)<>'' then
                  QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
                QContasPagar_CabCod_Cadastro.Value:=DMContrato_PJuridica.QContratoPJuridicaCod_Cadastro.Value;
                QContasPagar_CabCod_Filial.Value:=DMContrato_PJuridica.QContratoPJuridicaCod_Filial.Value;
                QContasPagar_CabDesc_tipo_Documento.Value:='CCJ';
                QContasPagar_CabDT_VENCIMENTO.Value:=DMContrato_PJuridica.QContratoPJuridicaDT_VENCIMENTO.value;
                QContasPagar_CabDT_EMISSAO.Value:=DMContrato_PJuridica.QContratoPJuridicaDT_CONTRATO.value;
                QContasPagar_CabNUM_TITULO.Value:=DMContrato_PJuridica.QContratoPJuridicaNUM_CONTRATO.value;
                QContasPagar_CabNUM_PARCELA.Value:=1;
                QContasPagar_CabVAL_TITULO.Value:=StrToFloat(MeValTotal.Text);
                QContasPagar_CabIND_ACEITE.Value:='NAO';
                QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
                QContasPagar_CabCOD_CONTRATO_PJURIDICA.Value:=DMContrato_PJuridica.QContratoPJuridicaCOD_CONTRATO_PJURIDICA.Value;
                QCOntasPagar_Cab.Post;
              End
            else
              If pTipo = 'CPR' then
                Begin
                  QContasPagar_cab.Open;
                  QContasPagar_Mov.Open;
                  QContasPagar_Cab.Insert;
                  if Trim(MECodFinalidade.Text)<>'' then
                    QContasPagar_cabCod_Finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
                  if Trim(MECodBanco.Text)<>'' then
                    QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
                  if Trim(MECodDepartamento.Text)<>'' then
                    QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
                  QContasPagar_CabCod_Cadastro.Value:=DMContrato_CPR.QContrato_CPRCod_Cadastro.Value;
                  QContasPagar_CabCod_Filial.Value:=DMContrato_CPR.QContrato_CPRCod_Filial.Value;
                  QContasPagar_CabDesc_tipo_Documento.Value:='CPR';
                  QContasPagar_CabDT_VENCIMENTO.Value:=DMContrato_CPR.QContrato_CPRDT_VENCIMENTO.value;
                  QContasPagar_CabDT_EMISSAO.Value:=DMContrato_CPR.QContrato_CPRDT_EMISSAO.value;
                  QContasPagar_CabVAL_TITULO.Value:=DMContrato_CPR.QContrato_CPRVAL_PRECO.value;
                  QContasPagar_CabIND_ACEITE.Value:='NAO';
                  QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
                  QContasPagar_CabCOD_CONTRATO_CPR.Value:=DMContrato_CPR.QContrato_CPRCOD_CONTRATO_CPR.Value;
                  QContasPagar_CabNUM_TITULO.Value:=DMCOntrato_CPR.QContrato_CPRNum_Contrato_Cpr.Value;
                  QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao contrato nr.'+DMCOntrato_CPR.QContrato_CPRNum_Contrato_CPR.Text;
                  QCOntasPagar_Cab.Post;
                  DMContrato_CPR.QContrato_CPR.Edit;
                  DMContrato_CPR.QContrato_CPRInd_CP.value:=1;
                  DMContrato_CPR.QContrato_CPR.Post;
                End
              else
                Begin
                  wValor := 0;
                  For wCont := 0 To LBContaPagar.Items.Count - 1 do
                  Begin
                    wAux := Copy(LBContaPagar.Items[wCont],11,15);
                    wAux := Bib.LimpaString(wAux,'.');
                    wValor := wValor + StrToFloat(wAux)
                  End;
                  wValor1 := StrToFloat(Trim(MeValTotal.Text));
                  If wValor <> wValor1 Then
                     Raise Exception.Create('Valor das Parcelas Diferente do Total');
                  QContasPagar_cab.Open;
                  QContasPagar_Mov.Open;
                  For wCont := 0 to LBContaPagar.Items.Count - 1 do
                  Begin
                    QContasPagar_Cab.Insert;
                    if Trim(MECodFinalidade.Text)<>'' then
                      QContasPagar_cabCod_finalidade.Value:=StrToInt(Trim(MECodFinalidade.text));
                    if Trim(MECodBanco.Text)<>'' then
                      QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECodBanco.text));
                    if Trim(MECodDepartamento.Text) <> '' then
                      QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(MECodDepartamento.text));
                    QContasPagar_CabCod_Cadastro.Value:=StrToInt(DMContrato.QContrato_GPCod_Cadastro.Text);
                    QContasPagar_CabCod_Filial.Value:=StrToInt(DMContrato.QContrato_GPCod_Filial.Text);
                    QContasPagar_CabDesc_tipo_Documento.Value:= 'CON';
                    QContasPagar_CabDT_VENCIMENTO.Value:=StrToDate(Copy(LBContaPagar.Items[wCont],1,10) );
                    QContasPagar_CabDT_EMISSAO.Value:=DMContrato.QContrato_GPDT_CONTRATO.value; //DMOracle.DataServ; vilson pediu para trocar
                    QContasPagar_CabNUM_PARCELA.Value:=wCont + 1;
                    wAux := Copy(LBContaPagar.Items[wCont],11,15);
                    wAux := Bib.LimpaString(wAux,'.');
                    QContasPagar_CabVAL_TITULO.Value:=StrToFloat(wAux);
                    QContasPagar_CabIND_ACEITE.Value:= 'SIM';
                    QContasPagar_CabIND_SITUACAO.Value:= 'ABERTO';
                    QContasPagar_CabCOD_CONTRATO_GP.Value:=StrToInt(DMContrato.QContrato_GPCOD_CONTRATO_GP.Text);
                    QContasPagar_CabDESC_OBSERVACAO.Value:= 'Referente ao contrato nr.'+DMCOntrato.QContrato_GPNum_Contrato.Text;
                    QContasPagar_CabNUM_TITULO.Value:=DMCOntrato.QContrato_GPNum_Contrato.Value;
                    QCOntasPagar_Cab.Post;
                  End;
                  DMContrato.QContrato_GP.Edit;
                  DMContrato.QContrato_GPInd_CP.Value:=1;
                  DMContrato.QContrato_GP.Post;
                End;
        QContasPagar_Mov.Close;
        QContasPagar_cab.Close;
        If pTipo <> 'CNH' Then
           DMOracle.DBCemapa.Commit;
    end;
    ModalResult := MrOk;
  except
    DMContrato.QContrato_GP.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.RollBack;
    DMContasPagar.QContasPagar_Mov.Close;
    DMContasPagar.QContasPagar_cab.Close;
    Raise;
  end;
end;

procedure TFContrato_CP.SbFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal=mrOk then
    begin
      MECodFinalidade.text:=Floattostr(DMFinalidade.QFinalidadeConsCod_finalidade.Value);
      MECodFinalidadeExit(Self);
    end;

end;

procedure TFContrato_CP.SpeedButton2Click(Sender: TObject);
begin
  If FBancosCons = Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      MECodbanco.text:=Floattostr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      MECodBancoExit(Self);
    end;
end;

procedure TFContrato_CP.SbDepartamentoClick(Sender: TObject);
begin
  If FdepartamentoCons = Nil then
    FdepartamentoCons:=TFdepartamentoCons.Create(Application);
  if FdepartamentoCons.ShowModal=mrOk then
    begin
      MECodDepartamento.text:=Floattostr(DMDepartamento.QdepartamentoConsCod_departamento.Value);
      MECodDepartamentoExit(Self);
    end;
end;

procedure TFContrato_CP.MECodFinalidadeExit(Sender: TObject);
begin
  if Trim(MECodFinalidade.Text)<>'' then
    MEFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECodFinalidade.Text)
  else
    MEFinalidade.Clear;
end;

procedure TFContrato_CP.MECodbancoExit(Sender: TObject);
begin
  if Trim(MECodBanco.text)<>'' then
    MEBanco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEcodbanco.text)
  else
    MEBanco.Clear;
end;

procedure TFContrato_CP.MECodDepartamentoExit(Sender: TObject);
begin
  if Trim(MECodDepartamento.text)<>'' then
    MEDepartamento.text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepartamento.text)
  else
    MEDepartamento.Clear;
end;

procedure TFContrato_CP.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    If PTipo = 'CNH' Then
      MEDataCP.Text := DateToStr(DMConhecimentoFrete.QConhecimentoFreteDt_Emissao_Conhecimento.Value + StrToFloat(MEDiasCP.Text) )
    Else
      MEDataCP.Text := DateToStr(DMContrato.QContrato_GPDt_Contrato.Value + StrToFloat(MEDiasCP.Text) );
    MEDiasCP.Text := '';
  End;

end;

procedure TFContrato_CP.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := '     '+FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaPagar.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;

end;

procedure TFContrato_CP.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaPagar.Items.Delete(LBContaPagar.ItemIndex);
end;

procedure TFContrato_CP.FormActivate(Sender: TObject);
begin
  LBContaPagar.Items.Clear;
  If (PTipo = 'CNH') Or (PTipo = 'GP')  then // conhecimento de frete gera mais do que uma parcela
    Begin
      FContrato_CP.Panel1.Visible := True;
      FContrato_CP.LbContaPagar.Visible := True;
      FContrato_CP.Label20.Visible := True;
      FContrato_CP.Label4.Visible := True;
      FContrato_CP.Label5.Visible := True;
      FContrato_CP.Label6.Visible := True;
      FContrato_CP.BtApagaParcela.Visible := True;
      FContrato_CP.MeDiasCp.Visible := True;
      FContrato_CP.MeDataCp.Visible := True;
      FContrato_CP.MeValorCp.Visible := True;
      FContrato_CP.MeValTotal.Visible := True;
    End
  Else
    Begin
      FContrato_CP.Panel1.Visible := False;
      FContrato_CP.LbContaPagar.Visible := False;
      FContrato_CP.Label20.Visible := False;
      FContrato_CP.Label4.Visible := False;
      FContrato_CP.Label5.Visible := False;
      FContrato_CP.Label6.Visible := False;
      FContrato_CP.BtApagaParcela.Visible := False;
      FContrato_CP.MeDiasCp.Visible := False;
      FContrato_CP.MeDataCp.Visible := False;
      FContrato_CP.MeValorCp.Visible := False;
      FContrato_CP.MeValTotal.Visible := False;
    End;
  RgFinalidade.Visible := False;  
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
     ((PTipo = 'GP') OR (PTipo = 'CON')) Then
  Begin
    RgFinalidade.Visible := True;
    MeFinalidade.Visible := False;
    SbFinalidade.Visible := False;
    MECodFinalidade.Enabled := False;
  End;

end;

procedure TFContrato_CP.RgFinalidadeClick(Sender: TObject);
begin
  If PTipo = 'GP' Then
  Begin
    If RgFinalidade.ItemIndex = 0 Then
      If DMContrato.QContrato_GPDESC_TIPO_PRECO.Value = 'REAL' Then
        MECodFinalidade.Text:= '428'
      Else
        MECodFinalidade.Text:= '421'
    Else
      If DMContrato.QContrato_GPDESC_TIPO_PRECO.Value = 'REAL' Then
        MECodFinalidade.Text:= '152'
      Else
        MECodFinalidade.Text:= '415';
  End
  Else
    If RgFinalidade.ItemIndex = 0 Then
      MECodFinalidade.Text:= '39'
    Else
      MECodFinalidade.Text:= '429';

end;

end.

unit UAplicacaoFinanceiraMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, DBCtrls, ExtCtrls;

type
  TFAplicacaoFinanceiraMov = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    MEValorResgate: TMaskEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    MECodAplicacao: TMaskEdit;
    MEValor: TMaskEdit;
    MEDataBaixa: TMaskEdit;
    MEHistoricoMov: TMaskEdit;
    Label6: TLabel;
    SBHistoricoMov: TSpeedButton;
    EdHistoricoMov: TEdit;
    RGTipoMov: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure SBAplicacaoConsClick(Sender: TObject);
    procedure SBHistoricoMovClick(Sender: TObject);
    procedure MEHistoricoMovExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraMov: TFAplicacaoFinanceiraMov;

implementation

uses UAplicacaoFinanceira_cl, UOracle_cl, DB, UAplicacaoFinanceiraCons,
  UBancoAgencia_cl, UHistoricoCons, UHistorico_cl, UPlanilha_cl,
  UCaixaLanc_Cont;

{$R *.dfm}

procedure TFAplicacaoFinanceiraMov.BitBtn1Click(Sender: TObject);
var
wContaCred, wContra, wHistoricoContabil : String;
begin
  If RGTipoMov.ItemIndex = -1 then
    Raise Exception.Create('Informe o Tipo de Movimento!');
  If RGTipoMov.ItemIndex = 0 then
  Begin //aqui faz lançamento de baixas
    if ((StrToFloat(MEValorResgate.Text) < StrToFloat(MEValor.Text)) and (StrToFloat(MEValorResgate.Text) <> 0)) then
      Raise Exception.Create('Valor disponível para resgate menor que o informado!')
    else
    with DMAplicacaoFinanceira do
    Begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        QAplicacaoFinanceiraMov.open;
        QAplicacaoFinanceiraMov.Insert;
        QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA.Value := QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value;
        QAplicacaoFinanceiraMovDT_MOVIMENTO.Value:= StrToDate(MeDataBaixa.Text);
        QAplicacaoFinanceiraMovVAL_MOVIMENTO.Value := StrToFloat(MEValor.Text);
        QAplicacaoFinanceiraMovCOD_HISTORICO.Value := StrToInt(MEHistoricoMov.Text);
        QAplicacaoFinanceiraMovIND_TIPO.Value := 'BAIXA';
        QAplicacaoFinanceiraMov.Post;
        QAplicacaoFinanceira.Edit;
        QAplicacaoFinanceiraVAL_APLICADO.Value := (StrToFloat(MEValorResgate.Text) - StrToFloat(MEValor.Text));

        //**********************Atualizações para Grasiela**********************************************//
        if trim(MeHistoricoMov.Text) = '186' then
        begin
          wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
          wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
        end;

        If (Trim(MEHistoricoMov.Text) <> '143') and (Trim(MEHistoricoMov.Text) <> '184') then
           DMBancoAgencia.IncluiBanco(StrToInt(MEHistoricoMov.Text),QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,StrToInt(QAplicacaoFinanceiraNUM_TITULO.Text),
                                 0,QAplicacaoFinanceiraCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                                 StrToFloat(MEValor.Text),'MOV. DE APLIC. FINANCEIRA','',QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text,'','N','');

        If (Trim(MEHistoricoMov.Text) = '143') or (Trim(MEHistoricoMov.Text) = '184') then
        begin
          wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
          wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text)
        end
        Else
        begin
          if trim(MeHistoricoMov.Text) <> '186' then
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
            wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
          end;
        end;
        //**********************************************************************************************//
        wHistoricoContabil := DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
        //AQUI COMEÇA INCLUSÃO NA CONTABILIDADE
        if Trim(MEHistoricoMov.Text) <> '184' then
        begin
          DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                               QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                               QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                               QAplicacaoFinanceiraCOD_FILIAL.Value,
                               wContaCred,
                               'CREDITO',
                               QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                               StrToInt(wHistoricoContabil),
                               StrToFloat(MEValor.Text),
                               StrToDate(MEDataBaixa.Text),
                               wContra );

          DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                               QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                               QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                               QAplicacaoFinanceiraCOD_FILIAL.Value,
                               wContra,
                               'DEBITO',
                               QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                               StrToInt(wHistoricoContabil),
                               StrToFloat(MEValor.Text),
                               StrToDate(MEDataBaixa.Text),
                               wContaCred );
        end
        else
        begin
          If FCaixa_Lanc_Cont = Nil Then
            FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
          FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
          FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
          FCaixa_Lanc_Cont.Label3.Visible := False;
          FCaixa_Lanc_Cont.Label4.Visible := False;
          FCaixa_Lanc_Cont.MeContaDebito.Text := wContra;
          FCaixa_Lanc_Cont.MeContaCredito.Text := wContaCred;
          FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
          FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
          FCaixa_Lanc_Cont.MECodReduzidoDebito.Clear;
          FCaixa_Lanc_Cont.MECodReduzidoCredito.Clear;
          FCaixa_Lanc_Cont.ShowModal;
          DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                           QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           Trim(FCaixa_Lanc_Cont.MeContaCredito.Text),
                           'CREDITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           StrToFloat(MEValor.Text),
                           StrToDate(MEDataBaixa.Text),
                           Trim(FCaixa_Lanc_Cont.MeContaDebito.Text) );

          DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                           QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           Trim(FCaixa_Lanc_Cont.MeContaDebito.Text),
                           'DEBITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           StrToFloat(MEValor.Text),
                           StrToDate(MEDataBaixa.Text),
                           Trim(FCaixa_Lanc_Cont.MeContaCredito.Text) );

        end;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
       Raise Exception.Create('Transação não efetuada!');
      end;
      QAplicacaoFinanceira.Post;
      QAplicacaoFinanceiraMovCons.Close;
      QAplicacaoFinanceiraMovCons.SetVariable('COD_APLICACAO',QAplicacaoFinanceiraCod_Aplicacao_Financeira.Value);
      QAplicacaoFinanceiraMovCons.Open;
    end;
  end
  else
  With DMAplicacaoFinanceira do
  Begin//aqui faz o lançamento dos rendimentos
    Try
      DMOracle.DBCemapa.StartTransaction;
      QAplicacaoFinanceiraMov.open;
      QAplicacaoFinanceiraMov.Insert;
      QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA.Value := QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value;
      QAplicacaoFinanceiraMovDT_MOVIMENTO.Value:= StrToDate(MeDataBaixa.Text);
      QAplicacaoFinanceiraMovVAL_MOVIMENTO.Value := StrToFloat(MEValor.Text);
      QAplicacaoFinanceiraMovCOD_HISTORICO.Value := StrToInt(MEHistoricoMov.Text);
      QAplicacaoFinanceiraMovIND_TIPO.Value := 'RENDIMENTO';
      QAplicacaoFinanceiraMov.Post;

      QAplicacaoFinanceira.Edit;
      QAplicacaoFinanceiraVAL_APLICADO.Value := (StrToFloat(MEValorResgate.Text) + StrToFloat(MEValor.Text));

      if Trim(MeHistoricoMov.Text) = '41459' then
      begin
        wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
        wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
      end
      else
      begin
        wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
        wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
      end;
      wHistoricoContabil := DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO =' + MEHistoricoMov.Text);
      If FCaixa_Lanc_Cont = Nil Then
         FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
      FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
      FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
      FCaixa_Lanc_Cont.Label3.Visible := False;
      FCaixa_Lanc_Cont.Label4.Visible := False;
      FCaixa_Lanc_Cont.MeContaDebito.Text := wContra;
      FCaixa_Lanc_Cont.MeContaCredito.Text := wContaCred;
      FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
      FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
      FCaixa_Lanc_Cont.MECodReduzidoDebito.Clear;
      FCaixa_Lanc_Cont.MECodReduzidoCredito.Clear;
      FCaixa_Lanc_Cont.ShowModal;
      //AQUI COMEÇA INCLUSÃO NA CONTABILIDADE
      DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                           QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           Trim(FCaixa_Lanc_Cont.MeContaCredito.Text),
                           'CREDITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           StrToFloat(MEValor.Text),
                           StrToDate(MEDataBaixa.Text),
                           Trim(FCaixa_Lanc_Cont.MeContaDebito.Text) );

      DMPlanilha.GravaLanc('MOV_APLIC_FIN',
                           QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV.Text+'MOVIMENTO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           Trim(FCaixa_Lanc_Cont.MeContaDebito.Text),
                           'DEBITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           StrToFloat(MEValor.Text),
                           StrToDate(MEDataBaixa.Text),
                           Trim(FCaixa_Lanc_Cont.MeContaCredito.Text) );


      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      Raise Exception.Create('Transação não efetuada!');
    end;
      QAplicacaoFinanceira.Post;
      QAplicacaoFinanceiraMovCons.Close;
      QAplicacaoFinanceiraMovCons.SetVariable('COD_APLICACAO',QAplicacaoFinanceiraCod_Aplicacao_Financeira.Value);
      QAplicacaoFinanceiraMovCons.Open;
  end;
  DMAplicacaoFinanceira.QAplicacaoFinanceiraMov.Close;
  MEValor.Text := '';
  MEHistoricoMov.Text := '';
  MECodAplicacao.Text := '';
  EdHistoricoMov.Text := '';

end;

procedure TFAplicacaoFinanceiraMov.SBAplicacaoConsClick(Sender: TObject);
begin
{  If FAplicacaoFinanceiraCons = Nil then
    FAplicacaoFinanceiraCons:=TFAplicacaoFinanceiraCons.Create(Application);
  If FAplicacaoFinanceiraCons.ShowModal=mrOK then
  Begin
    With DMAplicacaoFinanceira do
    Begin
       QAplicacaoFinanceira.Close;
       QAplicacaoFinanceira.SetVariable('PK',QAplicacaoFinanceiraConsCod_Aplicacao_Financeira.Value);
       QAplicacaoFinanceira.Open;
       MECodAplicacao.Text := QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text;
       MEDataBaixa.Text := DateToStr(Date);
       MEValorResgate.Text := FloatToStr(QAplicacaoFinanceiraVAL_APLICADO.Value);
    End;
  End;  } 
end;

procedure TFAplicacaoFinanceiraMov.SBHistoricoMovClick(Sender: TObject);
begin
  If FHistoricoCons = Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOK then
    MEHistoricoMov.Text := IntToStr(DMHistorico.QHistoricoConsCOD_HISTORICO.Value);
    MEHistoricoMovExit(Self);
end;

procedure TFAplicacaoFinanceiraMov.MEHistoricoMovExit(Sender: TObject);
begin
  if trim(MEHistoricoMov.Text) <> '' then
    EdHistoricoMov.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = ' + Trim(MEHistoricoMov.Text))
  else
    ShowMessage('É preciso informar um Histórico!');
end;

procedure TFAplicacaoFinanceiraMov.FormActivate(Sender: TObject);
begin
    MECodAplicacao.Text := DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text;
    MEDataBaixa.Text := DateToStr(Date);
    MEValorResgate.Text := FloatToStr(DMAplicacaoFinanceira.QAplicacaoFinanceiraVAL_APLICADO.Value);
end;

end.

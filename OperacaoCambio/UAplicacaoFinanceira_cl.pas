unit UAplicacaoFinanceira_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMAplicacaoFinanceira = class(TDataModule)
    QAplicacaoFinanceira: TOracleDataSet1;
    QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA: TIntegerField;
    QAplicacaoFinanceiraCOD_BANCO: TIntegerField;
    QAplicacaoFinanceiraCOD_CONTA_CORRENTE: TIntegerField;
    QAplicacaoFinanceiraCOD_HISTORICO: TIntegerField;
    QAplicacaoFinanceiraDT_APLICACAO: TDateTimeField;
    QAplicacaoFinanceiraDT_VENCIMENTO: TDateTimeField;
    QAplicacaoFinanceiraDESC_TAXA: TStringField;
    QAplicacaoFinanceiraVAL_APLICADO: TFloatField;
    QAplicacaoFinanceiraVAL_ORIGINAL: TFloatField;
    QAplicacaoFinanceiraCOD_DEPARTAMENTO: TIntegerField;
    QAplicacaoFinanceiraCons: TOracleDataSet1;
    QAplicacaoFinanceiraConsCOD_APLICACAO_FINANCEIRA: TIntegerField;
    QAplicacaoFinanceiraConsDT_APLICACAO: TDateTimeField;
    QAplicacaoFinanceiraConsDESC_TAXA: TStringField;
    QAplicacaoFinanceiraConsVAL_APLICADO: TFloatField;
    QAplicacaoFinanceiraConsVAL_ORIGINAL: TFloatField;
    QAplicacaoFinanceiraConsDESC_CONTA_CORRENTE: TStringField;
    QAplicacaoFinanceiraConsDESC_BANCO_AGENCIA: TStringField;
    QAplicacaoFinanceiraConsCOD_HISTORICO: TIntegerField;
    QAplicacaoFinanceiraConsCOD_CONTA_CORRENTE: TIntegerField;
    QAplicacaoFinanceiraConsCOD_DEPARTAMENTO: TIntegerField;
    QAplicacaoFinanceiraConsDT_VENCIMENTO: TDateTimeField;
    QAplicacaoFinanceiraMov: TOracleDataSet1;
    QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV: TIntegerField;
    QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA: TIntegerField;
    QAplicacaoFinanceiraMovVAL_MOVIMENTO: TFloatField;
    QAplicacaoFinanceiraMovDT_MOVIMENTO: TDateTimeField;
    DSAplicacaoFinanceiraMov: TDataSource;
    QAplicacaoFinanceiraNUM_TITULO: TFloatField;
    QAplicacaoFinanceiraConsNUM_TITULO: TFloatField;
    QAplicacaoFinanceiraConsNUM_CONTA_CORRENTE: TStringField;
    QAplicacaoFinanceiraMovCOD_HISTORICO: TIntegerField;
    QAplicacaoFinanceiraMovCons: TOracleDataSet1;
    DSQAplicacaoFinanceiraMovCons: TDataSource;
    QAplicacaoFinanceiraMovConsCOD_APLICACAO_FINANCEIRA_MOV: TIntegerField;
    QAplicacaoFinanceiraMovConsVAL_MOVIMENTO: TFloatField;
    QAplicacaoFinanceiraMovConsDT_MOVIMENTO: TDateTimeField;
    QAplicacaoFinanceiraMovConsCOD_HISTORICO: TIntegerField;
    QAplicacaoFinanceiraMovConsDESC_HISTORICO: TStringField;
    QAplicacaoFinanceiraMovIND_TIPO: TStringField;
    QAplicacaoFinanceiraMovConsIND_TIPO: TStringField;
    QRAplicacaoFinanceira: TOracleDataSet1;
    QAplicacaoFinanceiraCOD_FILIAL: TIntegerField;
    QRAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA: TIntegerField;
    QRAplicacaoFinanceiraCOD_BANCO: TIntegerField;
    QRAplicacaoFinanceiraCOD_CONTA_CORRENTE: TIntegerField;
    QRAplicacaoFinanceiraCOD_HISTORICO: TIntegerField;
    QRAplicacaoFinanceiraDT_APLICACAO: TDateTimeField;
    QRAplicacaoFinanceiraDT_VENCIMENTO: TDateTimeField;
    QRAplicacaoFinanceiraDESC_TAXA: TStringField;
    QRAplicacaoFinanceiraVAL_APLICADO: TFloatField;
    QRAplicacaoFinanceiraVAL_ORIGINAL: TFloatField;
    QRAplicacaoFinanceiraCOD_DEPARTAMENTO: TIntegerField;
    QRAplicacaoFinanceiraNUM_TITULO: TFloatField;
    QRAplicacaoFinanceiraCOD_FILIAL: TIntegerField;
    QRAplicacaoFinanceiraDESC_HISTORICO: TStringField;
    QRAplicacaoFinanceiraDESC_BANCO_AGENCIA: TStringField;
    QRAplicacaoFinanceiraDESC_DEPARTAMENTO: TStringField;
    QRAplicacaoFinanceiraDESC_CONTA_CORRENTE: TStringField;
    QRAplicacaoFinanceiraDESC_FILIAL: TStringField;
    QAplicacaoFinanceiraNUM_COTA: TFloatField;
    QRAplicacaoFinanceiraNUM_COTA: TFloatField;
    procedure QAplicacaoFinanceiraAfterInsert(DataSet: TDataSet);
    procedure QAplicacaoFinanceiraBeforePost(DataSet: TDataSet);
    procedure QAplicacaoFinanceiraBeforeDelete(DataSet: TDataSet);
    procedure QAplicacaoFinanceiraAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAplicacaoFinanceira: TDMAplicacaoFinanceira;

implementation

uses UOracle_cl, UBancoAgencia_cl, UPlanilha_cl;

{$R *.dfm}

procedure TDMAplicacaoFinanceira.QAplicacaoFinanceiraAfterInsert(
  DataSet: TDataSet);
begin
  QAplicacaoFinanceiraDt_Aplicacao.Value := DMOracle.DataServ; 

end;

procedure TDMAplicacaoFinanceira.QAplicacaoFinanceiraBeforePost(
  DataSet: TDataSet);
var
wContaCred, wContra, wHistoricoContabil : string;
begin

  If QAplicacaoFinanceiraVal_Original.Value = 0 then   // No caso da Inclusão
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      //AQUI COMEÇA INCLUSÃO NO BANCO
      DMBancoAgencia.IncluiBanco(QAplicacaoFinanceiraCOD_HISTORICO.Value,QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                StrToInt(QAplicacaoFinanceiraNUM_TITULO.Text),0,QAplicacaoFinanceiraCod_Departamento.Value,
                QAplicacaoFinanceiraDT_APLICACAO.Value,QAplicacaoFinanceiraVAL_APLICADO.Value,'APLICAÇÃO FINANCEIRA','0',
                QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text,'','N','');

      wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
      wContra := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
      wHistoricoContabil := DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO =' + QAplicacaoFinanceiraCOD_HISTORICO.Text);
      //AQUI COMEÇA INCLUSÃO NA CONTABILIDADE
      DMPlanilha.GravaLanc('APLIC_FINANC',
                           QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.text+'APLICACAO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           wContaCred,
                           'CREDITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           QAplicacaoFinanceiraVAL_APLICADO.Value,
                           QAplicacaoFinanceiraDT_APLICACAO.Value,
                           wContra );

      DMPlanilha.GravaLanc('APLIC_FINANC',
                           QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value,
                           QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text+'APLICACAO',
                           QAplicacaoFinanceiraCOD_FILIAL.Value,
                           wContra,
                           'DEBITO',
                           QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value,
                           StrToInt(wHistoricoContabil),
                           QAplicacaoFinanceiraVAL_APLICADO.Value,
                           QAplicacaoFinanceiraDT_APLICACAO.Value,
                           wContaCred );

      QAplicacaoFinanceiraVal_Original.value:=QAplicacaoFinanceiraVal_Aplicado.Value;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      Raise Exception.Create('Cadastro não efetuado!');
    end;
  end;
  If QAplicacaoFinanceiraVal_Original.Value = 0 then   // No caso da Inclusão
    QAplicacaoFinanceiraVal_Original.value:=QAplicacaoFinanceiraVal_Aplicado.Value;
end;

procedure TDMAplicacaoFinanceira.QAplicacaoFinanceiraBeforeDelete(
  DataSet: TDataSet);
var
wComplemento : string;
begin
  wComplemento := QAplicacaoFinanceiraNUM_TITULO.Text+'-'+QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text+'APLICACAO';
  Try
    DMOracle.DBCemapa.StartTransaction;

    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BCO_MOVIMENTO WHERE NUM_CHEQUE = ' +
    QAplicacaoFinanceiraNUM_TITULO.Text + ' AND COD_CONTA_PAGAR_CAB = '+ QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text);
    DMOracle.QExecSQL.ExecSQL;

    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_LANCTO_CONTABIL WHERE COD_APLICACAO_FINANCEIRA_MOV = ' +
    QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text + ' AND DESC_COMPLEMENTO = ' + CHR(39)+wComplemento+CHR(39));
    DMOracle.QExecSQL.ExecSQL;

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Raise Exception.Create('Transação não efetuada!');
  end;

end;

procedure TDMAplicacaoFinanceira.QAplicacaoFinanceiraAfterPost(
  DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value;
  QAplicacaoFinanceira.Close;
  QAplicacaoFinanceira.SetVariable('PK',wCodigo);
  QAplicacaoFinanceira.Open;

end;

end.

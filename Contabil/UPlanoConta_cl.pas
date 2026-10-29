unit UPlanoConta_cl;

interface
                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPlanoConta = class(TDataModule)
    DSPlanoConta: TDataSource;
    DSPlanoContaCons: TDataSource;
    QPlanoConta: TOracleDataSet1;
    QPlanoContaCOD_REDUZIDO: TIntegerField;
    QPlanoContaCOD_FILIAL: TIntegerField;
    QPlanoContaDESC_PLANO_CONTA: TStringField;
    QPlanoContaNUM_GRAU: TIntegerField;
    QPlanoContaCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaNUM_PLANO_CONTA: TStringField;
    QPlanoContanome_filial: TStringField;
    QPlanoContaCons: TOracleDataSet1;
    QPlanoContaConsCOD_REDUZIDO: TIntegerField;
    QPlanoContaConsCOD_FILIAL: TIntegerField;
    QPlanoContaConsDESC_PLANO_CONTA: TStringField;
    QPlanoContaConsNUM_GRAU: TIntegerField;
    QPlanoContaConsNUM_PLANO_CONTA: TStringField;
    QPlanoContaConsCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaCodReduzido: TOracleDataSet1;
    QPlanoContaCodReduzidoCOD_REDUZIDO: TIntegerField;
    QPlanoContaCodReduzidoDESC_PLANO_CONTA: TStringField;
    QPlanoContaCodReduzidoCOD_FILIAL: TIntegerField;
    QPlanoContaCodReduzidoCOD_PLANO_CONTA: TIntegerField;
    QRPlanoContas: TOracleDataSet1;
    QRPlanoContasCOD_REDUZIDO: TIntegerField;
    QRPlanoContasCOD_FILIAL: TIntegerField;
    QRPlanoContasDESC_PLANO_CONTA: TStringField;
    QRPlanoContasNUM_GRAU: TIntegerField;
    QRPlanoContasCOD_PLANO_CONTA: TIntegerField;
    QRPlanoContasNUM_PLANO_CONTA: TStringField;
    QDuplicaPlanoConta: TOracleDataSet1;
    QPlanoContaCOD_GRUPO: TIntegerField;
    QPlanoContaCOD_DEPARTAMENTO: TIntegerField;
    QRPlanoContasCOD_GRUPO: TIntegerField;
    QRPlanoContasCOD_DEPARTAMENTO: TIntegerField;
    QPlanoContaDESC_NATUREZA_CONTA: TStringField;
    QPlanoContaCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaIND_LIBERADO_USO: TStringField;
    QPlanoContaConsIND_LIBERADO_USO: TStringField;
    QPlanoContaAntigo: TOracleDataSet1;
    QPlanoContaAntigoCOD_REDUZIDO: TIntegerField;
    QPlanoContaAntigoCOD_FILIAL: TIntegerField;
    QPlanoContaAntigoDESC_PLANO_CONTA: TStringField;
    QPlanoContaAntigoNUM_GRAU: TIntegerField;
    QPlanoContaAntigoCOD_PLANO_CONTA_ANTIGO: TIntegerField;
    QPlanoContaAntigoNUM_PLANO_CONTA: TStringField;
    QPlanoContaAntigoCOD_GRUPO: TIntegerField;
    QPlanoContaAntigoCOD_DEPARTAMENTO: TIntegerField;
    QPlanoContaAntigoDESC_NATUREZA_CONTA: TStringField;
    QPlanoContaAntigoCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaAntigoIND_LIBERADO_USO: TStringField;
    QPlanoContaAntigoCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaAntigoCons: TOracleDataSet1;
    QPlanoContaAntigoConsCOD_REDUZIDO: TIntegerField;
    QPlanoContaAntigoConsCOD_FILIAL: TIntegerField;
    QPlanoContaAntigoConsDESC_PLANO_CONTA: TStringField;
    QPlanoContaAntigoConsNUM_GRAU: TIntegerField;
    QPlanoContaAntigoConsNUM_PLANO_CONTA: TStringField;
    QPlanoContaAntigoConsCOD_PLANO_CONTA_ANTIGO: TIntegerField;
    QPlanoContaAntigoConsIND_LIBERADO_USO: TStringField;
    QrPlanoContas_Relacao: TOracleDataSet1;
    QrPlanoContas_RelacaoNUM_PLANO_CONTA: TStringField;
    QrPlanoContas_RelacaoDESC_PLANO_CONTA: TStringField;
    QrPlanoContas_RelacaoNUM_PLANO_CONTA_ANTIGO: TStringField;
    QrPlanoContas_RelacaoDESC_PLANO_CONTA_ANTIGO: TStringField;
    QRDFC: TOracleDataSet1;
    QRDFCDESC_PLANO_CONTA: TStringField;
    QRDFCPERIODO_ATUAL: TFloatField;
    QRDFCPERIODO_ANTERIOR: TFloatField;
    QRDFCIND_FLUXO_DFC: TStringField;
    QRDFCNUM_PLANO_CONTA: TStringField;
    QRDFCVARIACAO_ATUAL: TFloatField;
    QRDFCVARIACAO_ANTERIOR: TFloatField;
    QRSaldoDFC: TOracleDataSet1;
    QRSaldoDFCVAL_ATUAL: TFloatField;
    QRSaldoDFCVAL_ANTERIOR: TFloatField;
    QPlanoContaIND_OPERACIONAL_DFC: TStringField;
    QPlanoContaIND_INVESTIMENTO_DFC: TStringField;
    QPlanoContaIND_FINANCIAMENTO_DFC: TStringField;
    QPlanoContaIND_ENCERRAMENTO_EXERCICIO: TStringField;
    QPlanoContaConsDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QPlanoContaConsNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    procedure QPlanoContaCalcFields(DataSet: TDataSet);
    procedure QPlanoContaBeforePost(DataSet: TDataSet);
    procedure QPlanoContaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPlanoConta: TDMPlanoConta;

implementation

uses UOracle_cl, UPlanilha_cl, UParamSistema_cl, USequencia_cl;

{$R *.DFM}

procedure TDMPlanoConta.QPlanoContaCalcFields(DataSet: TDataSet);
begin
  QPlanoContanome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = '+FloatToStr(QPlanoContaCod_Filial.Value),True);
end;

procedure TDMPlanoConta.QPlanoContaBeforePost(DataSet: TDataSet);
Var wContaSuperior : String;
begin
  // Somente verifica o nível superior se está sendo utilizado a contabilidade.
  // Alteração feita para facilitar o cadastro das contas para o Sped Contribuições.
  if DMParamSistema.QParamSistemaIND_CONTABILIZA.Value = 'S' then
  begin
    // Verifica se existe o nível Superior
    If Length(QPlanoContaNum_Plano_Conta.Value) > 1 Then
    With DMPlanilha do
    Begin
      wContaSuperior := DMPlanilha.NivelSuperior(QPlanoContaNum_Plano_Conta.Value);
      QRegPlanoConta.Close;
      QRegPlanoConta.SetVariable('CONTA',wContaSuperior);
      QRegPlanoConta.SetVariable('FILIAL',QPlanoContaCod_Filial.Value);
      QRegPlanoConta.Open;
      If QRegPlanoContaCod_Plano_conta.Value = 0 then
        Raise Exception.Create('Conta sem nível superior!');
    End;
  end;
  If DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 4 then
    begin
      Case Length(QPlanoContaNum_Plano_Conta.Value) of
         1    : QPlanoContaNUm_Grau.Value:=1;
         2..3 : QPlanoContaNUm_Grau.Value:=2;
         4..5 : QPlanoContaNUm_Grau.Value:=3;
         6..12: QPlanoContaNUm_Grau.Value:=4;
      end;
    end;

  If DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 5 then
    begin
      Case Length(QPlanoContaNum_Plano_Conta.Value) of
         1    : QPlanoContaNUm_Grau.Value:=1;
         2..3 : QPlanoContaNUm_Grau.Value:=2;
         4..5 : QPlanoContaNUm_Grau.Value:=3;
         6..7 : QPlanoContaNUm_Grau.Value:=4;
         8..14: QPlanoContaNUm_Grau.Value:=5;
      end;
    end;

  If DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 6 then
    begin
      Case Length(QPlanoContaNum_Plano_Conta.Value) of
         1     : QPlanoContaNUm_Grau.Value:=1;
         2..3  : QPlanoContaNUm_Grau.Value:=2;
         4..5  : QPlanoContaNUm_Grau.Value:=3;
         6..7  : QPlanoContaNUm_Grau.Value:=4;
         8..9  : QPlanoContaNUm_Grau.Value:=5;
         10..16: QPlanoContaNUm_Grau.Value:=6;
      end;
    end;

  If (QPlanoContaNum_Grau.Value=DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value){ and
     (QPlanoContaCod_Reduzido.isnull)} then
     begin
       If (QPlanoContaCod_Reduzido.isnull) then
         QPlanoContaCod_Reduzido.Value:=DMSequencia.Sequencia(Trunc(QPlanoContaCod_Filial.Value),'COD_REDUZIDO');
       // Verifica se existe não existe duplicidade de cod. reduzido
       if QPlanoConta.State=dsInsert then
         begin
           QPlanoContaCodReduzido.Close;
           QPlanoContaCodReduzido.SetVariable('COD_FILIAL',QPlanoContaCod_Filial.Value);
           QPlanoContaCodReduzido.SetVariable('COD_REDUZIDO',QPlanoContaCod_Reduzido.Value);
           QPlanoContaCodReduzido.Open;
           If QPlanoContaCodReduzidoCod_Plano_Conta.Value <> 0 then
             begin
               QPlanoContaCod_Reduzido.Clear;
               Raise Exception.Create('Erro ! Este Código Reduzido já existe em outro Plano de Contas.'
                                      +chr(13)+'Cod.Plano de Contas :'+FloatToStr(QPlanoContaCodReduzidoCod_Plano_Conta.Value)
                                      +chr(13)+'Descrição :'+QPlanoContaCodReduzidoDesc_Plano_conta.Value);
             end;
         end;
     end
  else
    If (QPlanoContaNum_Grau.Value<>DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value) then
      QPlanoContaCod_Reduzido.Clear;
end;

procedure TDMPlanoConta.QPlanoContaNewRecord(DataSet: TDataSet);
begin
  QPlanoContaNUm_Grau.Value:=1;
end;

end.

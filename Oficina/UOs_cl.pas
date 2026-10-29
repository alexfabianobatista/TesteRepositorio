unit UOs_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOs = class(TDataModule)
    QOSCons: TOracleDataSet1;
    QOSCad: TOracleDataSet1;
    QOSCadNUM_OS: TIntegerField;
    QOSCadCOD_FILIAL: TIntegerField;
    QOSCadCOD_VENDEDOR: TIntegerField;
    QOSCadCOD_MECANICO: TIntegerField;
    QOSCadCOD_CADASTRO: TIntegerField;
    QOSCadNUM_CHASSI: TStringField;
    QOSCadIND_SITUACAO: TStringField;
    QOSCadIND_CONDICAO_PAGTO: TIntegerField;
    QOSCadIND_TIPO_OS: TIntegerField;
    QOSCadDT_EMISSAO: TDateTimeField;
    QOSCadDT_ENTRADA: TDateTimeField;
    QOSCadDT_PREVISAOSAIDA: TDateTimeField;
    QOSCadDT_SAIDA: TDateTimeField;
    QOSCadDT_LIMITEHORAS: TStringField;
    QOSCadCOD_MOTIVO_CANC: TIntegerField;
    QOSCadDESC_SERVICO: TStringField;
    QOSCadVAL_LIMITE_REQUISICAO: TFloatField;
    QOSCadHR_ENTRADA: TStringField;
    QOSCadHR_PREVISTASAIDA: TStringField;
    QOSCadHR_SAIDA: TStringField;
    QOSCadNUM_KM: TIntegerField;
    QOSCadNUM_TITULO: TIntegerField;
    QOSCadVAL_NF_MAO_DE_OBRA: TFloatField;
    QOSCadVAL_NF_SERVICO_TERCEIRO: TFloatField;
    QOSCadVAL_NF_PECAS: TFloatField;
    QOSCadVAL_NF_PECAS_ISENTAS: TFloatField;
    QOSCadDT_FECHAMENTO: TDateTimeField;
    QOSCadVAL_NF_SERVICO_CHAPEACAO: TFloatField;
    QOSCadVAL_NF_MAO_DE_OBRA2: TFloatField;
    QOSCadVAL_NF_SERVICO_TERCEIRO2: TFloatField;
    QOSCadVAL_NF_PECAS2: TFloatField;
    QOSCadVAL_NF_PECAS_ISENTAS2: TFloatField;
    QOSCadVAL_NF_SERVICO_CHAPEACAO2: TFloatField;
    QOSCadVAL_NF_SERVICO_ELETRICO: TFloatField;
    QOSCadVAL_NF_SERVICO_ELETRICO2: TFloatField;
    QOSCadCOD_OPERACAO: TIntegerField;
    QOSCadCOD_MENSAGEM: TIntegerField;
    QOSCadVAL_DESCONTO: TFloatField;
    QOSCadCOD_NOTA_CAB: TIntegerField;
    QOSCadIND_VISTA_PRAZO: TIntegerField;
    QOSCadIND_NATUREZA_OS: TStringField;
    QOSCadIND_CAMPO_OFICINA: TStringField;
    QOSCadVAL_NF_LOCOMOCAO: TFloatField;
    QOSCadVAL_NF_LOCOMOCAO2: TFloatField;
    QOSCadDESC_SOLICITACAO: TStringField;
    QOSCadCOD_SERIE: TStringField;
    QOSCadnome_cadastro: TStringField;
    QOSCaddesc_filial: TStringField;
    QOSCadnome_vendedor: TStringField;
    QOSCadnome_mecanico: TStringField;
    QOSCaddesc_tipo_os: TStringField;
    QOSCaddesc_caracteristica: TStringField;
    QOSConsNUM_OS: TIntegerField;
    QOSConsCOD_MECANICO: TIntegerField;
    QOSConsCOD_CADASTRO: TIntegerField;
    QOSConsCOD_VENDEDOR: TIntegerField;
    QOSConsNOME: TStringField;
    QOSConsNUM_CHASSI: TStringField;
    QOSConsNUM_PLACA: TStringField;
    QOSConsDESC_COR: TStringField;
    QOSConsNUM_ANO: TIntegerField;
    QOSConsIND_SITUACAO: TStringField;
    QOSConsIND_CONDICAO_PAGTO: TIntegerField;
    QOSConsIND_TIPO_OS: TIntegerField;
    QOSConsDT_EMISSAO: TDateTimeField;
    QOSConsDT_ENTRADA: TDateTimeField;
    QOSConsDT_PREVISAOSAIDA: TDateTimeField;
    QOSConsCOD_FILIAL: TIntegerField;
    QOSConsNUM_KM: TIntegerField;
    QOSConsDESC_SERVICO: TStringField;
    QOSCadCOD_OS: TIntegerField;
    procedure QOSCadAfterInsert(DataSet: TDataSet);
    procedure QOSCadBeforeEdit(DataSet: TDataSet);
    procedure QOSCadBeforePost(DataSet: TDataSet);
    procedure QOSCadCalcFields(DataSet: TDataSet);
    procedure QOSCadNewRecord(DataSet: TDataSet);
  private
    function SenhaLiberaCadastro: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOs: TDMOs;

implementation

uses UOracle_cl, UParamSistema_cl, UMensagemOs, UOficinaPassword;

{$R *.dfm}

procedure TDMOs.QOSCadAfterInsert(DataSet: TDataSet);
begin
  QOSCadIND_CAMPO_OFICINA.Value := 'O';
end;

procedure TDMOs.QOSCadBeforeEdit(DataSet: TDataSet);
var
  wLibera, wDtVencto: string;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
  begin
    wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'TB_CADASTRO.COD_CADASTRO = ' +
      FloatToStr(QOSCadCod_Cadastro.Value));
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' +
      FloatToStr(QOSCadCod_Cadastro.Value) +
      ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    if wDtvencto <> '' then
      if StrToDate(wDtVencto) < (Date - 5) then
        if wLibera = 'NAO' then
        begin
          MessageDlg('Cliente Com Titulos Em Aberto - Verificar Liberação de Cadastro', mtInformation, [mbOk], 0);
          if SenhaLiberaCadastro = true then
            exit
          else
            raise Exception.Create('Cliente Com Titulos Em Aberto - Verificar Liberação de Cadastro');
        end;
  end;
end;

procedure TDMOs.QOSCadBeforePost(DataSet: TDataSet);
var
  wTempoSemServico: string;
  wOsAberta: string;
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') then
  begin
    wTempoSemServico := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS', 'COD_CADASTRO = ' + QOSCadCOD_CADASTRO.Text + ' AND DT_EMISSAO >= ' + chr(39) + DateToStr(Date - 90) + chr(39));
    if (Trim(wTempoSemServico) = '') then
    begin
      MessageDlg('Cliente não executa serviços a mais de 90 dias!', mtInformation, [mbOk], 0);
      if SenhaLiberaCadastro = true then
        exit
      else
        raise exception.create('Senha não confere');
    end;
    wOsAberta := DMOracle.BuscaNome('SELECT MIN(NUM_OS) FROM TB_OS', 'COD_CADASTRO = ' + QOSCadCOD_CADASTRO.Text + ' AND TB_OS.IND_SITUACAO = ' + chr(39) + 'A' + chr(39));
    if wOsAberta <> '' then
    begin
      if wOsAberta <> QOSCadNum_Os.Text then
      begin
        if FMensagemOs = nil then
          FMensagemOs := TFMensagemOs.create(Application);
        FMensagemOs.QRLNumOs.Caption := wOsAberta;
        FMensagemOs.showmodal;
      end;
    end;
    if QOSCadCOD_OS.IsNull then
      QOSCadCOD_OS.Value := StrToInt('0' + DMOracle.FastSelect('SQ_OS.NEXTVAL', 'DUAL'));
  end;
end;

procedure TDMOs.QOSCadCalcFields(DataSet: TDataSet);
begin
  QOSCaddesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + IntToStr(QOSCadCOD_FILIAL.Value));
  QOSCadnome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + IntToStr(QOSCadCOD_VENDEDOR.Value));
  QOSCadnome_mecanico.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO', 'COD_MECANICO = ' + IntToStr(QOSCadCOD_MECANICO.Value));
  QOSCaddesc_tipo_os.Value := DMOracle.BuscaNome('SELECT DESC_OS_TIPO FROM TB_OS_TIPO', 'COD_OS_TIPO = ' + IntToStr(QOSCadIND_TIPO_OS.Value));
  QOSCadnome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QOSCadCOD_CADASTRO.Value));
end;

procedure TDMOs.QOSCadNewRecord(DataSet: TDataSet);
begin
  QOSCadDT_EMISSAO.Value := Date;
  QOSCadDT_ENTRADA.Value := Date;
  QOSCadDT_PREVISAOSAIDA.Value := Date;
  QOSCadCOD_FILIAL.Value := 1; // Pega como padrão 1 Matriz
  QOSCadIND_SITUACAO.Value := 'A'; // Aberta.
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
  begin
    QOSCadIND_TIPO_OS.Value := 1; // Usa como padrão NORMAL
    QOSCadHR_PREVISTASAIDA.Value := '18:00';
  end;
  QOSCadHR_ENTRADA.Value := TimeToStr(Time);
end;

function TDMOs.SenhaLiberaCadastro(): boolean;
begin
  if FOficinaPassword = nil then
    FOficinaPassword := TFOficinaPassword.Create(Application);
  if FOficinaPassword.ShowModal = mrOk then
  begin
    if (UpperCase(FOficinaPassword.Password.Text) = UpperCase(DMParamSistema.QParamSistemaDesc_Senha_Oficina.Text)) then
      result := true
    else
      result := false;
  end
  else
    result := false;
end;

end.

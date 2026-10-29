unit UImportaMySQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBXpress, DB, SqlExpr, FMTBcd, Grids, DBGrids,
  ZConnection, StdCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, Gauges, UBiblioteca;

type
  TFImportaMySQL = class(TForm)
    SBBase: TSpeedButton;
    BtnImportar: TBitBtn;
    GGeral: TGauge;
    GAtual: TGauge;
    LMensagem: TLabel;
    procedure SBBaseClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
  private
    mapCidades: TVariantMap;
    mapCadastro: TVariantMap;
    procedure mapeiaCidades;
    procedure minAtual(valor: Integer);
    procedure maxAtual(valor: Integer);
    procedure maxGeral(valor: Integer);
    procedure minGeral(valor: Integer);
    procedure geral(valor: Integer);
    procedure atual(valor: Integer);
    procedure mensagem(mensagem: string);
    function sequencia(seq: string): Double;
    function LimpaDocumento(num: string): string;
    function LimpaNumero(num: string): string;
    procedure importaCadastro;
    procedure importaContasReceber;
    procedure importaContasReceberMov(cab: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaMySQL: TFImportaMySQL;

implementation

uses UOracle_cl, UImportaMySQL_cl, Math, ComObj;

{$R *.dfm}

function TFImportaMySQL.LimpaDocumento(num: string): string;
var
  i: integer;
begin
  result := '';
  num := trim(num);
  for i := 1 to Length(num) do
    if ((num[i] in ['0'..'9']) or (num[i] = '-') or (num[i] = '/') or (num[i] = '.')) then
      result := result + num[i];
end;

function TFImportaMySQL.LimpaNumero(num: string): string;
var
  i: integer;
begin
  result := '';
  num := trim(num);
  for i := 1 to Length(num) do
    if num[i] in ['0'..'9'] then
      result := result + num[i];
end;

function TFImportaMySQL.sequencia(seq: string): Double;
begin
  DmImportaMySQL.QSeq.Close;
  DmImportaMySQL.QSeq.SetVariable('SEQ', seq);
  DmImportaMySQL.QSeq.Open;
  Result := DmImportaMySQL.QSeqVALOR.Value;
end;

procedure TFImportaMySQL.minAtual(valor: Integer);
begin
  GAtual.MinValue := valor;
end;

procedure TFImportaMySQL.maxAtual(valor: Integer);
begin
  GAtual.MaxValue := valor;
end;

procedure TFImportaMySQL.minGeral(valor: Integer);
begin
  GGeral.MinValue := valor;
end;

procedure TFImportaMySQL.maxGeral(valor: Integer);
begin
  GGeral.MaxValue := valor;
end;

procedure TFImportaMySQL.geral(valor: Integer);
begin
  GGeral.Progress := valor;
end;

procedure TFImportaMySQL.atual(valor: Integer);
begin
  GAtual.Progress := valor;
  Application.Title := LMensagem.Caption + ' - ' + FloatToStr(GAtual.MaxValue / GAtual.Progress) + '%';
end;

procedure TFImportaMySQL.mensagem(mensagem: string);
begin
  LMensagem.Caption := mensagem;
  LMensagem.Refresh;
end;

procedure TFImportaMySQL.SBBaseClick(Sender: TObject);
begin
  with DMOracle do
  try
    if SBBase.Down then
    begin
      SBBase.Caption := 'Produção';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORA';
      DBCemapa.Connected := True;
    end
    else
    begin
      SBBase.Caption := 'Teste';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORCL';
      DBCemapa.Connected := True;
    end;
  except
    MessageDlg('Não foi possível conectar com esta base de dados!'
      + #13 + 'Certifique-se que esta base existe em seu servidor', mtWarning, [mbOk], 0);
  end;
end;

procedure TFImportaMySQL.BtnImportarClick(Sender: TObject);
begin
  try
    minAtual(0);
    minGeral(0);
    maxGeral(2);

    geral(0);

    DMOracle.DBCemapa.StartTransaction;

//    mensagem('Mapeando códigos das cidades');
//    mapeiaCidades;
//    geral(1);

    mensagem('Importando cadastros');
    importaCadastro;
    geral(1);

    mensagem('Importando Contas a Receber');
    importaContasReceber;
    geral(2);

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFImportaMySQL.mapeiaCidades;
begin
  with DmImportaMySQL do
  begin
    QCidades.Close;
    QCidades.Open;
    mapCidades := TVariantMap.Create;

    maxAtual(QCidades.RecordCount);

    QCidades.First;
    while not QCidades.Eof do
    begin
      atual(QCidades.RecNo);
      ZCidade.Close;
      ZCidade.ParamByName('COD_ESTADO').AsString := QCidadesCOD_ESTADO.Value;
      ZCidade.ParamByName('DESC_CIDADE').AsString := QCidadesDESC_CIDADE.Value;
      ZCidade.Open;

      if not ZCidade.IsEmpty then
        mapCidades.addValue(ZCidadeCID_CODIGO.Value, QCidadesCOD_CIDADE.Value);

      QCidades.Next;
    end;
  end;
end;

procedure TFImportaMySQL.importaCadastro;
var wPais, wEstado, wDescCidade: string;
  wCidade: Integer;
begin
  with DmImportaMySQL do
  begin
    ZClientes.Close;
    ZClientes.Open;
    QCadastro.Close;
    QCadastro.Open;

    maxAtual(ZClientes.RecordCount);
    mapCadastro := TVariantMap.Create;

    ZClientes.First;
    while not ZClientes.Eof do
    begin
      atual(ZClientes.RecNo);

      wCidade := -1;
      wEstado := '';
      wDescCidade := '';
      QCidade.Close;
      QCidade.SetVariable('COD_CIDADE_IBGE', ZClientesCOD_IBGE_CIDADE.Value);
      QCidade.SetVariable('COD_UF_IBGE', ZClientesCOD_IBGE_ESTADO.Value);
      QCidade.Open;
      if QCidade.IsEmpty then
      begin
        QCidadeNome.Close;
        QCidadeNome.SetVariable('DESC_CIDADE', ZClientesCID_NOME.Value);
        QCidadeNome.SetVariable('COD_ESTADO', ZClientesCID_ESTADO.Value);
        QCidadeNome.Open;

        if QCidadeNome.IsEmpty then
        begin
          MessageDlg('Cidade não encontrada: ' + ZClientesCID_NOME.Value + '(' + ZClientesCID_ESTADO.Value + ') ' + ZClientesCid_CodIBGE.Text + #13 + #10 + 'Cliente: ' + ZClientesCli_Codigo.Text, mtError, [mbOK], 0);
          raise Exception.Create('');
        end
        else
        begin
          wCidade := QCidadeNomeCOD_CIDADE.Value;
          wEstado := QCidadeNomeCOD_ESTADO.Value;
          wDescCidade := QCidadeNomeDESC_CIDADE.Value;
        end;
      end
      else
      begin
        wCidade := QCidadeCOD_CIDADE.Value;
        wEstado := QCidadeCOD_ESTADO.Value;
        wDescCidade := QCidadeDESC_CIDADE.Value;
      end;

      QCadastro.Append;
      QCadastroCOD_CADASTRO.Value := Trunc(sequencia('SQCADASTRO'));
      QCadastroNOME.Value := ZClientesCli_Nome.Value;
      QCadastroDESC_FANTASIA.Value := ZClientesCli_NomeFant.Value;
      QCadastroDESC_ENDERECO.Value := ZClientesCli_Endereco.Value;
      QCadastroDESC_BAIRRO.Value := ZClientesCli_Bairro.Value;
      QCadastroDESC_CEP.Value := ZClientesCli_CEP.Value;
      if not ZClientesCli_Fone.IsNull then
        QCadastroDESC_TELEFONE.Value := LimpaNumero(ZClientesCli_Fone.Value);
      if not ZClientesCli_FAX.IsNull then
        QCadastroDESC_FAX.Value := LimpaNumero(ZClientesCli_FAX.Value);
      QCadastroDESC_E_MAIL.Value := ZClientesCli_Email.Value;
      QCadastroIND_FISICA_JURIDICA.Value := ZClientesCli_FisicaJuridica.Value;
      QCadastroDT_CADASTRO.Value := ZClientesCli_DataCad.Value;
      QCadastroCOD_CIDADE.Value := wCidade;
      if QCadastroIND_FISICA_JURIDICA.Value = 'F' then
        QCadastroNUM_CGC_CPF.Value := LimpaDocumento(ZClientesCLFS_CPF.Value)
      else
        QCadastroNUM_CGC_CPF.Value := LimpaDocumento(ZClientesCLJR_CNPJ.Value);
      if QCadastroIND_FISICA_JURIDICA.Value = 'F' then
      begin
        if ZClientesCLFS_CADPRODUTOR.IsNull then
          QCadastroNUM_INSCRICAO.Value := LimpaDocumento(ZClientesCLFS_RG.Value)
        else
          QCadastroNUM_INSCRICAO.Value := LimpaDocumento(ZClientesCLFS_CADPRODUTOR.Value);
      end
      else
        QCadastroNUM_INSCRICAO.Value := LimpaDocumento(ZClientesCLJR_INSCEST.Value);
      if ZClientesCLFS_SEXO.IsNull then
        QCadastroIND_SEXO_CATEGORIA.Value := 'M'
      else
        QCadastroIND_SEXO_CATEGORIA.Value := ZClientesCLFS_SEXO.Value;
//      QCadastroCOD_ESTADO.Value := DMOracle.FastSelect('COD_ESTADO', 'TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
//      QCadastroDESC_CIDADE.Value := DMOracle.FastSelect('DESC_CIDADE', 'TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
      QCadastroCOD_ESTADO.Value := wEstado;
      QCadastroDESC_CIDADE.Value := wDescCidade;
      wPais := DMOracle.FastSelect('COD_PAIS', 'TB_PAIS', 'TRIM(UPPER(DESC_PAIS)) = TRIM(UPPER(' + QuotedStr('BRASIL') + '))');
      if wPais <> '' then
        QCadastroCOD_PAIS.Value := StrToInt(wPais);
      QCadastroCOD_TIPO_CADASTRO.Value := StrToInt(DMOracle.FastSelect('COD_TIPO_CADASTRO_CLIENTE', 'TB_PARAM_SISTEMA'));
      QCadastro.Post;

      mapCadastro.addValue(ZClientesCli_Codigo.Value, QCadastroCOD_CADASTRO.Value);

      ZClientes.Next;
    end;
  end;
end;

procedure TFImportaMySQL.importaContasReceber;
begin
  with DmImportaMySQL do
  begin
    ZCR.Close;
    ZCR.Open;
    QCR.Close;
    QCR.Open;

    maxAtual(ZCR.RecordCount);

    ZCR.First;
    while not ZCR.Eof do
    begin
      atual(ZCR.RecNo);

      QCR.Append;
      QCRCOD_CONTA_RECEBER_CAB.Value := Trunc(sequencia('SQCONTA_RECEBER'));
      QCRCOD_FINALIDADE.Value := StrToInt(DMOracle.FastSelect('MIN(COD_FINALIDADE)', 'TB_FINALIDADE', 'IND_TIPO = ' + QuotedStr('VENDA')));
//      QCRCOD_BANCO_AGENCIA.Value := ;
//      QCRCOD_CONTA_CORRENTE.Value := ;
      QCRCOD_FILIAL.Value := 1;
      QCRNUM_TITULO.Value := ZCRTit_Titulo.Value; //precisa aumentar a precisão do NUM_TITULO para pelo menos 9
      QCRNUM_PARCELA.Value := ZCRTit_Parcela.Value;
      QCRDESC_TIPO_DOCUMENTO.Value := ZCRSer_Codigo.Value;
      QCRDT_MOVIMENTO.Value := ZCRTit_DataLcto.Value;
      QCRDT_BAIXA.Value := ZCRTit_DataBaixa.Value;
      QCRDT_VENCIMENTO.Value := ZCRTit_DataVcto.Value;
      QCRDT_EMISSAO.Value := ZCRTit_DataLcto.Value;
      QCRVAL_TITULO.Value := ZCRTit_VlrTitulo.Value; //tem que considerar as baixas
//      QCRIND_ACEITE.Value := ;
//      QCRIND_SITUACAO.Value := ;
      QCRDESC_OBSERVACAO.Value := ZCRTit_Obs.Value;
      QCRCOD_CADASTRO.Value := mapCadastro.getValue(ZCRCli_Codigo.Value);
      QCRVAL_ORIGINAL.Value := ZCRTit_VlrTitulo.Value;
      QCRCOD_DEPARTAMENTO.Value := 1;
//      QCRCOD_VENDEDOR.Value := ZCRTit_Vendedores.Value; //cuidar pq é uma STRING e tem casos zuados como: '211,291,292'
      QCRPERC_COMISSAO.Value := 0;
      QCRPERC_COMISSAO1.Value := 0;
      QCRPERC_COMISSAO.Value := 0;
      QCR.Post;

      ZCR.Next;
    end;
  end;
end;

procedure TFImportaMySQL.importaContasReceberMov(cab: Integer);
begin
  with DmImportaMySQL do
  begin
    ZCRMov.Close;
    ZCRMov.Open;
    QCRMov.Close;
    QCRMov.Open;

    maxAtual(ZCRMov.RecordCount);

    ZCRMov.First;
    while not ZCRMov.Eof do
    begin
      atual(ZCRMov.RecNo);

      QCRMov.Append;
      QCRMovCOD_CONTA_RECEBER_MOV.Value := Trunc(sequencia('SQCONTA_RECEBER_MOV'));
      QCRMovCOD_CONTA_RECEBER_CAB.Value := cab;
      QCRMovDT_MOVIMENTO.Value := ZCRMovMov_DataLcto.Value;
      QCRMov.Post;

      ZCRMov.Next;
    end;
  end;
end;

end.

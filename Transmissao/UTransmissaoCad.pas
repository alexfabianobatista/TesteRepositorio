unit UTransmissaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TFTransmissaoCad = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog: TSaveDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BTExpCadastro: TBitBtn;
    BTExpContasPagar: TBitBtn;
    BTExpObra: TBitBtn;
    BTExpRequisicoes: TBitBtn;
    BTExpBancos: TBitBtn;
    BTExpCaixa: TBitBtn;
    BTExpNotas: TBitBtn;
    BTExpContabilidade: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    BTExpProduto: TBitBtn;
    Label17: TLabel;
    Label18: TLabel;
    BTExpContasRec: TBitBtn;
    Label19: TLabel;
    CheckBox9: TCheckBox;
    procedure BTExpCadastroClick(Sender: TObject);
    procedure BTExpObraClick(Sender: TObject);
    procedure BTExpContasPagarClick(Sender: TObject);
    procedure BTExpCaixaClick(Sender: TObject);
    procedure BTExpBancosClick(Sender: TObject);
    procedure BTExpRequisicoesClick(Sender: TObject);
    procedure BTExpContabilidadeClick(Sender: TObject);
    procedure BTExpNotasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTExpProdutoClick(Sender: TObject);
    procedure BTExpContasRecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransmissaoCad: TFTransmissaoCad;

implementation

uses UTransmissao_cl, UOracle_cl, UBiblioteca, UBanco_cl;

{$R *.DFM}
procedure GeraArquivo(objeto: String;Texto:String);
var
  S,wArquivo:String;
  F: TextFile;
begin
    S:=Texto;
    if S = '' then  //--teste conteudo da string caso seja vazia não permite criação de arquivo vazio
      raise exception.create('Não existem registros a serem Exportados');

    wArquivo:=objeto;
    wArquivo := wArquivo + FormatDateTime('dd_MM_YY', Date) + '.txt';
    FTransmissaoCad.SaveDialog.FileName:= wArquivo;
    FTransmissaoCad.SaveDialog.Filter := 'Arquivo Transmissão Cavalca';
    FTransmissaoCad.SaveDialog.DefaultExt := '';
    FTransmissaoCad.SaveDialog.FilterIndex := 0;

    if FTransmissaoCad.SaveDialog.Execute then
    begin
      AssignFile( F, FTransmissaoCad.SaveDialog.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);

      with DMOracle do
      begin
        try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;

        if objeto = 'CAD' then
          QExecSQL.SQL.Add('delete log_tb_cadastro');

        if objeto = 'OBRA' then
          QExecSQL.SQL.Add('delete log_tb_obra');

        if objeto = 'NOTAS' then
          QExecSQL.SQL.Add('delete log_tb_nota_cab');

        if objeto = 'REQUISICOES' then
          QExecSQL.SQL.Add('delete log_tb_obra_req_cab');

        if objeto = 'CP' then
          QExecSQL.SQL.Add('delete log_tb_conta_pagar_cab');

        if objeto = 'BANCOS' then
          QExecSQL.SQL.Add('delete log_tb_bco_movimento');

        if objeto = 'CAIXA' then
          QExecSQL.SQL.Add('delete log_tb_caixa_mov');

        if objeto = 'CONTABIL' then
          QExecSQL.SQL.Add('delete log_tb_lancto_contabil');

        if objeto = 'PRODUTO' then
          QExecSQL.SQL.Add('delete log_tb_produto');

        if objeto = 'CR' then
          QExecSQL.SQL.Add('delete log_tb_conta_receber_cab');

       QExecSQL.ExecSQL;
       DBCemapa.Commit;
      except
        DBCemapa.Rollback;
      end;

      try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;

        if objeto = 'NOTAS' then
        begin
          QExecSQL.SQL.Add('delete log_tb_nota_item');
        end;

        if objeto = 'REQUISICOES' then
        begin
          QExecSQL.SQL.Add('delete log_tb_obra_req_item');
        end;

        if objeto = 'CP' then
        begin
          QExecSQL.SQL.Add('delete log_tb_conta_pagar_mov');
        end;

        if objeto = 'CR' then
          QExecSQL.SQL.Add('delete log_tb_conta_receber_mov');

       QExecSQL.ExecSQL;
       DBCemapa.Commit;
      except
        DBCemapa.Rollback;
      end;
      end;
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
end;


procedure TFTransmissaoCad.BTExpCadastroClick(Sender: TObject);
var S,wAux: String;
begin
  with DMTransmissao do
  begin
    //--abertura querys transmissao
    QTransmissaoCadastro.Close;
    QTransmissaoCadastro.setVariable('TYPE','I');
    QTransmissaoCadastro.Open;
    QTransmissaoCadastro.first;

    //----------inicio bloco transmissao cadastro
    while not(QTransmissaoCadastro.Eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_CADASTRO('                                        +
      'COD_CADASTRO,'                                                                +
      'COD_MOTIVO,'                                                                  +
      'COD_TIPO_CADASTRO,'                                                           +
      'COD_REGIAO,'                                                                  +
      'COD_PAIS,'                                                                    +
      'COD_ESTADO_CIVIL,'                                                            +
      'COD_RAMO,'                                                                    +
      'COD_ESTADO,'                                                                  +
      'NOME,'                                                                        +
      'DESC_ENDERECO,'                                                               +
      'DESC_CIDADE,'                                                                 +
      'DESC_CEP,'                                                                    +
      'NUM_CGC_CPF,'                                                                 +
      'NUM_INSCRICAO,'                                                               +
      'DT_CADASTRO,'                                                                 +
      'IND_SEXO_CATEGORIA,'                                                          +
      'NUM_CAIXA_POSTAL,'                                                            +
      'DT_CANCELAMENTO,'                                                             +
      'DESC_TELEFONE,'                                                               +
      'DESC_CELULAR,'                                                                +
      'NOME_CONTATO,'                                                                +
      'DT_NASCIMENTO,'                                                               +
      'DESC_BAIRRO,'                                                                 +
      'PERC_FUNRURAL,'                                                               +
      'VAL_LIMITE,'                                                                  +
      'DESC_FANTASIA,'                                                               +
      'DESC_CIDADE_COBRANCA,'                                                        +
      'DESC_ENDERECO_COBRANCA,'                                                      +
      'DESC_ESTADO_COBRANCA,'                                                        +
      'DESC_CEP_COBRANCA,'                                                           +
      'DESC_TELEFONE_COMERCIAL,'                                                     +
      'NUM_JUNTA,'                                                                   +
      'DT_FUNDACAO,'                                                                 +
      'DT_JUNTA,'                                                                    +
      'DESC_FAX,'                                                                    +
      'NOME_MAE,'                                                                    +
      'NOME_PAI,'                                                                    +
      'DESC_NATURALIDADE,'                                                           +
      'DESC_ESTADO_NATURAL,'                                                         +
      'DT_EXPEDICAO_IDENTIDADE,'                                                     +
      'DESC_E_MAIL,'                                                                 +
      'DESC_FAX_COBRANCA,'                                                           +
      'IND_SEPROC_SIMNAO,'                                                           +
      'DESC_INSCRICAO_MUNICIPAL,'                                                    +
      'NOME_CONJUGE,'                                                                +
      'DESC_CPF_CONJUGE,'                                                            +
      'DESC_IDENTIDADE_CONJUGE,'                                                     +
      'COD_CLASS_CADASTRO,'                                                          +
      'COD_BANCO_AGENCIA,'                                                           +
      'COD_OPERACAO_CC,'                                                             +
      'DT_NASCIMENTO_CONTATO,'                                                       +
      'NOME_CONTATO2,'                                                               +
      'DT_NASCIMENTO2,'                                                              +
      'COD_VENDEDOR,'                                                                +
      'PERC_COMISSAO,'                                                               +
      'DESC_COMPLEMENTO,'                                                            +
      'IND_FISICA_JURIDICA,'                                                         +
      'DESC_ENDERECO_ENTREGA,'                                                       +
      'DESC_CIDADE_ENTREGA,'                                                         +
      'DESC_BAIRRO_ENTREGA,'                                                         +
      'DESC_OBS,'                                                                    +
      'DESC_OBS1,'                                                                   +
      'DESC_OBS2,'                                                                   +
      'DESC_FORMA_COMPRA,'                                                           +
      'COD_USUARIO,'                                                                 +
      'DESC_REF_COMERCIAL1,'                                                         +
      'DESC_REF_COMERCIAL2,'                                                         +
      'DESC_REF_COMERCIAL3,'                                                         +
      'DESC_REF_BANCO1,'                                                             +
      'DESC_REF_BANCO2,'                                                             +
      'DESC_REF_BANCO3,'                                                             +
      'DESC_REF_PARENTE_NOME,'                                                       +
      'DESC_REF_PARENTE_ENDERECO,'                                                   +
      'DESC_REF_PARENTE_CIDADE,'                                                     +
      'DESC_REF_PARENTE_TELEFONE,'                                                   +
      'DESC_REF_OUTRAS,'                                                             +
      'COD_CADASTRO_NOVO,'                                                           +
      'DESC_ORGAO_EMISSOR,'                                                          +
      'DESC_INSCRICAO_INSS,'                                                         +
      'DESC_CARTEIRA,'                                                               +
      'DT_EXPEDICAO_CARTEIRA,'                                                       +
      'COD_VENDEDOR_PREPOSTO,'                                                       +
      'COD_CIDADE,'                                                                  +
      'DESC_HOBBIE,'                                                                 +
      'DESC_DESTRITO,'                                                               +
      'DESC_AGENCIA,'                                                                +
      'DESC_CONTA_CORRENTE,'                                                         +
      'COD_OPERACAO_CC1,'                                                            +
      'COD_OPERACAO_CC2,'                                                            +
      'DESC_PLACA,'                                                                  +
      'PERC_DESCONTO,'                                                               +
      'IND_REGIME_ESPECIAL,'                                                         +
      'IND_LIBERA_VENDA) '                                                           +
      'values('                                                                      +
      trim(QTransmissaoCadastroCOD_CADASTRO.text)+',';
      if trim(QTransmissaoCadastroCOD_MOTIVO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_MOTIVO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_TIPO_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_TIPO_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_REGIAO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_REGIAO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_PAIS.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_PAIS.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_ESTADO_CIVIL.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_ESTADO_CIVIL.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_RAMO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_RAMO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_ESTADO.text) <> '' then
        wAux:=chr(39)+trim(QTransmissaoCadastroCOD_ESTADO.text)+chr(39)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroNOME.text)+CHR(39)+','                           +
      CHR(39)+(QTransmissaoCadastroDESC_ENDERECO.text)+CHR(39)+','                  +
      CHR(39)+(QTransmissaoCadastroDESC_CIDADE.text)+CHR(39)+','                    +
      CHR(39)+(QTransmissaoCadastroDESC_CEP.text)+CHR(39)+','                       +
      CHR(39)+(QTransmissaoCadastroNUM_CGC_CPF.text)+CHR(39)+','                    +
      CHR(39)+(QTransmissaoCadastroNUM_INSCRICAO.text)+CHR(39)+','                  +
      CHR(39)+QTransmissaoCadastroDT_CADASTRO.text+CHR(39)+','                      +
      CHR(39)+(QTransmissaoCadastroIND_SEXO_CATEGORIA.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroNUM_CAIXA_POSTAL.text) <> '' then
        wAux:=trim(QTransmissaoCadastroNUM_CAIXA_POSTAL.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+QTransmissaoCadastroDT_CANCELAMENTO.text+CHR(39)+','                  +
      CHR(39)+(QTransmissaoCadastroDESC_TELEFONE.text)+CHR(39)+','                  +
      CHR(39)+(QTransmissaoCadastroDESC_CELULAR.text)+CHR(39)+','                   +
      CHR(39)+(QTransmissaoCadastroNOME_CONTATO.text)+CHR(39)+','                   +
      CHR(39)+QTransmissaoCadastroDT_NASCIMENTO.text+CHR(39)+','                    +
      CHR(39)+(QTransmissaoCadastroDESC_BAIRRO.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroPERC_FUNRURAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_FUNRURAL.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroVAL_LIMITE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroVAL_LIMITE.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroDESC_FANTASIA.text)+CHR(39)+','                  +
      CHR(39)+(QTransmissaoCadastroDESC_CIDADE_COBRANCA.text)+CHR(39)+','           +
      CHR(39)+(QTransmissaoCadastroDESC_ENDERECO_COBRANCA.text)+CHR(39)+','         +
      CHR(39)+(QTransmissaoCadastroDESC_ESTADO_COBRANCA.text)+CHR(39)+','           +
      CHR(39)+(QTransmissaoCadastroDESC_CEP_COBRANCA.text)+CHR(39)+','              +
      CHR(39)+(QTransmissaoCadastroDESC_TELEFONE_COMERCIAL.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroNUM_JUNTA.text) <> '' then
        wAux:=trim(QTransmissaoCadastroNUM_JUNTA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+QTransmissaoCadastroDT_FUNDACAO.text+CHR(39)+','                      +
      CHR(39)+QTransmissaoCadastroDT_JUNTA.text+CHR(39)+','                         +
      CHR(39)+(QTransmissaoCadastroDESC_FAX.text)+CHR(39)+','                       +
      CHR(39)+(QTransmissaoCadastroNOME_MAE.text)+CHR(39)+','                       +
      CHR(39)+(QTransmissaoCadastroNOME_PAI.text)+CHR(39)+','                       +
      CHR(39)+(QTransmissaoCadastroDESC_NATURALIDADE.text)+CHR(39)+','              +
      CHR(39)+(QTransmissaoCadastroDESC_ESTADO_NATURAL.text)+CHR(39)+','            +
      CHR(39)+QTransmissaoCadastroDT_EXPEDICAO_IDENTIDADE.text+CHR(39)+','          +
      CHR(39)+(QTransmissaoCadastroDESC_E_MAIL.text)+CHR(39)+','                    +
      CHR(39)+(QTransmissaoCadastroDESC_FAX_COBRANCA.text)+CHR(39)+','              +
      CHR(39)+(QTransmissaoCadastroIND_SEPROC_SIMNAO.text)+CHR(39)+','              +
      CHR(39)+(QTransmissaoCadastroDESC_INSCRICAO_MUNICIPAL.text)+CHR(39)+','       +
      CHR(39)+(QTransmissaoCadastroNOME_CONJUGE.text)+CHR(39)+','                   +
      CHR(39)+(QTransmissaoCadastroDESC_CPF_CONJUGE.text)+CHR(39)+','               +
      CHR(39)+(QTransmissaoCadastroDESC_IDENTIDADE_CONJUGE.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_CLASS_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CLASS_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_BANCO_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+QTransmissaoCadastroDT_NASCIMENTO_CONTATO.text+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroNOME_CONTATO2.text)+CHR(39)+','                  +
      CHR(39)+QTransmissaoCadastroDT_NASCIMENTO2.text+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_VENDEDOR.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroPERC_COMISSAO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_COMISSAO.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroDESC_COMPLEMENTO.text)+CHR(39)+','               +
      CHR(39)+(QTransmissaoCadastroIND_FISICA_JURIDICA.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_ENDERECO_ENTREGA.text)+CHR(39)+','          +
      CHR(39)+(QTransmissaoCadastroDESC_CIDADE_ENTREGA.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_BAIRRO_ENTREGA.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_OBS.text)+CHR(39)+','                       +
      CHR(39)+(QTransmissaoCadastroDESC_OBS1.text)+CHR(39)+','                      +
      CHR(39)+(QTransmissaoCadastroDESC_OBS2.text)+CHR(39)+','                      +
      CHR(39)+(QTransmissaoCadastroDESC_FORMA_COMPRA.text)+CHR(39)+','              +
      trim(QTransmissaoCadastroCOD_USUARIO.text)+','                                +
      CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL1.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL2.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL3.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO1.text)+CHR(39)+','                +
      CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO2.text)+CHR(39)+','                +
      CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO3.text)+CHR(39)+','                +
      CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_NOME.text)+CHR(39)+','          +
      CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_ENDERECO.text)+CHR(39)+','      +
      CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_CIDADE.text)+CHR(39)+','        +
      CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_TELEFONE.text)+CHR(39)+','      +
      CHR(39)+(QTransmissaoCadastroDESC_REF_OUTRAS.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_CADASTRO_NOVO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CADASTRO_NOVO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroDESC_ORGAO_EMISSOR.text)+CHR(39)+','             +
      CHR(39)+(QTransmissaoCadastroDESC_INSCRICAO_INSS.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroDESC_CARTEIRA.text)+CHR(39)+','                  +
      CHR(39)+QTransmissaoCadastroDT_EXPEDICAO_CARTEIRA.text+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_VENDEDOR_PREPOSTO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_VENDEDOR_PREPOSTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_CIDADE.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CIDADE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroDESC_HOBBIE.text)+CHR(39)+','                    +
      CHR(39)+(QTransmissaoCadastroDESC_DESTRITO.text)+CHR(39)+','                  +
      CHR(39)+(QTransmissaoCadastroDESC_AGENCIA.text)+CHR(39)+','                   +
      CHR(39)+(QTransmissaoCadastroDESC_CONTA_CORRENTE.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC1.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC1.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC2.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC2.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroDESC_PLACA.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroPERC_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_DESCONTO.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoCadastroIND_REGIME_ESPECIAL.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoCadastroIND_LIBERA_VENDA.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCadastro.next;
    end;


    QTransmissaoCadastro.Close;
    QTransmissaoCadastro.setVariable('TYPE','U');
    QTransmissaoCadastro.Open;
    QTransmissaoCadastro.first;

    //----------UPDATE
    while not(QTransmissaoCadastro.Eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_CADASTRO SET ';
      if trim(QTransmissaoCadastroCOD_MOTIVO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_MOTIVO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_MOTIVO = '+wAux;
      if trim(QTransmissaoCadastroCOD_TIPO_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_TIPO_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_TIPO_CADASTRO = '+wAux;
      if trim(QTransmissaoCadastroCOD_REGIAO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_REGIAO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_REGIAO = '+wAux;
      if trim(QTransmissaoCadastroCOD_PAIS.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_PAIS.text)+','
      else
        wAux:='null,';
      S:=S+'COD_PAIS = '+wAux;
      if trim(QTransmissaoCadastroCOD_ESTADO_CIVIL.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_ESTADO_CIVIL.text)+','
      else
        wAux:='null,';
      S:=S+'COD_ESTADO_CIVIL = '+wAux;
      if trim(QTransmissaoCadastroCOD_RAMO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_RAMO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_RAMO = '+wAux;
      if trim(QTransmissaoCadastroCOD_ESTADO.text) <> '' then
        wAux:=chr(39)+trim(QTransmissaoCadastroCOD_ESTADO.text)+chr(39)+','
      else
        wAux:='null,';
      S:=S+'COD_ESTADO = '+wAux                                                                     +
      'NOME = '+CHR(39)+(QTransmissaoCadastroNOME.text)+CHR(39)+','                           +
      'DESC_ENDERECO = '+CHR(39)+(QTransmissaoCadastroDESC_ENDERECO.text)+CHR(39)+','                  +
      'DESC_CIDADE = '+CHR(39)+(QTransmissaoCadastroDESC_CIDADE.text)+CHR(39)+','                    +
      'DESC_CEP = '+CHR(39)+(QTransmissaoCadastroDESC_CEP.text)+CHR(39)+','                       +
      'NUM_CGC_CPF = '+CHR(39)+(QTransmissaoCadastroNUM_CGC_CPF.text)+CHR(39)+','                    +
      'NUM_INSCRICAO = '+CHR(39)+(QTransmissaoCadastroNUM_INSCRICAO.text)+CHR(39)+','                  +
      'DT_CADASTRO = '+CHR(39)+QTransmissaoCadastroDT_CADASTRO.text+CHR(39)+','                      +
      'IND_SEXO_CATEGORIA = '+CHR(39)+(QTransmissaoCadastroIND_SEXO_CATEGORIA.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroNUM_CAIXA_POSTAL.text) <> '' then
        wAux:=trim(QTransmissaoCadastroNUM_CAIXA_POSTAL.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_CAIXA_POSTAL = '+wAux                                                                     +
      'DT_CANCELAMENTO = '+CHR(39)+QTransmissaoCadastroDT_CANCELAMENTO.text+CHR(39)+','                  +
      'DESC_TELEFONE = '+CHR(39)+(QTransmissaoCadastroDESC_TELEFONE.text)+CHR(39)+','                  +
      'DESC_CELULAR = '+CHR(39)+(QTransmissaoCadastroDESC_CELULAR.text)+CHR(39)+','                   +
      'NOME_CONTATO = '+CHR(39)+(QTransmissaoCadastroNOME_CONTATO.text)+CHR(39)+','                   +
      'DT_NASCIMENTO = '+CHR(39)+QTransmissaoCadastroDT_NASCIMENTO.text+CHR(39)+','                    +
      'DESC_BAIRRO = '+CHR(39)+(QTransmissaoCadastroDESC_BAIRRO.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroPERC_FUNRURAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_FUNRURAL.text))+','
      else
        wAux:='null,';
      S:=S+'PERC_FUNRURAL = '+wAux;
      if trim(QTransmissaoCadastroVAL_LIMITE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroVAL_LIMITE.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_LIMITE = '+wAux                                                                     +
      'DESC_FANTASIA = '+CHR(39)+(QTransmissaoCadastroDESC_FANTASIA.text)+CHR(39)+','                  +
      'DESC_CIDADE_COBRANCA = '+CHR(39)+(QTransmissaoCadastroDESC_CIDADE_COBRANCA.text)+CHR(39)+','           +
      'DESC_ENDERECO_COBRANCA = '+CHR(39)+(QTransmissaoCadastroDESC_ENDERECO_COBRANCA.text)+CHR(39)+','         +
      'DESC_ESTADO_COBRANCA = '+CHR(39)+(QTransmissaoCadastroDESC_ESTADO_COBRANCA.text)+CHR(39)+','           +
      'DESC_CEP_COBRANCA = '+CHR(39)+(QTransmissaoCadastroDESC_CEP_COBRANCA.text)+CHR(39)+','              +
      'DESC_TELEFONE_COMERCIAL = '+CHR(39)+(QTransmissaoCadastroDESC_TELEFONE_COMERCIAL.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroNUM_JUNTA.text) <> '' then
        wAux:=trim(QTransmissaoCadastroNUM_JUNTA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_JUNTA = '+wAux                                                                     +
      'DT_FUNDACAO = '+CHR(39)+QTransmissaoCadastroDT_FUNDACAO.text+CHR(39)+','                      +
      'DT_JUNTA = '+CHR(39)+QTransmissaoCadastroDT_JUNTA.text+CHR(39)+','                         +
      'DESC_FAX = '+CHR(39)+(QTransmissaoCadastroDESC_FAX.text)+CHR(39)+','                       +
      'NOME_MAE = '+CHR(39)+(QTransmissaoCadastroNOME_MAE.text)+CHR(39)+','                       +
      'NOME_PAI = '+CHR(39)+(QTransmissaoCadastroNOME_PAI.text)+CHR(39)+','                       +
      'DESC_NATURALIDADE = '+CHR(39)+(QTransmissaoCadastroDESC_NATURALIDADE.text)+CHR(39)+','              +
      'DESC_ESTADO_NATURAL = '+CHR(39)+(QTransmissaoCadastroDESC_ESTADO_NATURAL.text)+CHR(39)+','            +
      'DT_EXPEDICAO_IDENTIDADE = '+CHR(39)+QTransmissaoCadastroDT_EXPEDICAO_IDENTIDADE.text+CHR(39)+','          +
      'DESC_E_MAIL = '+CHR(39)+(QTransmissaoCadastroDESC_E_MAIL.text)+CHR(39)+','                    +
      'DESC_FAX_COBRANCA = '+CHR(39)+(QTransmissaoCadastroDESC_FAX_COBRANCA.text)+CHR(39)+','              +
      'IND_SEPROC_SIMNAO = '+CHR(39)+(QTransmissaoCadastroIND_SEPROC_SIMNAO.text)+CHR(39)+','              +
      'DESC_INSCRICAO_MUNICIPAL = '+CHR(39)+(QTransmissaoCadastroDESC_INSCRICAO_MUNICIPAL.text)+CHR(39)+','       +
      'NOME_CONJUGE = '+CHR(39)+(QTransmissaoCadastroNOME_CONJUGE.text)+CHR(39)+','                   +
      'DESC_CPF_CONJUGE = '+CHR(39)+(QTransmissaoCadastroDESC_CPF_CONJUGE.text)+CHR(39)+','               +
      'DESC_IDENTIDADE_CONJUGE = '+CHR(39)+(QTransmissaoCadastroDESC_IDENTIDADE_CONJUGE.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_CLASS_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CLASS_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CLASS_CADASTRO = '+wAux;
      if trim(QTransmissaoCadastroCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_BANCO_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_BANCO_AGENCIA = '+wAux;
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC.text)+','
      else
        wAux:='null,';
      S:=S+'COD_OPERACAO_CC = '+wAux                                                                     +
      'DT_NASCIMENTO_CONTATO = '+CHR(39)+QTransmissaoCadastroDT_NASCIMENTO_CONTATO.text+CHR(39)+','            +
      'NOME_CONTATO2 = '+CHR(39)+(QTransmissaoCadastroNOME_CONTATO2.text)+CHR(39)+','                  +
      'DT_NASCIMENTO2 = '+CHR(39)+QTransmissaoCadastroDT_NASCIMENTO2.text+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_VENDEDOR.text)+','
      else
        wAux:='null,';
      S:=S+'COD_VENDEDOR = '+wAux;
      if trim(QTransmissaoCadastroPERC_COMISSAO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_COMISSAO.text))+','
      else
        wAux:='null,';
      S:=S+'PERC_COMISSAO = '+wAux                                                                     +
      'DESC_COMPLEMENTO = '+CHR(39)+(QTransmissaoCadastroDESC_COMPLEMENTO.text)+CHR(39)+','               +
      'IND_FISICA_JURIDICA = '+CHR(39)+(QTransmissaoCadastroIND_FISICA_JURIDICA.text)+CHR(39)+','            +
      'DESC_ENDERECO_ENTREGA = '+CHR(39)+(QTransmissaoCadastroDESC_ENDERECO_ENTREGA.text)+CHR(39)+','          +
      'DESC_CIDADE_ENTREGA = '+CHR(39)+(QTransmissaoCadastroDESC_CIDADE_ENTREGA.text)+CHR(39)+','+
      'DESC_BAIRRO_ENTREGA = '+CHR(39)+(QTransmissaoCadastroDESC_BAIRRO_ENTREGA.text)+CHR(39)+','+
      'DESC_OBS = '+CHR(39)+(QTransmissaoCadastroDESC_OBS.text)+CHR(39)+','+
      'DESC_OBS1 = '+CHR(39)+(QTransmissaoCadastroDESC_OBS1.text)+CHR(39)+','+
      'DESC_OBS2 = '+CHR(39)+(QTransmissaoCadastroDESC_OBS2.text)+CHR(39)+','+
      'DESC_FORMA_COMPRA = '+CHR(39)+(QTransmissaoCadastroDESC_FORMA_COMPRA.text)+CHR(39)+','+
      'COD_USUARIO = '+trim(QTransmissaoCadastroCOD_USUARIO.text)+','+
      'DESC_REF_COMERCIAL1 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL1.text)+CHR(39)+','+
      'DESC_REF_COMERCIAL2 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL2.text)+CHR(39)+','+
      'DESC_REF_COMERCIAL3 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_COMERCIAL3.text)+CHR(39)+','+
      'DESC_REF_BANCO1 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO1.text)+CHR(39)+','+
      'DESC_REF_BANCO2 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO2.text)+CHR(39)+','+
      'DESC_REF_BANCO3 = '+CHR(39)+(QTransmissaoCadastroDESC_REF_BANCO3.text)+CHR(39)+','+
      'DESC_REF_PARENTE_NOME = '+CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_NOME.text)+CHR(39)+','+
      'DESC_REF_PARENTE_ENDERECO = '+CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_ENDERECO.text)+CHR(39)+','+
      'DESC_REF_PARENTE_CIDADE = '+CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_CIDADE.text)+CHR(39)+','+
      'DESC_REF_PARENTE_TELEFONE = '+CHR(39)+(QTransmissaoCadastroDESC_REF_PARENTE_TELEFONE.text)+CHR(39)+','+
      'DESC_REF_OUTRAS = '+CHR(39)+(QTransmissaoCadastroDESC_REF_OUTRAS.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_CADASTRO_NOVO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CADASTRO_NOVO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO_NOVO = '+wAux+
      'DESC_ORGAO_EMISSOR = '+CHR(39)+(QTransmissaoCadastroDESC_ORGAO_EMISSOR.text)+CHR(39)+','+
      'DESC_INSCRICAO_INSS = '+CHR(39)+(QTransmissaoCadastroDESC_INSCRICAO_INSS.text)+CHR(39)+','+
      'DESC_CARTEIRA = '+CHR(39)+(QTransmissaoCadastroDESC_CARTEIRA.text)+CHR(39)+','+
      'DT_EXPEDICAO_CARTEIRA = '+CHR(39)+QTransmissaoCadastroDT_EXPEDICAO_CARTEIRA.text+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_VENDEDOR_PREPOSTO.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_VENDEDOR_PREPOSTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_VENDEDOR_PREPOSTO = '+wAux;
      if trim(QTransmissaoCadastroCOD_CIDADE.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_CIDADE.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CIDADE = '+wAux+
      'DESC_HOBBIE = '+CHR(39)+(QTransmissaoCadastroDESC_HOBBIE.text)+CHR(39)+','+
      'DESC_DESTRITO = '+CHR(39)+(QTransmissaoCadastroDESC_DESTRITO.text)+CHR(39)+','+
      'DESC_AGENCIA = '+CHR(39)+(QTransmissaoCadastroDESC_AGENCIA.text)+CHR(39)+','+
      'DESC_CONTA_CORRENTE = '+CHR(39)+(QTransmissaoCadastroDESC_CONTA_CORRENTE.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC1.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC1.text)+','
      else
        wAux:='null,';
      S:=S+'COD_OPERACAO_CC1 = '+wAux;
      if trim(QTransmissaoCadastroCOD_OPERACAO_CC2.text) <> '' then
        wAux:=trim(QTransmissaoCadastroCOD_OPERACAO_CC2.text)+','
      else
        wAux:='null,';
      S:=S+'COD_OPERACAO_CC2 = '+wAux+
      'DESC_PLACA = '+CHR(39)+(QTransmissaoCadastroDESC_PLACA.text)+CHR(39)+',';
      if trim(QTransmissaoCadastroPERC_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCadastroPERC_DESCONTO.text))+','
      else
        wAux:='null,';
      S:=S+'PERC_DESCONTO = '+wAux+
      'IND_REGIME_ESPECIAL = '+CHR(39)+(QTransmissaoCadastroIND_REGIME_ESPECIAL.text)+CHR(39)+','+
      'IND_LIBERA_VENDA = '+CHR(39)+(QTransmissaoCadastroIND_LIBERA_VENDA.text)+CHR(39)+
      ' WHERE COD_CADASTRO = '+trim(QTransmissaoCadastroCOD_CADASTRO.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCadastro.next;
    end;
    QTransmissaoCadastro.Close;
    geraArquivo('CAD',S)
  end;
end;



procedure TFTransmissaoCad.BTExpObraClick(Sender: TObject);
var S,wAux: String;

begin
  with DMTransmissao do
  begin
    QTransmissaoObra.Close;
    QTransmissaoObra.setVariable('TYPE','I');
    QTransmissaoObra.Open;
    QTransmissaoObra.first;

    S:='';
    //data criacao 26/04/2004
    //----------inicio bloco transmissao obra
    while not(QTransmissaoObra.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_OBRA('                                            +
      'COD_OBRA,'                                                                    +
      'COD_FILIAL,'                                                                  +
      'DESC_OBRA,'                                                                   +
      'DESC_ENDERECO,'                                                               +
      'COD_CIDADE,'                                                                  +
      'DT_INICIO_OBRA,'                                                              +
      'DT_FIM_OBRA,'                                                                 +
      'COD_CADASTRO,'                                                                +
      'DT_CADASTRO_OBRA,'                                                            +
      'COD_USUARIO,'                                                                 +
      'IND_SITUACAO,'                                                                +
      'IND_KM_HR,'                                                                   +
      'TROCA_OLEO,'                                                                  +
      'TROCA_FILTRO,'                                                                +
      'REVISAO,'                                                                     +
      'VAL_MARCADOR) '                                                               +
      'VALUES('                                                                      +
      trim(QTransmissaoObraCOD_OBRA.text)+','                                        +
      trim(QTransmissaoObraCOD_FILIAL.text)+','                                      +
      CHR(39)+(QTransmissaoObraDESC_OBRA.text)+CHR(39)+','                           +
      CHR(39)+(QTransmissaoObraDESC_ENDERECO.text)+CHR(39)+',';
      if trim(QTransmissaoObraCOD_CIDADE.text) <> '' then
        wAux:=trim(QTransmissaoObraCOD_CIDADE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      CHR(39)+QTransmissaoObraDT_INICIO_OBRA.text+CHR(39)+','                        +
      CHR(39)+QTransmissaoObraDT_FIM_OBRA.text+CHR(39)+','                           +
      trim(QTransmissaoObraCOD_CADASTRO.text)+','                                    +
      CHR(39)+QTransmissaoObraDT_CADASTRO_OBRA.text+CHR(39)+','                      +
      trim(QTransmissaoObraCOD_USUARIO.text)+','                                     +
      CHR(39)+(QTransmissaoObraIND_SITUACAO.text)+CHR(39)+','                        +
      CHR(39)+(QTransmissaoObraIND_KM_HR.text)+CHR(39)+','                           +
      FloatToStr(QTransmissaoObraTROCA_OLEO.value)+','                               +
      FloatToStr(QTransmissaoObraTROCA_FILTRO.value)+','                             +
      FloatToStr(QTransmissaoObraREVISAO.value)+','                                  +
      FloatToStr(QTransmissaoObraVAL_MARCADOR.value)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoObra.next;
    end;


    //----UPDATE OBRA

    QTransmissaoObra.Close;
    QTransmissaoObra.setVariable('TYPE','U');
    QTransmissaoObra.Open;
    QTransmissaoObra.first;
    while not(QTransmissaoObra.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_OBRA SET '+
      'COD_FILIAL = '+trim(QTransmissaoObraCOD_FILIAL.text)+','                                      +
      'DESC_OBRA = '+CHR(39)+(QTransmissaoObraDESC_OBRA.text)+CHR(39)+','                           +
      'DESC_ENDERECO = '+CHR(39)+(QTransmissaoObraDESC_ENDERECO.text)+CHR(39)+',';
      if trim(QTransmissaoObraCOD_CIDADE.text) <> '' then
        wAux:=trim(QTransmissaoObraCOD_CIDADE.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CIDADE = '+wAux                                                                      +
      'DT_INICIO_OBRA = '+CHR(39)+QTransmissaoObraDT_INICIO_OBRA.text+CHR(39)+','                        +
      'DT_FIM_OBRA = '+CHR(39)+QTransmissaoObraDT_FIM_OBRA.text+CHR(39)+','                           +
      'COD_CADASTRO = '+trim(QTransmissaoObraCOD_CADASTRO.text)+','                                    +
      'DT_CADASTRO_OBRA = '+CHR(39)+QTransmissaoObraDT_CADASTRO_OBRA.text+CHR(39)+','                      +
      'COD_USUARIO = '+trim(QTransmissaoObraCOD_USUARIO.text)+','                                     +
      'IND_SITUACAO = '+CHR(39)+(QTransmissaoObraIND_SITUACAO.text)+CHR(39)+','                        +
      'IND_KM_HR = '+CHR(39)+(QTransmissaoObraIND_KM_HR.text)+CHR(39)+','                           +
      'TROCA_OLEO = '+FloatToStr(QTransmissaoObraTROCA_OLEO.value)+','                               +
      'TROCA_FILTRO = '+FloatToStr(QTransmissaoObraTROCA_FILTRO.value)+','                             +
      'REVISAO = '+FloatToStr(QTransmissaoObraREVISAO.value)+','                                  +
      'VAL_MARCADOR = '+Bib.TrocaVirgulaPorPonto(FloatToStr(QTransmissaoObraVAL_MARCADOR.value))+
      ' WHERE COD_OBRA = '+trim(QTransmissaoObraCOD_OBRA.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoObra.next;
    end;
    QTransmissaoObra.Close;
    geraArquivo('OBRA',S)
  end;
end;




procedure TFTransmissaoCad.BTExpContasPagarClick(Sender: TObject);
var S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoCPCab.Close;
    QTransmissaoCPCab.setVariable('TYPE','I');
    QTransmissaoCPCab.Open;
    QTransmissaoCPCab.first;

    QTransmissaoCPMov.Close;
    QTransmissaoCPMov.setVariable('TYPE','I');
    QTransmissaoCPMov.Open;
    QTransmissaoCPMov.first;

    //----------inicio bloco transmissao CONTA PAGAR
    while not(QTransmissaoCPCab.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_CONTA_PAGAR_CAB('                           +
      'COD_CONTA_PAGAR_CAB,'                                                   +
      'COD_FINALIDADE,'                                                        +
      'COD_BANCO_AGENCIA,'                                                     +
      'COD_CADASTRO,'                                                          +
      'COD_FILIAL,'                                                            +
      'NUM_TITULO,'                                                            +
      'NUM_PARCELA,'                                                           +
      'DESC_TIPO_DOCUMENTO,'                                                   +
      'DT_MOVIMENTO,'                                                          +
      'DT_BAIXA,'                                                              +
      'DT_VENCIMENTO,'                                                         +
      'DT_EMISSAO,'                                                            +
      'DT_CAPITALIZACAO,'                                                      +
      'VAL_TITULO,'                                                            +
      'COD_NOTA_CAB,'                                                          +
      'DESC_OBSERVACAO,'                                                       +
      'IND_ACEITE,'                                                            +
      'IND_SITUACAO,'                                                          +
      'VAL_ORIGINAL,'                                                          +
      'VAL_INDEXADO,'                                                          +
      'COD_DEPARTAMENTO,'                                                      +
      'COD_CONTRATO,'                                                          +
      'COD_CONTRATO_GP,'                                                       +
      'COD_CONTRATO_VEND,'                                                     +
      'COD_CONTRATO_ARROZ,'                                                    +
      'COD_CONHECIMENTO_FRETE,'                                                +
      'DT_VENCIMENTO_PRORROGADO,'                                              +
      'COD_RPA,'                                                               +
      'COD_OBRA_REQ_CAB,'                                                      +
      'COD_ESTADIA) '                                                          +
      'VALUES('                                                                +
      trim(QTransmissaoCPCabCOD_CONTA_PAGAR_CAB.text)+','                      +
      trim(QTransmissaoCPCabCOD_FINALIDADE.text)+',';
      if trim(QTransmissaoCPCabCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_BANCO_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      trim(QTransmissaoCPCabCOD_CADASTRO.text)+','                             +
      trim(QTransmissaoCPCabCOD_FILIAL.text)+',';
      if trim(QTransmissaoCPCabNUM_TITULO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabNUM_TITULO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabNUM_PARCELA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabNUM_PARCELA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+QTransmissaoCPCabDESC_TIPO_DOCUMENTO.text+CHR(39)+','            +
      CHR(39)+QTransmissaoCPCabDT_MOVIMENTO.text+CHR(39)+','                   +
      CHR(39)+QTransmissaoCPCabDT_BAIXA.text+CHR(39)+','                       +
      CHR(39)+QTransmissaoCPCabDT_VENCIMENTO.text+CHR(39)+','                  +
      CHR(39)+QTransmissaoCPCabDT_EMISSAO.text+CHR(39)+','                     +
      CHR(39)+QTransmissaoCPCabDT_CAPITALIZACAO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabVAL_TITULO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_TITULO.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+QTransmissaoCPCabDESC_OBSERVACAO.text+CHR(39)+','                +
      CHR(39)+QTransmissaoCPCabIND_ACEITE.text+CHR(39)+','                     +
      CHR(39)+QTransmissaoCPCabIND_SITUACAO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabVAL_ORIGINAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_ORIGINAL.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabVAL_INDEXADO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_INDEXADO.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_DEPARTAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_GP.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_GP.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_VEND.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_ARROZ.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_ARROZ.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONHECIMENTO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+QTransmissaoCPCabDT_VENCIMENTO_PRORROGADO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabCOD_RPA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_RPA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_OBRA_REQ_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_OBRA_REQ_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPCabCOD_ESTADIA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_ESTADIA.text)
      else
        wAux:='null';
      S:=S+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCPCab.next;
    end;                              

    //------------inicio montagem arquivo transmissao Contas pagar mov
    while not(QTransmissaoCPMov.eof) do
    begin
    S:=S+'INSERT INTO SISTEMA.TB_CONTA_PAGAR_MOV('                                   +
     'COD_CONTA_PAGAR_MOV,'                                                          +
      'COD_CONTA_PAGAR_CAB,'                                                         +
      'DT_MOVIMENTO,'                                                                +
      'VAL_MOVIMENTO,'                                                               +
      'DESC_OBSERVACAO,'                                                             +
      'IND_TIPO_MOVIMENTO,'                                                          +
      'DT_USUARIO,'                                                                  +
      'COD_USUARIO,'                                                                 +
      'COD_BCO_MOVIMENTO,'                                                           +
      'COD_CAIXA_MOV,'                                                               +
      'COD_LANCTO_CONTABIL_CRED,'                                                    +
      'COD_LANCTO_CONTABIL_DEB,'                                                     +
      'COD_AUX,'                                                                     +
      'IND_FORMA_PAGAMENTO)'                                                         +
      'VALUES('                                                                      +
      trim(QTransmissaoCPMovCOD_CONTA_PAGAR_MOV.text)+','                            +
      trim(QTransmissaoCPMovCOD_CONTA_PAGAR_CAB.text)+','                            +
      CHR(39)+(QTransmissaoCPMovDT_MOVIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCPMovVAL_MOVIMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPMovVAL_MOVIMENTO.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      CHR(39)+QTransmissaoCPCabDESC_OBSERVACAO.text+CHR(39)+','                      +
      CHR(39)+QTransmissaoCPMovIND_TIPO_MOVIMENTO.text+CHR(39)+','                   +
      CHR(39)+DateToStr(Trunc(QTransmissaoCPMovDT_USUARIO.Value))+CHR(39)+','        +
      trim(QTransmissaoCPMovCOD_USUARIO.text)+',';
      if trim(QTransmissaoCPMovCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPMovCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_CAIXA_MOV.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_CRED.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_CRED.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_DEB.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_DEB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCPMovCOD_AUX.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_AUX.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoCPMovIND_FORMA_PAGAMENTO.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCPMov.next;
    end;


    QTransmissaoCPCab.Close;
    QTransmissaoCPCab.setVariable('TYPE','U');
    QTransmissaoCPCab.Open;
    QTransmissaoCPCab.first;

    QTransmissaoCPMov.Close;
    QTransmissaoCPMov.setVariable('TYPE','U');
    QTransmissaoCPMov.Open;
    QTransmissaoCPMov.first;

    //----------inicio bloco transmissao CONTA PAGAR
    while not(QTransmissaoCPCab.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_CONTA_PAGAR_CAB SET '+
      'COD_FINALIDADE = '+trim(QTransmissaoCPCabCOD_FINALIDADE.text)+',';
      if trim(QTransmissaoCPCabCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_BANCO_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_BANCO_AGENCIA = '+wAux                                                                +
      'COD_CADASTRO = '+trim(QTransmissaoCPCabCOD_CADASTRO.text)+','                             +
      'COD_FILIAL = '+trim(QTransmissaoCPCabCOD_FILIAL.text)+',';
      if trim(QTransmissaoCPCabNUM_TITULO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabNUM_TITULO.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_TITULO = '+wAux;
      if trim(QTransmissaoCPCabNUM_PARCELA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabNUM_PARCELA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_PARCELA = '+wAux                                                                +
      'DESC_TIPO_DOCUMENTO = '+CHR(39)+QTransmissaoCPCabDESC_TIPO_DOCUMENTO.text+CHR(39)+','            +
      'DT_MOVIMENTO = '+CHR(39)+QTransmissaoCPCabDT_MOVIMENTO.text+CHR(39)+','                   +
      'DT_BAIXA = '+CHR(39)+QTransmissaoCPCabDT_BAIXA.text+CHR(39)+','                       +
      'DT_VENCIMENTO = '+CHR(39)+QTransmissaoCPCabDT_VENCIMENTO.text+CHR(39)+','                  +
      'DT_EMISSAO = '+CHR(39)+QTransmissaoCPCabDT_EMISSAO.text+CHR(39)+','                     +
      'DT_CAPITALIZACAO = '+CHR(39)+QTransmissaoCPCabDT_CAPITALIZACAO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabVAL_TITULO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_TITULO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_TITULO = '+wAux;
      if trim(QTransmissaoCPCabCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux                                                                +
      'DESC_OBSERVACAO = '+CHR(39)+QTransmissaoCPCabDESC_OBSERVACAO.text+CHR(39)+','                +
      'IND_ACEITE = '+CHR(39)+QTransmissaoCPCabIND_ACEITE.text+CHR(39)+','                     +
      'IND_SITUACAO = '+CHR(39)+QTransmissaoCPCabIND_SITUACAO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabVAL_ORIGINAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_ORIGINAL.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_ORIGINAL = '+wAux;
      if trim(QTransmissaoCPCabVAL_INDEXADO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPCabVAL_INDEXADO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_INDEXADO = '+wAux;
      if trim(QTransmissaoCPCabCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_DEPARTAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_DEPARTAMENTO = '+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO = '+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_GP.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_GP.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_GP = '+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_VEND.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_VEND = '+wAux;
      if trim(QTransmissaoCPCabCOD_CONTRATO_ARROZ.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONTRATO_ARROZ.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_ARROZ = '+wAux;
      if trim(QTransmissaoCPCabCOD_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_CONHECIMENTO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONHECIMENTO_FRETE = '+wAux                                                                +
      'DT_VENCIMENTO_PRORROGADO = '+CHR(39)+QTransmissaoCPCabDT_VENCIMENTO_PRORROGADO.text+CHR(39)+',';
      if trim(QTransmissaoCPCabCOD_RPA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_RPA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_RPA = '+wAux;
      if trim(QTransmissaoCPCabCOD_OBRA_REQ_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_OBRA_REQ_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_OBRA_REQ_CAB = '+wAux;
      if trim(QTransmissaoCPCabCOD_ESTADIA.text) <> '' then
        wAux:=trim(QTransmissaoCPCabCOD_ESTADIA.text)
      else
        wAux:='null';
      S:=S+'COD_ESTADIA = '+wAux+
      ' WHERE COD_CONTA_PAGAR_CAB = '+trim(QTransmissaoCPCabCOD_CONTA_PAGAR_CAB.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCPCab.next;
    end;

    //------------inicio montagem arquivo transmissao Contas pagar mov
    while not(QTransmissaoCPMov.eof) do
    begin
    S:=S+'UPDATE SISTEMA.TB_CONTA_PAGAR_MOV SET '+
      'COD_CONTA_PAGAR_CAB = '+trim(QTransmissaoCPMovCOD_CONTA_PAGAR_CAB.text)+','+
      'DT_MOVIMENTO = '+CHR(39)+(QTransmissaoCPMovDT_MOVIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCPMovVAL_MOVIMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCPMovVAL_MOVIMENTO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_MOVIMENTO = '+wAux+
      'DESC_OBSERVACAO = '+CHR(39)+QTransmissaoCPCabDESC_OBSERVACAO.text+CHR(39)+','+
      'IND_TIPO_MOVIMENTO = '+CHR(39)+QTransmissaoCPMovIND_TIPO_MOVIMENTO.text+CHR(39)+','+
      'DT_USUARIO = '+CHR(39)+DateToStr(Trunc(QTransmissaoCPMovDT_USUARIO.Value))+CHR(39)+','+
      'COD_USUARIO = '+trim(QTransmissaoCPMovCOD_USUARIO.text)+',';
      if trim(QTransmissaoCPMovCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_BCO_MOVIMENTO = '+wAux;
      if trim(QTransmissaoCPMovCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_CAIXA_MOV.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CAIXA_MOV = '+wAux;
      if trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_CRED.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_CRED.text)+','
      else
        wAux:='null,';
      S:=S+'COD_LANCTO_CONTABIL_CRED = '+wAux;
      if trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_DEB.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_LANCTO_CONTABIL_DEB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_LANCTO_CONTABIL_DEB = '+wAux;
      if trim(QTransmissaoCPMovCOD_AUX.text) <> '' then
        wAux:=trim(QTransmissaoCPMovCOD_AUX.text)+','
      else
        wAux:='null,';
      S:=S+'COD_AUX = '+wAux+
      'IND_FORMA_PAGAMENTO= '+CHR(39)+(QTransmissaoCPMovIND_FORMA_PAGAMENTO.text)+CHR(39)+
      ' WHERE COD_CONTA_PAGAR_MOV = '+trim(QTransmissaoCPMovCOD_CONTA_PAGAR_MOV.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCPMov.next;
    end;

    QTransmissaoCPCab.Close;
    QTransmissaoCPMov.Close;
    geraArquivo('CP',S)
  end;
end;



procedure TFTransmissaoCad.BTExpRequisicoesClick(Sender: TObject);
var S,wAux: String;

begin
  with DMTransmissao do
  begin
    QTransmissaoReqCab.Close;
    QTransmissaoReqCab.setVariable('TYPE','I');
    QTransmissaoReqCab.Open;
    QTransmissaoReqCab.first;

    QTransmissaoReqItem.Close;
    QTransmissaoReqItem.setVariable('TYPE','I');
    QTransmissaoReqItem.Open;
    QTransmissaoReqItem.first;

    //----------inicio bloco transmissao obra req cab
    while not(QTransmissaoReqCab.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_OBRA_REQ_CAB('                                    +
      'COD_OBRA_REQ_CAB,'                                                            +
      'DT_LANCAMENTO,'                                                               +
      'COD_CADASTRO,'                                                                +
      'COD_USUARIO,'                                                                 +
      'NUM_REQUISICAO ,'                                                             +
      'DT_EMISSAO,'                                                                  +
      'COD_OBRA,'                                                                    +
      'COD_FILIAL,'                                                                  +
      'IND_SITUACAO,'                                                                +
      'COD_MOTIVO,'                                                                  +
      'COD_OPERACAO,'                                                                +
      'NUM_NOTA_FISCAL,'                                                             +
      'IND_TIPO_REQUISICAO,'                                                         +
      'COD_CENTRO_CUSTO,'                                                            +
      'VAL_ENTRADA,'                                                                 +
      'VAL_DESCONTO,'                                                                +
      'VAL_ACRESCIMO)'                                                               +
      ' VALUES('                                                                     +
      trim(QTransmissaoReqCabCOD_OBRA_REQ_CAB.text)+','                              +
      CHR(39)+QTransmissaoReqCabDT_LANCAMENTO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      trim(QTransmissaoReqCabCOD_USUARIO.text)+',';
      if trim(QTransmissaoReqCabNUM_REQUISICAO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabNUM_REQUISICAO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      CHR(39)+QTransmissaoReqCabDT_EMISSAO.text+CHR(39)+','                          +
      trim(QTransmissaoReqCabCOD_OBRA.text)+',';
      if trim(QTransmissaoReqCabCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      CHR(39)+QTransmissaoReqCabIND_SITUACAO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_MOTIVO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_MOTIVO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqCabCOD_OPERACAO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_OPERACAO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqCabNUM_NOTA_FISCAL.text) <> '' then
        wAux:=trim(QTransmissaoReqCabNUM_NOTA_FISCAL.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                      +
      CHR(39)+QTransmissaoReqCabIND_TIPO_REQUISICAO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_CENTRO_CUSTO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_CENTRO_CUSTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqCabVAL_ENTRADA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_ENTRADA.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqCabVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_DESCONTO.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqCabVAL_ACRESCIMO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_ACRESCIMO.text))
      else
        wAux:='null';
      S:=S+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoReqCab.next;
    end;
    //----------termino bloco transmissao req cab

    //----------inicio bloco transmissao req item
    while not(QTransmissaoReqItem.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_OBRA_REQ_ITEM('                                   +
      'COD_OBRA_REQ_ITEM,'                                                           +
      'COD_OBRA_REQ_CAB,'                                                            +
      'COD_PRODUTO,'                                                                 +
      'QT_QUANTIDADE,'                                                               +
      'VAL_UNITARIO,'                                                                +
      'DESC_COMPLEMENTO) '                                                           +
      'VALUES('                                                                      +
      trim(QTransmissaoReqItemCOD_OBRA_REQ_ITEM.text)+','                            +
      trim(QTransmissaoReqItemCOD_OBRA_REQ_CAB.text)+',';
      if trim(QTransmissaoReqItemCOD_PRODUTO.text) <> '' then
        wAux:=trim(QTransmissaoReqItemCOD_PRODUTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqItemQT_QUANTIDADE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqItemQT_QUANTIDADE.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoReqItemVAL_UNITARIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqItemVAL_UNITARIO.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                     +
      CHR(39)+(QTransmissaoReqItemDESC_COMPLEMENTO.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoReqItem.next;
    end;
    //----------termino bloco transmissao REQ ITEM



    QTransmissaoReqCab.Close;
    QTransmissaoReqCab.setVariable('TYPE','U');
    QTransmissaoReqCab.Open;
    QTransmissaoReqCab.first;

    QTransmissaoReqItem.Close;
    QTransmissaoReqItem.setVariable('TYPE','U');
    QTransmissaoReqItem.Open;
    QTransmissaoReqItem.first;

    //----------inicio bloco transmissao obra req cab
    while not(QTransmissaoReqCab.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_OBRA_REQ_CAB SET '+
      'DT_LANCAMENTO = '+CHR(39)+QTransmissaoReqCabDT_LANCAMENTO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO = '+wAux+
      'COD_USUARIO = '+trim(QTransmissaoReqCabCOD_USUARIO.text)+',';
      if trim(QTransmissaoReqCabNUM_REQUISICAO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabNUM_REQUISICAO.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_REQUISICAO = '+wAux+
      'DT_EMISSAO = '+CHR(39)+QTransmissaoReqCabDT_EMISSAO.text+CHR(39)+','+
      'COD_OBRA = '+trim(QTransmissaoReqCabCOD_OBRA.text)+',';
      if trim(QTransmissaoReqCabCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+'COD_FILIAL = '+wAux+
      'IND_SITUACAO = '+CHR(39)+QTransmissaoReqCabIND_SITUACAO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_MOTIVO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_MOTIVO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_MOTIVO = '+wAux;
      if trim(QTransmissaoReqCabCOD_OPERACAO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_OPERACAO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_OPERACAO = '+wAux;
      if trim(QTransmissaoReqCabNUM_NOTA_FISCAL.text) <> '' then
        wAux:=trim(QTransmissaoReqCabNUM_NOTA_FISCAL.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_NOTA_FISCAL = '+wAux+
      'IND_TIPO_REQUISICAO = '+CHR(39)+QTransmissaoReqCabIND_TIPO_REQUISICAO.text+CHR(39)+',';
      if trim(QTransmissaoReqCabCOD_CENTRO_CUSTO.text) <> '' then
        wAux:=trim(QTransmissaoReqCabCOD_CENTRO_CUSTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CENTRO_CUSTO = '+wAux;
      if trim(QTransmissaoReqCabVAL_ENTRADA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_ENTRADA.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_ENTRADA = '+wAux;
      if trim(QTransmissaoReqCabVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_DESCONTO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_DESCONTO = '+wAux;
      if trim(QTransmissaoReqCabVAL_ACRESCIMO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqCabVAL_ACRESCIMO.text))
      else
        wAux:='null';
      S:=S+'VAL_ACRESCIMO = '+wAux+
      ' WHERE COD_OBRA_REQ_CAB = '+trim(QTransmissaoReqCabCOD_OBRA_REQ_CAB.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoReqCab.next;
    end;
    //----------termino bloco transmissao req cab

    //----------inicio bloco transmissao req item
    while not(QTransmissaoReqItem.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_OBRA_REQ_ITEM SET '+
      'COD_OBRA_REQ_CAB = '+trim(QTransmissaoReqItemCOD_OBRA_REQ_CAB.text)+',';
      if trim(QTransmissaoReqItemCOD_PRODUTO.text) <> '' then
        wAux:=trim(QTransmissaoReqItemCOD_PRODUTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_PRODUTO = '+wAux;
      if trim(QTransmissaoReqItemQT_QUANTIDADE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqItemQT_QUANTIDADE.text))+','
      else
        wAux:='null,';
      S:=S+'QT_QUANTIDADE = '+wAux;
      if trim(QTransmissaoReqItemVAL_UNITARIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoReqItemVAL_UNITARIO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_UNITARIO = '+wAux+
      'DESC_COMPLEMENTO = '+CHR(39)+(QTransmissaoReqItemDESC_COMPLEMENTO.text)+CHR(39)+
      ' WHERE COD_OBRA_REQ_ITEM = '+trim(QTransmissaoReqItemCOD_OBRA_REQ_ITEM.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoReqItem.next;
    end;
    //----------termino bloco UPDATE REQ ITEM

    QTransmissaoReqCab.close;
    QTransmissaoReqItem.close;
    geraArquivo('REQUISICOES',S)
   end;
end;



procedure TFTransmissaoCad.BTExpBancosClick(Sender: TObject);
var S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoBanco.Close;
    QTransmissaoBanco.setVariable('TYPE','I');
    QTransmissaoBanco.Open;
    QTransmissaoBanco.first;

    while not(QTransmissaoBanco.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_BCO_MOVIMENTO('                             +
      'COD_BCO_MOVIMENTO,'                                                     +
      'COD_USUARIO,'                                                           +
      'COD_HISTORICO,'                                                         +
      'COD_CONTA_CORRENTE,'                                                    +
      'NUM_CHEQUE,'                                                            +
      'DT_MOVIMENTO,'                                                          +
      'VAL_MOVIMENTO,'                                                         +
      'DESC_OBSERVACAO,'                                                       +
      'DESC_COMPLEMENTO1,'                                                     +
      'DESC_COMPLEMENTO2,'                                                     +
      'COD_NOTA_CAB,'                                                          +
      'COD_CONTA_RECEBER_CAB,'                                                 +
      'COD_CONTA_PAGAR_CAB,'                                                   +
      'DT_USUARIO,'                                                            +
      'NUM_NOTA,'                                                              +
      'COD_SERIE,'                                                             +
      'COD_CADASTRO,'                                                          +
      'NUM_CARGA,'                                                             +
      'IND_BAIXA_CHEQUE,'                                                      +
      'COD_DEPARTAMENTO,'                                                      +
      'DT_BAIXA_CHEQUE,'                                                       +
      'DESC_TARJA_MAGNETICA,'                                                  +
      'DESC_AGENCIA,'                                                          +
      'DESC_BANCO,'                                                            +
      'DESC_CONTA,'                                                            +
      'NUM_CGC_CPF_EMITENTE,'                                                  +
      'DT_BOM_PARA,'                                                           +
      'IND_TIPO_CHEQUE,'                                                       +
      'DT_ENVIA_BANCO,'                                                        +
      'IND_PGTO_TAXA,'                                                         +
      'VAL_DESCONTO_TAXA,'                                                     +
      'VAL_MULTA_JUROS,'                                                       +
      'DESC_OBSERVACAO2) '                                                     +
      'VALUES('                                                                +
      trim(QTransmissaoBancoCOD_BCO_MOVIMENTO.text)+','                        +
      trim(QTransmissaoBancoCOD_USUARIO.text)+','                              +
      trim(QTransmissaoBancoCOD_HISTORICO.text)+','                            +
      trim(QTransmissaoBancoCOD_CONTA_CORRENTE.text)+',';
      if trim(QTransmissaoBancoNUM_CHEQUE.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_CHEQUE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoBancoDT_MOVIMENTO.text)+CHR(39)+','                 +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_MOVIMENTO.text))+','                            +
      CHR(39)+(QTransmissaoBancoDESC_OBSERVACAO.text)+CHR(39)+','              +
      CHR(39)+(QTransmissaoBancoDESC_COMPLEMENTO1.text)+CHR(39)+','            +
      CHR(39)+(QTransmissaoBancoDESC_COMPLEMENTO2.text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_NOTA_CAB.text)+','                     
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoCOD_CONTA_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CONTA_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+DateToStr(Trunc(QTransmissaoBancoDT_USUARIO.Value))+CHR(39)+',';
      if trim(QTransmissaoBancoNUM_NOTA.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_NOTA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoBancoCOD_SERIE.Text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoNUM_CARGA.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_CARGA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoBancoIND_BAIXA_CHEQUE.Text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_DEPARTAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux+
      CHR(39)+QTransmissaoBancoDT_BAIXA_CHEQUE.Text+CHR(39)+','+
      CHR(39)+QTransmissaoBancoDESC_TARJA_MAGNETICA.text+CHR(39)+',';
      if trim(QTransmissaoBancoDESC_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoDESC_BANCO.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_BANCO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoDESC_CONTA.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_CONTA.text)+','
      else
        wAux:='null,';
      S:=S+wAux+
      CHR(39)+QTransmissaoBancoNUM_CGC_CPF_EMITENTE.text+CHR(39)+','+
      CHR(39)+QTransmissaoBancoDT_BOM_PARA.Text+CHR(39)+',' +
      CHR(39)+QTransmissaoBancoIND_TIPO_CHEQUE.text+CHR(39)+','+
      CHR(39)+QTransmissaoBancoDT_ENVIA_BANCO.text+CHR(39)+',' +
      CHR(39)+QTransmissaoBancoIND_PGTO_TAXA.text+CHR(39)+',';
      if trim(QTransmissaoBancoVAL_DESCONTO_TAXA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_DESCONTO_TAXA.text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoBancoVAL_MULTA_JUROS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_MULTA_JUROS.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+QTransmissaoBancoDESC_OBSERVACAO2.text+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoBanco.next;
    end;

    //----UPDDATE BANCO

    QTransmissaoBanco.Close;
    QTransmissaoBanco.setVariable('TYPE','U');
    QTransmissaoBanco.Open;
    QTransmissaoBanco.first;

    while not(QTransmissaoBanco.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_BCO_MOVIMENTO SET '+
      'COD_USUARIO = '+trim(QTransmissaoBancoCOD_USUARIO.text)+','+
      'COD_HISTORICO = '+trim(QTransmissaoBancoCOD_HISTORICO.text)+','+
      'COD_CONTA_CORRENTE = '+trim(QTransmissaoBancoCOD_CONTA_CORRENTE.text)+',';
      if trim(QTransmissaoBancoNUM_CHEQUE.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_CHEQUE.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_CHEQUE = '+wAux+
      'DT_MOVIMENTO = '+CHR(39)+(QTransmissaoBancoDT_MOVIMENTO.text)+CHR(39)+','+
      'VAL_MOVIMENTO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_MOVIMENTO.Text))+','+
      'DESC_OBSERVACAO = '+CHR(39)+(QTransmissaoBancoDESC_OBSERVACAO.text)+CHR(39)+','+
      'DESC_COMPLEMENTO1 = '+CHR(39)+(QTransmissaoBancoDESC_COMPLEMENTO1.text)+CHR(39)+','+
      'DESC_COMPLEMENTO2 = '+CHR(39)+(QTransmissaoBancoDESC_COMPLEMENTO2.text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux;
      if trim(QTransmissaoBancoCOD_CONTA_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CONTA_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_RECEBER_CAB = '+wAux;
      if trim(QTransmissaoBancoCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_PAGAR_CAB = '+wAux                                                                +
      'DT_USUARIO = '+CHR(39)+DateToStr(Trunc(QTransmissaoBancoDT_USUARIO.Value))+CHR(39)+',';
      if trim(QTransmissaoBancoNUM_NOTA.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_NOTA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_NOTA = '+wAux                                                                +
      'COD_SERIE = '+CHR(39)+(QTransmissaoBancoCOD_SERIE.Text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO = '+wAux;
      if trim(QTransmissaoBancoNUM_CARGA.text) <> '' then
        wAux:=trim(QTransmissaoBancoNUM_CARGA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_CARGA = '+wAux                                                                +
      'IND_BAIXA_CHEQUE = '+CHR(39)+(QTransmissaoBancoIND_BAIXA_CHEQUE.Text)+CHR(39)+',';
      if trim(QTransmissaoBancoCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoBancoCOD_DEPARTAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_DEPARTAMENTO = '+wAux                                                                +
      'DT_BAIXA_CHEQUE = '+CHR(39)+QTransmissaoBancoDT_BAIXA_CHEQUE.Text+CHR(39)+','+
      'DESC_TARJA_MAGNETICA = '+CHR(39)+QTransmissaoBancoDESC_TARJA_MAGNETICA.text+CHR(39)+',';
      if trim(QTransmissaoBancoDESC_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_AGENCIA.text)+','
      else
        wAux:='null,';
      S:=S+'DESC_AGENCIA = '+wAux;
      if trim(QTransmissaoBancoDESC_BANCO.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_BANCO.text)+','
      else
        wAux:='null,';
      S:=S+'DESC_BANCO = '+wAux;
      if trim(QTransmissaoBancoDESC_CONTA.text) <> '' then
        wAux:=trim(QTransmissaoBancoDESC_CONTA.text)+','
      else
        wAux:='null,';
      S:=S+'DESC_CONTA = '+wAux+
      'NUM_CGC_CPF_EMITENTE = '+CHR(39)+QTransmissaoBancoNUM_CGC_CPF_EMITENTE.text+CHR(39)+','+
      'DT_BOM_PARA = '+CHR(39)+QTransmissaoBancoDT_BOM_PARA.Text+CHR(39)+',' +
      'IND_TIPO_CHEQUE = '+CHR(39)+QTransmissaoBancoIND_TIPO_CHEQUE.text+CHR(39)+','+
      'DT_ENVIA_BANCO = '+CHR(39)+QTransmissaoBancoDT_ENVIA_BANCO.text+CHR(39)+',' +
      'IND_PGTO_TAXA = '+CHR(39)+QTransmissaoBancoIND_PGTO_TAXA.text+CHR(39)+',';
      if trim(QTransmissaoBancoVAL_DESCONTO_TAXA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_DESCONTO_TAXA.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_DESCONTO_TAXA = '+wAux;
      if trim(QTransmissaoBancoVAL_MULTA_JUROS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoBancoVAL_MULTA_JUROS.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_MULTA_JUROS = '+wAux+
      'DESC_OBSERVACAO2 = '+CHR(39)+QTransmissaoBancoDESC_OBSERVACAO2.text+CHR(39)+
      ' WHERE COD_BCO_MOVIMENTO = '+trim(QTransmissaoBancoCOD_BCO_MOVIMENTO.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoBanco.next;
    end;
    QTransmissaoBanco.Close;
    geraArquivo('BANCOS',S)
  end;
end;



procedure TFTransmissaoCad.BTExpCaixaClick(Sender: TObject);
var S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoCaixa.Close;
    QTransmissaoCaixa.setVariable('TYPE','I');
    QTransmissaoCaixa.Open;
    QTransmissaoCaixa.first;

    while not(QTransmissaoCaixa.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_CAIXA_MOV('                                 +
      'COD_CAIXA_MOV,'                                                         +
      'COD_USUARIO,'                                                           +
      'COD_FILIAL,'                                                            +
      'COD_DEPARTAMENTO,'                                                      +
      'COD_HISTORICO,'                                                         +
      'DT_MOVIMENTO,'                                                          +
      'VAL_MOVIMENTO,'                                                         +
      'DESC_HORARIO,'                                                          +
      'NUM_DOCUMENTO,'                                                         +
      'COD_CADASTRO,'                                                          +
      'COD_NOTA_CAB,'                                                          +
      'COD_CONTA_RECEBER_CAB,'                                                 +
      'COD_CONTA_PAGAR_CAB,'                                                   +
      'DT_USUARIO,'                                                            +
      'DESC_COMPLEMENTO,'                                                      +
      'COD_CONTRATO_MOV,'                                                      +
      'COD_BCO_MOVIMENTO,'                                                     +
      'DESC_COMPLEMENTO1) '                                                    +
      'VALUES('                                                                +
      trim(QTransmissaoCaixaCOD_CAIXA_MOV.text)+','                            +
      trim(QTransmissaoCaixaCOD_USUARIO.text)+',';
      if trim(QTransmissaoCaixaCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      trim(QTransmissaoCaixaCOD_DEPARTAMENTO.text)+','                         +
      trim(QTransmissaoCaixaCOD_HISTORICO.text)+','                            +
      CHR(39)+(QTransmissaoCaixaDT_MOVIMENTO.text)+CHR(39)+','                 +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCaixaVAL_MOVIMENTO.text))+','                            +
      CHR(39)+(QTransmissaoCaixaDESC_HORARIO.text)+CHR(39)+',';
      if trim(QTransmissaoCaixaNUM_DOCUMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaNUM_DOCUMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCaixaCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCaixaCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCaixaCOD_CONTA_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTA_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCaixaCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+DateToStr(Trunc(QTransmissaoCaixaDT_USUARIO.Value))+CHR(39)+','  +
      CHR(39)+(QTransmissaoCaixaDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCaixaCOD_CONTRATO_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTRATO_MOV.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCaixaCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoCaixaDESC_COMPLEMENTO1.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCaixa.next;
    end;


    QTransmissaoCaixa.Close;
    QTransmissaoCaixa.setVariable('TYPE','U');
    QTransmissaoCaixa.Open;
    QTransmissaoCaixa.first;

    while not(QTransmissaoCaixa.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_CAIXA_MOV SET '+
      'COD_USUARIO = '+trim(QTransmissaoCaixaCOD_USUARIO.text)+',';
      if trim(QTransmissaoCaixaCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+'COD_FILIAL = '+wAux+
      'COD_DEPARTAMENTO = '+trim(QTransmissaoCaixaCOD_DEPARTAMENTO.text)+','+
      'COD_HISTORICO = '+trim(QTransmissaoCaixaCOD_HISTORICO.text)+','+
      'DT_MOVIMENTO = '+CHR(39)+(QTransmissaoCaixaDT_MOVIMENTO.text)+CHR(39)+','+
      'VAL_MOVIMENTO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCaixaVAL_MOVIMENTO.text))+','+
      'DESC_HORARIO = '+CHR(39)+(QTransmissaoCaixaDESC_HORARIO.text)+CHR(39)+',';
      if trim(QTransmissaoCaixaNUM_DOCUMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaNUM_DOCUMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_DOCUMENTO = '+wAux;
      if trim(QTransmissaoCaixaCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO = '+wAux;
      if trim(QTransmissaoCaixaCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux;
      if trim(QTransmissaoCaixaCOD_CONTA_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTA_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_RECEBER_CAB = '+wAux;
      if trim(QTransmissaoCaixaCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_PAGAR_CAB = '+wAux+
      'DT_USUARIO = '+CHR(39)+DateToStr(Trunc(QTransmissaoCaixaDT_USUARIO.Value))+CHR(39)+','+
      'DESC_COMPLEMENTO = '+CHR(39)+(QTransmissaoCaixaDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCaixaCOD_CONTRATO_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_CONTRATO_MOV.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_MOV = '+wAux;
      if trim(QTransmissaoCaixaCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCaixaCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_BCO_MOVIMENTO = '+wAux+
      'DESC_COMPLEMENTO1 = '+CHR(39)+(QTransmissaoCaixaDESC_COMPLEMENTO1.text)+CHR(39)+
      ' WHERE COD_CAIXA_MOV = '+trim(QTransmissaoCaixaCOD_CAIXA_MOV.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCaixa.next;
    end;
    QTransmissaoCaixa.close;
    geraArquivo('CAIXA',S)
  end;
end;

procedure TFTransmissaoCad.BTExpContabilidadeClick(Sender: TObject);
var
  S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoLancto.Close;
    QTransmissaoLancto.setVariable('TYPE','I');
    QTransmissaoLancto.Open;
    QTransmissaoLancto.first;

    while not(QTransmissaoLancto.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_LANCTO_CONTABIL('                      +
      'COD_LANCTO_CONTABIL,'                                              +
      'COD_NOTA_CAB,'                                                     +
      'COD_CONTAS_RECEBER_CAB,'                                           +
      'COD_CONTA_PAGAR_CAB,'                                              +
      'COD_BCO_MOVIMENTO,'                                                +
      'COD_CAIXA_MOV,'                                                    +
      'COD_FILIAL,'                                                       +
      'COD_HISTORICO_CONTABIL,'                                           +
      'COD_PLANO_CONTA,'                                                  +
      'DT_LANCAMENTO,'                                                    +
      'NUM_LANCAMENTO,'                                                   +
      'DESC_COMPLEMENTO,'                                                 +
      'VAL_LANCAMENTO,'                                                   +
      'IND_OPERACAO,'                                                     +
      'COD_PLANILHA,'                                                     +
      'NUM_CONTRAPARTIDA,'                                                +
      'IND_ATUALIZA_SALDO,'                                               +
      'COD_FILIAL_CONTRAPARTIDA,'                                         +
      'COD_GENERICO,'                                                     +
      'NUM_RPA,'                                                          +
      'COD_CONHECIMENTO_FRETE,'                                           +
      'COD_ESTADIA,'                                                      +
      'COD_OBRA) '                                                        +
      'VALUES('                                                           +
      trim(QTransmissaoLanctoCOD_LANCTO_CONTABIL.text)+',';
      if trim(QTransmissaoLanctoCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_CONTAS_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONTAS_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CAIXA_MOV.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_HISTORICO_CONTABIL.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_HISTORICO_CONTABIL.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      trim(QTransmissaoLanctoCOD_PLANO_CONTA.text)+','                         +
      CHR(39)+(QTransmissaoLanctoDT_LANCAMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoNUM_LANCAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoNUM_LANCAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoLanctoDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoVAL_LANCAMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoLanctoVAL_LANCAMENTO.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoLanctoIND_OPERACAO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoCOD_PLANILHA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_PLANILHA.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+(QTransmissaoLanctoNUM_CONTRAPARTIDA.text)+CHR(39)+','           +
      CHR(39)+(QTransmissaoLanctoIND_ATUALIZA_SALDO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoCOD_FILIAL_CONTRAPARTIDA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_FILIAL_CONTRAPARTIDA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_GENERICO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_GENERICO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoNUM_RPA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoNUM_RPA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONHECIMENTO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_ESTADIA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_ESTADIA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoLanctoCOD_OBRA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_OBRA.text)+''
      else
        wAux:='null';
      S:=S+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoLancto.next;
    end;

    //----UPDATE LANCAMENTO CONTABIL
    QTransmissaoLancto.Close;
    QTransmissaoLancto.setVariable('TYPE','U');
    QTransmissaoLancto.Open;
    QTransmissaoLancto.first;

    while not(QTransmissaoLancto.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_LANCTO_CONTABIL SET ';
      if trim(QTransmissaoLanctoCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_NOTA_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux;
      if trim(QTransmissaoLanctoCOD_CONTAS_RECEBER_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONTAS_RECEBER_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTAS_RECEBER_CAB = '+wAux;
      if trim(QTransmissaoLanctoCOD_CONTA_PAGAR_CAB.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONTA_PAGAR_CAB.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_PAGAR_CAB = '+wAux;
      if trim(QTransmissaoLanctoCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_BCO_MOVIMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_BCO_MOVIMENTO = '+wAux;
      if trim(QTransmissaoLanctoCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CAIXA_MOV.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CAIXA_MOV = '+wAux;
      if trim(QTransmissaoLanctoCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_FILIAL.text)+','
      else
        wAux:='null,';
      S:=S+'COD_FILIAL = '+wAux;
      if trim(QTransmissaoLanctoCOD_HISTORICO_CONTABIL.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_HISTORICO_CONTABIL.text)+','
      else
        wAux:='null,';
      S:=S+'COD_HISTORICO_CONTABIL = '+wAux+
      'COD_PLANO_CONTA = '+trim(QTransmissaoLanctoCOD_PLANO_CONTA.text)+','+
      'DT_LANCAMENTO = '+CHR(39)+(QTransmissaoLanctoDT_LANCAMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoNUM_LANCAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoNUM_LANCAMENTO.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_LANCAMENTO = '+wAux+
      'DESC_COMPLEMENTO = '+CHR(39)+(QTransmissaoLanctoDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoVAL_LANCAMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoLanctoVAL_LANCAMENTO.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_LANCAMENTO = '+wAux+
      'IND_OPERACAO = '+CHR(39)+(QTransmissaoLanctoIND_OPERACAO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoCOD_PLANILHA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_PLANILHA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_PLANILHA = '+wAux+
      'NUM_CONTRAPARTIDA = '+CHR(39)+(QTransmissaoLanctoNUM_CONTRAPARTIDA.text)+CHR(39)+','+
      'IND_ATUALIZA_SALDO = '+CHR(39)+(QTransmissaoLanctoIND_ATUALIZA_SALDO.text)+CHR(39)+',';
      if trim(QTransmissaoLanctoCOD_FILIAL_CONTRAPARTIDA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_FILIAL_CONTRAPARTIDA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_FILIAL_CONTRAPARTIDA = '+wAux;
      if trim(QTransmissaoLanctoCOD_GENERICO.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_GENERICO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_GENERICO = '+wAux;
      if trim(QTransmissaoLanctoNUM_RPA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoNUM_RPA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_RPA = '+wAux;
      if trim(QTransmissaoLanctoCOD_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_CONHECIMENTO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONHECIMENTO_FRETE = '+wAux;
      if trim(QTransmissaoLanctoCOD_ESTADIA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_ESTADIA.text)+','
      else
        wAux:='null,';
      S:=S+'COD_ESTADIA = '+wAux;
      if trim(QTransmissaoLanctoCOD_OBRA.text) <> '' then
        wAux:=trim(QTransmissaoLanctoCOD_OBRA.text)+''
      else
        wAux:='null';
      S:=S+'COD_OBRA = '+wAux+
      ' WHERE COD_LANCTO_CONTABIL = '+trim(QTransmissaoLanctoCOD_LANCTO_CONTABIL.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoLancto.next;
    end;
    QTransmissaoLancto.close;
    geraArquivo('CONTABIL',S)
  end;
end;

procedure TFTransmissaoCad.BTExpNotasClick(Sender: TObject);
var
  S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoNFCab.Close;
    QTransmissaoNFCab.setVariable('TYPE','I');
    QTransmissaoNFCab.Open;
    QTransmissaoNFCab.first;

    QTransmissaoNFItem.Close;
    QTransmissaoNFItem.setVariable('TYPE','I');
    QTransmissaoNFItem.Open;
    QTransmissaoNFItem.first;

    while not(QTransmissaoNFCab.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_NOTA_CAB('                                  +
      'COD_NOTA_CAB,'                                                          +
      'COD_USUARIO,'                                                           +
      'COD_FILIAL,'                                                            +
      'COD_MENSAGEM,'                                                          +
      'COD_TRANSPORTE,'                                                        +
      'COD_OPERACAO,'                                                          +
      'COD_ESTADO,'                                                            +
      'COD_VENDEDOR,'                                                          +
      'COD_CADASTRO,'                                                          +
      'NUM_NOTA,'                                                              +
      'COD_SERIE,'                                                             +
      'IND_SITUACAO,'                                                          +
      'IND_CONDICAO_PAGTO,'                                                    +
      'DT_EMISSAO,'                                                            +
      'DT_MOVIMENTO,'                                                          +
      'DT_RECEBIMENTO,'                                                        +
      'COD_MOTIVO_CANC,'                                                       +
      'VAL_DESPESAS,'                                                          +
      'IND_ENTRADA_SAIDA,'                                                     +
      'VAL_FRETE,'                                                             +
      'VAL_DESCONTO,'                                                          +
      'COD_TRANSPORTADOR,'                                                     +
      'NUM_CONHECIMENTO_FRETE,'                                                +
      'VAL_AVISTA,'                                                            +
      'IND_TIPO_FRETE,'                                                        +
      'NUM_VOLUMES,'                                                           +
      'OBS,'                                                                   +
      'OBS_COMPLEMENTO,'                                                       +
      'DT_USUARIO,'                                                            +
      'COD_TRIBUTACAO_FRETE,'                                                  +
      'VAL_TOTAL_IPI,'                                                         +
      'VAL_ICM_FRETE,'                                                         +
      'VAL_ICM_BASE_FRETE,'                                                    +
      'VAL_FUNRURAL,'                                                          +
      'DESC_PLACA,'                                                            +
      'DESC_TRANSPORTADORA,'                                                   +
      'COD_NOTA_CONTA_CORRENTE,'                                               +
      'DT_EMISSAO_CF,'                                                         +
      'COD_OPERACAO_CF,'                                                       +
      'NR_DIAS_CHEQUE,'                                                        +
      'COD_CONTRATO_MOV,'                                                      +
      'COD_CONTRATO_GP_MOV,'                                                   +
      'NR_DIAS_CHEQUE1,'                                                       +
      'NR_DIAS_CHEQUE2,'                                                       +
      'IND_NOTA_SEGURO,'                                                       +
      'COD_CONTRATO_VEND,'                                                     +
      'NR_ROTA,'                                                               +
      'PERC_COMISSAO,'                                                         +
      'IND_MILHAGEM,'                                                          +
      'NUM_OS,'                                                                +
      'COD_DEPARTAMENTO,'                                                      +
      'VAL_PEDAGIO,'                                                           +
      'COD_VENDEDOR_PREPOSTO,'                                                 +
      'NR_DIAS_CHEQUE3,'                                                       +
      'VAL_FRETE_TON,'                                                         +
      'DESC_OBS_CORPO_NOTA,'                                                   +
      'COD_ORDEM_COMPRA_CAB,'                                                  +
      'COD_CADASTRO_PARCEIRO,'                                                 +
      'NUM_PEDIDO,'                                                            +
      'COD_ORDEM_CARREGAMENTO_CAB,'                                            +
      'NR_DIAS_CHEQUE4,'                                                       +
      'DESC_OBS_DEVOLUCAO)'                                                    +
      'VALUES('                                                                +
      trim(QTransmissaoNFCabCOD_NOTA_CAB.text)+','                             +
      trim(QTransmissaoNFCabCOD_USUARIO.text)+','                              +
      trim(QTransmissaoNFCabCOD_FILIAL.text)+',';
      if trim(QTransmissaoNFCabCOD_MENSAGEM.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_MENSAGEM.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_TRANSPORTE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRANSPORTE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      trim(QTransmissaoNFCabCOD_OPERACAO.text)+','                             +
      CHR(39)+(QTransmissaoNFCabCOD_ESTADO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_VENDEDOR.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +                                                               
      trim(QTransmissaoNFCabCOD_CADASTRO.text)+','                             +
      trim(QTransmissaoNFCabNUM_NOTA.text)+','                                 +
      CHR(39)+trim(QTransmissaoNFCabCOD_SERIE.text)+CHR(39)+','                +
      CHR(39)+trim(QTransmissaoNFCabIND_SITUACAO.text)+CHR(39)+','             +
      CHR(39)+trim(QTransmissaoNFCabIND_CONDICAO_PAGTO.text)+CHR(39)+','       +
      CHR(39)+trim(QTransmissaoNFCabDT_EMISSAO.text)+CHR(39)+','               +
      CHR(39)+DateToStr(trunc(QTransmissaoNFCabDT_MOVIMENTO.value))+CHR(39)+','+
      CHR(39)+trim(QTransmissaoNFCabDT_RECEBIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_MOTIVO_CANC.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_MOTIVO_CANC.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_DESPESAS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_DESPESAS.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabIND_ENTRADA_SAIDA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabVAL_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_DESCONTO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_TRANSPORTADOR.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRANSPORTADOR.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNUM_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_CONHECIMENTO_FRETE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_AVISTA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_AVISTA.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabIND_TIPO_FRETE.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabNUM_VOLUMES.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_VOLUMES.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabOBS.text)+CHR(39)+','                      +
      CHR(39)+trim(QTransmissaoNFCabOBS_COMPLEMENTO.text)+CHR(39)+','          +
      CHR(39)+DateToStr(trunc(QTransmissaoNFCabDT_USUARIO.value))+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_TRIBUTACAO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRIBUTACAO_FRETE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_TOTAL_IPI.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_TOTAL_IPI.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_ICM_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_ICM_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_ICM_BASE_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_ICM_BASE_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_FUNRURAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FUNRURAL.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabDESC_PLACA.text)+CHR(39)+','               +
      CHR(39)+trim(QTransmissaoNFCabDESC_TRANSPORTADORA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_NOTA_CONTA_CORRENTE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_NOTA_CONTA_CORRENTE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabDT_EMISSAO_CF.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_OPERACAO_CF.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_OPERACAO_CF.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_CONTRATO_MOV.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_CONTRATO_GP_MOV.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_GP_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE1.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE1.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE2.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE2.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabIND_NOTA_SEGURO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_VEND.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_ROTA.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_ROTA.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabPERC_COMISSAO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabPERC_COMISSAO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux+
      CHR(39)+trim(QTransmissaoNFCabIND_MILHAGEM.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabNUM_OS.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_OS.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_DEPARTAMENTO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_PEDAGIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_PEDAGIO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_VENDEDOR_PREPOSTO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_VENDEDOR_PREPOSTO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE3.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE3.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabVAL_FRETE_TON.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FRETE_TON.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabDESC_OBS_CORPO_NOTA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_ORDEM_COMPRA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_ORDEM_COMPRA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_CADASTRO_PARCEIRO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CADASTRO_PARCEIRO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNUM_PEDIDO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_PEDIDO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabCOD_ORDEM_CARREGAMENTO_CAB.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_ORDEM_CARREGAMENTO_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE4.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE4.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoNFCabDESC_OBS_DEVOLUCAO.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoNFCab.next;
    end;

    while not(QTransmissaoNFItem.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_NOTA_ITEM('                                  +
      'COD_NOTA_ITEM,'                                                          +
      'COD_NOTA_CAB,'                                                           +
      'COD_TRIBUTACAO,'                                                         +
      'QT_QUANTIDADE,'                                                          +
      'VAL_TOTAL,'                                                              +
      'PERC_IPI,'                                                               +
      'PERC_COMISSAO,'                                                          +
      'COD_PRODUTO,'                                                            +
      'COD_LOTE_TIPO,'                                                          +
      'VAL_DESCONTO,'                                                           +
      'VAL_DESPESAS,'                                                           +
      'VAL_FRETE,'                                                              +
      'PERC_DESCONTO,'                                                          +
      'VAL_IPI,'                                                                +
      'VAL_UNITARIO,'                                                           +
      'VAL_ICM_BASE,'                                                           +
      'VAL_ICM,'                                                                +
      'IND_CLASS_IPI,'                                                          +
      'VAL_CUSTO,'                                                              +
      'VAL_ISS,'                                                                +
      'PERC_INSS,'                                                              +
      'PERC_BENEFICIADO,'                                                       +
      'IND_BX_CONTR_VEND,'                                                      +
      'NUM_NOTA_PRODUTOR,'                                                      +
      'IND_TIPO_CONSUMO,'                                                       +
      'QT_CHEGADA,'                                                             +
      'VAL_PIS,'                                                                +
      'VAL_CONFINS,'                                                            +
      'PERC_DESC)'                                                              +
      ' VALUES('                                                                +
      trim(QTransmissaoNFItemCOD_NOTA_ITEM.text)+','                            +
      trim(QTransmissaoNFItemCOD_NOTA_CAB.text)+','                             +
      trim(QTransmissaoNFItemCOD_TRIBUTACAO.text)+','                           +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemQT_QUANTIDADE.text))+','  +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_TOTAL.text))+','      +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_IPI.text))+','       +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_COMISSAO.text))+','  +
      trim(QTransmissaoNFItemCOD_PRODUTO.text)+','                              +
      trim(QTransmissaoNFItemCOD_LOTE_TIPO.text)+',';
      if trim(QTransmissaoNFItemVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_DESCONTO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_DESPESAS.text))+','   +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_FRETE.text))+','      +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_DESCONTO.text))+','  +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_IPI.text))+','        +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_UNITARIO.text))+','   +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ICM_BASE.text))+','   +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ICM.text))+','        +
      CHR(39)+trim(QTransmissaoNFItemIND_CLASS_IPI.text)+CHR(39)+','            +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_CUSTO.text))+','      +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ISS.text))+',';
      if trim(QTransmissaoNFItemPERC_INSS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_INSS.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFItemPERC_BENEFICIADO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_BENEFICIADO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      CHR(39)+trim(QTransmissaoNFItemIND_BX_CONTR_VEND.text)+CHR(39)+',';
      if trim(QTransmissaoNFItemNUM_NOTA_PRODUTOR.text) <> '' then
        wAux:=trim(QTransmissaoNFItemNUM_NOTA_PRODUTOR.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      CHR(39)+trim(QTransmissaoNFItemIND_TIPO_CONSUMO.text)+CHR(39)+',';
      if trim(QTransmissaoNFItemQT_CHEGADA.text) <> '' then
        wAux:=trim(QTransmissaoNFItemQT_CHEGADA.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFItemVAL_PIS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_PIS.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFItemVAL_CONFINS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_CONFINS.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoNFItemPERC_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_DESCONTO.Text))
      else
        wAux:='null';
      S:=S+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoNFItem.next;
    end;

    //----UPDATE NOTA CAB E ITEM
    QTransmissaoNFCab.Close;
    QTransmissaoNFCab.setVariable('TYPE','U');
    QTransmissaoNFCab.Open;
    QTransmissaoNFCab.first;

    QTransmissaoNFItem.Close;
    QTransmissaoNFItem.setVariable('TYPE','U');
    QTransmissaoNFItem.Open;
    QTransmissaoNFItem.first;

    while not(QTransmissaoNFCab.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_NOTA_CAB SET '+
      'COD_USUARIO = '+trim(QTransmissaoNFCabCOD_USUARIO.text)+','                              +
      'COD_FILIAL = '+trim(QTransmissaoNFCabCOD_FILIAL.text)+',';
      if trim(QTransmissaoNFCabCOD_MENSAGEM.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_MENSAGEM.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_MENSAGEM = '+wAux;
      if trim(QTransmissaoNFCabCOD_TRANSPORTE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRANSPORTE.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_TRANSPORTE = '+wAux                                                                +
      'COD_OPERACAO = '+trim(QTransmissaoNFCabCOD_OPERACAO.text)+','                             +
      'COD_ESTADO = '+CHR(39)+(QTransmissaoNFCabCOD_ESTADO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_VENDEDOR.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_VENDEDOR = '+wAux                                                                +
      'COD_CADASTRO = '+trim(QTransmissaoNFCabCOD_CADASTRO.text)+','                             +
      'NUM_NOTA = '+trim(QTransmissaoNFCabNUM_NOTA.text)+','                                 +
      'COD_SERIE = '+CHR(39)+trim(QTransmissaoNFCabCOD_SERIE.text)+CHR(39)+','                +
      'IND_SITUACAO = '+CHR(39)+trim(QTransmissaoNFCabIND_SITUACAO.text)+CHR(39)+','             +
      'IND_CONDICAO_PAGTO = '+CHR(39)+trim(QTransmissaoNFCabIND_CONDICAO_PAGTO.text)+CHR(39)+','       +
      'DT_EMISSAO = '+CHR(39)+trim(QTransmissaoNFCabDT_EMISSAO.text)+CHR(39)+','               +
      'DT_MOVIMENTO = '+CHR(39)+DateToStr(trunc(QTransmissaoNFCabDT_MOVIMENTO.value))+CHR(39)+','+
      'DT_RECEBIMENTO = '+CHR(39)+trim(QTransmissaoNFCabDT_RECEBIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_MOTIVO_CANC.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_MOTIVO_CANC.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_MOTIVO_CANC = '+wAux;
      if trim(QTransmissaoNFCabVAL_DESPESAS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_DESPESAS.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_DESPESAS = '+wAux                                                                +
      'IND_ENTRADA_SAIDA = '+CHR(39)+trim(QTransmissaoNFCabIND_ENTRADA_SAIDA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabVAL_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_FRETE = '+wAux;
      if trim(QTransmissaoNFCabVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_DESCONTO.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_DESCONTO = '+wAux;
      if trim(QTransmissaoNFCabCOD_TRANSPORTADOR.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRANSPORTADOR.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_TRANSPORTADOR = '+wAux;
      if trim(QTransmissaoNFCabNUM_CONHECIMENTO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_CONHECIMENTO_FRETE.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_CONHECIMENTO_FRETE = '+wAux;
      if trim(QTransmissaoNFCabVAL_AVISTA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_AVISTA.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_AVISTA = '+wAux                                                                +
      'IND_TIPO_FRETE = '+CHR(39)+trim(QTransmissaoNFCabIND_TIPO_FRETE.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabNUM_VOLUMES.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_VOLUMES.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_VOLUMES = '+wAux                                                                +
      'OBS = '+CHR(39)+trim(QTransmissaoNFCabOBS.text)+CHR(39)+','                      +
      'OBS_COMPLEMENTO = '+CHR(39)+trim(QTransmissaoNFCabOBS_COMPLEMENTO.text)+CHR(39)+','          +
      'DT_USUARIO = '+CHR(39)+DateToStr(trunc(QTransmissaoNFCabDT_USUARIO.value))+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_TRIBUTACAO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_TRIBUTACAO_FRETE.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_TRIBUTACAO_FRETE = '+wAux;
      if trim(QTransmissaoNFCabVAL_TOTAL_IPI.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_TOTAL_IPI.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_TOTAL_IPI = '+wAux;
      if trim(QTransmissaoNFCabVAL_ICM_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_ICM_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_ICM_FRETE = '+wAux;
      if trim(QTransmissaoNFCabVAL_ICM_BASE_FRETE.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_ICM_BASE_FRETE.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_ICM_BASE_FRETE = '+wAux;
      if trim(QTransmissaoNFCabVAL_FUNRURAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FUNRURAL.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_FUNRURAL = '+wAux                                                                +
      'DESC_PLACA = '+CHR(39)+trim(QTransmissaoNFCabDESC_PLACA.text)+CHR(39)+','               +
      'DESC_TRANSPORTADORA = '+CHR(39)+trim(QTransmissaoNFCabDESC_TRANSPORTADORA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_NOTA_CONTA_CORRENTE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_NOTA_CONTA_CORRENTE.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CONTA_CORRENTE = '+wAux                                                                +
      'DT_EMISSAO_CF = '+CHR(39)+trim(QTransmissaoNFCabDT_EMISSAO_CF.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_OPERACAO_CF.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_OPERACAO_CF.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_OPERACAO_CF = '+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_DIAS_CHEQUE = '+wAux;
      if trim(QTransmissaoNFCabCOD_CONTRATO_MOV.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_MOV = '+wAux;
      if trim(QTransmissaoNFCabCOD_CONTRATO_GP_MOV.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_GP_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_GP_MOV = '+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE1.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE1.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_DIAS_CHEQUE1 = '+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE2.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE2.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_DIAS_CHEQUE2 = '+wAux                                                                +
      'IND_NOTA_SEGURO = '+CHR(39)+trim(QTransmissaoNFCabIND_NOTA_SEGURO.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CONTRATO_VEND.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_VEND = '+wAux;
      if trim(QTransmissaoNFCabNR_ROTA.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_ROTA.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_ROTA = '+wAux;
      if trim(QTransmissaoNFCabPERC_COMISSAO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabPERC_COMISSAO.Text))+','
      else
        wAux:='null,';
      S:=S+'PERC_COMISSAO = '+wAux                                                                +
      'IND_MILHAGEM = '+CHR(39)+trim(QTransmissaoNFCabIND_MILHAGEM.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabNUM_OS.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_OS.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_OS = '+wAux;
      if trim(QTransmissaoNFCabCOD_DEPARTAMENTO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_DEPARTAMENTO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_DEPARTAMENTO = '+wAux;
      if trim(QTransmissaoNFCabVAL_PEDAGIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_PEDAGIO.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_PEDAGIO = '+wAux;
      if trim(QTransmissaoNFCabCOD_VENDEDOR_PREPOSTO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_VENDEDOR_PREPOSTO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_VENDEDOR_PREPOSTO = '+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE3.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE3.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_DIAS_CHEQUE3 = '+wAux;
      if trim(QTransmissaoNFCabVAL_FRETE_TON.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFCabVAL_FRETE_TON.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_FRETE_TON = '+wAux                                                                +
      'DESC_OBS_CORPO_NOTA = '+CHR(39)+trim(QTransmissaoNFCabDESC_OBS_CORPO_NOTA.text)+CHR(39)+',';
      if trim(QTransmissaoNFCabCOD_ORDEM_COMPRA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_ORDEM_COMPRA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_ORDEM_COMPRA_CAB = '+wAux;
      if trim(QTransmissaoNFCabCOD_CADASTRO_PARCEIRO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_CADASTRO_PARCEIRO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO_PARCEIRO = '+wAux;
      if trim(QTransmissaoNFCabNUM_PEDIDO.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNUM_PEDIDO.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_PEDIDO = '+wAux;
      if trim(QTransmissaoNFCabCOD_ORDEM_CARREGAMENTO_CAB.text) <> '' then
        wAux:=trim(QTransmissaoNFCabCOD_ORDEM_CARREGAMENTO_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_ORDEM_CARREGAMENTO_CAB = '+wAux;
      if trim(QTransmissaoNFCabNR_DIAS_CHEQUE4.text) <> '' then
        wAux:=trim(QTransmissaoNFCabNR_DIAS_CHEQUE4.Text)+','
      else
        wAux:='null,';
      S:=S+'NR_DIAS_CHEQUE4 = '+wAux                                                                +
      'DESC_OBS_DEVOLUCAO = '+CHR(39)+trim(QTransmissaoNFCabDESC_OBS_DEVOLUCAO.text)+CHR(39)+
      ' WHERE COD_NOTA_CAB = '+trim(QTransmissaoNFCabCOD_NOTA_CAB.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoNFCab.next;
    end;

    while not(QTransmissaoNFItem.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_NOTA_ITEM SET '+
      //trim(QTransmissaoNFItemCOD_NOTA_ITEM.text)+','+
      'COD_NOTA_CAB = '+trim(QTransmissaoNFItemCOD_NOTA_CAB.text)+','+
      'COD_TRIBUTACAO = '+trim(QTransmissaoNFItemCOD_TRIBUTACAO.text)+','+
      'QT_QUANTIDADE = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemQT_QUANTIDADE.text))+','+
      'VAL_TOTAL = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_TOTAL.text))+','+
      'PERC_IPI = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_IPI.text))+','+
      'PERC_COMISSAO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_COMISSAO.text))+','+
      'COD_PRODUTO = '+trim(QTransmissaoNFItemCOD_PRODUTO.text)+','+
      'COD_LOTE_TIPO = '+trim(QTransmissaoNFItemCOD_LOTE_TIPO.text)+',';
      if trim(QTransmissaoNFItemVAL_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_DESCONTO.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_DESCONTO = '+wAux+
      'VAL_DESPESAS = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_DESPESAS.text))+','+
      'VAL_FRETE = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_FRETE.text))+','+
      'PERC_DESCONTO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_DESCONTO.text))+','+
      'VAL_IPI = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_IPI.text))+','+
      'VAL_UNITARIO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_UNITARIO.text))+','+
      'VAL_ICM_BASE = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ICM_BASE.text))+','+
      'VAL_ICM = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ICM.text))+','+
      'IND_CLASS_IPI = '+CHR(39)+trim(QTransmissaoNFItemIND_CLASS_IPI.text)+CHR(39)+','+
      'VAL_CUSTO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_CUSTO.text))+','+
      'VAL_ISS = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_ISS.text))+',';
      if trim(QTransmissaoNFItemPERC_INSS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_INSS.Text))+','
      else
        wAux:='null,';
      S:=S+'PERC_INSS = '+wAux;
      if trim(QTransmissaoNFItemPERC_BENEFICIADO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_BENEFICIADO.Text))+','
      else
        wAux:='null,';
      S:=S+'PERC_BENEFICIADO = '+wAux                                                                 +
      'IND_BX_CONTR_VEND = '+CHR(39)+trim(QTransmissaoNFItemIND_BX_CONTR_VEND.text)+CHR(39)+',';
      if trim(QTransmissaoNFItemNUM_NOTA_PRODUTOR.text) <> '' then
        wAux:=trim(QTransmissaoNFItemNUM_NOTA_PRODUTOR.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_NOTA_PRODUTOR = '+wAux                                                                 +
      'IND_TIPO_CONSUMO = '+CHR(39)+trim(QTransmissaoNFItemIND_TIPO_CONSUMO.text)+CHR(39)+',';
      if trim(QTransmissaoNFItemQT_CHEGADA.text) <> '' then
        wAux:=trim(QTransmissaoNFItemQT_CHEGADA.Text)+','
      else
        wAux:='null,';
      S:=S+'QT_CHEGADA = '+wAux;
      if trim(QTransmissaoNFItemVAL_PIS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_PIS.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_PIS = '+wAux;
      if trim(QTransmissaoNFItemVAL_CONFINS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemVAL_CONFINS.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_CONFINS = '+wAux;
      if trim(QTransmissaoNFItemPERC_DESCONTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoNFItemPERC_DESCONTO.Text))
      else
        wAux:='null';
      S:=S+'PERC_DESC = '+wAux+
      ' WHERE COD_NOTA_ITEM = '+trim(QTransmissaoNFItemCOD_NOTA_ITEM.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoNFItem.next;
    end;
    QTransmissaoNFCab.close;
    QTransmissaoNFItem.close;
  end;
  geraArquivo('NOTAS',S)
end;

procedure TFTransmissaoCad.BitBtn1Click(Sender: TObject);
var S: String;
    F: TextFile;
    wContador: integer;

begin
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    with DMTransmissao do
    begin
      OSImporta.Lines.LoadFromFile(OpenDialog1.FileName);
      OSImporta.Execute;
      OSImporta.Finished;
      if trim(OSImporta.Output.Text)=  '' then
      begin
        DMBanco.DBCemapa2.commit;
        ShowMessage('Todas as informações do Arquivo foram Importadas com Êxito.');
      end
      else
        showMessage('Erro na Importação, Nenhuma informação foi importada'+chr(10)+
                    'Entre em contato com a CEMAPA');
    end;

  end;
end;

procedure TFTransmissaoCad.BTExpProdutoClick(Sender: TObject);
var
  S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoProduto.Close;
    QTransmissaoProduto.setVariable('TYPE','I');
    QTransmissaoProduto.Open;
    QTransmissaoProduto.first;

    while not(QTransmissaoProduto.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_PRODUTO( '                             +
      'COD_PRODUTO,'                                                      +
      'COD_CLASSE,'                                                       +
      'COD_TRIBUTACAO,'                                                   +
      'DESC_PRODUTO,'                                                     +
      'NUM_EMBALAGEM,'                                                    +
      'DESC_UNIDADE,'                                                     +
      'NUM_TRIB_TRANSFERENCIA,'                                           +
      'VAL_VAREJO,'                                                       +
      'VAL_ATACADO,'                                                      +
      'PERC_DESCONTO_MAXIMO,'                                             +
      'PERC_IPI,'                                                         +
      'DESC_CLASS_FISCAL,'                                                +
      'IND_TIPO_PRODUTO,'                                                 +
      'DT_ALTERACAO_PRECO,'                                               +
      'NUM_FABRICANTE,'                                                   +
      'COD_CADASTRO,'                                                     +
      'PERC_COMISSAO,'                                                    +
      'PERC_ISS,'                                                         +
      'PERC_INSS,'                                                        +
      'PRECO_PROMOCAO,'                                                   +
      'DT_PRECO_PRO_INI,'                                                 +
      'DT_PRECO_PRO_FIN,'                                                 +
      'IND_SITUACAO,'                                                     +
      'DESC_COMPLEMENTO_PROMOCAO,'                                        +
      'DESC_COMPLEMENTO,'                                                 +
      'COD_PRODUTO_B,'                                                    +
      'IND_CLASSE_TOX,'                                                   +
      'DESC_FORMULACAO,'                                                  +
      'DESC_GRUPO_QUIMICO,'                                               +
      'NUM_VOLUMES,'                                                      +
      'IND_CESTA_BASICA,'                                                 +
      'NUM_METROS_CUBICOS,'                                               +
      'IND_TIPO_EMBALAGEM,'                                               +
      'DESC_COMPLEMENTO_2,'                                               +
      'IND_TIPO_VASILHAME,'                                               +
      'PRECO_PROMOCAO1,'                                                  +
      'IND_ESTOFARIA,'                                                    +
      'IND_PINTURA,'                                                      +
      'VAL_PRECO_FRETE,'                                                  +
      'IND_RETORNAVEL,'                                                   +
      'NUM_CX_PALETE,'                                                    +
      'IND_KM)'                                                           +
      'VALUES( '                                                          +
      trim(QTransmissaoProdutoCOD_PRODUTO.text)+','                       +
      trim(QTransmissaoProdutoCOD_CLASSE.text)+','                        +
      trim(QTransmissaoProdutoCOD_TRIBUTACAO.text)+','                    +
      CHR(39)+(QTransmissaoProdutoDESC_PRODUTO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_EMBALAGEM.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_EMBALAGEM.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                           +
      CHR(39)+(QTransmissaoProdutoDESC_UNIDADE.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_TRIB_TRANSFERENCIA.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_TRIB_TRANSFERENCIA.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoVAL_VAREJO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_VAREJO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoVAL_ATACADO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_ATACADO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPERC_DESCONTO_MAXIMO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_DESCONTO_MAXIMO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPERC_IPI.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_IPI.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                       +
      CHR(39)+(QTransmissaoProdutoDESC_CLASS_FISCAL.text)+CHR(39)+',' +
      CHR(39)+(QTransmissaoProdutoIND_TIPO_PRODUTO.text)+CHR(39)+','  +
      CHR(39)+(QTransmissaoProdutoDT_ALTERACAO_PRECO.text)+CHR(39)+','+
      CHR(39)+(QTransmissaoProdutoNUM_FABRICANTE.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPERC_COMISSAO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_COMISSAO.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPERC_ISS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_ISS.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPERC_INSS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_INSS.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoProdutoPRECO_PROMOCAO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPRECO_PROMOCAO.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoDT_PRECO_PRO_INI.text)+CHR(39)+','   +
      CHR(39)+(QTransmissaoProdutoDT_PRECO_PRO_FIN.text)+CHR(39)+','   +
      CHR(39)+(QTransmissaoProdutoIND_SITUACAO.text)+CHR(39)+','       +
      CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO_PROMOCAO.text)+CHR(39)+','   +
      CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoCOD_PRODUTO_B.text) <> '' then
        wAux:=trim(QTransmissaoProdutoCOD_PRODUTO_B.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_CLASSE_TOX.text)+CHR(39)+','     +
      CHR(39)+(QTransmissaoProdutoDESC_FORMULACAO.text)+CHR(39)+','    +
      CHR(39)+(QTransmissaoProdutoDESC_GRUPO_QUIMICO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_VOLUMES.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_VOLUMES.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_CESTA_BASICA.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_METROS_CUBICOS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_METROS_CUBICOS.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_TIPO_EMBALAGEM.text)+CHR(39)+',' +
      CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO_2.text)+CHR(39)+',' +
      CHR(39)+(QTransmissaoProdutoIND_TIPO_VASILHAME.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoPRECO_PROMOCAO1.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPRECO_PROMOCAO1.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_ESTOFARIA.text)+CHR(39)+','      +
      CHR(39)+(QTransmissaoProdutoIND_PINTURA.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoVAL_PRECO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_PRECO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_RETORNAVEL.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_CX_PALETE.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_CX_PALETE.text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                        +
      CHR(39)+(QTransmissaoProdutoIND_KM.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoProduto.next;
    end;

    //----UPDATE PRODUTO
    QTransmissaoProduto.Close;
    QTransmissaoProduto.setVariable('TYPE','U');
    QTransmissaoProduto.Open;
    QTransmissaoProduto.first;

    while not(QTransmissaoProduto.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_PRODUTO SET '+
      'COD_PRODUTO = '+trim(QTransmissaoProdutoCOD_PRODUTO.text)+','+
      'COD_CLASSE = '+trim(QTransmissaoProdutoCOD_CLASSE.text)+','+
      'COD_TRIBUTACAO = '+trim(QTransmissaoProdutoCOD_TRIBUTACAO.text)+','+
      'DESC_PRODUTO = '+CHR(39)+(QTransmissaoProdutoDESC_PRODUTO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_EMBALAGEM.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_EMBALAGEM.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_EMBALAGEM = '+wAux+
      'DESC_UNIDADE = '+CHR(39)+(QTransmissaoProdutoDESC_UNIDADE.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_TRIB_TRANSFERENCIA.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_TRIB_TRANSFERENCIA.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_TRIB_TRANSFERENCIA = '+wAux;
      if trim(QTransmissaoProdutoVAL_VAREJO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_VAREJO.text)+','
      else
        wAux:='null,';
      S:=S+'VAL_VAREJO = '+wAux;
      if trim(QTransmissaoProdutoVAL_ATACADO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_ATACADO.text)+','
      else
        wAux:='null,';
      S:=S+'VAL_ATACADO = '+wAux;
      if trim(QTransmissaoProdutoPERC_DESCONTO_MAXIMO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_DESCONTO_MAXIMO.text)+','
      else
        wAux:='null,';
      S:=S+'PERC_DESCONTO_MAXIMO = '+wAux;
      if trim(QTransmissaoProdutoPERC_IPI.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_IPI.text)+','
      else
        wAux:='null,';
      S:=S+'PERC_IPI = '+wAux+
      'DESC_CLASS_FISCAL = '+CHR(39)+(QTransmissaoProdutoDESC_CLASS_FISCAL.text)+CHR(39)+',' +
      'IND_TIPO_PRODUTO = '+CHR(39)+(QTransmissaoProdutoIND_TIPO_PRODUTO.text)+CHR(39)+','  +
      'DT_ALTERACAO_PRECO = '+CHR(39)+(QTransmissaoProdutoDT_ALTERACAO_PRECO.text)+CHR(39)+','+
      'NUM_FABRICANTE = '+CHR(39)+(QTransmissaoProdutoNUM_FABRICANTE.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoCOD_CADASTRO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoCOD_CADASTRO.text)+','
      else
        wAux:='null,';
      S:=S+'COD_CADASTRO = '+wAux;
      if trim(QTransmissaoProdutoPERC_COMISSAO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_COMISSAO.text)+','
      else
        wAux:='null,';
      S:=S+'PERC_COMISSAO = '+wAux;
      if trim(QTransmissaoProdutoPERC_ISS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_ISS.text)+','
      else
        wAux:='null,';
      S:=S+'PERC_ISS = '+wAux;
      if trim(QTransmissaoProdutoPERC_INSS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPERC_INSS.text)+','
      else
        wAux:='null,';
      S:=S+'PERC_INSS = '+wAux;
      if trim(QTransmissaoProdutoPRECO_PROMOCAO.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPRECO_PROMOCAO.text)+','
      else
        wAux:='null,';
      S:=S+'PRECO_PROMOCAO = '+wAux+
      'DT_PRECO_PRO_INI = '+CHR(39)+(QTransmissaoProdutoDT_PRECO_PRO_INI.text)+CHR(39)+','   +
      'DT_PRECO_PRO_FIN = '+CHR(39)+(QTransmissaoProdutoDT_PRECO_PRO_FIN.text)+CHR(39)+','   +
      'IND_SITUACAO = '+CHR(39)+(QTransmissaoProdutoIND_SITUACAO.text)+CHR(39)+','       +
      'DESC_COMPLEMENTO_PROMOCAO = '+CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO_PROMOCAO.text)+CHR(39)+','+
      'DESC_COMPLEMENTO = '+CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoCOD_PRODUTO_B.text) <> '' then
        wAux:=trim(QTransmissaoProdutoCOD_PRODUTO_B.text)+','
      else
        wAux:='null,';
      S:=S+'COD_PRODUTO_B = '+wAux+
      'IND_CLASSE_TOX = '+CHR(39)+(QTransmissaoProdutoIND_CLASSE_TOX.text)+CHR(39)+','     +
      'DESC_FORMULACAO = '+CHR(39)+(QTransmissaoProdutoDESC_FORMULACAO.text)+CHR(39)+','    +
      'DESC_GRUPO_QUIMICO = '+CHR(39)+(QTransmissaoProdutoDESC_GRUPO_QUIMICO.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_VOLUMES.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_VOLUMES.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_VOLUMES = '+wAux+
      'IND_CESTA_BASICA = '+CHR(39)+(QTransmissaoProdutoIND_CESTA_BASICA.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_METROS_CUBICOS.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_METROS_CUBICOS.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_METROS_CUBICOS = '+wAux+
      'IND_TIPO_EMBALAGEM = '+CHR(39)+(QTransmissaoProdutoIND_TIPO_EMBALAGEM.text)+CHR(39)+',' +
      'DESC_COMPLEMENTO_2 = '+CHR(39)+(QTransmissaoProdutoDESC_COMPLEMENTO_2.text)+CHR(39)+',' +
      'IND_TIPO_VASILHAME = '+CHR(39)+(QTransmissaoProdutoIND_TIPO_VASILHAME.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoPRECO_PROMOCAO1.text) <> '' then
        wAux:=trim(QTransmissaoProdutoPRECO_PROMOCAO1.text)+','
      else
        wAux:='null,';
      S:=S+'PRECO_PROMOCAO1 = '+wAux+
      'IND_ESTOFARIA = '+CHR(39)+(QTransmissaoProdutoIND_ESTOFARIA.text)+CHR(39)+','      +
      'IND_PINTURA = '+CHR(39)+(QTransmissaoProdutoIND_PINTURA.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoVAL_PRECO_FRETE.text) <> '' then
        wAux:=trim(QTransmissaoProdutoVAL_PRECO_FRETE.text)+','
      else
        wAux:='null,';
      S:=S+'VAL_PRECO_FRETE = '+wAux+
      'IND_RETORNAVEL = '+CHR(39)+(QTransmissaoProdutoIND_RETORNAVEL.text)+CHR(39)+',';
      if trim(QTransmissaoProdutoNUM_CX_PALETE.text) <> '' then
        wAux:=trim(QTransmissaoProdutoNUM_CX_PALETE.text)+','
      else
        wAux:='null,';
      S:=S+'NUM_CX_PALETE = '+wAux+
      'IND_KM = '+CHR(39)+(QTransmissaoProdutoIND_KM.text)+CHR(39)+
      ' WHERE COD_PRODUTO = '+trim(QTransmissaoProdutoCod_Produto.text)+';';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoProduto.next;
    end;
    QTransmissaoProduto.close;
    geraArquivo('PRODUTO',S)
  end;
end;

procedure TFTransmissaoCad.BTExpContasRecClick(Sender: TObject);
var
  S,wAux: String;
begin
  with DMTransmissao do
  begin
    QTransmissaoCRCab.Close;
    QTransmissaoCRCab.setVariable('TYPE','I');
    QTransmissaoCRCab.Open;
    QTransmissaoCRCab.first;

    QTransmissaoCRMov.Close;
    QTransmissaoCRMov.setVariable('TYPE','I');
    QTransmissaoCRMov.Open;
    QTransmissaoCRMov.first;

    while not(QTransmissaoCRCab.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_CONTA_RECEBER_CAB('                                  +
      'COD_CONTA_RECEBER_CAB,'                                                          +
      'COD_FINALIDADE,'                                                                 +
      'COD_BANCO_AGENCIA,'                                                              +
      'COD_FILIAL,'                                                                     +
      'NUM_TITULO,'                                                                     +
      'NUM_PARCELA,'                                                                    +
      'DESC_TIPO_DOCUMENTO,'                                                            +
      'DT_MOVIMENTO,'                                                                   +
      'DT_BAIXA,'                                                                       +
      'DT_VENCIMENTO,'                                                                  +
      'DT_EMISSAO,'                                                                     +
      'DT_CAPITALIZACAO,'                                                               +
      'VAL_TITULO,'                                                                     +
      'VAL_NEGOCIO,'                                                                    +
      'IND_ACEITE,'                                                                     +
      'IND_SITUACAO,'                                                                   +
      'DESC_OBSERVACAO,'                                                                +
      'COD_NOTA_CAB,'                                                                   +
      'COD_CADASTRO,'                                                                   +
      'VAL_ORIGINAL,'                                                                   +
      'COD_NOSSO_NUMERO,'                                                               +
      'VAL_JUROS,'                                                                      +
      'COD_DEPARTAMENTO,'                                                               +
      'COD_CONTRATO_VEND,'                                                              +
      'DESC_AVALISTA1,'                                                                 +
      'DESC_AVALISTA2,'                                                                 +
      'COD_VENDEDOR,'                                                                   +
      'PERC_COMISSAO,'                                                                  +
      'DT_CAPITALIZACAO_MOEDA,'                                                         +
      'VAL_PROMISSORIA,'                                                                +
      'IND_ENVIADO_BANCO,'                                                              +
      'COD_CONTA_CORRENTE,'                                                             +
      'COD_ORDEM_COMPRA_CAB,'                                                           +
      'COD_OBRA_CONTRATO) '                                                             +
      'VALUES('                                                                         +
      trim(QTransmissaoCRCabCOD_CONTA_RECEBER_CAB.text)+',';
      if trim(QTransmissaoCRCabCOD_FINALIDADE.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_FINALIDADE.text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_BANCO_AGENCIA.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_FILIAL.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabNUM_TITULO.text) <> '' then
        wAux:=trim(QTransmissaoCRCabNUM_TITULO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabNUM_PARCELA.text) <> '' then
        wAux:=trim(QTransmissaoCRCabNUM_PARCELA.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoCRCabDESC_TIPO_DOCUMENTO.text)+CHR(39)+','      +
      CHR(39)+trim(DateToStr(trunc(QTransmissaoCRCabDT_MOVIMENTO.value)))+CHR(39)+','+
      CHR(39)+trim(QTransmissaoCRCabDT_BAIXA.text)+CHR(39)+','                 +
      CHR(39)+trim(QTransmissaoCRCabDT_VENCIMENTO.text)+CHR(39)+','            +
      CHR(39)+trim(QTransmissaoCRCabDT_EMISSAO.text)+CHR(39)+','               +
      CHR(39)+trim(QTransmissaoCRCabDT_CAPITALIZACAO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabVAL_TITULO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_TITULO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabVAL_NEGOCIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_NEGOCIO.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      CHR(39)+trim(QTransmissaoCRCabIND_ACEITE.text)+CHR(39)+','                +
      CHR(39)+trim(QTransmissaoCRCabIND_SITUACAO.text)+CHR(39)+','              +
      CHR(39)+trim(QTransmissaoCRCabDESC_OBSERVACAO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_NOTA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      trim(QTransmissaoCRCabCOD_CADASTRO.text)+',';
      if trim(QTransmissaoCRCabVAL_ORIGINAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_ORIGINAL.text))+','
      else
        wAux:='null,';
      S:=S+wAux+
      CHR(39)+trim(QTransmissaoCRCabCOD_NOSSO_NUMERO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabVAL_JUROS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_JUROS.text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      trim(QTransmissaoCRCabCOD_DEPARTAMENTO.text)+',';
      if trim(QTransmissaoCRCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_CONTRATO_VEND.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      CHR(39)+trim(QTransmissaoCRCabDESC_AVALISTA1.text)+CHR(39)+','           +
      CHR(39)+trim(QTransmissaoCRCabDESC_AVALISTA2.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_VENDEDOR.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                +
      Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabPERC_COMISSAO.text))+','  +
      CHR(39)+trim(QTransmissaoCRCabDT_CAPITALIZACAO_MOEDA.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabVAL_PROMISSORIA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_PROMISSORIA.text))+','
      else
        wAux:='null,';
      S:=S+wAux+
      CHR(39)+trim(QTransmissaoCRCabIND_ENVIADO_BANCO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_CONTA_CORRENTE.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_CONTA_CORRENTE.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabCOD_ORDEM_COMPRA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_ORDEM_COMPRA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRCabCOD_OBRA_CONTRATO.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_OBRA_CONTRATO.Text)+','
      else
        wAux:='null';
      S:=S+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCRCab.next;
    end;

    while not(QTransmissaoCRMov.eof) do
    begin
      S:=S+'INSERT INTO SISTEMA.TB_CONTA_RECEBER_MOV('                          +
      'COD_CONTA_RECEBER_MOV,'                                                  +
      'COD_CONTA_RECEBER_CAB,'                                                  +
      'DT_MOVIMENTO,'                                                           +
      'VAL_MOVIMENTO,'                                                          +
      'DESC_OBSERVACAO,'                                                        +
      'COD_USUARIO,'                                                            +
      'DT_USUARIO,'                                                             +
      'IND_TIPO_MOVIMENTO,'                                                     +
      'COD_BCO_MOVIMENTO,'                                                      +
      'COD_CAIXA_MOV,'                                                          +
      'COD_LANCTO_CONTABIL_CRED,'                                               +
      'COD_LANCTO_CONTABIL_DEB,'                                                +
      'COD_NOTA_CAB,'                                                           +
      'IND_DEVOLUCAO,'                                                          +
      'IND_FORMA_PAGAMENTO)'                                                    +
      ' VALUES('                                                                +
      trim(QTransmissaoCRMovCOD_CONTA_RECEBER_MOV.text)+','                     +
      trim(QTransmissaoCRMovCOD_CONTA_RECEBER_CAB.text)+','                     +
      CHR(39)+trim(DateToStr(trunc(QTransmissaoCRMovDT_Movimento.Value)))+CHR(39)+',';
      if trim(QTransmissaoCRMovVAL_MOVIMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRMovVAL_Movimento.Text))+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      CHR(39)+trim(QTransmissaoCRMovDESC_OBSERVACAO.text)+CHR(39)+','           +
      trim(QTransmissaoCRMovCOD_USUARIO.text)+','                               +
      CHR(39)+trim(DateToStr(trunc(QTransmissaoCRMovDT_USUARIO.Value)))+CHR(39)+','                +
      CHR(39)+trim(QTransmissaoCRMovIND_TIPO_MOVIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCRMovCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_BCO_MOVIMENTO.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRMovCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_CAIXA_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_CRED.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_CRED.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_DEB.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_DEB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux;
      if trim(QTransmissaoCRMovCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_NOTA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+wAux                                                                 +
      CHR(39)+trim(QTransmissaoCRMovIND_DEVOLUCAO.text)+CHR(39)+','            +
      CHR(39)+trim(QTransmissaoCRMovIND_FORMA_PAGAMENTO.text)+CHR(39)+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCRMov.next;
    end;

    //----UPDATE CONTA RECEBER_CAB E MOV
    QTransmissaoCRCab.Close;
    QTransmissaoCRCab.setVariable('TYPE','U');
    QTransmissaoCRCab.Open;
    QTransmissaoCRCab.first;

    QTransmissaoCRMov.Close;
    QTransmissaoCRMov.setVariable('TYPE','U');
    QTransmissaoCRMov.Open;
    QTransmissaoCRMov.first;

    //S:=S+'NUM_EMBALAGEM = '+wAux+

    while not(QTransmissaoCRCab.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_CONTA_RECEBER_CAB SET '+
      'COD_CONTA_RECEBER_CAB,= '+trim(QTransmissaoCRCabCOD_CONTA_RECEBER_CAB.text)+',';
      if trim(QTransmissaoCRCabCOD_FINALIDADE.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_FINALIDADE.text)+','
      else
        wAux:='null,';
      S:=S+'COD_FINALIDADE = '+wAux;
      if trim(QTransmissaoCRCabCOD_BANCO_AGENCIA.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_BANCO_AGENCIA.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_BANCO_AGENCIA = '+wAux;
      if trim(QTransmissaoCRCabCOD_FILIAL.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_FILIAL.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_FILIAL = '+wAux;
      if trim(QTransmissaoCRCabNUM_TITULO.text) <> '' then
        wAux:=trim(QTransmissaoCRCabNUM_TITULO.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_TITULO = '+wAux;
      if trim(QTransmissaoCRCabNUM_PARCELA.text) <> '' then
        wAux:=trim(QTransmissaoCRCabNUM_PARCELA.Text)+','
      else
        wAux:='null,';
      S:=S+'NUM_PARCELA = '+wAux                                                                +
      'DESC_TIPO_DOCUMENTO = '+CHR(39)+trim(QTransmissaoCRCabDESC_TIPO_DOCUMENTO.text)+CHR(39)+','      +
      'DT_MOVIMENTO = '+CHR(39)+trim(QTransmissaoCRCabDT_MOVIMENTO.text)+CHR(39)+','             +
      'DT_BAIXA = '+CHR(39)+trim(QTransmissaoCRCabDT_BAIXA.text)+CHR(39)+','                 +
      'DT_VENCIMENTO = '+CHR(39)+trim(QTransmissaoCRCabDT_VENCIMENTO.text)+CHR(39)+','            +
      'DT_EMISSAO =  '+CHR(39)+trim(QTransmissaoCRCabDT_EMISSAO.text)+CHR(39)+','               +
      'DT_CAPITALIZACAO = '+CHR(39)+trim(QTransmissaoCRCabDT_CAPITALIZACAO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabVAL_TITULO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_TITULO.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_TITULO = '+wAux;
      if trim(QTransmissaoCRCabVAL_NEGOCIO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_NEGOCIO.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_NEGOCIO = '+wAux                                                                 +
      'IND_ACEITE = '+CHR(39)+trim(QTransmissaoCRCabIND_ACEITE.text)+CHR(39)+','                +
      'IND_SITUACAO = '+CHR(39)+trim(QTransmissaoCRCabIND_SITUACAO.text)+CHR(39)+','              +
      'DESC_OBSERVACAO = '+CHR(39)+trim(QTransmissaoCRCabDESC_OBSERVACAO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_NOTA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux                                                                 +
      'COD_CADASTRO = '+trim(QTransmissaoCRCabCOD_CADASTRO.text)+',';
      if trim(QTransmissaoCRCabVAL_ORIGINAL.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_ORIGINAL.text))+','
      else
        wAux:='null,';
      S:=S+'val_original = '+wAux;
      if trim(QTransmissaoCRCabCOD_NOSSO_NUMERO.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_NOSSO_NUMERO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOSSO_NUMERO = '+wAux;
      if trim(QTransmissaoCRCabVAL_JUROS.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_JUROS.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_JUROS = '+wAux                                                                +
      'COD_DEPARTAMENTO = '+trim(QTransmissaoCRCabCOD_DEPARTAMENTO.text)+',';
      if trim(QTransmissaoCRCabCOD_CONTRATO_VEND.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_CONTRATO_VEND.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTRATO_VEND = '+wAux                                                                +
      'DESC_AVALISTA1 = '+CHR(39)+trim(QTransmissaoCRCabDESC_AVALISTA1.text)+CHR(39)+','           +
      'DESC_AVALISTA2 = '+CHR(39)+trim(QTransmissaoCRCabDESC_AVALISTA2.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_VENDEDOR.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_VENDEDOR.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_VENDEDOR = '+wAux                                                                +
      'PERC_COMISSAO = '+Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabPERC_COMISSAO.text))+','  +
      'DT_CAPITALIZACAO_MOEDA = '+CHR(39)+trim(QTransmissaoCRCabDT_CAPITALIZACAO_MOEDA.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabVAL_PROMISSORIA.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRCabVAL_PROMISSORIA.text))+','
      else
        wAux:='null,';
      S:=S+'VAL_PROMISSORIA =  '+wAux                                                                +
      'IND_ENVIADO_BANCO = '+CHR(39)+trim(QTransmissaoCRCabIND_ENVIADO_BANCO.text)+CHR(39)+',';
      if trim(QTransmissaoCRCabCOD_CONTA_CORRENTE.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_CONTA_CORRENTE.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CONTA_CORRENTE = '+wAux;
      if trim(QTransmissaoCRCabCOD_ORDEM_COMPRA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_ORDEM_COMPRA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_ORDEM_COMPRA_CAB = '+wAux;
      if trim(QTransmissaoCRCabCOD_OBRA_CONTRATO.text) <> '' then
        wAux:=trim(QTransmissaoCRCabCOD_OBRA_CONTRATO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_OBRA_CONTRATO = '+wAux+');';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCRCab.next;
    end;

    while not(QTransmissaoCRMov.eof) do
    begin
      S:=S+'UPDATE SISTEMA.TB_CONTA_RECEBER_MOV SET '+
      'COD_CONTA_RECEBER_MOV = '+trim(QTransmissaoCRMovCOD_CONTA_RECEBER_MOV.text)+','+
      'COD_CONTA_RECEBER_CAB = '+trim(QTransmissaoCRMovCOD_CONTA_RECEBER_CAB.text)+','                     +
      'DT_MOVIMENTO = '+CHR(39)+trim(QTransmissaoCRMovDT_Movimento.text)+CHR(39)+',';
      if trim(QTransmissaoCRMovVAL_MOVIMENTO.text) <> '' then
        wAux:=Bib.TrocaVirgulaPorPonto(trim(QTransmissaoCRMovVAL_Movimento.Text))+','
      else
        wAux:='null,';
      S:=S+'VAL_MOVIMENTO = '+wAux                                                                 +
      'DESC_OBSERVACAO = '+trim(QTransmissaoCRMovDESC_OBSERVACAO.text)+','                           +
      'COD_USUARIO = '+trim(QTransmissaoCRMovCOD_USUARIO.text)+','                               +
      'DT_USUARIO = '+CHR(39)+trim(QTransmissaoCRMovDT_USUARIO.text)+CHR(39)+','                +
      'IND_TIPO_MOVIMENTO = '+CHR(39)+trim(QTransmissaoCRMovIND_TIPO_MOVIMENTO.text)+CHR(39)+',';
      if trim(QTransmissaoCRMovCOD_BCO_MOVIMENTO.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_BCO_MOVIMENTO.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_BCO_MOVIMENTO = '+wAux;
      if trim(QTransmissaoCRMovCOD_CAIXA_MOV.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_CAIXA_MOV.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_CAIXA_MOV = '+wAux;
      if trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_CRED.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_CRED.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_LANCTO_CONTABIL_CRED = '+wAux;
      if trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_DEB.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_LANCTO_CONTABIL_DEB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_LANCTO_CONTABIL_DEB = '+wAux;
      if trim(QTransmissaoCRMovCOD_NOTA_CAB.text) <> '' then
        wAux:=trim(QTransmissaoCRMovCOD_NOTA_CAB.Text)+','
      else
        wAux:='null,';
      S:=S+'COD_NOTA_CAB = '+wAux+
      'IND_DEVOLUCAO = '+CHR(39)+trim(QTransmissaoCRMovIND_DEVOLUCAO.text)+CHR(39)+','+
      'IND_FORMA_PAGAMENTO = '+CHR(39)+trim(QTransmissaoCRMovIND_FORMA_PAGAMENTO.text)+CHR(39)+' );';
      S:= S+Chr(13)+Chr(10);
      QTransmissaoCRMov.next;
    end;
    geraArquivo('CR',S);
  end;
end;

end.

unit UScpcCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, Sockets, Grids, DBGrids,
  DBCtrls, DB, ExtCtrls,maskUtils, InvokeRegistry, Rio, SOAPHTTPClient, SOAPHttpTrans, WinInet, XMLDoc,
  xmldom, XMLIntf, msxmldom, ActnList;

type
  TFScpcCons = class(TForm)
    Sock: TTcpClient;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mmRespostaSCPC: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    meCodigo: TMaskEdit;
    meSenha: TMaskEdit;
    meNome: TMaskEdit;
    meDtNasc: TMaskEdit;
    meCPF: TMaskEdit;
    StatusBar: TStatusBar;
    Label142: TLabel;
    meCodCadastro: TMaskEdit;
    edCadastro: TEdit;
    btnConsultar: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    meDtInicio: TMaskEdit;
    Label8: TLabel;
    MEDtFim: TMaskEdit;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    RgTipoCadastro: TRadioGroup;
    Label10: TLabel;
    MeBanco: TMaskEdit;
    Label11: TLabel;
    MeAgencia: TMaskEdit;
    Label12: TLabel;
    MeContaCorrente: TMaskEdit;
    MeDigito: TMaskEdit;
    Label13: TLabel;
    MeNumeroCheque: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    MeDigitoCheque: TMaskEdit;
    Label16: TLabel;
    MeValorCheque: TMaskEdit;
    XMLDocument1: TXMLDocument;
    HTTPReqResp1: THTTPReqResp;
    ActionList1: TActionList;
    Action1: TAction;
    function ImprimeAtributos(pNode: IXMLNode): String;
    procedure MontaRetorno(pNode: IXMLNode);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SockConnect(Sender: TObject);
    procedure SockDisconnect(Sender: TObject);
    procedure meNomeExit(Sender: TObject);
    procedure meCodigoExit(Sender: TObject);
    procedure meSenhaExit(Sender: TObject);
    procedure meDtNascExit(Sender: TObject);
    procedure meCPFExit(Sender: TObject);
    procedure meCodCadastroExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RgTipoCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function EncodeBase64(const inStr: string): string;
    procedure HTTPRIO1HTTPWebNode1BeforePost(
      const HTTPReqResp: THTTPReqResp; Data: Pointer);
    procedure HTTPRIO1BeforeExecute(const MethodName: String;
      var SOAPRequest: WideString);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FScpcCons: TFScpcCons;
  nivel:Integer;
  Retorno: WideString;
implementation

uses UScpc_cl, UOracle_cl, UBiblioteca, UParamSistema_cl, UUsuario_cl,
  UConsultaWebServiceSCPC;

{$R *.dfm}

function TFScpcCons.ImprimeAtributos(pNode: IXMLNode): String;
  function tituloPadrao: boolean;
  begin
    result := (pNode.NodeName <> 'cnpj') and      //nós em que não deve ser mostrado o seu titulo da forma padrao.
              (pNode.NodeName <> 'cidade') and
              (pNode.NodeName <> 'cidade-associado') and
              (pNode.NodeName <> 'estado') and
              (pNode.NodeName <> 'endereco') and
              (pNode.NodeName <> 'ns2:resultado') and
              (pNode.NodeName <> 'cpf') and
              (pNode.NodeName <> 'detalhe-ultimo-telefone-informado') and
              (pNode.NodeName <> 'telefone') and
              (pNode.NodeName <> 'estado-rg') and
              (pNode.NodeName <> 'resumo') and
              (pNode.NodeName <> 'detalhe-spc') and
              (pNode.NodeName <> 'detalhe-alerta-documento') and
              (pNode.NodeName <> 'tipo-documento-alerta') and
              (pNode.NodeName <> 'cheque-lojista') and
              (pNode.NodeName <> 'fax') and
              (pNode.NodeName <> 'detalhe-cheque-lojista') and
              (pNode.NodeName <> 'alinea') and
              (pNode.NodeName <> 'cheque-inicial') and
              (pNode.NodeName <> 'cheque-final') and
              (pNode.NodeName <> 'dados-bancarios') and
              (pNode.NodeName <> 'banco') and
              (pNode.NodeName <> 'detalhe-contra-ordem') and
              (pNode.NodeName <> 'motivo') and
              (pNode.NodeName <> 'contumacia') and
              (pNode.NodeName <> 'detalhe-contumacia') and
              (pNode.NodeName <> 'detalhe-consulta-realizada') and
              (pNode.NodeName <> 'origem-associado') and
              (copy(pNode.NodeName, 1, 8) <> 'telefone');
  end;
var Resultado: String;
    i, j: Integer;
begin
  Resultado := '';
  if(pNode.NodeName <> 'protocolo') and     //nós em que nada deve ser mostrado
    (pNode.NodeName <> 'operador') and
    (pNode.NodeName <> 'detalhe-ultimo-telefone-informado') and
    (pNode.NodeName <> 'contumacia') then
  begin
    if(pNode.NodeName = 'consumidor-pessoa-fisica') then
    begin
      Resultado := resultado + '=================================================================================' + chr(13) + chr(10) ;
      Resultado := resultado + chr(9) + chr(9) + chr(9) + chr(9) + 'DADOS CADASTRAIS' + chr(13) + chr(10);
      Resultado := resultado + '=================================================================================' + chr(13) + chr(10) ;
    end
    else if pNode.NodeName = 'cheque-inicial' then
      resultado := resultado + 'CHEQUE INICIAL - '
    else if pNode.NodeName = 'cheque-final' then
      resultado := resultado + 'CHEQUE FINAL - ';

 {  //Mostra o nome do Node(tag)
    else if tituloPadrao then       //nós em que não deve ser mostrado o seu titulo da forma padrao.
      resultado := resultado + pNode.NodeName + ': ';      }
    for i := 0 to pNode.AttributeNodes.Count -1 do
    begin
      if(pNode.NodeName = 'ns2:resultado') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'restricao') then
        begin
          Resultado := resultado + '=================================================================================' + chr(13) + chr(10) ;
          if pNode.AttributeNodes.Get(i).Text = 'true' then
            Resultado := resultado + chr(9) + chr(9) + chr(9) + 'ATENÇÃO: CADASTRO COM RESTRIÇÃO' + chr(13) + chr(10)
          else
            Resultado := resultado + chr(9) + chr(9) + chr(9) + chr(9) + 'CADASTRO SEM RESTRIÇÃO' + chr(13) + chr(10);
          Resultado := resultado + '=================================================================================' + chr(13) + chr(10) ;
        end
      end
      else if(pNode.NodeName = 'consumidor-pessoa-fisica') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'sexo') then
          resultado := resultado + 'SEXO:' + pNode.AttributeNodes.Get(i).Text + chr(9) + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'numero-titulo-eleitor') then
          resultado := resultado + 'TITULO DE ELEITOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'numero-rg') then
          resultado := resultado + 'NUM. RG:' + pNode.AttributeNodes.Get(i).Text  + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-mae') then
          resultado := resultado + 'NOME DA MÃE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-pai') then
          resultado := resultado + 'NOME DO PAI:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome') then
          resultado := resultado + 'NOME:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'idade') then
          resultado := resultado + 'IDADE:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'estado-civil') then
          resultado := resultado + 'ESTADO CIVIL:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-nascimento') then
          resultado := resultado + 'DATA NASC.:'
            + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
                + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
      end
      else if(pNode.NodeName = 'cpf') then
      begin
        if pNode.AttributeNodes.Get(i).NodeName = 'numero' then
          resultado := resultado + 'CPF:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if pNode.AttributeNodes.Get(i).NodeName = 'regiao-origem' then
          resultado := resultado + 'REGIÃO CPF:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end
      else if(pNode.NodeName = 'estado-rg') and (pNode.AttributeNodes.Get(i).NodeName = 'sigla-uf') then
        resultado := resultado + 'UF RG:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      else if pNode.AttributeNodes.Get(i).NodeName = 'razao-social' then
        resultado := resultado + 'RAZÃO SOCIAL:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
      else if pNode.AttributeNodes.Get(i).NodeName = 'nome-comercial' then
        resultado := resultado + 'NOME FANTASIA:' + pNode.AttributeNodes.Get(i).Text  + chr(13) + chr(10)
      else if(pNode.NodeName = 'cnpj') and (pNode.AttributeNodes.Get(i).NodeName = 'numero') then
        resultado := resultado + 'CNPJ:' + pNode.AttributeNodes.Get(i).Text
      else if(pNode.NodeName = 'endereco') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'cep') then
          resultado := chr(13) + chr(10) + resultado + 'CEP:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'bairro') then
          resultado := resultado + 'BAIRRO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'complemento') then
          resultado := resultado + 'COMPLEMENTO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
          resultado := resultado + 'N.:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'logradouro') then
          resultado := resultado + 'LOGRAD.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end
      else if((pNode.NodeName = 'cidade') or (pNode.NodeName = 'cidade-associado') or (pNode.NodeName = 'comarca')) and (pNode.AttributeNodes.Get(i).NodeName = 'nome') then
          resultado := resultado + 'CIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      else if(pNode.NodeName = 'estado') and (pNode.AttributeNodes.Get(i).NodeName = 'sigla-uf') then
          resultado := resultado + 'UF:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      else if (copy(pNode.NodeName, 1, 8) = 'telefone') or (pNode.NodeName = 'fax') then
      begin
        if (pNode.ParentNode.NodeName <> 'detalhe-ultimo-telefone-informado') then
        begin
          if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
          begin
            if pNode.NodeName = 'telefone-residencial' then
              resultado := resultado + chr(13) + chr(10) + 'FONE RESIDENCIAL:' + pNode.AttributeNodes.Get(i).Text + chr(9)
            else if pNode.NodeName = 'telefone-celular' then
              resultado := resultado + chr(13) + chr(10) + 'CELULAR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
            else if pNode.NodeName = 'telefone-comercial' then
              resultado := resultado + chr(13) + chr(10) + 'FONE COMERCIAL:' + pNode.AttributeNodes.Get(i).Text + chr(9)
            else if pNode.NodeName = 'fax' then
              resultado := resultado + chr(13) + chr(10) + 'FAX:' + pNode.AttributeNodes.Get(i).Text + chr(9)
            else
              resultado := resultado + chr(13) + chr(10) + 'TELEFONE:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          end
          else if(pNode.AttributeNodes.Get(i).NodeName = 'numero-ddd') then
            resultado := resultado + 'DDD:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        end;
      end
      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'spc') then        //REGISTROS NO SPC
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'valor-ultima-ocorrencia') then
          resultado := resultado + 'VALOR ULTIMA OCORRENCIA:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-spc') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
          resultado := resultado + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------' + chr(13) + chr(10)
              + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'comprador-fiador-avalista') then
          resultado := resultado + 'TIPO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-entidade') then
          resultado := resultado + 'ENTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-vencimento') then
          resultado := resultado + 'VENCIMENTO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-inclusao') then
          resultado := resultado + 'INCLUSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-associado') then
          resultado := resultado + 'ASSOCIADO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end
      //
      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'protesto') then        //REGISTROS DE PROTESTO
      begin

          if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') then
            resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text
              + '---------------------------------------------------------------------------------' + chr(13) + chr(10)
  //          + chr(13) + chr(10)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
            resultado := resultado + '    ULTIMA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13)+ chr(10)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'data-primeira-ocorrencia') then
            resultado := resultado + 'PRIMEIRA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' //+ chr(13) + chr(10)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'valor-total') then
            resultado := resultado + 'VALOR TOTAL DE PROSTESTO:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
//            + '---------------------------------------------------------------------------------' + chr(13) + chr(10)
          else
      end
      else if (pNode.NodeName = 'detalhe-protesto') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-protesto') then
          resultado := resultado
          + '---------------------------------------------------------------------------------' + chr(13) + chr(10)
          +'DATA DO PROTESTO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
          resultado := resultado //+ chr(13) + chr(10)
           //  + '---------------------------------------------------------------------------------' + chr(13) + chr(10)
              + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else
      end


      //
      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'alerta-documento') then      //ALERTA DE DOCUMENTO
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-alerta-documento') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'observacao') then
          resultado := resultado + 'OBS:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'motivo') then
          resultado := resultado + 'MOTIVO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'entidade-origem') then
          resultado := resultado + 'ENT. ORIGEM:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ocorrencia') then
          resultado := resultado + 'OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-inclusao') then
          resultado := resultado + 'INCLUSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' '
      end
      else if (pNode.NodeName = 'tipo-documento-alerta') then
        resultado := resultado + chr(13) + chr(10) + chr(9) + 'DOCUMENTO:' + pNode.AttributeNodes.Get(i).Text
      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'cheque-lojista') then      //CHEQUE LOGISTA
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'valor-ultima-ocorrencia') then
          resultado := resultado + 'VALOR ULT. OCORRENCIA:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-cheque-lojista') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'nome-entidade') then
          resultado := resultado + 'ENTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(9) + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-inclusao') then
          resultado := resultado + 'DATA INCLUSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-associado') then
          resultado := resultado + 'ASSOCIADO:' + pNode.AttributeNodes.Get(i).Text + chr(9) + chr(9)

      end
      else if (pNode.ParentNode.NodeName = 'detalhe-cheque-lojista') then
      begin
        if (pNode.NodeName = 'alinea') and (pNode.AttributeNodes.Get(i).NodeName = 'descricao') then
          resultado := resultado + 'ALINEA:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if (pNode.NodeName = 'cheque-inicial') or (pNode.NodeName = 'cheque-final') then
        begin
          if(pNode.AttributeNodes.Get(i).NodeName = 'data-emissao') then
            resultado := resultado + 'DATA EMISSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
                + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
            resultado := resultado + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
            resultado := resultado + 'N.:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'digito') then
            resultado := resultado + 'DV:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        end
      end
      else if (pNode.NodeName = 'dados-bancarios') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'numero-agencia') then
          resultado := resultado + 'N. AG.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-agencia') then
          resultado := resultado + 'NOME AG.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'numero-conta-corrente') then
          resultado := resultado + 'N. CC.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'digito-conta-corrente') then
          resultado := resultado + 'DIG. CC.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end
      else if (pNode.NodeName = 'banco') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'nome') then
          resultado := resultado + 'BANCO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end

      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'contra-ordem') then      //CONTRA ORDEM
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA ULTIMA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-contra-ordem') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'origem') then
          resultado := resultado + 'ORIGEM:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ocorrencia') then
          resultado := resultado + 'DATA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-inclusao') then
          resultado := resultado + 'DATA INCLUSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
      end
      else if (pNode.ParentNode.NodeName = 'detalhe-contra-ordem') then
      begin
        if (pNode.NodeName = 'motivo') and (pNode.AttributeNodes.Get(i).NodeName = 'descricao') then
          resultado := resultado + 'MOTIVO:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if (pNode.NodeName = 'cheque-inicial') or (pNode.NodeName = 'cheque-final') then
        begin
          if(pNode.AttributeNodes.Get(i).NodeName = 'data-emissao') then
            resultado := resultado + 'DATA EMISSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
                + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
            resultado := resultado + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
            resultado := resultado + 'N.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'digito') then
            resultado := resultado + 'DV:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        end
      end

      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'contumacia') then      //CONTUMACIA
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA ULTIMA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-contumacia') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'origem') then
          resultado := resultado + 'ORIGEM:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ocorrencia') then
          resultado := resultado + 'DATA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10)
      end
      else if (pNode.ParentNode.NodeName = 'detalhe-contumacia') then
      begin
        if (pNode.NodeName = 'motivo') and (pNode.AttributeNodes.Get(i).NodeName = 'descricao') then
          resultado := resultado + 'MOTIVO:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if (pNode.NodeName = 'cheque-inicial') or (pNode.NodeName = 'cheque-final') then
        begin
          if(pNode.AttributeNodes.Get(i).NodeName = 'data-emissao') then
            resultado := resultado + 'DATA EMISSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
                + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
            resultado := resultado + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
            resultado := resultado + 'N.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'digito') then
            resultado := resultado + 'DV:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        end
      end

      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'consulta-realizada') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA ULTIMA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-consulta-realizada') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'nome-entidade-origem') then
          resultado := resultado + 'ENT.ORIGEM:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-consulta') then
          resultado := resultado + 'DATA CONSULTA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'nome-associado') then
          resultado := resultado + 'ASSOCIADO:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
      end
      else if (pNode.ParentNode.NodeName = 'detalhe-consulta-realizada') then
      begin
        if (pNode.NodeName = 'origem-associado') and (pNode.AttributeNodes.Get(i).NodeName = 'nome') then
          resultado := resultado + 'CIDADE ASSOCIADO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
      end

      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'ccf') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultima-ocorrencia') then
          resultado := resultado + 'DATA ULTIMA OCORRENCIA:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-ccf') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade') then
          resultado := resultado + 'QUANT.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'origem') then
          resultado := resultado + 'ORIGEM:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-ultimo-cheque') then
          resultado := resultado + 'DATA ULT. CHEQUE:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
      end
      else if (pNode.ParentNode.NodeName = 'detalhe-ccf') then
      begin
        if (pNode.NodeName = 'motivo') and (pNode.AttributeNodes.Get(i).NodeName = 'descricao') then
          resultado := resultado + 'MOTIVO:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if (pNode.NodeName = 'ultimo-cheque') then
        begin
          if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
            resultado := resultado + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'numero') then
            resultado := resultado + 'N.:' + pNode.AttributeNodes.Get(i).Text + chr(9)
          else if(pNode.AttributeNodes.Get(i).NodeName = 'digito') then
            resultado := resultado + 'DV:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        end
      end

      else if (pNode.NodeName = 'resumo') and (pNode.ParentNode.NodeName = 'informacao-poder-judiciario') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'quantidade-total') and (pNode.AttributeNodes.Get(i).Text <> '0') then
          resultado := resultado + 'QUANTIDADE:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
            + '---------------------------------------------------------------------------------'
      end
      else if (pNode.NodeName = 'detalhe-informacao-poder-judiciario') then
      begin
        if(pNode.AttributeNodes.Get(i).NodeName = 'data-documento') then
          resultado := resultado + 'DATA DOCUMENTO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'data-inclusao') then
          resultado := resultado + 'DATA INCLUSÃO:' + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' ' + chr(13) + chr(10 )
        else if(pNode.AttributeNodes.Get(i).NodeName = 'entidade-origem') then
          resultado := resultado + 'ENTIDADE ORIGEM.:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'numero-processo') then
          resultado := resultado + 'N. PROCESSO:' + pNode.AttributeNodes.Get(i).Text + chr(9)
        else if(pNode.AttributeNodes.Get(i).NodeName = 'valor') then
          resultado := resultado + 'VALOR:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
      end
      else if (pNode.ParentNode.NodeName = 'detalhe-informacao-poder-judiciario') then
      begin
        if (pNode.NodeName = 'vara') and (pNode.AttributeNodes.Get(i).NodeName = 'nome') then
          resultado := resultado + 'VARA:' + pNode.AttributeNodes.Get(i).Text + chr(13) + chr(10)
      end

   {   essa parte imprime o que não foi tratado da forma padrão
   else
      begin
        resultado := resultado + pNode.AttributeNodes.Get(i).NodeName + '=';
        if(Copy(pNode.AttributeNodes.Get(i).NodeName, 1, 5) = 'data-') then
          resultado := resultado + Copy(pNode.AttributeNodes.Get(i).Text, 9, 2) + '/'
            + Copy(pNode.AttributeNodes.Get(i).Text, 6, 2) + '/'
              + Copy(pNode.AttributeNodes.Get(i).Text, 1, 4) + ' '
        else
          resultado := resultado + pNode.AttributeNodes.Get(i).Text + ' ';
      end;  }
    end;
  end;
  result := resultado;
end;

procedure TFScpcCons.MontaRetorno(pNode: IXMLNode);
  var
    noAux:IXMLNode;
begin
 
  if (pNode.NodeName = 'spc') then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'REGISTROS NO SPC' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'alerta-documento') then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'ALERTA DE DOCUMENTOS' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'cheque-lojista') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'CHEQUE LOJISTA' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'contra-ordem') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'CONTRA ORDEM' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'contumacia') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'CONTUMACIA' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  //---PROTESTO----
  else if (pNode.NodeName = 'protesto') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'PROTESTO' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  //
  else if (pNode.NodeName = 'consulta-realizada') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) +'CONSULTAS REALIZADAS' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================' + chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'dados-agencia-bancaria') and (pNode.ChildNodes.Count > 0) then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) +'DADOS AGENCIA BANCARIA' + chr(13) + chr(10);
    retorno := retorno + '=================================================================================';
  end
  else if (pNode.NodeName = 'ccf') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + chr(9) + chr(9) +'CCF' + chr(13) + chr(10);
    retorno := retorno + '================================================================================='+ chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if (pNode.NodeName = 'informacao-poder-judiciario') and ((pNode.ChildNodes.First.AttributeNodes.First.NodeName <> 'quantidade-total')
    or (pNode.ChildNodes.First.AttributeNodes.First.Text <> '0'))then
  begin
    retorno := retorno + chr(13) + chr(10) + '=================================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) + 'INFORMAÇÃO PODER JUDICIÁRIO' + chr(13) + chr(10);
    retorno := retorno + '================================================================================='+ chr(13) + chr(10)
      + 'RESUMO - ';
  end
  else if pNode.NodeName = 'ultimo-cheque' then
      retorno := retorno + 'ULTIMO CHEQUE - ';
  if (pNode.NodeName = 'ultimo-endereco-informado') and ((pNode.HasChildNodes) or (pNode.AttributeNodes.Count > 0)) then
  begin
    retorno := retorno + chr(13) + chr(10) + '===============================================================================' + chr(13) + chr(10);
    retorno := retorno + chr(9) + chr(9) + chr(9) +'ULTIMOS ENDEREÇOS INFORMADOS' + chr(13) + chr(10);
    retorno := retorno + '===============================================================================';
  end
  else if (pNode.NodeName = 'detalhe-ultimo-endereco-informado') then
    retorno := retorno + chr(13) + chr(10) + '---------------------------------------------------------------------------------'
  else if (pNode.NodeName = 'detalhe-alerta-documento') or (pNode.NodeName = 'detalhe-cheque-lojista')
     or (pNode.NodeName = 'detalhe-contra-ordem') or (pNode.NodeName = 'detalhe-contumacia')
      or (pNode.NodeName = 'detalhe-dados-agencia-bancaria') or (pNode.NodeName = 'detalhe-consulta-realizada')
        or (pNode.NodeName = 'detalhe-ccf') or (pNode.NodeName = 'detalhe-informacao-poder-judiciario')then
    retorno := retorno + chr(13) + chr(10) + '---------------------------------------------------------------------------------' + chr(13) + chr(10);
  if (pNode.AttributeNodes.Count > 0) and (pNode.NodeName <> 'consulta-realizada') then             //se tem atributos imprime eles
  begin
    retorno :=retorno + ImprimeAtributos(pNode);
  end
  else if (pNode.NodeName = 'faultcode') or (pNode.NodeName = 'faultstring') then
    retorno := retorno + pNode.Text + chr(9);
  if(pNode.HasChildNodes) and (pNode.NodeName <> 'credito-concedido')
      and (pNode.NodeName <> 'contra-ordem-agencia-conta-diferente') and (pNode.NodeName <> 'contra-ordem-documento-diferente')
        and (pNode.NodeName <> 'banco-agencia-conta-documento-diferente') then          //se tem filhos vai pro primeiro deles
  begin
    inc(nivel);
    MontaRetorno(pnode.ChildNodes.First);
  end
  else
  begin
    noAux := pNode.NextSibling;
    if(noAux <> nil)then  // se tem irmao vai pro irmao.
    begin
      pNode := noAux;
      MontaRetorno(pNode);
    end
    else                                      //se não tem irmão
    begin
      noAux := pNode.ParentNode.NextSibling;
      while (noAux = nil) and (nivel > 0) do    //se o pai tem proximo irmao -> vai pro irmao do pai
      begin
        Dec(nivel);
        pNode := pNode.ParentNode;
        noAux := pNode.ParentNode.NextSibling;
      end;
      if(noAux <> nil) then
      begin
        Dec(nivel);
        pNode := noAux;
        MontaRetorno(pNode);
      end;
    end;
  end;
end;

procedure TFScpcCons.btnConsultarClick(Sender: TObject);
Var
  Trans : String;
  Resp  : String;
  Flag, consultar  : Boolean;
  i,j : integer;
  posicaoPalavra, palavraEncontrada, a : integer;
  strm : TStringStream;
  wValor : Real;
  p: produtos;
  prod: TProduto;
  ws : consultaWebService;
  c: codigo_produto;
  resultado: TResultado;
  f: filtro;
  Stream: TMemoryStream;
  ss: tmemorystream;
  requisicao: String;
  Node: IXMLNode;
  wTipoPessoa: String;
begin
  if MessageDlg('Deseja realmente consultar? Essa consulta será cobrada.', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  mmRespostaSCPC.Clear;
  meCodigoExit(Sender);
  meSenhaExit(Sender);
  meNomeExit(sender);
  meCPFExit(Sender);
  meDtNascExit(Sender);
  wTipoPessoa := DMOracle.FastSelect('IND_FISICA_JURIDICA','TB_CADASTRO','COD_CADASTRO = ' + Trim(meCodCadastro.Text));

  if Length(trim(meCPF.Text)) < 11 then
    raise Exception.Create('CPF com menos digitos que o mínimo (11 caracteres)');
  Stream := TMemoryStream.Create;
  ss := TMemoryStream.create;
  requisicao:= '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://webservice.consulta.spcjava.spcbrasil.org/">'
  + '<soapenv:Header/><soapenv:Body><web:filtro>'
  + '<codigo-produto>' + DMParamSistema.QParamSistemaIND_TIPO_CONSULTA_SPC.Text + '</codigo-produto>';
 { if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEIFAGRIL') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION') then
    requisicao := requisicao + '<codigo-produto>' + '246' + '</codigo-produto>'    //codigo do produto liberado para consulta spc mix
  else
    requisicao := requisicao + '<codigo-produto>' + '13' + '</codigo-produto>';   //codigo do produto liberado para consulta spc mix}
  if wTipoPessoa = 'F' then
    requisicao := requisicao + '<tipo-consumidor>'+ 'F' +'</tipo-consumidor>'
  else
    requisicao := requisicao + '<tipo-consumidor>'+ 'J' +'</tipo-consumidor>';
  requisicao := requisicao + '<documento-consumidor>' + trim(meCPF.Text) + '</documento-consumidor>'
  + '<utiliza-CMC7>false</utiliza-CMC7>';
  if trim(MeBanco.Text) <> '' then
    requisicao:= requisicao + '<banco-cheque-inicial>' + trim(MeBanco.Text) + '</banco-cheque-inicial>';
  if trim(MeAgencia.Text) <> '' then
    requisicao:= requisicao + '<agencia-cheque-inicial>' + trim(MeAgencia.Text) + '</agencia-cheque-inicial>';
  if trim(MeContaCorrente.Text) <> '' then
    requisicao:= requisicao + '<conta-corrente-cheque-inicial>' + trim(MeContaCorrente.Text) + '</conta-corrente-cheque-inicial>';
  if trim(MeDigito.Text) <> '' then
    requisicao:= requisicao + '<digito-conta-corrente-cheque-inicial>' + trim(MeDigito.Text) + '</digito-conta-corrente-cheque-inicial>';
  if trim(MeNumeroCheque.Text) <> '' then
    requisicao:= requisicao + '<numero-cheque-inicial>' + trim(MeNumeroCheque.Text) + '</numero-cheque-inicial>';
  if trim(MeDigitoCheque.Text) <> '' then
    requisicao:= requisicao + '<digito-cheque-inicial>'+ trim(MeDigitoCheque.Text) +'</digito-cheque-inicial>';
  requisicao:= requisicao + '</web:filtro></soapenv:Body></soapenv:Envelope>';


  HTTPReqResp1.UserName := Trim(meCodigo.Text);
  HTTPReqResp1.Password := Trim(meSenha.Text);
  HTTPReqResp1.URL := 'https://servicos.spc.org.br/spc/remoting/ws/consulta/consultaWebService';     //Produção
  //HTTPReqResp1.URL := 'https://treinamento.spcbrasil.com.br/spc/remoting/ws/consulta/consultaWebService?wsdl'; //Homologação
  HTTPReqResp1.UseUTF8InHeader := True;
  HTTPReqResp1.Execute(requisicao, Stream);

  XMLDocument1.LoadFromStream(Stream);

//  XMLDocument1.FileName := 'C:\geraexe\arquivo.xml';
//  XMLDocument1.Active := True;
  {XMLDocument1.SaveToStream(ss);                  //essa parte comentada salva o xml de retorno do webService
  ss.Position := 0;
  try
    ss.SaveToFile(ExtractFilePath(Application.ExeName) + 'scpcCons\' + trim(meCodCadastro.Text) + '-' + bib.SubstituiStr(DateToStr(Date),'/', '-') + '.xml');
  Except
    MessageDlg('Falha ao gravar o arquivo XML.' , mtInformation, [mbOK], 0);
  end;}
  //  Node := XMLDocument1.DocumentElement;   //passa o xml sem a tag. Usado para Teste.

  Node := XMLDocument1.DocumentElement.ChildNodes['S:Body'];
  Node := Node.ChildNodes.First;
  nivel := 0;
  retorno := '';

  MontaRetorno(Node);

  mmRespostaSCPC.Lines.Add(Retorno);
  SendMessage(mmRespostaSCPC.Handle, WM_VSCROLL, SB_TOP, 0); 
  strm := TStringStream.Create('');
  mmRespostaSCPC.Lines.SaveToStream(strm);
  DMScpc.QConsultaSCPC.open;
  DMScpc.QConsultaSCPC.Insert;
  DMScpc.QConsultaSCPCCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  DMScpc.QConsultaSCPCCOD_CADASTRO.text := trim(meCodCadastro.text);
  DMScpc.QConsultaSCPCDT_CONSULTA.Value := Date;
  DMScpc.QConsultaSCPCDESC_RESULTADO.LoadFromStream(strm);
  DMScpc.QConsultaSCPC.Post;
  strm.free;
end;

procedure TFScpcCons.FormDestroy(Sender: TObject);
begin
  If Sock.Active then
     Sock.Active := False;
end;

procedure TFScpcCons.FormCreate(Sender: TObject);
begin
  meCodigo.Text := DMParamSistema.QParamSistemaDESC_CODIGO_SCPC.Text;
  meSenha.Text := DMParamSistema.QParamSistemaDESC_SENHA_SCPC.Text;

  PageControl1.ActivePage := TabSheet1;

//  If Not Sock.Active then
{  Sock.Active := False;
  Sock.Active := True;   } //comentado por Alessandro em 08/05/13 pois não é mais utilizado sockets para a consulta, e essa rotina estava deixando a consulta lenta

end;

procedure TFScpcCons.SockConnect(Sender: TObject);
begin
  statusBar.Panels[0].Text := 'Conectado';
end;

procedure TFScpcCons.SockDisconnect(Sender: TObject);
begin
  statusBar.Panels[0].Text := 'Desconectado';
end;

procedure TFScpcCons.meNomeExit(Sender: TObject);
var i:byte;
begin
 // For I:=1 To meNome.MaxLength - Length(meNome.Text) Do
 //   meNome.Text := meNome.Text + ' ';
end;

procedure TFScpcCons.meCodigoExit(Sender: TObject);
Var I : Byte;
begin
//  For I:=1 To meCodigo.MaxLength - Length(meCodigo.Text) Do
//    meCodigo.Text := '0' + meCodigo.Text;
end;

procedure TFScpcCons.meSenhaExit(Sender: TObject);
Var I : Byte;
begin
 // For I:=1 To meSenha.MaxLength - Length(meSenha.Text) Do
 //   meSenha.Text := meSenha.Text + ' ';
end;

procedure TFScpcCons.meDtNascExit(Sender: TObject);
Var I : Byte;
begin
 // For I:=1 To meDtNasc.MaxLength - Length(meDtNasc.Text) Do
 //   meDtNasc.Text := ' ' + meDtNasc.Text;
end;

procedure TFScpcCons.meCPFExit(Sender: TObject);
Var I : Byte;
begin
 // For I:=1 To meCPF.MaxLength - Length(meCPF.Text) Do
 //   meCPF.Text := '0' + meCPF.Text;
end;

procedure TFScpcCons.meCodCadastroExit(Sender: TObject);
var wSql : string;
begin
  if trim(meCodCadastro.text) <> '' then
  begin
    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add(' SELECT ');
    DMOracle.QExecSQL.SQL.Add('   NOME, ');
    DMOracle.QExecSQL.SQL.Add('   TO_CHAR(DT_NASCIMENTO, ''DDMMYYYY''), ');
    DMOracle.QExecSQL.SQL.Add('   NUM_CGC_CPF, ');
    DMOracle.QExecSQL.SQL.Add('   NUM_INSCRICAO, ');
    DMOracle.QExecSQL.SQL.Add('   DESC_ORGAO_EMISSOR');
    DMOracle.QExecSQL.SQL.Add(' FROM ');
    DMOracle.QExecSQL.SQL.Add('   TB_CADASTRO');
    DMOracle.QExecSQL.SQL.Add(' WHERE ');
    DMOracle.QExecSQL.SQL.Add('   COD_CADASTRO = ' + trim(meCodCadastro.text));
    DMOracle.QExecSQL.open;

    edCadastro.Text := DMOracle.QExecSQL.Fields[0].Text;
    meNome.Text := DMOracle.QExecSQL.fields[0].Text;
    meDtNasc.Text := DMOracle.QExecSQL.fields[1].Text;
    meCPF.Text := Bib.limpaNumero(DMOracle.QExecSQL.fields[2].Text);
    DMOracle.QExecSQL.close;

    meNomeExit(sender);
    meCPFExit(sender);
    meCodigoExit(sender);
    meSenhaExit(sender);
  end
  else
  begin
    meNome.Clear;
    meCPF.Clear;
  end;
end;

procedure TFScpcCons.BitBtn1Click(Sender: TObject);
begin
  DMScpc.QConsultaSCPCCons.Close;
  DMScpc.QConsultaSCPCCons.SetVariable('COD_CADASTRO', strtoint(trim(meCodCadastro.Text)));
  IF trim(meDtInicio.Text) <> '' then
    DMScpc.QConsultaSCPCCons.SetVariable('DT_INICIO', strtodate(trim(meDtInicio.Text)))
  else
    DMScpc.QConsultaSCPCCons.SetVariable('DT_INICIO', null);
  if trim(meDtInicio.Text) <> '' then
    DMScpc.QConsultaSCPCCons.SetVariable('DT_FIM', strtodate(trim(MEDtFim.Text)))
  else
    DMScpc.QConsultaSCPCCons.SetVariable('DT_FIM', null);
  DMScpc.QConsultaSCPCCons.Open;
  DMScpc.QConsultaSCPCCons.Last;
end;

procedure TFScpcCons.RgTipoCadastroClick(Sender: TObject);
var wSql : string;
begin
  If RgTipoCadastro.ItemIndex = 0 Then  // para cadastro
     meCodCadastroExit(Self)
  else
   Begin  // para conjuge
    if trim(meCodCadastro.text) <> '' then
    begin
      DMOracle.QExecSQL.close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add(' SELECT ');
      DMOracle.QExecSQL.SQL.Add('   NOME_CONJUGE, ');
      DMOracle.QExecSQL.SQL.Add('   TO_CHAR(DT_NASCIMENTO_CONJUGE, ''DDMMYYYY''), ');
      DMOracle.QExecSQL.SQL.Add('   DESC_CPF_CONJUGE, ');
      DMOracle.QExecSQL.SQL.Add('   DESC_IDENTIDADE_CONJUGE ');
      DMOracle.QExecSQL.SQL.Add(' FROM ');
      DMOracle.QExecSQL.SQL.Add('   TB_CADASTRO');
      DMOracle.QExecSQL.SQL.Add(' WHERE ');
      DMOracle.QExecSQL.SQL.Add('   COD_CADASTRO = ' + trim(MeCodCadastro.text));
      DMOracle.QExecSQL.Open;

      meNome.Text := DMOracle.QExecSQL.fields[0].Text;
      meDtNasc.Text := DMOracle.QExecSQL.fields[1].Text;
      meCPF.Text := Bib.limpaNumero(DMOracle.QExecSQL.fields[2].Text);

      DMOracle.QExecSQL.close;

      meNomeExit(sender);
      meCPFExit(sender);
    end

   End;
end;

procedure TFScpcCons.FormActivate(Sender: TObject);
begin
{  Sock.Active := False;
  Sock.Active := True;     }//comentado por Alessandro em 08/05/13 pois não é mais utilizado sockets para a consulta, e essa rotina estava deixando a consulta lenta
  mmRespostaSCPC.Clear;
  MeBanco.Clear;
  MeAgencia.Clear;
  MeContaCorrente.Clear;
  MeDigito.Clear;
  MeNumeroCheque.Clear;
  MeDigitoCheque.Clear;
  MeValorCheque.Clear;
  if DMParamSistema.CodEmpresa = 'PAULINHO' then
    FScpcCons.WindowState := wsMaximized;
end;

procedure TFScpcCons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Sock.Active := False;
end;

function TFScpcCons.EncodeBase64(const inStr: string): string;

  function Encode_Byte(b: Byte): char;
  const
    Base64Code: string[64] =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  begin
    Result := Base64Code[(b and $3F)+1];
  end;
var
  i: Integer;
begin
  i := 1;
  Result := '';
  while i <= Length(InStr) do
  begin
    Result := Result + Encode_Byte(Byte(inStr[i]) shr 2);
    Result := Result + Encode_Byte((Byte(inStr[i]) shl 4) or (Byte(inStr[i+1]) shr 4));
    if i+1 <= Length(inStr) then
      Result := Result + Encode_Byte((Byte(inStr[i+1]) shl 2) or (Byte(inStr[i+2]) shr 6))
    else
      Result := Result + '=';
    if i+2 <= Length(inStr) then
      Result := Result + Encode_Byte(Byte(inStr[i+2]))
    else
      Result := Result + '=';
    Inc(i, 3);
  end;
end;

procedure TFScpcCons.HTTPRIO1HTTPWebNode1BeforePost(
  const HTTPReqResp: THTTPReqResp; Data: Pointer);
  var UserName, Password: String;
begin

  UserName := EncodeBase64('389929');
  Password := EncodeBase64('10072012');
  if not InternetSetOption(Data,
               INTERNET_OPTION_PASSWORD,
               PChar(UserName),
               Length(UserName)) then
     ShowMessage(SysErrorMessage(GetLastError));

  if not InternetSetOption(Data,
               INTERNET_OPTION_PASSWORD,
               PChar(Password),
               Length(Password)) then
     ShowMessage(SysErrorMessage(GetLastError));

end;

procedure TFScpcCons.HTTPRIO1BeforeExecute(const MethodName: String;
  var SOAPRequest: WideString);
  var stream: TStringStream;
      ss:TMemoryStream; 
begin
  //SOAPRequest := StringReplace(SOAPRequest, 'codigo_produto','codigo-produto',[rfReplaceAll]);
  ShowMessage(MethodName + '-' + SOAPRequest);
  stream := TStringStream.Create(SOAPRequest);
  ss := TMemoryStream.Create;
  ss.LoadFromStream(stream);
  ss.Position := 0;
  ss.SaveToFile('c:\requisicaoxml.txt');
end;

procedure TFScpcCons.HTTPRIO1AfterExecute(const MethodName: String;
  SOAPResponse: TStream);
  var ss:TMemoryStream;
      stringStream : TStringStream;
begin
  ss := TMemoryStream.Create;
  ss.LoadFromStream(SOAPResponse);
  ss.Position := 0;
  ss.SaveToFile('c:\retornoxml.txt');


    //  XMLDocument1.LoadFromStream(SOAPResponse);
    //  XMLDocument1.SaveToStream(ss);

  //TreeView1.LoadFromStream(ss);
end;

end.

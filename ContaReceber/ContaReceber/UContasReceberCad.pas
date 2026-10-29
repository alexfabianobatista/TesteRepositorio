unit UContasReceberCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  ImgList, DBCtrls, Grids, DBGrids, ComObj, OracleNavigator, Variants,
  maskUtils,
  DBDirceu, ActnList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFContasReceberCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEDtVencto: TDBEdit;
    Label11: TLabel;
    DBEDtEmissao: TDBEdit;
    Label13: TLabel;
    DBEValorTitulo: TDBEdit;
    Label14: TLabel;
    DBEValorJuro: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    BtFinalidade: TSpeedButton;
    DBRGAceite: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit16: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit15: TDBEdit;
    BtBanco: TSpeedButton;
    BtFilial: TSpeedButton;
    BtCliente: TSpeedButton;
    GroupBox1: TGroupBox;
    Opcao: TMenuItem;
    BaixadoContasReceber1: TMenuItem;
    RelaodeContasReceberpVencimentos1: TMenuItem;
    MovimentoContasReceber1: TMenuItem;
    RelaodeTtulosporCliente1: TMenuItem;
    RelaodeTtulosAbertos1: TMenuItem;
    RelaodeTtulosBaixados1: TMenuItem;
    RelaodeTtulosVencidos1: TMenuItem;
    EmissodeBloqueto2: TMenuItem;
    EmissodeNotaPromissria1: TMenuItem;
    EmissodeDuplicatas1: TMenuItem;
    RelaodeTtulosAbertosSaldos1: TMenuItem;
    Label8: TLabel;
    BtDepartamento: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    EmissodeRecibos1: TMenuItem;
    VoltaBaixadeTitulos1: TMenuItem;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    TtulosemAbertoVendedor1: TMenuItem;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    BtVendedor: TSpeedButton;
    DBEdit23: TDBEdit;
    Comisso1: TMenuItem;
    RelatrioTtulosRecebidos1: TMenuItem;
    RelatrioTtulosRecebidosBancos1: TMenuItem;
    DBEdit14: TDBEdit;
    N2: TMenuItem;
    Arquivoremessa6411: TMenuItem;
    Q: TMenuItem;
    OpenDialog1: TOpenDialog;
    RelatrioArquivodeRemessa6411: TMenuItem;
    N3: TMenuItem;
    GerarArquivoSCI1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    EmissoRecibo1: TMenuItem;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    OracleNavigator1: TOracleNavigator;
    Capitalizao1: TMenuItem;
    ResumoPorSiglaBanco1: TMenuItem;
    ArquivoRemessaHSBC1: TMenuItem;
    RetornoRemessaHSBC1: TMenuItem;
    N7: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    EmissoBloquetoTotal1: TMenuItem;
    VoltarStatusregistros1: TMenuItem;
    ResumoCtaReceberDiario1: TMenuItem;
    LiberaBaixa: TMenuItem;
    ReciboComplementarJuro1: TMenuItem;
    Label23: TLabel;
    DBEdit25: TDBEdit;
    BtContaCorrente: TSpeedButton;
    DBEdit26: TDBEdit;
    N8: TMenuItem;
    ArquivoRemessaIta1: TMenuItem;
    RetornoRemessaIta1: TMenuItem;
    CartadeCobrana1: TMenuItem;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    SbOrdemCompra: TSpeedButton;
    N9: TMenuItem;
    ArquivoRemessaSicredi: TMenuItem;
    RetornoRemessaSicredi1: TMenuItem;
    N10: TMenuItem;
    ArquivoRemessaBradesco1: TMenuItem;
    RetornoRemessaBradesco1: TMenuItem;
    TtulosporFinalidade1: TMenuItem;
    TtulospDtEmisso1: TMenuItem;
    ReciboComissao1: TMenuItem;
    N11: TMenuItem;
    RelatoSerasa1: TMenuItem;
    RetornoRemessaBancoRural1: TMenuItem;
    EmissoCarn1: TMenuItem;
    N12: TMenuItem;
    GeraContrato: TMenuItem;
    DBRGDesconto: TDBRadioGroup;
    N13: TMenuItem;
    ArquivoRemessaCNAB2401: TMenuItem;
    ArquivoRetornoCNAB2401: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    HistricoContrato1: TMenuItem;
    N14: TMenuItem;
    RelDescontoCheque1: TMenuItem;
    ClculodeDesconto1: TMenuItem;
    N15: TMenuItem;
    RemessaV0801: TMenuItem;
    CpiadeBloqueto1: TMenuItem;
    RetornoV0801: TMenuItem;
    N16: TMenuItem;
    GeraArquivoSERASA1: TMenuItem;
    TotaldeCRporPerodo1: TMenuItem;
    BoletimdeRegistroSCPC1: TMenuItem;
    ResumoMovContasaReceber1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Autorizaodefatura1: TMenuItem;
    TitAbertosSintticoporDepto1: TMenuItem;
    TabSheet3: TTabSheet;
    DBMemo1: TDBMemo;
    RelatrioMovimentao1: TMenuItem;
    N17: TMenuItem;
    Sicredicnab240v0811: TMenuItem;
    NumBloqEmitidosporBanco1: TMenuItem;
    ZerarComisso1: TMenuItem;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    TabSheet4: TTabSheet;
    Label40: TLabel;
    DBEdit33: TDBEdit;
    Label41: TLabel;
    DBEdit34: TDBEdit;
    SBVendedorPublicar1: TSpeedButton;
    DBDirceu3: TDBDirceu;
    SBVendedorPublicar: TSpeedButton;
    DBDirceu4: TDBDirceu;
    DBEdit35: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit36: TDBEdit;
    RelComissao: TMenuItem;
    BloquetoAgrupadopPeriodo1: TMenuItem;
    tulosAbertosOutrasMoedas1: TMenuItem;
    N18: TMenuItem;
    CalculaVariaoCambial1: TMenuItem;
    ProtocolodeEntregadeDocumentos1: TMenuItem;
    ExportaContas1: TMenuItem;
    ExportarparaSISCOBRA1: TMenuItem;
    SdArquivo: TSaveDialog;
    LanaJurosManual1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BaixadoContasReceber1Click(Sender: TObject);
    procedure RelaodeContasReceberpVencimentos1Click(Sender: TObject);
    procedure RelaodeTtulosporCliente1Click(Sender: TObject);
    procedure MovimentoContasReceber1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtClienteClick(Sender: TObject);
    procedure BtBancoClick(Sender: TObject);
    procedure BtFinalidadeClick(Sender: TObject);
    procedure RelaodeTtulosAbertos1Click(Sender: TObject);
    procedure RelaodeTtulosBaixados1Click(Sender: TObject);
    procedure RelaodeTtulosVencidos1Click(Sender: TObject);
    procedure EmissodeBloqueto2Click(Sender: TObject);
    procedure EmissodeNotaPromissria1Click(Sender: TObject);
    procedure EmissodeDuplicatas1Click(Sender: TObject);
    procedure RelaodeTtulosAbertosSaldos1Click(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure EmissodeRecibos1Click(Sender: TObject);
    procedure VoltaBaixadeTitulos1Click(Sender: TObject);
    procedure TtulosemAbertoVendedor1Click(Sender: TObject);
    procedure BtVendedorClick(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure RelatrioTtulosRecebidos1Click(Sender: TObject);
    procedure RelatrioTtulosRecebidosBancos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure Arquivoremessa6411Click(Sender: TObject);
    procedure QClick(Sender: TObject);
    procedure RelatrioArquivodeRemessa6411Click(Sender: TObject);
    procedure GerarArquivoSCI1Click(Sender: TObject);
    procedure EmissoRecibo1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Capitalizao1Click(Sender: TObject);
    procedure ResumoPorSiglaBanco1Click(Sender: TObject);
    procedure ArquivoRemessaHSBC1Click(Sender: TObject);
    procedure RetornoRemessaHSBC1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EmissoBloquetoTotal1Click(Sender: TObject);
    procedure VoltarStatusregistros1Click(Sender: TObject);
    procedure ResumoCtaReceberDiario1Click(Sender: TObject);
    procedure LiberaBaixaClick(Sender: TObject);
    procedure ReciboComplementarJuro1Click(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure ArquivoRemessaIta1Click(Sender: TObject);
    procedure RetornoRemessaIta1Click(Sender: TObject);
    procedure CartadeCobrana1Click(Sender: TObject);
    procedure SbOrdemCompraClick(Sender: TObject);
    procedure ArquivoRemessaSicrediClick(Sender: TObject);
    procedure RetornoRemessaSicredi1Click(Sender: TObject);
    procedure ArquivoRemessaBradesco1Click(Sender: TObject);
    procedure RetornoRemessaBradesco1Click(Sender: TObject);
    procedure TtulosporFinalidade1Click(Sender: TObject);
    procedure TtulospDtEmisso1Click(Sender: TObject);
    procedure ReciboComissao1Click(Sender: TObject);
    procedure RelatoSerasa1Click(Sender: TObject);
    procedure RetornoRemessaBancoRural1Click(Sender: TObject);
    procedure EmissoCarn1Click(Sender: TObject);
    procedure GeraContratoClick(Sender: TObject);
    procedure ArquivoRemessaCNAB2401Click(Sender: TObject);
    procedure HistricoContrato1Click(Sender: TObject);
    procedure RelDescontoCheque1Click(Sender: TObject);
    procedure ClculodeDesconto1Click(Sender: TObject);
    procedure RemessaV0801Click(Sender: TObject);
    procedure CpiadeBloqueto1Click(Sender: TObject);
    procedure ArquivoRetornoCNAB2401Click(Sender: TObject);
    procedure RetornoV0801Click(Sender: TObject);
    procedure GeraArquivoSERASA1Click(Sender: TObject);
    procedure TotaldeCRporPerodo1Click(Sender: TObject);
    procedure BoletimdeRegistroSCPC1Click(Sender: TObject);
    procedure ResumoMovContasaReceber1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Autorizaodefatura1Click(Sender: TObject);
    procedure TitAbertosSintticoporDepto1Click(Sender: TObject);
    procedure RelatrioMovimentao1Click(Sender: TObject);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sicredicnab240v0811Click(Sender: TObject);
    procedure NumBloqEmitidosporBanco1Click(Sender: TObject);
    procedure ZerarComisso1Click(Sender: TObject);
    procedure SBVendedorPublicarClick(Sender: TObject);
    procedure SBVendedorPublicar1Click(Sender: TObject);
    procedure RelComissaoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure BloquetoAgrupadopPeriodo1Click(Sender: TObject);
    procedure tulosAbertosOutrasMoedas1Click(Sender: TObject);
    procedure CalculaVariaoCambial1Click(Sender: TObject);
    procedure ProtocolodeEntregadeDocumentos1Click(Sender: TObject);
    procedure ExportaContas1Click(Sender: TObject);
    procedure ExportarparaSISCOBRA1Click(Sender: TObject);
    procedure LanaJurosManual1Click(Sender: TObject);
    //procedure RelatoSerasa1Click(Sender: TObject);

  private
    { Private declarations }
    wExportar: Boolean;
    procedure atualiza_Bloquetos;
    procedure atualiza_BloquetoCompleto;
    procedure Imprime_Comissao(wVendedor: Integer; wComissao: Real);
    procedure BaixaTituloRetorno(wValor_Juro, wValor_Desconto, wValor_Baixa,
      wPagto_Juro: Real;
      NNumero, mDataLiquidacao, mDataCredito: string);
    //    procedure BaixaTituloRetorno(S: String);   // Banco do Brasil
    procedure BaixaTituloHSBC(S: string); // Banco HSBC
    procedure BaixaTituloRURAL(S: string);
    function RetornoErroSicredi(wErro: string): string;
    function RetornaErroItau(CodErro, Erro: string): string;
    function RetornaErroBradesco(wstrErro: string): string;
    function RetornaErroSantander(wStrErro: string): string;
    function RetornaErroUnibanco(wStrErro: string): string;
    procedure ExportarSISCOBRA_novo;

  public
    { Public declarations }
    procedure Monta_SQL_Safra_Bradesco;

  end;

var
  FContasReceberCad: TFContasReceberCad;
  WinWord, Docs, Doc: Variant;
  wNum_Titulo: string;

implementation

uses UContasReceber_cl, UOracle_cl, UContasReceberCons, UContasReceberBaixa,
  UContasReceberParam, URContasReceberClientes, URContasReceber_Vencimentos,
  URContasReceberMov, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UBancosCons, UFinalidadeCons, UFinalidade_cl, UBancoAgencia_cl,
  ULiberaBaixa, URContasReceber_TitulosAbertos,
  URContasReceber_TitulosBaixados, URContasReceber_VencimentosSintetico,
  URContasReceber_TitVenc, UContasReceber_Capitalizacao,
  URBloqueto_BB, URPromissoria, URContasReceber_Duplicatas,
  URContasReceber_Saldos, UDepartamentoCons,
  UDepartamento_cl, UBloqueto, URRecibo, UBiblioteca, URecibos2,
  UContasReceberVoltaBaixa, UParamSistema_cl,
  URContasReceber_Duplicatas_CGS, URContasReceber_Duplicatas_Faville,
  URContasReceber_Tit_Aberto_Vend, URContasReceber_Tit_Vend_Aberto,
  URContasReceber_Duplicatas_Ab, URPromissoria_Branco, UVendedorCons,
  UVendedor_cl, URComissao, URContasReceber_Recebidos,
  URContasReceber_Receb_Bancos, URContasReceber_Tit_Vend_Aberto_1,
  URContasReceber_Duplicatas_GONZATTI,
  UContaCorrenteCons, USequencia_cl,
  UUsuario_cl, UPlanilha_cl, URRemessas_641,
  UCaixa_cl, UCaixaLanc_Cont, Ucontrato_cl, URContrato,
  URContasReceberResumo, UContasReceberVoltaTitEnviado, URContaReceberTotalDia,
  URCartaCobranca, UOrdemCompraCons, UOrdemCompra_cl,
  URContasReceber_Duplicatas_MEDIBENS,
  URContasReceber_Finalidade, URTitulosEmissao, UReciboComissao,
  URCartaCobrancaCiviero, URCartaCobrancaFaville, URBloqueto_Bradesco,
  UObraContratoMovCons, UObraContrato_cl, URHistoricoContrato,
  URRemessasDesconto, URCalculoDesconto, UContasReceber_Rel_cl,
  URTotalCRPeriodo, URResumoMovCReceber, URTituloAberto_Depto_Sint,
  URMovimentacao, URBloquetoSafra, UBancoAgenciaRel_cl, URBloqEmitBanco,
  UPromissoria, URComissaoPublicar, URBoletaBB,
  URTitulosAbertos_OutrasMoedas, UMoeda_cl, URProtocoloEntregaDocumento,
  URRetornoRemessaBB;

{$R *.DFM}

{ Função remove mascara cgc/cpf e acrescenta zeros
 A Função RMASKCGC_CPF, serve tanto para CGC/CPF como para numeros que necessitam
 ser preechidos com zeros inicial para isso informe a string, seguido do tamanho desejado.}

function formatCC(s: string): string;
var
  i: integer;
begin
  result := '';
  for i := 1 to length(s) do
  begin
    if s[i] = '-' then
      break;
    result := result + s[i];
  end;
end;

function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var
  S, Aux: string;
  x, c: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A'..'Z'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  for x := 1 to Zeros do
    Aux := '0' + Aux;
  C := Length(S);
  for x := Zeros downto 1 do
  begin
    Aux[x] := S[C];
    Dec(C, 1);
    if C < 1 then
      Break;
  end;
  S := Aux;

  Result := S;

end;

{ Função converte espacos em branco/ponto/virgula em zeros }

function StrZero(Num: Real; Zeros, Deci: integer): string;
var
  V: string;
  Z: Integer;
begin

  Str(Num: Zeros: Deci, V);
  Trim(V);
  { Convert spaces to zeroes }
  while Pos(' ', V) > 0 do
  begin
    V[Pos(' ', V)] := '0'
  end;

  while (Pos('.', V) > 0) or (Pos(',', V) > 0) do
  begin
    z := Pos('.', V); // Pega posição
    Delete(V, z, 1); // Deleta na posição.
    Insert('0', V, 1); // Inclui 0 na primeira posicao.
  end;
  Result := V;
end;

// -------------------------------------------------------\\
{ Função remove acentos da string passada como parametro}

function RemoveAcento(Texto: string): string;
var
  i: integer;
begin
  // Abaixo a relação de alguns caracteres não suportado por mainframes em especial(BB)
  for i := 1 to length(Texto) do
    case Texto[i] of
      'á': Texto[i] := 'a';
      'é': Texto[i] := 'e';
      'í': Texto[i] := 'i';
      'ó': Texto[i] := 'o';
      'ú': Texto[i] := 'u';
      'à': Texto[i] := 'a';
      'è': Texto[i] := 'e';
      'ì': Texto[i] := 'i';
      'ò': Texto[i] := 'o';
      'ù': Texto[i] := 'u';
      'â': Texto[i] := 'a';
      'ê': Texto[i] := 'e';
      'î': Texto[i] := 'i';
      'ô': Texto[i] := 'o';
      'û': Texto[i] := 'u';
      'ä': Texto[i] := 'a';
      'ë': Texto[i] := 'e';
      'ï': Texto[i] := 'i';
      'ö': Texto[i] := 'o';
      'ü': Texto[i] := 'u';
      'õ': Texto[i] := 'o';
      'ñ': Texto[i] := 'n';
      'ç': Texto[i] := 'c';
      'Á': Texto[i] := 'A';
      'É': Texto[i] := 'E';
      'Í': Texto[i] := 'I';
      'Ó': Texto[i] := 'O';
      'Ú': Texto[i] := 'U';
      'À': Texto[i] := 'A';
      'È': Texto[i] := 'E';
      'Ì': Texto[i] := 'I';
      'Ò': Texto[i] := 'O';
      'Ù': Texto[i] := 'U';
      'Â': Texto[i] := 'A';
      'Ê': Texto[i] := 'E';
      'Î': Texto[i] := 'I';
      'Ô': Texto[i] := 'O';
      'Û': Texto[i] := 'U';
      'Ä': Texto[i] := 'A';
      'Ë': Texto[i] := 'E';
      'Ï': Texto[i] := 'I';
      'Ö': Texto[i] := 'O';
      'Ü': Texto[i] := 'U';
      'Ã': Texto[i] := 'A';
      'Õ': Texto[i] := 'O';
      'Ñ': Texto[i] := 'N';
      'Ç': Texto[i] := 'C';
      '&': Texto[i] := ' ';
      '*': Texto[i] := ' ';
      '_': Texto[i] := ' ';
      '-': Texto[i] := ' ';
      '@': Texto[i] := ' ';
      '#': Texto[i] := ' ';
      '$': Texto[i] := ' ';
      '|': Texto[i] := ' ';
    end;

  Result := Texto;

end;

{funçao formata uma string de um valor numerico em uma quantidade de numeros inteiros e decimais}

function intdecimais(wValor: string; wTamanho, wDecimais: integer): string;
var
  C, Cont, Posicao: integer;
  Res, Aux: string;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  if wValor <> '' then
  begin
    Str(StrToFloat(Trim(wValor)): wTamanho: wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    begin
      Posicao := Pos('.', Res);
      Delete(Res, Posicao, 1);
    end;

    C := Length(Res);
    for Cont := wTamanho downto 1 do
    begin
      Aux[Cont] := Res[C];
      Dec(C, 1);
      if C < 1 then
        Break;
    end;

  end;
  Res := Aux;
  Result := Res;
end;

procedure TFContasReceberCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMContasReceber do
  begin
    QcontasReceber_Cab.Open;
    QContasReceber_Mov.Open;
  end;
  if DMOracle.BuscaNome('SELECT IND_ACEITE_CR FROM TB_PARAM_SISTEMA',
    'IND_ACEITE_CR IS NOT NULL') = 'S' then
  begin
    DBRGAceite.Visible := True;
    LiberaBaixa.Visible := True;
  end
  else
  begin
    DBRGAceite.Visible := False;
    LiberaBaixa.Visible := False;
  end;

  //---adicionado por Fabio para indicar titulos que foram env. para desc. zadimel 13/12/2004
  if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ZADIMEL' then
    DBRGDesconto.Visible := True
  else
    DBRGDesconto.Visible := false;
  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ENCOPEL' then
    DBRadioGroup3.Caption := 'Emitido Dupl';

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' then
    //faz algumas alterações para publicar
  begin //por conta de ter 2 vendedores para cada titulo
    PageControl1.Pages[3].TabVisible := true;
    MMCadSimples.Items[1].Items[16].Enabled := false;
    //desabilita o relatorio de comissão de vendedores
    MMCadSimples.Items[1].Items[16].Visible := false;
    MMCadSimples.Items[1].Items[40].Enabled := true;
    //habilita o relatorio de comissao para publicar
    MMCadSimples.Items[1].Items[40].Visible := true;
    Label18.Visible := false;
    DBEdit18.Visible := false;
    BtVendedor.Visible := false;
    DBEdit23.Visible := false;
    label20.Visible := false;
    DBEdit20.Visible := false;
  end
  else
  begin
    MMCadSimples.Items[1].Items[16].Enabled := true;
    MMCadSimples.Items[1].Items[16].Visible := true;
    MMCadSimples.Items[1].Items[40].Enabled := false;
    MMCadSimples.Items[1].Items[40].Visible := false;
    PageControl1.Pages[3].TabVisible := false;
  end;
  BtCopia.Visible := false;

  wExportar := False;
end;

procedure TFContasReceberCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo, wCodDoc, wCodCompl, wCodHistorico, wVlrLancto: Real;
  wHistorico_Inclusao, wNumDoc, wTestaNulo, wContaCred, wContaDeb, wGerar,
    wContabiliza_Inclusao: string;
  wDtLancto: TDateTime;
  wFilial, wFilial_Cred: Integer;
begin
  DmUsuario.Checar_Filial_Usuario(DMContasReceber.QContasReceber_CabCOD_FILIAL.Text, 'CONTAS A RECEBER');
  if DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE',
    'COD_FINALIDADE  = ' +
    FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value)) = 'NAO' then
    raise Exception.Create('Finalidade Nao Liberada Para Uso');
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMContasReceber.QContasReceber_CabDt_Emissao.Value then
    raise Exception.Create('Lançamento Não Permitido - Fechamento Contabil');
  wCodHistorico := 0; // Inicializa variavel.
  if DMContasReceber.QContasReceber_Cab.State = dsInsert then
    wGerar := 'Sim'
  else
    wGerar := 'Nao';
  wCodigo := DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise exception.create('Erro! Transação não efetuada');
  end;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceber_Cab.SetVariable('PK', wCodigo);
  DMContasReceber.QContasReceber_Cab.Open;
  if wGerar = 'Sim' then
  begin
    wHistorico_Inclusao :=
      DMOracle.BuscaNome('SELECT COD_HISTORICO_CAIXA_INCLUSAO FROM TB_FINALIDADE',
      'COD_FINALIDADE  = ' +
      FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value), True);
    wContabiliza_Inclusao :=
      DMOracle.BuscaNome('SELECT IND_CONTABILIDADE FROM TB_FINALIDADE',
      'COD_FINALIDADE  = ' +
      FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value), True);
    if (wHistorico_Inclusao) <> '' then
      if DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text = '' then
      begin
        DMCaixa.QCaixa_Mov.Open;
        DMCaixa.QCaixa_Mov.Insert;
        DMCaixa.QCaixa_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
        DMCaixa.QCaixa_MovDT_Usuario.Value := DMOracle.DataHoraServ;
        if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
        begin
          DMCaixa.QCaixa_MovCod_Filial.Value := 1;
          DMCaixa.QCaixa_MovCod_Departamento.Value :=
            StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO',
            'COD_USUARIO = ' + FloatToStr(DMUsuario.CodUsuarioCorrente), True));
        end
        else
        begin
          DMCaixa.QCaixa_MovCod_Filial.Value :=
            StrToInt(DMContasReceber.QContasReceber_CabCod_Filial.Text);
          DMCaixa.QCaixa_MovCod_Departamento.Value :=
            StrToInt(DMContasReceber.QContasReceber_CabCod_Departamento.Text);
        end;
        DMCaixa.QCaixa_MovCod_Historico.Value := StrToInt(wHistorico_Inclusao);
        DMcaixa.QCaixa_MovDT_Movimento.value :=
          DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        DMcaixa.QCaixa_MovVal_Movimento.value :=
          DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        DMcaixa.QCaixa_MovNum_Documento.value :=
          DMContasReceber.QContasReceber_CabNum_Titulo.Value;
        DMcaixa.QCaixa_MovCod_Cadastro.value :=
          DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        DMcaixa.QCaixa_MovCod_Conta_Receber_Cab.value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        DMCaixa.QCaixa_Mov.Post;
        DMCaixa.QCaixa_Mov.Close;
      end
      else
      begin
        DMBancoAgencia.QBancoMovimento.Open;
        DMBancoAgencia.QBancoMovimento.Insert;
        DMBancoAgencia.QBancoMovimentoCod_Usuario.Value :=
          DMUsuario.CodUsuarioCorrente;
        DMBancoAgencia.QBancoMovimentoDT_Usuario.Value :=
          Trunc(DMOracle.DataHoraServ);
        DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Value;
        DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
          StrToInt(wHistorico_Inclusao);
        DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
          DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
          DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        DMBancoAgencia.QBancoMovimentoNum_Cheque.value :=
          DMContasReceber.QContasReceber_CabNum_Titulo.Value;
        DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
          DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value :=
          DMContasReceber.QContasReceber_CabDesc_Cliente.Value;
        DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
          DMContasReceber.QContasReceber_CabCod_Departamento.Value;
        DMBancoAgencia.QBancoMovimento.Post;
        DMBancoAgencia.QBancoMovimento.Close;
      end;
    if wContabiliza_Inclusao = 'S' then
    begin
      if DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text = '' then
        // lancamento por caixa caso contrario por banco
        wContaCred :=
          DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE',
          'COD_FINALIDADE = ' +
          DMContasReceber.QContasReceber_CabCod_Finalidade.Text,
          True)
      else
        wContaCred :=
          DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA',
          'COD_BANCO_AGENCIA = ' +
          DMContasReceber.QContasReceber_CabCod_Banco_Agencia.Text, True);
      wContaDeb :=
        DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE',
        'COD_FINALIDADE = ' +
        DMContasReceber.QContasReceber_CabCod_Finalidade.Text, True);
      if (wContaCred <> '') or
        (wContaDeb <> '') then
      begin
        wCodDoc :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        wNumDoc :=
          FloatToStr(DMContasReceber.QContasReceber_CabNum_Titulo.Value);
        wFilial := DMContasReceber.QContasReceber_CabCod_Filial.Value;
        wCodCompl := DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        wTestaNulo :=
          DMOracle.BuscaNome('SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE',
          'COD_FINALIDADE = ' +
          DMContasReceber.QContasReceber_CabCod_Finalidade.Text,
          True);
        if Trim(wTestaNulo) <> '' then
          wCodHistorico := StrToFloat(wTestaNulo);
        wVlrLancto := DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        wDtLancto := DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        if FCaixa_Lanc_Cont = nil then
          FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
        FCaixa_Lanc_Cont.MEContaCredito.text := wContaCred;
        if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
          FCaixa_Lanc_Cont.pFilial := 1
        else
          FCaixa_Lanc_Cont.pFilial := wFilial;
        FCaixa_Lanc_Cont.MEContaDebito.Text := wContaDeb;
        FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
        FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
        FCaixa_Lanc_Cont.Label3.Visible := False;
        FCaixa_Lanc_Cont.Label4.Visible := False;
        FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
        FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
        FCaixa_Lanc_Cont.ShowModal;
        DMOracle.DBCemapa.StartTransaction;
        DMContasReceber.QContasReceber_Mov.Edit;
        wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text,
          '.');
        wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
        wFilial_Cred := wFilial;
        if (DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text <> '') and
          (DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') then
          wFilial_Cred := 1;
        DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Cred, wContaCred,
          'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto,
          wContaDeb);
        DMContasReceber.QContasReceber_MovCOD_LANCTO_CONTABIL_CRED.Value :=
          DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

        DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial, wContaDeb,
          'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto,
          wContaCred);
        DMContasReceber.QContasReceber_MovCOD_LANCTO_CONTABIL_DEB.Value :=
          DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

        DMContasReceber.QContasReceber_Mov.Post;
      end;
    end;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFContasReceberCad.SBCancelarClick(Sender: TObject);
var
  wCodigo: Real;
begin
  wCodigo := DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
  inherited;
  DMOracle.DBCemapa.RollBack;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceber_Cab.SetVariable('PK', wCodigo);
  DMContasReceber.QContasReceber_Cab.Open;
end;

procedure TFContasReceberCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, Dsedit] then
  begin
    BtBanco.Enabled := True;
    BtFilial.Enabled := True;
    BtFinalidade.Enabled := True;
    BtCliente.Enabled := True;
    BtDepartamento.Enabled := True;
    BtVendedor.Enabled := True;
    BtContaCorrente.Enabled := True;
    Opcao.Enabled := False;
    SbOrdemCompra.Enabled := True;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' then
    begin
      if PageControl1.Pages[3].TabVisible then
      begin
        SBVendedorPublicar.Enabled := true;
        SBVendedorPublicar1.Enabled := true
      end;
    end;
  end
  else
  begin
    BtBanco.Enabled := False;
    BtFilial.Enabled := False;
    BtFinalidade.Enabled := False;
    BtCliente.Enabled := False;
    BtDepartamento.Enabled := False;
    BtContaCorrente.Enabled := False;
    BtVendedor.Enabled := False;
    SbOrdemCompra.Enabled := False;
    Opcao.Enabled := True;
  end;
  if DSPrimario.State = Dsedit then
  begin
    DBEValorJuro.ReadOnly := True;
    DBEValorTitulo.ReadOnly := True;
    DBEDtEmissao.ReadOnly := True;
  end
  else
  begin
    DBEValorJuro.ReadOnly := False;
    DBEValorTitulo.ReadOnly := False;
    DBEDtEmissao.ReadOnly := False;
  end;
end;

procedure TFContasReceberCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = nil then
    FContasReceberCons := TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal = mrOK then
  begin
    with DMContasReceber do
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
    end;
  end;
end;

procedure TFContasReceberCad.BaixadoContasReceber1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberBaixa = nil then
    FContasReceberBaixa := TFContasReceberBaixa.Create(Application);
  FContasReceberBaixa.ShowModal;
end;

procedure TFContasReceberCad.RelaodeContasReceberpVencimentos1Click(
  Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[0].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME0CodFilial.Text,
      'CONTAS A RECEBER');
    if FRContasReceber_Vencimentos = nil then
      FRContasReceber_Vencimentos :=
        TFRContasReceber_Vencimentos.Create(Application);
    with DMContasReceber do
    begin
      QRContasReceber_Vencimentos.Close;
      if Trim(FContasReceberParam.ME0DataInicial.Text) = '' then
        raise
          Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
      FRContasReceber_Vencimentos.QRLDataInicial.Caption :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataInicial.Text));
      DataInicial :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataInicial.Text));
      QRContasReceber_Vencimentos.SetVariable('DT_VENC_INICIAL',
        FContasReceberParam.ME0DataInicial.Text);

      if Trim(FContasReceberParam.ME0DataFinal.Text) = '' then
        raise
          Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
      FRContasReceber_Vencimentos.QRLDataFinal.Caption :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataFinal.Text));
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME0DataFinal.Text));
      QRContasReceber_Vencimentos.SetVariable('DT_VENC_FINAL',
        FContasReceberParam.ME0DataFinal.Text);

      if Trim(FContasReceberParam.ME0CodFilial.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('FILIAL',
          FContasReceberParam.ME0CodFilial.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.ME0CodFinalidade.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('FINALIDADE',
          FContasReceberParam.ME0CodFinalidade.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('FINALIDADE', Null);

      if Trim(FContasReceberParam.ME0CodCliente.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('CADASTRO',
          FContasReceberParam.ME0CodCliente.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('CADASTRO', Null);

      if Trim(FContasReceberParam.ME0CodBanco.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('BANCO',
          FContasReceberParam.ME0CodBanco.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.ME0Serie.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO',
          FContasReceberParam.ME0Serie.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if Trim(FContasReceberParam.ME0CodDepto.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME0CodDepto.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME0DtEmissaoInicial.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_INICIAL',
          Trim(FContasReceberParam.ME0DtEmissaoInicial.Text))
      else
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_INICIAL', Null);
      if Trim(FContasReceberParam.ME0DtEmissaoFinal.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_FINAL',
          Trim(FContasReceberParam.ME0DtEmissaoFinal.Text))
      else
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_FINAL', Null);

      QRContasReceber_Vencimentos.SetVariable('DT_BASE',
        FContasReceberParam.ME0DtBase.Text);
      DMContasReceber.pDataBase :=
        StrToDate(FContasReceberParam.ME0DtBase.Text);
      QRContasReceber_Vencimentos.Open;
    end;

    if FContasReceberParam.RGTipo.ItemIndex = 0 then // Analítico
    begin
      if FRContasReceber_Vencimentos = nil then
        FRContasReceber_Vencimentos :=
          TFRContasReceber_Vencimentos.Create(Application);
      if FContasReceberParam.ME0Departamento.Text = '' then
        FRContasReceber_Vencimentos.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: Todos'
      else
        FRContasReceber_Vencimentos.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME0Departamento.Text;
      FRContasReceber_Vencimentos.QRLReferencia.Caption :=
        Trim(FContasReceberParam.ME0DtBase.Text);
      FRContasReceber_Vencimentos.QRLPeriodoEmissao.Caption := 'Emissão: ' +
        FContasReceberParam.ME0DtEmissaoInicial.Text + ' Até ' +
        FContasReceberParam.ME0DtEmissaoFinal.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Vencimentos.QRPrimario.Preview
      else
        FRContasReceber_Vencimentos.QRPrimario.Print;
    end
    else
    begin
      if FRContasReceber_VencimentosSintetico = nil then
        FRContasReceber_VencimentosSintetico :=
          TFRContasReceber_VencimentosSintetico.Create(Application);
      FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption := 'PERIODO DE : '
        + DataInicial + ' ATÉ : ' + DataFinal;
      FRContasReceber_VencimentosSintetico.QRLPeriodoEmissao.Caption :=
        'Emissão: ' + FContasReceberParam.ME0DtEmissaoInicial.Text + ' Até ' +
        FContasReceberParam.ME0DtEmissaoFinal.Text;
      if FContasReceberParam.ME0Departamento.Text = '' then
        FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption :=
          FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption + ' Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: Todos'
      else
        FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption :=
          FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption + ' Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME0Departamento.Text;
      FRContasReceber_VencimentosSintetico.QRLReferencia.Caption :=
        Trim(FContasReceberParam.ME0DtBase.Text);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_VencimentosSintetico.QRPrimario.Preview
      else
        FRContasReceber_VencimentosSintetico.QRPrimario.Print;
    end;
    DMContasReceber.QRContasReceber_Vencimentos.Close;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosporCliente1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[1].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME1CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Cab.Close;
      QRContasReceber_Mov.Close;
      QRContasReceber_Produtos.Close;
      QRContasReceber_Cab.Sql.Clear;
      QRContasReceber_Cab.Sql.ADD('SELECT TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB,TB_CONTA_RECEBER_CAB.COD_FINALIDADE,TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.COD_FILIAL,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.NUM_PARCELA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO,TB_CONTA_RECEBER_CAB.DT_BAIXA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DT_VENCIMENTO,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_CAPITALIZACAO,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DT_CAPITALIZACAO_MOEDA,TB_CONTA_RECEBER_CAB.VAL_TITULO,TB_CONTA_RECEBER_CAB.COD_NOTA_CAB,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DESC_OBSERVACAO,TB_CONTA_RECEBER_CAB.IND_ACEITE,TB_CONTA_RECEBER_CAB.IND_SITUACAO,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.VAL_ORIGINAL,TB_CONTA_RECEBER_CAB.VAL_JUROS,TB_CADASTRO.NOME,TB_CADASTRO.DESC_ENDERECO,TB_CADASTRO.NUM_CGC_CPF,');
      QRContasReceber_Cab.Sql.ADD('TB_CADASTRO.COD_CADASTRO,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_BAIRRO,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,');
      QRContasReceber_Cab.Sql.ADD('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_FINALIDADE.NUM_DIAS_CARENCIA FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_FINALIDADE,TB_CLASS_CADASTRO WHERE ');
      QRContasReceber_Cab.Sql.ADD('(TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO) ');
      QRContasReceber_Cab.Sql.ADD(' AND (TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE) ');
      QRContasReceber_Cab.Sql.ADD(' AND (TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO) ');
      if Trim(FContasReceberParam.ME1CodFilial.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME1CodFilial.Text));
      if Trim(FContasReceberParam.ME1Codigo.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = '
          + Trim(FContasReceberParam.ME1Codigo.Text));
      if Trim(FContasReceberParam.ME1CodDepto.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' + Trim(FContasReceberParam.ME1CodDepto.Text));
      if Trim(FContasReceberParam.ME1Finalidade.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = '
          + Trim(FContasReceberParam.Me1Finalidade.Text));
      if Trim(FContasReceberParam.ME1CGCCPF.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CADASTRO.NUM_CGC_CPF = ' +
          Trim(FContasReceberParam.ME1CGCCPF.Text));
      if FContasReceberParam.RGSituacao.ItemIndex <> 2 then
        if FContasReceberParam.RGSituacao.ItemIndex = 0 then
          // os que estão em aberto
          QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39))
        else // os que estão baixados Total Ou baixados parcial
          QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + chr(39) + 'ABERTO' + chr(39));
      if Trim(FContasReceberParam.ME1Inicial.text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= '
          + chr(39) + Trim(FContasReceberParam.ME1Inicial.text) + chr(39));
      if Trim(FContasReceberParam.ME1Final.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= '
          + chr(39) + Trim(FContasReceberParam.ME1Final.text) + chr(39));
      if Trim(FContasReceberParam.Me1DtBaixa_Inic.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.DT_BAIXA >= ' +
          chr(39) + Trim(FContasReceberParam.Me1DtBaixa_Inic.text) + chr(39));
      if Trim(FContasReceberParam.Me1DtBaixa_Fim.Text) <> '' then
        QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.DT_BAIXA <= ' +
          chr(39) + Trim(FContasReceberParam.Me1DtBaixa_Fim.text) + chr(39));
      case FContasReceberParam.Rg1Ordem.ItemIndex of
        0:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        1:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        2:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        3:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        4:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        5:
          QRContasReceber_Cab.Sql.ADD(' ORDER  BY  TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
      end;
      if Trim(FContasReceberParam.ME1DtReferencia.Text) = '' then
        raise Exception.Create('Preencher Data Referencia de Juros');
      DMContasReceber.pDataReferencia :=
        StrToDate(FContasReceberParam.ME1DtReferencia.Text);
      QRContasReceber_Cab.Open;
      QRContasReceber_Mov.Open;
      QRContasReceber_Produtos.Open;
    end;
    if FRContasReceber_Clientes = nil then
      FRContasReceber_Clientes := TFRContasReceber_Clientes.Create(Application);
    FRContasReceber_Clientes.QRLPeriodo.Caption := 'PERÍODO DE : ' +
      FContasReceberParam.ME1Inicial.text + ' ATÉ : ' +
      FContasReceberParam.ME1Final.text;
    if FContasReceberParam.ME1Departamento.Text = '' then
      FRContasReceber_Clientes.QRLDepartamento.Caption := 'Dt.Referência:' +
        FContasReceberParam.ME1DtReferencia.Text + ' - Filial:' +
        Trim(FContasReceberParam.ME1Filial.Text) + ' - Departamento: Todos'
    else
      FRContasReceber_Clientes.QRLDepartamento.Caption := 'Dt.Referência:' +
        FContasReceberParam.ME1DtReferencia.Text + ' - Filial:' +
        Trim(FContasReceberParam.ME1Filial.Text) + ' - Departamento: ' +
        Trim(FContasReceberParam.ME1Departamento.Text);

    //Se for RUDI, aumenta o tamanho da banda e acresceta campos de endereço, bairro e telefone
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI' then
    begin
      //aumentar banda
      FRContasReceber_Clientes.QRGroup1.Height := 57;
      //endereco
      FRContasReceber_Clientes.QRLabel24.Top := 16;
      FRContasReceber_Clientes.QRDBText22.Top := 16;
      //bairro
      FRContasReceber_Clientes.QRLabel26.Top := 16;
      FRContasReceber_Clientes.QRDBText23.Top := 16;
      //telefone
      FRContasReceber_Clientes.QRLabel25.Top := 16;
      FRContasReceber_Clientes.QRDBText24.Top := 16;

      //Coloca para baixo labels da banda de baixo
      FRContasReceber_Clientes.QRLabel3.Top := 40;
      FRContasReceber_Clientes.QRLabel4.Top := 40;
      FRContasReceber_Clientes.QRLabel13.Top := 40;
      FRContasReceber_Clientes.QRLabel20.Top := 40;
      FRContasReceber_Clientes.QRLabel19.Top := 40;
      FRContasReceber_Clientes.QRLabel14.Top := 40;
      FRContasReceber_Clientes.QRLabel11.Top := 40;
      FRContasReceber_Clientes.QRLabel12.Top := 40;
      FRContasReceber_Clientes.QRLabel21.Top := 40;

    end;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_Clientes.QRPrimario.Preview
    else
      FRContasReceber_Clientes.QRPrimario.Print;
    DMContasReceber.QRContasReceber_Cab.Close;
    DMContasReceber.QRContasReceber_Mov.Close;
    DMContasReceber.QRContasReceber_Produtos.Close;
  end;
end;

procedure TFContasReceberCad.MovimentoContasReceber1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[2].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME2CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME2Inicial.text) = '') or
      (Trim(FContasReceberParam.ME2Final.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRCReceber_Mov.Close;
      if Trim(FContasReceberParam.ME2CodCliente.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME2CodCliente.Text)
      else
        QRCReceber_Mov.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME2CodDepto.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME2CodDepto.Text)
      else
        QRCReceber_Mov.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME2CodFilial.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_FILIAL',
          FContasReceberParam.ME2CodFilial.Text)
      else
        QRCReceber_Mov.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME2CodVendedor.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME2CodVendedor.Text)
      else
        QRCReceber_Mov.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME2CC.Text) <> '' then
        QRCReceber_Mov.SetVariable('CC', FContasReceberParam.ME2CC.Text)
      else
        QRCReceber_Mov.SetVariable('CC', Null);

      if Trim(FContasReceberParam.ME2Finalidade.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_FINALIDADE',
          trim(FContasReceberParam.ME2Finalidade.Text))
      else
        QRCReceber_Mov.SetVariable('COD_FINALIDADE', Null);

      QRCReceber_Mov.SetVariable('INICIAL',
        FContasReceberParam.ME2Inicial.Text);
      QRCReceber_Mov.SetVariable('FINAL', FContasReceberParam.ME2Final.Text);

      case FContasReceberParam.RGIndTipoMov.ItemIndex of
        0: QRCReceber_Mov.SetVariable('TIPO_MOV', 'PRINCIPAL');
        1: QRCReceber_Mov.SetVariable('TIPO_MOV', 'RECEBTO. PRINCIPAL');
        2: QRCReceber_Mov.SetVariable('TIPO_MOV', 'DESC. CONCEDIDO');
        3: QRCReceber_Mov.SetVariable('TIPO_MOV', 'JUROS');
        4: QRCReceber_Mov.SetVariable('TIPO_MOV', 'RECEBTO. JUROS');
        5: QRCReceber_Mov.SetVariable('TIPO_MOV', Null);
      end;
      case FContasReceberParam.RG2FormaPagamento.ItemIndex of
        0: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;
      if FContasReceberParam.RGIndTipoMov.ItemIndex = 0 then
        QRCReceber_Mov.SetVariable('TIPO_MOV1', Null)
      else
        QRCReceber_Mov.SetVariable('TIPO_MOV1', 'PRINCIPAL');
      QRCReceber_Mov.SQL[QRCReceber_Mov.SQL.Count - 1] := '';
      case FContasReceberParam.RG2Ordem.ItemIndex of
        0: QRCReceber_Mov.Sql.Add('TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1: QRCReceber_Mov.Sql.Add('TB_CONTA_RECEBER_CAB.DT_EMISSAO');
        2: QRCReceber_Mov.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO');
        3: QRCReceber_Mov.Sql.Add('TB_CONTA_RECEBER_CAB.NUM_TITULO');
      end;
      QRCReceber_MovTot.Close;
      if Trim(FContasReceberParam.ME2CodCliente.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME2CodCliente.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME2CodFilial.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_FILIAL',
          FContasReceberParam.ME2CodFilial.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_FILIAL', Null);

      QRCReceber_MovTot.SetVariable('INICIAL',
        FContasReceberParam.ME2Inicial.Text);
      DataInicial := DateToStr(StrToDate(FContasReceberParam.ME2Inicial.Text));

      QRCReceber_MovTot.SetVariable('FINAL', FContasReceberParam.ME2Final.Text);
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME2Final.Text));
      if Trim(FContasReceberParam.ME2CodDepto.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME2CodDepto.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME2CodVendedor.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME2CodVendedor.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME2CC.Text) <> '' then
        QRCReceber_Mov.SetVariable('CC', FContasReceberParam.ME2CC.Text)
      else
        QRCReceber_Mov.SetVariable('CC', Null);

      case FContasReceberParam.RGIndTipoMov.ItemIndex of
        0: QRCReceber_MovTot.SetVariable('TIPO_MOV', 'PRINCIPAL');
        1: QRCReceber_MovTot.SetVariable('TIPO_MOV', 'RECEBTO. PRINCIPAL');
        2: QRCReceber_MovTot.SetVariable('TIPO_MOV', 'DESC. CONCEDIDO');
        3: QRCReceber_MovTot.SetVariable('TIPO_MOV', 'JUROS');
        4: QRCReceber_MovTot.SetVariable('TIPO_MOV', 'RECEBTO. JUROS');
        5: QRCReceber_MovTot.SetVariable('TIPO_MOV', Null);
      end;
      case FContasReceberParam.RG2FormaPagamento.ItemIndex of
        0: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;
      if FContasReceberParam.RGIndTipoMov.ItemIndex = 0 then
        QRCReceber_MovTot.SetVariable('TIPO_MOV1', Null)
      else
        QRCReceber_MovTot.SetVariable('TIPO_MOV1', 'PRINCIPAL');
      QRCReceber_Mov.Open;
      QRCReceber_MovTot.Open;

    end;
    if FRContasReceberMov = nil then
      FRContasReceberMov := TFRContasReceberMov.Create(Application);
    FRContasReceberMov.QRPeriodo.Caption := 'PERIODO DE: ' + DataInicial +
      ' ATÉ : ' + DataFinal;
    FRContasReceberMov.QRLCC.Caption := 'Conta Corrente: ' +
      FContasReceberParam.Ed2CC.Text;

    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'FAVILLE') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZADIMEL') then
    begin
      FRContasReceberMov.QRBand3.Enabled := False;
      FRContasReceberMov.QRBand5.Enabled := True;
    end
    else
    begin
      FRContasReceberMov.QRBand3.Enabled := True;
      FRContasReceberMov.QRBand5.Enabled := False;
    end;

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceberMov.QRPrimario.Preview
    else
      FRContasReceberMov.QRPrimario.Print;
    DMContasReceber.QRCReceber_MovTot.Close;
    DMContasReceber.QRCReceber_Mov.Close;
  end;
end;

procedure TFContasReceberCad.SBExcluirClick(Sender: TObject);
begin
  {inherited;}
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >=
    DMContasReceber.QContasReceber_CabDt_Emissao.Value then
    raise
      Exception.Create('Não é Permitido Baixar Este Título - Fechamento Contabil');
  if DMContasReceber.QContasReceber_CabInd_Situacao.Value <> 'ABERTO' then
    raise Exception.Create('Não é Possível Excluir um Titulo Com Baixas');
  if not (DMContasReceber.QContasReceber_CabCod_Nota_Cab.IsNull) or
    not (DMContasReceber.QContasReceber_CabNUM_OS.IsNull) then
    // Não Permite Excluir um Título  Gerado pela Nota
    raise
      Exception.Create('Não é Possível Excluir um registro gerado por uma Nota')
  else
  begin
    if DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value > 0 then
    begin
      if
        MessageDlg('A Exclusão deste Registro irá desfazer todos os movimentos contábeis, '
        + #13 + 'Assim como os Movimentos do contas à Receber. Confirma?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.DBCemapa.StartTransaction; // Termina a transação no AfterDelete
        try
          DMContasReceber.ExcluiMovimentos(DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value);
          DMContasReceber.QContasReceber_Cab.Delete;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.RollBack;
          raise; // exception.create('Erro! Transação não efetuada');
        end;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Filial.Value :=
        DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContasReceberCad.BtClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContasReceberCad.BtBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Banco_Agencia.Value :=
        DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value;
end;

procedure TFContasReceberCad.BtFinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Finalidade.Value :=
        DMFinalidade.QFinalidadeConsCod_Finalidade.Value;
end;

procedure TFContasReceberCad.RelaodeTtulosAbertos1Click(Sender: TObject);
var
  wSql: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[4].TabVisible := True;
  FContasReceberParam.CB4SituacaoVendedor.ItemIndex := 0;

  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME4CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitulosAberto.Close;
      QRContasReceber_TitulosAberto.SQL.Clear;
      wsql :=
        ('SELECT TB_CADASTRO.NOME,TB_VENDEDOR.NOME AS NOME_VENDEDOR,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CELULAR,TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB');
      wSql := wsql +
        (',TB_CADASTRO.desc_endereco,TB_CADASTRO.desc_cidade,TB_CADASTRO.desc_cep,TB_CADASTRO.cod_estado,TB_CADASTRO.num_cgc_cpf');
      wSql := wsql +
        (',TB_CADASTRO.DESC_FONE_EMPRESA,Tb_conta_RECEBER_cab.COD_FILIAL,Tb_conta_RECEBER_cab.COD_FINALIDADE,Tb_conta_RECEBER_cab.COD_BANCO_AGENCIA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_CADASTRO,Tb_conta_RECEBER_cab.COD_VENDEDOR,Tb_conta_RECEBER_cab.NUM_TITULO,Tb_conta_RECEBER_cab.NUM_PARCELA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_TIPO_DOCUMENTO,Tb_conta_RECEBER_cab.DT_MOVIMENTO,Tb_conta_RECEBER_cab.DT_BAIXA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_VENCIMENTO,Tb_conta_RECEBER_cab.DT_EMISSAO,Tb_conta_RECEBER_cab.DT_CAPITALIZACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_CAPITALIZACAO_MOEDA,Tb_conta_RECEBER_cab.VAL_TITULO AS VALT_TITULO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_NOTA_CAB,Tb_conta_RECEBER_cab.DESC_OBSERVACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.IND_ACEITE,Tb_conta_RECEBER_cab.IND_SITUACAO,Tb_conta_RECEBER_cab.VAL_JUROS');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.VAL_ORIGINAL,Tb_filial.DESC_FILIAL,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA');
      wsql := wsql +
        (',TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_AVALISTA1,TB_FINALIDADE.NUM_DIAS_CARENCIA ');
      wsql := wsql +
        (' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_FILIAL,TB_FINALIDADE,TB_CLASS_CADASTRO ');
      wsql := wsql +
        ('WHERE Tb_conta_RECEBER_cab.COD_FILIAL = Tb_filial.COD_FILIAL ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ');
      wsql := wsql +
        (' AND Tb_cadastro.COD_CLASS_CADASTRO = Tb_class_cadastro.COD_CLASS_CADASTRO');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_FINALIDADE = Tb_finalidade.COD_FINALIDADE ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
        wsql := wsql + (' AND (Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'BAIXA TOTAL' + chr(39) + ')')
      else
      begin
        wsql := wsql + (' AND ((Tb_conta_RECEBER_cab.IND_SITUACAO = ' + chr(39)
          +
          'BAIXA PARCIAL' + chr(39) + ')');
        if Trim(FContasReceberParam.ME4DtRefEmissao.Text) <> '' then
        begin
          wsql := wsql + ' OR (Tb_conta_RECEBER_cab.DT_BAIXA > ' + chr(39) +
            FContasReceberParam.ME4DtRefEmissao.Text + chr(39) + ')';
          wsql := wsql + ' OR  (Tb_conta_RECEBER_cab.DT_BAIXA IS NULL))';
        end;
      end;
      if Trim(FContasReceberParam.ME4CodCliente.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = ' +
          Trim(FContasReceberParam.ME4CodCliente.Text));
      if Trim(FContasReceberParam.ME4CodFilial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME4CodFilial.Text));
      if Trim(FContasReceberParam.ME4CodRegiao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_REGIAO = ' +
          Trim(FContasReceberParam.ME4CodRegiao.Text));
      if Trim(FContasReceberParam.ME4CodVendedor.Text) <> '' then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.ME4CodVendedor.Text))
        else
          wsql := wsql + (' AND TB_CADASTRO.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.ME4CodVendedor.Text));
      if Trim(FContasReceberParam.ME4CodBanco.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.ME4CodBanco.Text));
      if Trim(FContasReceberParam.ME4CodFinalidade.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE In (' +
          Trim(FContasReceberParam.ME4CodFinalidade.Text) + ')');
      if Trim(FContasReceberParam.ME4DescDocumento.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO = ' +
          chr(39) + Trim(FContasReceberParam.ME4DescDocumento.Text) + chr(39));
      if Trim(FContasReceberParam.ME4CodDepto.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' +
          Trim(FContasReceberParam.ME4CodDepto.Text));
      wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) +
        FContasReceberParam.ME4DtRefEmissao.Text + chr(39));
      if Trim(FContasReceberParam.ME4Inicial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39)
          + FContasReceberParam.ME4Inicial.Text + chr(39));
      if Trim(FContasReceberParam.ME4final.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39)
          + FContasReceberParam.ME4Final.Text + chr(39));
      if Trim(FContasReceberParam.ME4ContaNao1.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao1.Text));
      if Trim(FContasReceberParam.ME4ContaNao2.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao2.Text));
      if Trim(FContasReceberParam.ME4ContaNao3.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao3.Text));
      if Trim(FContasReceberParam.ME4ContaNao4.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao4.Text));
      if Trim(FContasReceberParam.ME4ContaNao5.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao5.Text));
      if Trim(FContasReceberParam.ME4ContaNao6.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao6.Text));
      if Trim(FContasReceberParam.ME4ContaNao7.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao7.Text));
      if Trim(FContasReceberParam.ME4ContaNao8.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao8.Text));
      if Trim(FContasReceberParam.ME4ContaNao9.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao9.Text));
      if Trim(FContasReceberParam.ME4ContaNao10.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao10.Text));
      if Trim(FContasReceberParam.Me4Classificacao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_CLASS_CADASTRO = ' +
          Trim(FContasReceberParam.Me4Classificacao.Text));
      if Trim(FContasReceberParam.Me4ContratoVenda.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' +
          Trim(FContasReceberParam.Me4ContratoVenda.Text));
      if FContasReceberParam.Rg4Notas.ItemIndex = 0 then
        // SOMENTE LISTAR TITULOS QUE FORAM EMITIDOS POR NOTA FISCAL
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB > 0 ');
      case FContasReceberParam.CB4SituacaoVendedor.ItemIndex of
        1: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) + 'ATIVO'
            + Chr(39));
        2: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) +
            'INATIVO' + Chr(39));
      end;
      if FContasReceberParam.Me4Valor.Text <> '' then
        Wsql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL <= ' +
          FContasReceberParam.Me4Valor.Text);
      if wExportar then
      begin
        wsql := wsql + (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO, Tb_conta_RECEBER_cab.NUM_TITULO, TB_CONTA_RECEBER_CAB.DT_EMISSAO');
      end
      else
      begin
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
        begin
          case FContasReceberParam.RG4Ordem.ItemIndex of
            0: wsql := wsql +
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            1: wsql := wsql +
              (' ORDER BY   Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            2: wsql := wsql +
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
            3: wsql := wsql +
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          end;
        end
        else
        begin
          case FContasReceberParam.RG4Ordem.ItemIndex of
            0: wsql := wsql +
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            1: wsql := wsql +
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            2: wsql := wsql +
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
            3: wsql := wsql +
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          end;
        end;
      end;

      QRContasReceber_TitulosAberto.SQL.Add(wSql);
      DMContasReceber.pDataBase := StrToDate(FContasReceberParam.ME4DtRefEmissao.Text);
      DMContasReceber.pDataReferencia := StrToDate(FContasReceberParam.ME4DtReferencia.Text);
      QRContasReceber_TitulosAberto.Open;
    end;
    if FRContasReceber_TitulosAberto = nil then
      FRContasReceber_TitulosAberto :=
        TFRContasReceber_TitulosAberto.Create(Application);
    FRContasReceber_TitulosAberto.QRLPeriodo.Caption := 'PERIODO DE : ' +
      FContasReceberParam.ME4Inicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME4Final.Text + ' Finalidade:' +
      FContasReceberParam.ME4CodFinalidade.Text;
    FRContasReceber_TitulosAberto.QRLDepartamento.Caption := 'Dt.Referencia:' +
      FContasReceberParam.ME4DtReferencia.Text + ' - Filial:' +
      Trim(FContasReceberParam.ME4Filial.Text);
    if FContasReceberParam.ME4Departamento.Text = '' then
      FRContasReceber_TitulosAberto.QRLOutros.Caption := 'Departamento: Todos'
    else
      FRContasReceber_TitulosAberto.QRLOutros.Caption := 'Departamento: ' +
        FContasReceberParam.ME4Departamento.Text;

    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
    begin
      FRContasReceber_TitulosAberto.QRGroup1.Enabled := False;
      FRContasReceber_TitulosAberto.QRBand5.Enabled := False;
    end;

    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
    begin
      FRContasReceber_TitulosAberto.QRLabel21.Caption := 'Dt. Baixa';
      FRContasReceber_TitulosAberto.QRDBText9.DataField := 'Dt_Baixa';
      FRContasReceber_TitulosAberto.QRDBText9.Mask := '';
      FRContasReceber_TitulosAberto.QRExpr4.Enabled := False;
      FRContasReceber_TitulosAberto.QRExpr5.Enabled := False;
      FRContasReceber_TitulosAberto.QRExpr6.Enabled := False;
    end;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
      (Trim(FContasReceberParam.ME4CodCliente.Text) <> '') then
    begin
      with DMContrato do
      begin
        QRContrato.Close;
        if Trim(FContasReceberParam.ME4CodFilial.Text) <> '' then
          QRContrato.SetVariable('COD_FILIAL',
            FContasReceberParam.ME4CodFilial.Text)
        else
          QRContrato.SetVariable('COD_FILIAL', Null);
        QRContrato.SetVariable('COD_PRODUTO', Null);
        QRContrato.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME4CodCliente.Text);
        QRContrato.SetVariable('COD_VENDEDOR', Null);
        QRContrato.SetVariable('DT_INICIAL', Null);
        QRContrato.SetVariable('DT_FINAL', Null);
        QRContrato.SetVariable('DT_ANO_SAFRA', Null);
        QRContrato.SetVariable('IND_TIPO_SAFRA', Null);
        QRContrato.SetVariable('IND_SITUACAO', 'ABERTO');
        QRContrato.Open;
        if FRContrato = nil then
          FRContrato := TFRContrato.Create(Application);
        FRContrato.QrlTitulo.Caption :=
          'Relacao de Contratos Compra e Venda - ';
        FRContasReceber_TitulosAberto.QRCompositeReport1.Reports.Add(FRContasReceber_TitulosAberto.QRPrimario);
        FRContasReceber_TitulosAberto.QRCompositeReport1.Reports.Add(FRContrato.QRPrimario);

        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_TitulosAberto.QRCompositeReport1.Preview
        else
          FRContasReceber_TitulosAberto.QRCompositeReport1.Print;
        QRContrato.Close;
      end;
    end
    else
    begin
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RUDI') or
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') then
        FRContasReceber_TitulosAberto.QrGroup2.Height := 58
      else
        FRContasReceber_TitulosAberto.QrGroup2.Height := 19;

      //--------------Aumenta a Banda Detail para a zadimel p/ Aparecer o avalista do Titulo
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RUDI') then
      begin
        FRContasReceber_TitulosAberto.QrBand3.Height := 43;
        FRContasReceber_TitulosAberto.QRLabel8.Enabled := true;
        FRContasReceber_TitulosAberto.QRDBText2.Enabled := true;
      end
      else
      begin
        FRContasReceber_TitulosAberto.QrBand3.Height := 19;
        FRContasReceber_TitulosAberto.QRLabel8.Enabled := false;
        FRContasReceber_TitulosAberto.QRDBText2.Enabled := false;
      end;

      if wExportar then
      begin
        ExportarSISCOBRA_novo;
      end
      else
      begin
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_TitulosAberto.QRPrimario.Preview
        else
          FRContasReceber_TitulosAberto.QRPrimario.Print;
      end;
    end;
    DMContasReceber.QRContasReceber_TitulosAberto.Close;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosBaixados1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[3].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME3CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitulosBaixados.Close;
      if Trim(FContasReceberParam.ME3CodCliente.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME3CodCliente.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_CADASTRO', Null);
      if Trim(FContasReceberParam.ME3CodFilial.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_FILIAL',
          FContasReceberParam.ME3CodFilial.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME3CodDepto.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME3CodDepto.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME3CodVendedor.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME3CodVendedor.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME3Finalidade.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('FINALIDADE',
          FContasReceberParam.ME3Finalidade.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('FINALIDADE', Null);

      if Trim(FContasReceberParam.ME3Banco.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_BANCO_AGENCIA',
          trim(FContasReceberParam.ME3Banco.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_CONTRATO',
          trim(FContasReceberParam.Fm3Contrato.MeContrato.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_CONTRATO', Null);

      if Trim(FContasReceberParam.ME3Inicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRContasReceber_TitulosBaixados.SetVariable('DT_INICIAL',
        FContasReceberParam.ME3Inicial.Text);
      DataInicial := DateToStr(StrToDate(FContasReceberParam.ME3Inicial.Text));

      if Trim(FContasReceberParam.ME3Final.Text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');

      QRContasReceber_TitulosBaixados.SetVariable('DT_FINAL',
        FContasReceberParam.ME3Final.Text);
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME3Final.Text));
      pDataInicial := StrToDate(FContasReceberParam.ME3Inicial.Text);
      pDataFinal := StrToDate(FContasReceberParam.ME3Final.Text);
      QRContasReceber_TitulosBaixados.SQL[QRContasReceber_TitulosBaixados.SQL.Count - 1] := '';
      if FContasReceberParam.RG3Ordem.ItemIndex = 0 then
        QRContasReceber_TitulosBaixados.SQL.Add('TB_CADASTRO.NOME')
      else
        QRContasReceber_TitulosBaixados.SQL.Add('TB_CONTA_RECEBER_CAB.DT_BAIXA');
      QRContasReceber_TitulosBaixados.Open;
    end;
    if FRContasReceber_TitulosBaixados = nil then
      FRContasReceber_TitulosBaixados :=
        TFRContasReceber_TitulosBaixados.Create(Application);
    if FContasReceberParam.RG3tipo.ItemIndex = 0 then
      FRContasReceber_TitulosBaixados.QrBand3.Enabled := True
    else
      FRContasReceber_TitulosBaixados.QrBand3.Enabled := False;

    FRContasReceber_TitulosBaixados.QRLFinalidade.Caption := 'Finalidade: ' +
      FContasReceberParam.Ed3Finalidade.Text;
    FRContasReceber_TitulosBaixados.QRLFilial.Caption := 'Filial:' +
      Trim(FContasReceberParam.Me3CodFilial.Text) + ' - ' +
      Trim(FContasReceberParam.Me3Filial.Text);
    FRContasReceber_TitulosBaixados.QRLPeriodo.Caption := 'PERIODO DE : ' +
      DataInicial + ' ATÉ : ' + DataFinal;
    if Trim(FContasReceberParam.Fm3Contrato.EdContrato.Text) <> '' then
      FRContasReceber_TitulosBaixados.QRLContrato.Caption := 'Contrato: ' +
        Trim(FContasReceberParam.Fm3Contrato.EdContrato.Text)
    else if Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text) <> '' then
      FRContasReceber_TitulosBaixados.QRLContrato.Caption := 'Contrato: ' +
        Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text)
    else
      FRContasReceber_TitulosBaixados.QRLContrato.Caption := '';
    if FContasReceberParam.ME3Departamento.Text = '' then
      FRContasReceber_TitulosBaixados.QRLPeriodo.Caption :=
        FRContasReceber_TitulosBaixados.QRLPeriodo.Caption +
        ' Departamento: Todos'
    else
      FRContasReceber_TitulosBaixados.QRLPeriodo.Caption :=
        FRContasReceber_TitulosBaixados.QRLPeriodo.Caption + ' Departamento: ' +
        FContasReceberParam.ME3Departamento.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_TitulosBaixados.QRPrimario.Preview
    else
      FRContasReceber_TitulosBaixados.QRPrimario.Print;

    DMContasReceber.QRContasReceber_TitulosBaixados.Close;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosVencidos1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[5].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME5CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitVenc.Close;
      if Trim(FContasReceberParam.ME5CodRegiao.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('REGIAO',
          FContasReceberParam.ME5CodRegiao.Text)
      else
        QRContasReceber_TitVenc.SetVariable('REGIAO', Null);

      if Trim(FContasReceberParam.ME5CodDepto.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME5CodDepto.Text)
      else
        QRContasReceber_TitVenc.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME5TipoDocumento.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('DESC_TIPO_DOCUMENTO',
          FContasReceberParam.ME5TipoDocumento.Text)
      else
        QRContasReceber_TitVenc.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if Trim(FContasReceberParam.ME5CodCliente.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('CADASTRO',
          FContasReceberParam.ME5CodCliente.Text)
      else
        QRContasReceber_TitVenc.SetVariable('CADASTRO', Null);
      if Trim(FContasReceberParam.Me5ClassCadastro.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('COD_CLASS_CADASTRO',
          FContasReceberParam.Me5ClassCadastro.Text)
      else
        QRContasReceber_TitVenc.SetVariable('COD_CLASS_CADASTRO', Null);
      if Trim(FContasReceberParam.ME5CodFilial.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('FILIAL',
          FContasReceberParam.ME5CodFilial.Text)
      else
        QRContasReceber_Titvenc.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.ME5DataInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRContasReceber_Titvenc.SetVariable('DATA_INICIAL',
        FContasReceberParam.ME5DataInicial.Text);
      DataInicial :=
        DateToStr(StrToDate(FContasReceberParam.ME5DataInicial.Text));

      if Trim(FContasReceberParam.ME5DataFinal.Text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRContasReceber_TitVenc.SetVariable('DATA_FINAL',
        FContasReceberParam.ME5DataFinal.Text);
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME5DataFinal.Text));
      QRContasReceber_TitVenc.SQL[QRContasReceber_TitVenc.SQL.Count - 1] := '';
      case FContasReceberParam.RGOrdem.ItemIndex of
        0: DMContasReceber.QRContasReceber_TitVenc.SQL.Add('ORDER BY NOME');
        1:
          DMContasReceber.QRContasReceber_TitVenc.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      end;
      QRContasReceber_TitVenc.Open;
    end;
    if FRContasReceber_TitVenc = nil then
      FRContasReceber_TitVenc := TFRContasReceber_TitVenc.Create(Application);
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
    begin
      FRContasReceber_TitVenc.QRLabel7.Caption := 'Numero';
      FRContasReceber_TitVenc.QRDBText4.Datafield := 'numero';
      FRContasReceber_TitVenc.QRDBText4.Mask := '';
    end
    else
      FRContasReceber_TitVenc.QRLabel8.Caption := '';
    FRContasReceber_TitVenc.QRLPeriodo.Caption := 'Filial:' +
      FContasReceberParam.Me5Filial.Text + ' PERIODO DE : ' + DataInicial +
      ' ATÉ : ' + DataFinal;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_TitVenc.QRPrimario.Preview
    else
      FRContasReceber_TitVenc.QRPrimario.Print;

    DMContasReceber.QRContasReceber_TitVenc.Close;
  end;
end;

procedure TFContasReceberCad.EmissodeBloqueto2Click(Sender: TObject);
var
  mVerify: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[6].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME6CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if FContasReceberParam.Rg6Vencimento.ItemIndex = 0 then
        pVencimentoBloqueto := 'S'
      else
        pVencimentoBloqueto := 'N';

      QRBloqueto.Close;
      QRBloqueto.Sql.Clear;
      QRBloqueto.Sql.Add('SELECT ');
      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
      QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO AS NOSSO_NUMERO,');
      QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
      QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
      QRBloqueto.Sql.Add('TO_CHAR(Tb_banco_agencia.NOSSO_NUMERO),');
      QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
      QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
      QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
      if pVencimentoBloqueto = 'N' then
        QRBloqueto.Sql.Add(CHR(39) + 'APRESENTACAO'  + CHR(39) + ' AS DT_VENCIMENTO1,')
      Else
        QRBloqueto.Sql.Add('TO_CHAR(Tb_conta_receber_cab.DT_VENCIMENTO,' + QuotedStr('DD/MM/YYYY') + ') AS DT_VENCIMENTO1,');
      QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,');
      QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
      QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.COD_VENDEDOR,');
      QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,Tb_conta_receber_cab.COD_FILIAL,TB_CADASTRO.NOME AS NOME_SACADO,');
      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
      QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.CARTEIRA,');
      QRBloqueto.Sql.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,TB_CADASTRO.DESC_BAIRRO,TB_CONTA_RECEBER_CAB.IND_ACEITE, ');
      QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA, NVL(TB_CADASTRO.PERC_DESCONTO,0) AS PERC_DESCONTO '); //--- adicionado por Fabio na Faville 21/07/2004
      QRBloqueto.Sql.Add('FROM ');
      QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_FILIAL,TB_CONTA_CORRENTE ');
      QRBloqueto.Sql.Add('Where TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA ');
      QRBloqueto.Sql.Add('AND Tb_banco_agencia.COD_BANCO_AGENCIA = Tb_conta_receber_cab.COD_BANCO_AGENCIA ');
      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
        Trim(FContasReceberParam.ME6CodContaCorrente.Text));
      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
        Trim(FContasReceberParam.ME6CodBanco.Text));
      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
        'BAIXA TOTAL' + CHR(39));
      if Trim(FContasReceberParam.ME6CodNota.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
          Trim(FContasReceberParam.ME6CodNota.Text));
      if Trim(FContasReceberParam.ME6CodNotaF.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
          Trim(FContasReceberParam.ME6CodNotaF.Text));
      if Trim(FContasReceberParam.ME6CodContaReceberCab.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = '
          + Trim(FContasReceberParam.ME6CodContaReceberCab.Text));
      if Trim(FContasReceberParam.ME6CodBanco.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.ME6CodBanco.Text));
      if Trim(FContasReceberParam.ME6CodFilial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME6CodFilial.Text));
      if Trim(FContasReceberParam.ME6Inicial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
          chr(39) + Trim(FContasReceberParam.ME6Inicial.Text) + chr(39));
      if Trim(FContasReceberParam.ME6Final.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
          chr(39) + Trim(FContasReceberParam.ME6Final.Text) + chr(39));
      QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');
      if FContasReceberParam.Rg6Vencimento.ItemIndex = 0 then
        DmContasReceber.pVencimentoBloqueto := 'S'
      else
        DmContasReceber.pVencimentoBloqueto := 'N';
      QRBloqueto.Open;
      // Banco do Brasil
      if QRBloquetoCod_Banco.Value = 001 then
      begin
        Bloqueto.EmiteBloqueto(1, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;

      // Banco Bradesco
      if (QRBloquetoCod_Banco.Value = 237) or
        (QRBloquetoCod_Banco.Value = 291) then
        // BANCO BCN ESTA AQUI SOMENTE PARA EMITIR EM FOLHA EM BRANCO IGUAL BRADESCO
      begin
        Bloqueto.EmiteBloqueto(2, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;

      // Banco HSBC
      if QRBloquetoCod_Banco.Value = 399 then
      begin
        Bloqueto.EmiteBloqueto(4, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;
      // Banco Rural
      if QRBloquetoCod_Banco.Value = 453 then
        Bloqueto.EmiteBloqueto(3, 'P');
      // Caixa Economica
      if QRBloquetoCod_Banco.Value = 104 then
        Bloqueto.EmiteBloqueto(5, 'P');
      // Meridional
      if QRBloquetoCod_Banco.Value = 008 then
        Bloqueto.EmiteBloqueto(6, 'P');
      // Banco Banestado
      if QRBloquetoCod_Banco.Value = 038 then
        Bloqueto.EmiteBloqueto(7, 'P');
      // Banco Itau
      if QRBloquetoCod_Banco.Value = 341 then
        Bloqueto.EmiteBloqueto(8, 'P');
      // Banco Sicredi
      if QRBloquetoCod_Banco.Value = 748 then
        Bloqueto.EmiteBloqueto(9, 'P');
    end;
  end;
end;

procedure TFContasReceberCad.EmissodeNotaPromissria1Click(Sender: TObject);
var
  wTexto: string;
begin
  inherited;
  if (DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value) > 0 then
  begin
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'FAVILLE') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'NIR') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ZADIMEL') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MEDIBENS') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'COZER') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MEDIPECAS') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'FORTE') then
    begin
      if FRPromissoria_Branco = nil then
        FRPromissoria_Branco := TFRPromissoria_Branco.Create(Application);
      FRPromissoria_Branco.QRLVencimento.Caption :=
        DMContasReceber.QContasReceber_CabDT_Vencimento.Text;
      FRPromissoria_Branco.QRLNumero.Caption :=
        DMContasReceber.QContasReceber_CabNum_Titulo.Text;
      FRPromissoria_Branco.QRLParcela.Caption :=
        DMContasReceber.QContasReceber_CabNum_Parcela.Text;
      wTexto := 'Na data de ' +
        DateToStr(DMContasReceber.QContasReceber_CabDT_Vencimento.Value) +
        ', pagarei por esta unica via de NOTA PROMISSORIA a ';
      wTexto := wTexto +
        Trim(DMContasReceber.QContasReceber_CabDesc_Filial.Value);
      wTexto := wTexto + ' CPF/CNPJ: ' +
        DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'COD_FILIAL = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True);
      wTexto := wTexto + ' ou a sua ordem a quantia de: (';
      if DMContasReceber.QContasReceber_CabVAL_PROMISSORIA.Text <> '' then
      begin
        wTexto := wTexto +
          Bib.extenso(DMContasReceber.QContasReceber_CabVAL_PROMISSORIA.Value,
          'REAL');
        FRPromissoria_Branco.QrLValor.Caption :=
          DMContasReceber.QContasReceber_CabVal_Promissoria.text;
      end
      else
      begin
        wTexto := wTexto +
          Bib.extenso(DMContasReceber.QContasReceber_CabVAL_TITULO.Value,
          'REAL');
        FRPromissoria_Branco.QrLValor.Caption :=
          DMContasReceber.QContasReceber_CabVal_Titulo.text;
      end;
      wTexto := wTexto + '.) em moeda corrente deste pais.';
      FRPromissoria_Branco.QrLocal_Pagamento.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL = '
        +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True) +
        ' - ' + DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL',
        'COD_FILIAL = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True);
      FRPromissoria_Branco.QrDescricao.Caption := wTexto;
      FRPromissoria_Branco.QrEmitente.Caption :=
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value) + ' - '
        +
        DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria_Branco.QrCpf_Cnpj.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrEndereco.Caption :=
        DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
        'COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria_Branco.QrCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrCpfEmitente.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrNomeEmitente.Caption :=
        FRPromissoria_Branco.QrEmitente.Caption;
      FRPromissoria_Branco.QRlAvalista1.Caption :=
        DMContasReceber.QContasReceber_CabDESC_AVALISTA1.Value;
      FRPromissoria_Branco.QRlAvalista2.Caption :=
        DMContasReceber.QContasReceber_CabDESC_AVALISTA2.Value;
      FRPromissoria_Branco.QRLCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL =' +
        FloatToStr(DmContasReceber.QContasReceber_CabCod_Filial.Value));
      FRPromissoria_Branco.QRLCidade.Caption :=
        Trim(FRPromissoria_Branco.QRLCidade.Caption) + ', ' +
        FormatDateTime('dd " de " mmmm " de " yyyy ',
        DmContasReceber.QContasReceber_CabDt_Emissao.Value);
      FRPromissoria_Branco.QRPrimario.Preview;
    end
    else
    begin
      if FRPromissoria = nil then
        FRPromissoria := TFRPromissoria.Create(Application);
      FRPromissoria.QRLDia.Caption := FormatDateTime('dd',
        DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLMes.Caption := FormatDateTime('mmmm',
        DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLAno.Caption := FormatDateTime('yyyy',
        DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLEndereco.Caption :=
        DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
        'COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria.QRLCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRLEstado.Caption :=
        DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRLCGCCPF.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRPrimario.Preview;
    end
  end
  else
    MessageDlg('Atenção é necessário selecionar o título o qual se deseja emitir a Nota Promissória', mtInformation, [mbOk], 0);
end;

procedure TFContasReceberCad.EmissodeDuplicatas1Click(Sender: TObject);
var
  wCont: integer;
  wComando: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[7].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME7CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Duplicatas.Close;
      if Trim(FContasReceberParam.ME7CodNota.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB',
          FContasReceberParam.ME7CodNota.Text)
      else
        QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', Null);
      if Trim(FContasReceberParam.ME7CodFilial.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('COD_FILIAL',
          FContasReceberParam.ME7CodFilial.Text)
      else
        QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME7CodDepto.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME7CodDepto.Text)
      else
        QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME7CodTitulo.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB',
          FContasReceberParam.ME7CodTitulo.Text)
      else
        QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', Null);
      if Trim(FContasReceberParam.ME7Representante.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME7Representante.Text)
      else
        QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.Me7NumParcela.Text) <> '' then
        QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA',
          Trim(FContasReceberParam.Me7NumParcela.Text))
      else
        QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA', null);
      QRContasReceber_Duplicatas.Open;
    end;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'CGS' then
    begin
      if FRContasReceberDuplicatas_CGS = nil then
        FRContasReceberDuplicatas_CGS :=
          TFRContasReceberDuplicatas_CGS.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberDuplicatas_CGS.QRPrimario.Preview
      else
        FRContasReceberDuplicatas_CGS.QRPrimario.Print;
    end
{    else if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI' then
    begin
      if FRContasReceberDuplicatas_GONZATTI = nil then
        FRContasReceberDuplicatas_GONZATTI :=
          TFRContasReceberDuplicatas_GONZATTI.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberDuplicatas_GONZATTI.QRPrimario.Preview
      else
        FRContasReceberDuplicatas_GONZATTI.QRPrimario.Print;
    end
    }else if ((DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MEDIBENS') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GEN') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ESTACAO') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'DINIZ') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'NIR') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS')) then
    begin
      if FRContasReceberDuplicatas_MEDIBENS = nil then
        FRContasReceberDuplicatas_MEDIBENS :=
          TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLE_mail.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_E_Mail.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Endereco_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption :=
        DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Inscricao_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption :=
        DMContasReceber.QRContasReceber_DuplicatasCod_Estado_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Cep_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Fone_Filial.Value;

      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa4.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa5.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa6.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLE_mail1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_E_Mail.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEndereco1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Endereco_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCidade1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCGC1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLInscricao1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Inscricao_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLEstado1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasCod_Estado_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLCEP1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Cep_Filial.Value;
      FRContasReceberDuplicatas_MEDIBENS.QRLfone1.caption :=
        DMContasReceber.QRContasReceber_DuplicatasDesc_Fone_Filial.Value;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO' then
      begin
        FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := '';
        FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite1.Caption := '';
      end
      else
      begin
        FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption :=
          DateToStr(Date);
        FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite1.Caption :=
          DateToStr(Date);
      end;
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') then
         FRContasReceberDuplicatas_MEDIBENS.QRSubDetail1.Enabled := False;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberDuplicatas_MEDIBENS.QRPrimario.Preview
      else
        FRContasReceberDuplicatas_MEDIBENS.QRPrimario.Print;
    end
    else if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
    begin
      FPromissoria.Duplicata_ab;
    end
    else
    begin
      if FRContasReceber_Duplicatas = nil then
        FRContasReceber_Duplicatas := TFRContasReceber_Duplicatas.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Duplicatas.QRPrimario.Preview
      else
        FRContasReceber_Duplicatas.QRPrimario.Print;
    end;
    DMContasReceber.QRContasReceber_Duplicatas.First;
    while not (DMContasReceber.QRContasReceber_Duplicatas.Eof) do
    begin
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
          Chr(39) + 'SIM' + Chr(39);
        wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
          FloatToStr(DMContasReceber.QRContasReceber_DuplicatasCOD_CONTA_RECEBER_CAB.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        DMContasReceber.QRContasReceber_Duplicatas.Next
      end;
      DMOracle.DBCemapa.Commit;
    end;
    DMContasReceber.QRContasReceber_Duplicatas.Close;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') then
      EmissodeDuplicatas1Click(Self);
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosAbertosSaldos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[8].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME8CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Saldos.Close;
      if Trim(FContasReceberParam.ME8CodCliente.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME8CodCliente.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME8CodDepto.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME8CodDepto.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME8CodBanco.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_BANCO_AGENCIA',
          FContasReceberParam.ME8CodBanco.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_BANCO_AGENCIA', Null);

      if Trim(FContasReceberParam.ME8CodFilial.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_FILIAL',
          FContasReceberParam.ME8CodFilial.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_FILIAL', Null);
      QRContasReceber_Saldos.SetVariable('DT_INICIAL',
        FContasReceberParam.ME8DtInicial.Text);
      QRContasReceber_Saldos.SetVariable('DT_FINAL',
        FContasReceberParam.ME8DtFinal.Text);
      QRContasReceber_Saldos.Open;
    end;
    if FRContasReceber_Saldos = nil then
      FRContasReceber_Saldos := TFRContasReceber_Saldos.Create(Application);
    if FContasReceberParam.ME8Departamento.Text = '' then
      FRContasReceber_Saldos.QRLDepartamento.Caption := 'Filial:' +
        FContasReceberParam.Me8Filial.Text + ' - Departamento: Todos'
    else
      FRContasReceber_Saldos.QRLDepartamento.Caption := 'Filial:' +
        FContasReceberParam.Me8Filial.Text + ' - Departamento: ' +
        FContasReceberParam.ME8Departamento.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_Saldos.QRPrimario.Preview
    else
      FRContasReceber_Saldos.QRPrimario.Print;
    DMContasReceber.QRContasReceber_Saldos.Close;
  end;
end;

procedure TFContasReceberCad.BtDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMContasReceber.QContasReceber_CabCod_Departamento.Value :=
      DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFContasReceberCad.EmissodeRecibos1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[9].TabVisible := True;
  FContasReceberParam.RGPreview.Visible := False;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME9CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRRecibos.Close;
      if Trim(FContasReceberParam.ME9CodCliente.Text) <> '' then
        QRRecibos.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME9CodCliente.Text)
      else
        QRRecibos.SetVariable('COD_CADASTRO', Null);
      QRRecibos.SetVariable('COD_DEPARTAMENTO', Null);
      QRRecibos.SetVariable('COD_REGIAO', Null);
      QRRecibos.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FContasReceberParam.ME9CodFilial.Text) <> '' then
        QRRecibos.SetVariable('COD_FILIAL',
          FContasReceberParam.ME9CodFilial.Text)
      else
        QRRecibos.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME9DtVencInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRRecibos.SetVariable('DT_INICIAL',
        FContasReceberParam.ME9DtVencInicial.Text);
      if Trim(FContasReceberParam.ME9DtVencFinal.Text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRRecibos.SetVariable('DT_FINAL',
        FContasReceberParam.ME9DtVencFinal.Text);
      QRRecibos.Open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', FContasReceberParam.ME9CodFilial.Text);
      DMFilial.QFilial.Open;
      if FRRecibos2 = nil then
        FRRecibos2 := TFRRecibos2.Create(Application);
      FRRecibos2.QRLRODAPE.Caption := DMFilial.QFilialDesc_Cidade.Value +
        FormatDateTime(', dd "de" mmmm "de" yyyy', Date);
      FRRecibos2.QuickRep1.Preview;
      QRRecibos.Close;
    end;
  end;
end;

procedure TFContasReceberCad.VoltaBaixadeTitulos1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberVoltaBaixa = nil then
    FContasReceberVoltaBaixa := TFContasReceberVoltaBaixa.Create(Application);
  if DMContasReceber.QContasReceber_CabCod_Cadastro.Text <> '' then
  begin
    FContasReceberVoltaBaixa.MECodCliente.Text :=
      DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
    FContasReceberVoltaBaixa.MeNumTitulo.Text :=
      DMContasReceber.QContasReceber_CabNum_Titulo.Text;
  end;
  FContasReceberVoltaBaixa.ShowModal;
end;

procedure TFContasReceberCad.TtulosemAbertoVendedor1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[11].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME11CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.ME11DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');

      if Trim(FContasReceberParam.ME11DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRContasReceber_Tit_Abertos_Vend.Close;
      {          QRContasReceber_Tit_Abertos_Vend.Sql.Clear;
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('SELECT Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_BANCO_AGENCIA,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_MOVIMENTO,Tb_conta_receber_cab.DT_BAIXA,Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_CAPITALIZACAO,Tb_conta_receber_cab.VAL_TITULO,Tb_conta_receber_cab.VAL_NEGOCIO,Tb_conta_receber_cab.IND_ACEITE,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,(Tb_conta_receber_cab.DESC_OBSERVACAO || DESC_AVALISTA1) AS DESC_OBSERVACAO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_CADASTRO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.VAL_ORIGINAL,Tb_conta_receber_cab.COD_NOSSO_NUMERO,Tb_conta_receber_cab.VAL_JUROS,Tb_conta_receber_cab.COD_DEPARTAMENTO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_CAPITALIZACAO_MOEDA,Tb_filial.DESC_FILIAL,Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO,Tb_cadastro.DESC_CIDADE,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_cadastro.DESC_TELEFONE,Tb_conta_receber_cab.COD_VENDEDOR,Tb_vendedor.NOME,Tb_Departamento.DESC_DEPARTAMENTO,TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_DEPARTAMENTO,TB_FINALIDADE,TB_FILIAL,TB_CLASS_CADASTRO ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_FILIAL = Tb_filial.COD_FILIAL) and ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_cadastro.COD_CLASS_CADASTRO = Tb_Class_cadastro.COD_CLASS_CADASTRO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_conta_receber_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_departamento.COD_DEPARTAMENTO = Tb_CONTA_RECEBER_CAB.COD_DEPARTAMENTO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_Finalidade.COD_FINALIDADE = Tb_CONTA_RECEBER_CAB.COD_FINALIDADE) ');
                if Trim(FContasReceberParam.ME11CodFilial.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' + Trim(FContasReceberParam.ME11CodFilial.Text));
                if Trim(FContasReceberParam.ME11CodVendedor.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.COD_VENDEDOR = ' + Trim(FContasReceberParam.ME11CodVendedor.Text));
                if Trim(FContasReceberParam.Me11CodSupervisor.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_vendedor.COD_SUPERVISOR = ' + Trim(FContasReceberParam.Me11CodSupervisor.Text));
                if Trim(FContasReceberParam.ME11CodDepto.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.COD_DEPARTAMENTO = ' + Trim(FContasReceberParam.ME11CodDepto.Text));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO >=' + CHR(39) + FCOntasReceberParam.ME11DTInicial.text + CHR(39));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO <=' + CHR(39) + FCOntasReceberParam.ME11DtFinal.text + CHR(39));
                Case FContasReceberParam.RG11Vendedor.ItemIndex of
                  0:QRContasReceber_Tit_Abertos_vend.SQL.Add('AND TB_VENDEDOR.IND_SITUACAO =' + CHR(39) + 'ATIVO' + CHR(39));
                  1:QRContasReceber_Tit_Abertos_vend.SQL.Add('AND TB_VENDEDOR.IND_SITUACAO =' + CHR(39) + 'INATIVO' + CHR(39));
                End;
                Case FContasReceberParam.RG11Ordem.ItemIndex of
                  0:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CADASTRO.NOME,TB_CADASTRO.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
                  1:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR, Tb_cadastro.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
                  2:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO, Tb_cadastro.COD_CADASTRO');
                End;
      }
      if Trim(FContasReceberParam.ME11CodFilial.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_FILIAL',
          Trim(FContasReceberParam.ME11CodFilial.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME11CodVendedor.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_VENDEDOR',
          Trim(FContasReceberParam.ME11CodVendedor.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.Me11CodSupervisor.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_SUPERVISOR',
          Trim(FContasReceberParam.Me11CodSupervisor.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_SUPERVISOR', Null);
      if Trim(FContasReceberParam.ME11CodDepto.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO',
          Trim(FContasReceberParam.ME11CodDepto.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO', Null);
      QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Inicial',
        FCOntasReceberParam.ME11DTInicial.text);
      QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Final',
        FCOntasReceberParam.ME11DtFinal.text);
      QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Base',
        FCOntasReceberParam.ME11DtBase.text);
      case FContasReceberParam.RG11Vendedor.ItemIndex of
        0: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO',
            'ATIVO');
        1: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO',
            'INATIVO');
        2: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO', Null);
      end;
      QRContasReceber_Tit_Abertos_Vend.SQL[QRContasReceber_Tit_Abertos_Vend.SQL.Count - 1] := '';
      case FContasReceberParam.RG11Ordem.ItemIndex of
        0:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CADASTRO.NOME,Tb_conta_receber_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR, Tb_conta_receber_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        2:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO, Tb_conta_receber_cab.COD_CADASTRO');
      end;
      DMContasReceber.pDataReferencia :=
        StrToDate(FCOntasReceberParam.ME11DtReferencia.text);

      QRContasReceber_Tit_Abertos_Vend.Open;

      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
      begin
        if FRContasReceber_Tit_Vend_Aberto_1 = nil then
          FRContasReceber_Tit_Vend_Aberto_1 :=
            TFRContasReceber_Tit_Vend_Aberto_1.create(Application);
        if FContasReceberParam.Rg11Tipo.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto_1.QRBand3.Enabled := True
        else
          FRContasReceber_Tit_Vend_Aberto_1.QRBand3.Enabled := False;
        FRContasReceber_Tit_Vend_Aberto_1.QRLDepartamento.Caption :=
          'Departamento: ' + FContasReceberParam.ME11Departamento.Text;
        FRContasReceber_Tit_Vend_Aberto_1.QRLTitulo.Caption :=
          'Relatorio Titulos Abertos Por Vendedor de ' +
          FContasReceberParam.ME11DtInicial.Text + ' Ate ' +
          FContasReceberParam.ME11DtFinal.Text;

        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto_1.QRPrimario.Preview
        else
          FRContasReceber_Tit_Vend_Aberto_1.QRPrimario.Print;
        DMContasReceber.QRContasReceber_Tit_Abertos_Vend.Close;
      end
      else
      begin
        if FRContasReceber_Tit_Vend_Aberto = nil then
          FRContasReceber_Tit_Vend_Aberto :=
            TFRContasReceber_Tit_Vend_Aberto.create(Application);
        if FContasReceberParam.Rg11Tipo.ItemIndex = 0 then
        begin
          FRContasReceber_Tit_Vend_Aberto.QRLCadastro.Enabled := True;
          FRContasReceber_Tit_Vend_Aberto.QRBand4.Enabled := True;
          FRContasReceber_Tit_Vend_Aberto.QRBand5.Enabled := True;
        end
        else
        begin
          FRContasReceber_Tit_Vend_Aberto.QRGroup2.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRBand4.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRBand5.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRGroup1.ForceNewPage := False;
        end;
        {              If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then  FOI A ELIANE QUE PEDIU PARA RETIRAR DO PROGRAMA
                       Begin
                         FRContasReceber_Tit_Vend_Aberto.QRDBText11.DataField := 'VAL_ORIGINAL';
                         FRContasReceber_Tit_Vend_Aberto.QRExpr4.Expression := 'SUM(QRContasReceber_Tit_Abertos_vend.VAL_ORIGINAL)';
                         FRContasReceber_Tit_Vend_Aberto.QRExpr2.Expression := 'SUM(QRContasReceber_Tit_Abertos_vend.VAL_ORIGINAL)';
                       End;  }
        FRContasReceber_Tit_Vend_Aberto.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME11Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME11Departamento.Text;
        FRContasReceber_Tit_Vend_Aberto.QRLTitulo.Caption :=
          'Relatorio Titulos Abertos Por Rep.Comercial Juros Ate ' +
          FContasReceberParam.ME11DtReferencia.Text;
        FRContasReceber_Tit_Vend_Aberto.QRLPeriodo.Caption := 'Periodo de ' +
          FContasReceberParam.ME11DtInicial.Text + ' Ate ' +
          FContasReceberParam.ME11DtFinal.Text;
        FRContasReceber_Tit_Vend_Aberto.QrlMensagem.Caption :=
          FContasReceberParam.Me11Mensagem.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto.QRPrimario.Preview
        else
          FRContasReceber_Tit_Vend_Aberto.QRPrimario.Print;
        DMContasReceber.QRContasReceber_Tit_Abertos_Vend.Close;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.BtVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[12].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME12CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissao.Close;
      if Trim(FContasReceberParam.ME12CodFilial.Text) <> '' then
        QRComissao.SetVariable('FILIAL', FContasReceberParam.ME12CodFilial.Text)
      else
        QRComissao.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> '' then
        QRComissao.SetVariable('COD_SERIE',
          FContasReceberParam.Me12TipoDocumento.Text)
      else
        QRComissao.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.ME12CodVendedor.Text) <> '' then
        QRComissao.SetVariable('VENDEDOR',
          FContasReceberParam.ME12CodVendedor.Text)
      else
        QRComissao.SetVariable('VENDEDOR', Null);

      if Trim(FContasReceberParam.ME12DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_I', FContasReceberParam.ME12DTInicial.text);

      if Trim(FContasReceberParam.ME12DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_F', FContasReceberParam.ME12DtFinal.text);

      if Trim(FContasReceberParam.ME12DtEmissao.text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO',
          FContasReceberParam.ME12DtEmissao.text);
      if Trim(FContasReceberParam.ME12DtEmissaoFinal.text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO_FINAL',
          FContasReceberParam.ME12DtEmissaoFinal.text);
      if Trim(FContasReceberParam.ME12DtVencto.Text) = '' then
        QRComissao.SetVariable('DT_VENCTO', Null)
      else
        QRComissao.SetVariable('DT_VENCTO',
          StrToDate(Trim(FContasReceberParam.ME12DtVencto.Text)));

      if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'GRASEL' then
      begin
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '3');
        //paga comissao tambem para notas com cheque
        QRComissao.SetVariable('SUBS_TIPO_MOV', '((Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('RECEBTO. PRINCIPAL') +
          ') Or (Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('DESC. CONCEDIDO') + '))');
      end
      else
      begin
        QRComissao.SetVariable('SUBS_TIPO_MOV', '(Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('RECEBTO. PRINCIPAL') + ')');
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '0');
      end;
      if FContasReceberParam.Rg12Abertos.ItemIndex = 0 then
        QRComissao.SetVariable('LISTAR_TITULOS_ABERTOS', 'SIM')
      else
        QRComissao.SetVariable('LISTAR_TITULOS_ABERTOS', 'NAO');
      if FRComissao = nil then
        FRComissao := TFRComissao.create(Application);
      if FContasReceberParam.Rg12TipoRelatorio.ItemIndex = 0 then
        FRComissao.pTipoRelatorio := 'ANALITICO'
      else
        FRComissao.pTipoRelatorio := 'SINTETICO';

      //if ((FContasReceberParam.RG12Ordem.ItemIndex = 0) or (FContasReceberParam.RG12Ordem.ItemIndex = 1)) then
      QRComissao.SQL[QRComissao.SQL.Count - 1] := '';
      case FContasReceberParam.RG12Ordem.ItemIndex of
        0: QRComissao.SQL.Add('ORDER BY COD_VENDEDOR,DATA');
        1: QRComissao.SQL.Add('ORDER BY COD_VENDEDOR,NUM_TITULO');
      end;
      QRComissao.Open;
      if FRComissao = nil then
        FRComissao := TFRComissao.create(Application);

      FRComissao.QRLTitulo.Caption := 'Relatorio de Comissao De: ' + FContasReceberParam.ME12DTInicial.Text + ' Ate : ' +
        FContasReceberParam.ME12DtFinal.Text;
      FRComissao.QRLFilial.Caption := 'Filial: ' + FContasReceberParam.ME12Filial.Text;
      if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO' then
      begin
        FRComissao.QRLabel11.Caption := '  Vend';
        FRComissao.QrDbText10.Datafield := 'Cod_Vendedor';
      end;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRComissao.QRPrimario.Preview
      else
        FRComissao.QRPrimario.Print;
      QRComissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DbEdit5.SetFocus;
end;

procedure TFContasReceberCad.RelatrioTtulosRecebidos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[13].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME13Filial.Text,
      'CONTAS A RECEBER');

    with DMContasReceber do
    begin
      QRContasReceber_Recebidos.Close;

      if Trim(FContasReceberParam.ME13Filial.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('FILIAL',
          FContasReceberParam.ME13Filial.Text)
      else
        QRContasReceber_Recebidos.SetVariable('FILIAL', Null);

      if Trim(FContasReceberParam.ME13Departamento.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME13Departamento.Text)
      else
        QRContasReceber_Recebidos.SetVariable('DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Me13CodCliente.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('COD_CADASTRO',
          FContasReceberParam.Me13CodCliente.Text)
      else
        QRContasReceber_Recebidos.SetVariable('COD_CADASTRO', Null);

      QRContasReceber_Recebidos.SetVariable('DT_INICIAL',
        FCOntasReceberParam.ME13DTInicial.text);
      QRContasReceber_Recebidos.SetVariable('DT_FINAL',
        FCOntasReceberParam.ME13DtFinal.text);
      if FCOntasReceberParam.Rg13FormaPagamento.ItemIndex = 0 then
        QRContasReceber_Recebidos.SetVariable('FORMA_PAGAMENTO', 'Caixa')
      else
        QRContasReceber_Recebidos.SetVariable('FORMA_PAGAMENTO', 'Contábil');
      case FCOntasReceberParam.Rg13Troca.ItemIndex of
        0: QRContasReceber_Recebidos.SetVariable('IND_TROCA', 'SIM');
        1: QRContasReceber_Recebidos.SetVariable('IND_TROCA', 'NAO');
        2: QRContasReceber_Recebidos.SetVariable('IND_TROCA', Null);
      end;
      case FCOntasReceberParam.Rg13Devolucao.ItemIndex of
        0: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', 'SIM');
        1: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', 'NAO');
        2: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', Null);
      end;

      if Trim(FContasReceberParam.Me13NumTitulo.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('NUM_TITULO',
          FContasReceberParam.Me13NumTitulo.Text)
      else
        QRContasReceber_Recebidos.SetVariable('NUM_TITULO', Null);

      QRContasReceber_Recebidos.Open;

      if FRContasReceber_Recebidos = nil then
        FRContasReceber_Recebidos :=
          TFRContasReceber_Recebidos.create(Application);

      FRContasReceber_Recebidos.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.Ed13Filial.Text + ' Depto:' +
        FContasReceberParam.Ed13Departamento.Text;
      FRContasReceber_Recebidos.QRLTitulo.Caption :=
        'Contas a Receber-Titulos Recebidos de ' +
        FContasReceberParam.ME13DtInicial.Text + ' até ' +
        FContasReceberParam.ME13DtFinal.Text;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Recebidos.QRPrimario.Preview
      else
        FRContasReceber_Recebidos.QRPrimario.Print;
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and
        (FContasReceberParam.Me13NumTitulo.Text <> '')) then
        FRContasReceber_Recebidos.QRBand3.Height := 44;
      DMContasReceber.QRContasReceber_Recebidos.Close;
    end;
  end;
end;

procedure TFContasReceberCad.RelatrioTtulosRecebidosBancos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[14].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME14Filial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Receb_Bco.Close;

      if Trim(FContasReceberParam.ME14Filial.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('FILIAL',
          FContasReceberParam.ME14Filial.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('FILIAL', Null);

      if Trim(FContasReceberParam.ME14Banco.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('BANCO',
          FContasReceberParam.ME14Banco.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.Me14ContaCorrente.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.Me14ContaCorrente.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME14Departamento.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME14Departamento.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Me14CodCliente.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('COD_CADASTRO',
          FContasReceberParam.Me14CodCliente.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.Me14NumTitulo.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('NUM_TITULO',
          FContasReceberParam.Me14NumTitulo.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('NUM_TITULO', Null);

      QRContasReceber_Receb_Bco.SetVariable('DT_INICIAL',
        FCOntasReceberParam.ME14DTInicial.text);
      QRContasReceber_Receb_Bco.SetVariable('DT_FINAL',
        FCOntasReceberParam.ME14DtFinal.text);

      QRContasReceber_Receb_Bco.Open;

      if FRContasReceber_Receb_Bancos = nil then
        FRContasReceber_Receb_Bancos :=
          TFRContasReceber_Receb_Bancos.create(Application);

      FRContasReceber_Receb_Bancos.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.Ed14Filial.Text + ' Banco:' +
        FContasReceberParam.Ed14Banco.Text + ' Dep.:' +
        FContasReceberParam.Ed14Departamento.Text;
      FRContasReceber_Receb_Bancos.QRLTitulo.Caption :=
        'Contas a Receber-Titulos Recebidos de ' +
        FContasReceberParam.ME14DtInicial.Text + ' até ' +
        FContasReceberParam.ME14DtFinal.Text;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Receb_Bancos.QRPrimario.Preview
      else
        FRContasReceber_Receb_Bancos.QRPrimario.Print;
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and
        (FContasReceberParam.Me14NumTitulo.Text <> '')) then
        FRContasReceber_Receb_Bancos.QRBand3.Height := 44;
      DMContasReceber.QRContasReceber_Receb_Bco.Close;
    end;
  end;
end;

procedure TFContasReceberCad.atualiza_Bloquetos;
var
  n_numero: Real;
begin
  with DMContasReceber do
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      n_numero := StrToFloat(FContasReceberParam.Me6NrBloqueto.text);
      QRBloqueto.First;
      while not (QRBloqueto.Eof) do
      begin
        //SERGIO ALTERADO 17/07/2003 INSERIDO CASO O BLOQUETO SEJA BRADESCO
        //rotina original logo abaixo
        case QRBloquetoCod_Banco.Value of
          399:
            begin
              if
                DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
                Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)) + Chr(39), True)
                <>
                '' then
                raise
                  Exception.Create('Nosso Número Já Existente No Banco de Dados');
              QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
                Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)));
            end;
          237:
            begin
              if
                DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
                FRBloqueto_Bradesco.CalculaDVNN(QRBloquetoCARTEIRA.Text +
                FloatToStr(n_numero)) + Chr(39), True) <> '' then
                raise
                  Exception.Create('Nosso Número Já Existente No Banco de Dados');

              QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
                FRBloqueto_Bradesco.CalculaDVNN(QRBloquetoCARTEIRA.Text +
                FloatToStr(n_numero)));
            end;
        else
          begin
            if
              DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
              'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
              Bib.DigitoVerificador(FloatToStr(n_numero)) + Chr(39), True) <> '' then
              raise
                Exception.Create('Nosso Número Já Existente No Banco de Dados');
            QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
              Bib.DigitoVerificador(FloatToStr(n_numero)));
          end;
        end;
        {        if QRBloquetoCod_Banco.Value = 399 then
                 Begin
                  If DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_NOSSO_NUMERO ='+Chr(39)+FloatToStr(n_numero)+Bib.DigitoVerificadorHSBC(FloatToStr(n_numero))+Chr(39)) <> '' Then
                     Raise Exception.Create('Nosso Número Já Existente No Banco de Dados');
                   QAtuBloq.SetVariable('NUMERO',FloatToStr(n_numero)+Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)));
                 End
                Else
                 Begin
                  If DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_NOSSO_NUMERO ='+Chr(39)+FloatToStr(n_numero)+Bib.DigitoVerificador(FloatToStr(n_numero))+Chr(39)) <> '' Then
                     Raise Exception.Create('Nosso Número Já Existente No Banco de Dados');
                   QAtuBloq.SetVariable('NUMERO',FloatToStr(n_numero)+Bib.DigitoVerificador(FloatToStr(n_numero)));
                 End;}
        QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',
          QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
        QAtuBloq.ExecSQL;
        QAtuBloq.close;
        QRBloqueto.Next;
        n_numero := n_numero + 1;
      end;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.RollBack;
      raise;
    end;
  end;
end;

procedure TFContasReceberCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFContasReceberCad.Arquivoremessa6411Click(Sender: TObject);
var
  mNUM_CEDENTE: string; // 2a Edition by Robson.
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  S: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  wAux: string;
  wDesconto: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    with DMContasReceber do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text), 'CONTAS A RECEBER');
      QRemessa.Close;

      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me17NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      if Trim(FContasReceberParam.Me17Instrucoes.Text) <> '' then
        wAux := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM',
          'COD_MENSAGEM = ' + Trim(FContasReceberParam.Me17Instrucoes.text),
          True);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if QRemessa.RecordCount > 0 then
      begin
        try
          // REGISTRO HEADER ARQUIVO REMESSA 641-CBR
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZADIMEL') then
            mSEQ_REMESSA := DMSequencia.Sequencia(2, 'ARQ_REM_BB');

          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_BB');
          mNUM_CEDENTE := Copy(QRemessaNUM_CONTA_CORRENTE.Text,
            Length(QRemessaNUM_CONTA_CORRENTE.Value), 1);

          if (UpperCase(mNUM_CEDENTE) >= 'A') and (UpperCase(mNUM_CEDENTE) <=
            'Z') then
          begin
            mNUM_CEDENTE := RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 8);
            mNUM_CEDENTE := mNUM_CEDENTE + Copy(QRemessaNUM_CONTA_CORRENTE.Text,
              Length(QRemessaNUM_CONTA_CORRENTE.Text), 1);
          end
          else if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE') or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE')) then
            mNUM_CEDENTE := RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 8) +
              QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text
          else
            mNUM_CEDENTE := RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 9);

          if QRemessaNUM_CONVENIO.Value <= 9999 then
            mNUM_CONVENENTE := RMaskCGC_CPF(QRemessaCOD_CONVENENTE_LIDER.Text, 4)
              + '00'
          else
            mNUM_CONVENENTE := RMaskCGC_CPF(QRemessaCOD_CONVENENTE_LIDER.Text,
              6);

          mBrancos := '';
          for x := 1 to 287 do
          begin
            mBrancos := mBrancos + ' ';
          end;

          S := ''; // Inicia variavel.

          S := S + '01REMESSA01COBRANCA       ' +
            RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
            RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Value, 1) +
            mNUM_CEDENTE +
            mNUM_CONVENENTE +
            FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
            '001BANCO DO BRASIL' +
            Copy(DateToStr(Date), 1, 2) +
            Copy(DateToStr(Date), 4, 2) +
            RMaskCGC_CPF(Copy(DateToStr(Date), 9, 2), 2) +
            RMaskCGC_CPF(FloatToStr(mSEQ_REMESSA), 7) +
            {Pegar funcao e Não esquecer incrementar arquivo sequencia}
          mBrancos +
            '000001' + Chr(13) + Chr(10); // Sequencial do registro=0001

          // REGISTRO DETALHE ARQUIVO REMESSA 641-CBR

          mSequencial := 2; { 1=Registro HEADER }
          while not QRemessa.Eof do
          begin
            mBrancos := '';
            for x := 1 to 8 do
            begin
              mBrancos := mBrancos + ' '; // Usado anteriormente também.
            end;

            // Prefixo do titulo \\
            mPrefixoTitulo := 'AI ';
            if (QRemessaCARTEIRA.Value = 11) or (QRemessaCARTEIRA.Value = 13) or
              (QRemessaCARTEIRA.Value = 15) or (QRemessaCARTEIRA.Value = 17) then
              mPrefixoTitulo := 'AI '
            else if QRemessaCARTEIRA.Value = 12 then
              mPrefixoTitulo := 'AIU'
            else if (QRemessaCARTEIRA.Value = 31) or (QRemessaCARTEIRA.Value =
              51) or
              (QRemessaCARTEIRA.Value = 54) then
              mPrefixoTitulo := 'SD ';

            mContaCaucao := '0';

            {           if QRemessaCARTEIRA.Value = 31 then  // foi conversado com a Jussara no fone 041-321-2570 e ela informou que este campo nao é mais tratado entao preencher com 0
                         if (StrToDate(QRemessaDT_VENCIMENTO.Text) <= date + 180 ) then
                            mContaCaucao := '1'
                         else
                            mContaCaucao := '2';  }

            if Length(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14)) = 14 then
              mTipoInscricao := '02'
            else
              mTipoInscricao := '01';

            // Isto é necessario para nosso numero com letras exemplo : X
            mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;
            while Pos(' ', mCodNossoNumero) > 0 do
              mCodNossoNumero[Pos(' ', mCodNossoNumero)] := '0';
            if Trim(mCodNossoNumero) = '' then
              mCodNossoNumero := '00000000000 ';
            //---adicionado pelo Fabio para corrigir problema de conversao de layout 400 p/240 zadimel
            if (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', '') = 'ZADIMEL') then
              wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 7) + '/' + RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2)
            else if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE')
              or
              (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE')) then
              wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 7) + '-' +
                RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2)
            else
              wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10);

            { Número da sequencia segundo layout }
   {1 e 2 }S := S + '102' +
            {3}RMaskCGC_CPF(QRemessanum_cgc_filial_conta.Text, 14) +
            {4}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
            {5}RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Value, 1) +
            {6}Copy(mNUM_CEDENTE, 1, 8) +
            {7}FormatMaskText('C', QRemessaDIGITO_VERIFICADOR_CEDENTE.Value) +
            {8}RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 6) +
            {9}RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 2) +
            {9}RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 7) +
            {9}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6) +
            {9}RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2) +
            {9}mBrancos +
            {10}mCodNossoNumero +
            {11-12-13-14-15}'0000    ' +
            {16}mPrefixoTitulo +
            {17}RMaskCGC_CPF(QRemessaVARIACAO.Text, 3) +
            {18}mContaCaucao +
            {19-20-21}'000000000000' +
            {22}'     ' +
            {23}RMaskCGC_CPF(QRemessaCARTEIRA.Text, 2) +
            {24}RMaskCGC_CPF(QRemessaCOMANDO.Text, 2) +
              wNumTitulo +
              // {25}    RMaskCGC_CPF(QRemessaNUM_TITULO.Text,10)                                         +
       {26}Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
            {26}Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
            {26}RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2) +
            {27}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
            {28}'001' +
            {29-30}'00000' +
            {31}'01' + // 01=Duplicata mercatil
            {32}'N' +
            {33}Copy(QRemessaDT_EMISSAO.Text, 1, 2) +
            {33}Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
            {33}RMaskCGC_CPF(Copy(QRemessaDT_EMISSAO.Text, 9, 2), 2) +
            {34}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2);
            //            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
                        {35}S := S + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2); // alterado pelo César
            //              {35}S := S + '05' //instruçao para protestar após o quinto dia util
            //            else
            //              {35}S := S + '00';
                        {36}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            Else
             begin
               S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
             end;
            wDesconto := StrToFloat('0' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
            If wDesconto > 0 Then
               {37}S := S + Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) + Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) + RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2)
            Else
               {37}S := S + '000000'; // Data para desconto //
            wDesconto := ((DMContasReceber.QRemessaVAL_TITULO.Value * wDesconto) / 100);
            {38}S := S + IntDecimais(FloatToStr(wDesconto), 13, 2);
            {39}S := S + '0000000000000' + // CARTEIRA 15 OU 12
            {40}'0000000000000' + // Valor do abatimento
            {41}mTipoInscricao +
            {42}RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
            {43}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaNOME.Text))) +
            {44}'   ' +
            {45}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
            {46}'               ' +
            {47}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
            {48}FormatMaskText('CCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
            {49}FormatMaskText('CC',
              UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text)) +
            {50}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', wAux)
              +
              {51}'00' + // Quantidade de dias p/protesto.
            {52}' ' +
            {53}RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);

            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;

          end; // fim do while

          // -------------   Registro Trailler -------------- \\

          mBrancos := '';
          for x := 1 to 393 do
          begin
            mBrancos := mBrancos + ' '; // Usado anteriormente também.
          end;
          S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
          // +Chr(13)+Chr(10);

        //------------------ Fim --------------------------\\

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA-CBR 641 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
            MessageDlg('Arquivo REMESSA-CBR 641 não foi Gerado!', mtWarning,
              [mbOk], 0);
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.QClick(Sender: TObject);
var
  wCont, i: integer;
  x, wRECUSA: string;
  F: TextFile;
  S: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;

begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  FContaCorrenteCons.ShowModal;
  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }
    Readln(F, S); {Le a proxima linha do arquivo }

    //  DMOracle.DBCemapa.StartTransaction;

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;

    DMContasReceber.CdRetornoRemessa.Close;
    DMContasReceber.CdRetornoRemessa.Open;

    while (Trim(S) <> ' ') and (Trim(Copy(S, 1, 1)) = '1') do // Caso seja um registro em branco finaliza nao entrar.
    begin
      {Verifica se a linha inteira ou o comando estão diferentes de brancos.}
      if (Trim(S) <> '') and (Copy(S, 109, 2) <> '  ') then
      begin
        x := Copy(S, 109, 2); // Pega COMANDO-24
        if (StrToFloat(x) <> 3) and (Copy(S, 63, 11) <> '') then
          // Comando não recusado.
        begin
          if StrToInt(x) in [5, 6, 7, 8, 15] then
          begin
            wVal_Juro := 0;
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;

            wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
              Copy(S, 115, 02);
            wDtCredito := Copy(S, 176, 02) + '/' + Copy(S, 178, 02) + '/' +
              Copy(S, 180, 02);
            wNNumero := Copy(S, 63, 12);
            // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
            wNum_Titulo := Trim(copy(S, 47, 6));
            //numero do titulo no sistema cemapa
          // Verifica se valor para baixar é diferente de zero.
            if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
              wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
            else
              raise exception.Create('Título com valor a baixar igual a zero!');

            if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
            begin
              wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
              wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
            end;

            if StrToFloat(Copy(S, 280, 13)) <> 0 then // Outros Recebimentos
            begin
              wVal_Juro := wVal_Juro + StrToFloat(Copy(S, 280, 13)) / 100;
              wpgto_juro := wVal_Juro + StrToFloat(Copy(S, 280, 13)) / 100;
            end;

            if (StrToFloat(Copy(S, 241, 13)) <> 0) or (StrToFloat(Copy(S, 228,
              13)) <> 0) then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
                StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro, wNNumero, wDtLiquida, wDtCredito);
            // Chama procedimento para baixa de titulo.
          end;
        end;
      end
      else if Copy(S, 63, 11) = '' then // Nosso numero esta em branco.
      begin
        x := '100'
      end;
      case StrToInt(x) of
        1: wRECUSA := 'Identificação inválida';
        2: wRECUSA := 'Variação da carteira inválida';
        3: wRECUSA := 'Valor de juros por um dia';
        4: wRECUSA := 'Valor de desconto inválido';
        5: wRECUSA := 'Espécie de título inválida para carteira/variação';
        6: wRECUSA := 'Espécie de valor variável inválido';
        7: wRECUSA := 'Prefixo da agência usuária inválido';
        8: wRECUSA := 'Valor do título/apólice inválido';
        9: wRECUSA := 'Data de vencimento inválida';
        10: wRECUSA := 'Fora do prazo(só admissível na carteira 11)';
        11: wRECUSA := 'Inexistência de margem para desconto';
        12: wRECUSA := 'O Banco não tem agência na praça do sacado';
        13: wRECUSA := 'Razões cadastrais';
        14: wRECUSA :=
          'Sacado interligado com o sacador(só admissível em cobrança simples-cart.11 e 17)';
        15: wRECUSA :=
          'Título sacado contra órgão do Poder Público(só admissível na cart.11 e sem ordem de protesto)';
        16: wRECUSA := 'Títulos preenchidos de forma irregular';
        17: wRECUSA := 'Título rasurado';
        18: wRECUSA := 'Endereço do sacado não localizado ou incompleto';
        19: wRECUSA := 'Código do cedente inválido';
        20: wRECUSA := 'Nome/endereço do cliente não informado(ECT)';
        21: wRECUSA := 'Carteira inválida';
        22: wRECUSA := 'Quantidade de valor variável inválida';
        23: wRECUSA := 'Faixa nosso número execedida';
        24: wRECUSA := 'Valor do abatimento inválido';
        25: wRECUSA := 'Novo número do título dado pelo cedente';
        26: wRECUSA := 'Valor do IOF de seguro invalido';
        27: wRECUSA := 'Nome do sacado/cedente inválido ou não informado';
        28: wRECUSA := 'Data do novo vencimento inválida';
        29: wRECUSA := 'Endereço não informado';
        30: wRECUSA := 'Registro de título já liquidado(carteira 17 tipo 4)';
        31: wRECUSA := 'Número de borderô inválido';
        32: wRECUSA := 'Nome da pessoa autorizada inválido';
        33: wRECUSA := 'Nosso número já existe';
        34: wRECUSA := 'Número da prestação do contrato inválido';
        35: wRECUSA := 'Percentual de desconto inválido';
        36: wRECUSA := 'Dias para fichamento de protesto invalido';
        37: wRECUSA := 'Data de emissão do titulo inválido';
        38: wRECUSA :=
          'Data do vencimento anterior à data da emissão do título';
        39: wRECUSA := 'Comando de alteração indevido para carteira';
        40: wRECUSA := 'Tipo de moeda inválida';
        41: wRECUSA := 'Abatimento não permitido';
        42: wRECUSA := 'CEP do sacado inválido';
        43: wRECUSA :=
          'Código de unidade variável incompatível com a data de emissão do título';
        44: wRECUSA := 'Dados para débito ao sacado inválidos';
        45: wRECUSA := 'Carteira/variação encerrada';
        46: wRECUSA := 'Convênio encerrado';
        47: wRECUSA := 'Título tem valor diverso do informado';
        48: wRECUSA := 'Motivo de baixa inválido para carteira';
        49: wRECUSA := 'Abatimento a cancelar não consta do título';
        50: wRECUSA := 'Comando incompatível com a carteira';
        51: wRECUSA := 'Código do convenente inválido';
        52: wRECUSA := 'Abatimento igual ou maior que o valor do título';
        53: wRECUSA := 'Título já se encontra na situação pretendida';
        54: wRECUSA := 'Título fora do prazo admitido para a conta 1';
        55: wRECUSA := 'Novo vencimento fora dos limites da carteira';
        56: wRECUSA := 'Título não pertence ao convenente';
        57: wRECUSA := 'Variação incompatível com a carteira';
        58: wRECUSA := 'Impossível a transferência para carteira indicada';
        59: wRECUSA := 'Título vencido em transferência para a carteira 51';
        60: wRECUSA :=
          'Título com prazo superior a 179 dias em transferência para cart.51';
        61: wRECUSA := 'Título já foi fichado para protesto';
        62: wRECUSA :=
          'Alteração da situação de débito inválida para o código de responsabilidade';
        63: wRECUSA := 'DV do nosso número inválido';
        64: wRECUSA := 'Título não passível de débito/baixa-situação anormal';
        65: wRECUSA :=
          'Título com ordem de não protestar-não pode ser encaminhado à cartório';
        80: wRECUSA := 'Nosso número inválido';
        81: wRECUSA := 'Data para concessão de desconto inválida';
        82: wRECUSA := 'CEP do sacado inválido';
        83: wRECUSA := 'Carteira/variação não localizada no cedente';
        84: wRECUSA := 'Título não localizado na existência';
        99: wRECUSA := 'Outros motivos';
        100: wRECUSA := 'Número do convênio retornou em branco';
      end;

      DMContasReceber.CdRetornoRemessa.Append;
      DMContasReceber.CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
      DMContasReceber.CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 23, 08);
      DMContasReceber.CdRetornoRemessaDESC_REGISTRO.Value := IntToStr(i);
      DMContasReceber.CdRetornoRemessaDESC_RECUSA.Value := x;
      DMContasReceber.CdRetornoRemessaDESC_MENSAGEM.Value := wRECUSA;
      DMContasReceber.CdRetornoRemessa.Post;

      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if FRRetornoRemessaBB = nil then
      FRRetornoRemessaBB := TFRRetornoRemessaBB.Create(Application);
    FRRetornoRemessaBB.QRPrimario.Preview;

    DMContasReceber.CdRetornoRemessa.Close;

  end; // Fim do begin OpenDialog.

  CloseFile(F); // Fecha arquivo aberto.
end;

procedure TFContasReceberCad.BaixaTituloRetorno(wValor_Juro, wValor_Desconto,
  wValor_Baixa, wPagto_Juro: Real;
  NNumero, mDataLiquidacao, mDataCredito: string);
var
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  CC, wFilial, wFilial_Contabil: Integer;
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' then
  begin
    mDataCredito := DateToStr(Date);
    mDataLiquidacao := DateToStr(Date);
  end;
  DMContasReceber.pBaixaMagenetico := 'S';

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    if wNum_Titulo = '' then
      QAchaTitulo.SetVariable('TITULO', Null)
    else
      QAchaTitulo.SetVariable('TITULO', wNum_Titulo);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK', DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;
        if (wPagto_Juro = 0) and (wValor_Juro = 0) then
          // foi colocado pelo cesar - esta vindo titulos da sicredi com valor a maior e zeros nos juros
          if wValor_Baixa > QContasReceber_CabVal_Titulo.Value then
          begin
            wPagto_Juro := wValor_Baixa - QContasReceber_CabVal_Titulo.Value;
            wValor_Juro := wValor_Baixa - QContasReceber_CabVal_Titulo.Value;
          end;
        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'RECEBTO. JUROS';

              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Value;
                wContaDeb := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);  // Data entrada ou liquidacao
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);

                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);

                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'RECEBTO. PRINCIPAL';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value := StrToDate(mDataCredito); // data do credito ou liquidacao
                if DMParamSistema.QParamSistemaInd_Tipo_Integracao.Value = 'C' then // Integracao via caixa    Cesar 05/10/2009
                  DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Baixa + wValor_Desconto
                else
                  DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Baixa;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                wContaDeb := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);   // Data entrada ou liquidação
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'DESC. CONCEDIDO';

              if not (DMFinalidade.QFinalidadeCod_Historico_Desc.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_DESC.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);   // Data entrada ou liquidação
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar. NN-'
          + NNumero);
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';
end;

procedure TFContasReceberCad.RelatrioArquivodeRemessa6411Click(
  Sender: TObject);
begin
  inherited;
  {   if FContasReceberParam = nil then
       FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
    if FContasReceberParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME17CodFilial.Text,'CONTAS A RECEBER');
      with DMContasReceber do
      begin
        QRRemessaDesconto.Close;
        if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
           QRRemessaDesconto.SetVariable('COD_FILIAL',FContasReceberParam.ME17CodFilial.text)
        else
           raise exception.Create ('Código da Filial não pode ficar em branco');
        if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
           QRRemessaDesconto.SetVariable('NUM_TITULO',FContasReceberParam.Me17NrTitulo.text)
        else
           QRRemessaDesconto.SetVariable('NUM_TITULO',Null);
        if Trim(FContasReceberParam.ME17CodContaCorrente.text)<>'' then
           QRRemessaDesconto.SetVariable('COD_CONTA_CORRENTE',FContasReceberParam.ME17CodContaCorrente.text)
        else
           raise exception.Create ('Código da Conta Corrente não pode ficar em branco');
        if Trim(FContasReceberParam.ME17DtInicial.text) = '' then
           Raise Exception.Create('Campo Data Inicial Deve Ser Informado');
        QRRemessaDesconto.SetVariable('DT_INICIAL',FContasReceberParam.ME17DtInicial.text);
        if Trim(FContasReceberParam.ME17DtFinal.text)<>'' then
           QRRemessaDesconto.SetVariable('DT_FINAL',FContasReceberParam.ME17DtFinal.text)
        else
           raise exception.Create ('Data Final não pode ficar em branco');

        If FContasReceberParam.RG17Ordem.ItemIndex = 0 then
          QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count-1]:='  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO '
        else
          QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count-1]:='  TB_CONTA_RECEBER_CAB.NUM_TITULO  ';

        QRRemessaDesconto.Open;
        if FRRemessas_641 = nil then
           FRRemessas_641:=TFRRemessas_641.create(Application);
        FRRemessas_641.QRLTitulo.Caption:=FContasReceberParam.Me17Titulo.Text+FContasReceberParam.ME17DtInicial.text+' até '+FContasReceberParam.ME17DtFinal.text;
        FRRemessas_641.QRLEmpresa.Caption:='Filial: '+FContasReceberParam.ME17Filial.text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
           FRRemessas_641.QRPrimario.Preview
        else
           FRRemessas_641.QRPrimario.Print;
        QRRemessaDesconto.Close;
      end;
    end;
   }

  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  FContasReceberParam.Rg17Remessa.Visible := true;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME17CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;
      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        raise exception.Create('Código da Filial não pode ficar em branco');
      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me17NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);
      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        raise
          exception.Create('Código da Conta Corrente não pode ficar em branco');
      if Trim(FContasReceberParam.ME17DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRemessa.SetVariable('DT_INICIAL',
        FContasReceberParam.ME17DtInicial.text);
      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        raise exception.Create('Data Final não pode ficar em branco');

      if FContasReceberParam.RG17Ordem.ItemIndex = 0 then
        QRemessa.SQL[QRemessa.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO '
      else
        QRemessa.SQL[QRemessa.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.NUM_TITULO  ';

      if FContasReceberParam.Rg17Remessa.ItemIndex = 0 then
        QRemessa.SetVariable('IND_REMESSA', 'SIM')
      else
        QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;
      if FRRemessas_641 = nil then
        FRRemessas_641 := TFRRemessas_641.create(Application);
      FRRemessas_641.QRLTitulo.Caption := FContasReceberParam.Me17Titulo.Text +
        FContasReceberParam.ME17DtInicial.text + ' até ' +
        FContasReceberParam.ME17DtFinal.text;
      FRRemessas_641.QRLEmpresa.Caption := 'Filial: ' +
        FContasReceberParam.ME17Filial.text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRRemessas_641.QRPrimario.Preview
      else
        FRRemessas_641.QRPrimario.Print;
      QRemessa.Close;
    end;
  end;
end;

procedure TFContasReceberCad.GerarArquivoSCI1Click(Sender: TObject);
var
  F: TextFile;
  S: string;
  mValorPago: Real;
  mDataVencimento: string;
  mDataPagamento: string;
  wTelefone: string;
  wEndereco: string;
  wTipoRegistro: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[10].TabVisible := True;

  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME10CodFilial.Text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QCadastroSCI.Close;
      if FContasReceberParam.RG10Tipo.ItemIndex = 0 then
        QCadastroSCI.SetVariable('pTIPO', 'F')
      else
        QCadastroSCI.SetVariable('pTIPO', 'J');

      if Trim(FContasReceberParam.ME10DtInicial.Text) <> '' then
        QCadastroSCI.SetVariable('DT_INICIAL',
          StrtoDate(FContasReceberParam.ME10DtInicial.Text))
      else
        QCadastroSCI.SetVariable('DT_INICIAL', Null);
      if Trim(FContasReceberParam.ME10DtFinal.Text) <> '' then
        QCadastroSCI.SetVariable('DT_FINAL',
          StrtoDate(FContasReceberParam.ME10DtFinal.Text))
      else
        QCadastroSCI.SetVariable('DT_FINAL', Null);
      if Trim(FContasReceberParam.ME10CodFilial.Text) <> '' then
        QCadastroSCI.SetVariable('COD_FILIAL',
          FContasReceberParam.ME10CodFilial.Text)
      else
        QCadastroSCI.SetVariable('COD_FILIAL', Null);
      QCadastroSCI.SetVariable('DT_VENCTO_INICIAL',
        StrtoDate(FContasReceberParam.MeDtVctoInicial.Text));
      QCadastroSCI.SetVariable('DT_VENCTO_FINAL',
        StrtoDate(FContasReceberParam.MeDtVctoFinal.Text));
      QCadastroSCI.Open;
      QCadastroSCI.First;

      if QCadastroSCI.RecordCount > 0 then
      begin
        S := ''; // Inicializa valor da variavel.
        if FContasReceberParam.RG10Tipo.ItemIndex = 0 then // Pessoa fisica
        begin
          while not QCadastroSCI.Eof do
          begin
            if QCadastroSCIDT_VENCIMENTO.Value = QCadastroSCIDT_EMISSAO.Value then
            begin
              mValorPago := QCadastroSCIVAL_TITULO.Value +
                QCadastroSCIVAL_JUROS.Value;
              mDataPagamento := Copy(QCadastroSCIDT_BAIXA.Text, 1, 2) +
                Copy(QCadastroSCIDT_BAIXA.Text, 4, 2) +
                Copy(QCadastroSCIDT_BAIXA.Text, 7, 4);
            end
            else
            begin
              mValorPago := 0;
              mDataPagamento := '        ';
            end;

            mDataVencimento := Copy(QCadastroSCIDT_VENCIMENTO.Text, 1, 2) +
              Copy(QCadastroSCIDT_VENCIMENTO.Text, 4, 2) +
              Copy(QCadastroSCIDT_VENCIMENTO.Text, 7, 4);

            // Verifica as datas se estão em branco e preenche com ASCII 32
            if Trim(mDataVencimento) = '' then
              mDataVencimento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                + CHR(32) + CHR(32) + CHR(32);

            if Trim(mDataPagamento) = '' then
              mDataPagamento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                + CHR(32) + CHR(32) + CHR(32);

            Bib.ValidaCPF(QCadastroSCINUM_CGC_CPF.Text); //Validar CPF

            if Length(QCadastroSCIDESC_TELEFONE.Text) > 10 then
              wTelefone := Copy(QCadastroSCIDESC_TELEFONE.Text, 5,
                length(QCadastroSCIDESC_TELEFONE.Text))
            else
              wTelefone := (QCadastroSCIDESC_TELEFONE.Text);

            wTelefone := Bib.LimpaString(wTelefone, '-');
            //----elimina traço do numero do telefone
            wTelefone := Bib.LimpaString(wTelefone, '.');
            //----elimina ponto do numero do telefone
            wTelefone := Bib.LimpaString(wTelefone, ' ');
            //----elimina espaço em branco do numero do telefone

            S := S + 'F' + //  Pessoa fisica
              RMaskCGC_CPF(QCadastroSCINUM_CGC_CPF.Text, 11) + // CPF
              '                    ' + // Identidade/RG
              '    ' + // Orgao emissor.
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCINOME.Value)) + //
              'R' + // Natureza do endereço
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCIDESC_ENDERECO.Value)) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              RemoveAcento(QCadastroSCIDESC_CIDADE.Value)) +
              FormatMaskText('CC', QCadastroSCICOD_ESTADO.Value) +
              RMaskCGC_CPF(QCadastroSCIDESC_CEP.Value, 8) +
              '    ' + // DDD do telefone
              Bib.FormataTextoEsq(wTelefone, 10) + // Telefone
              '    ' + // DDD do fax
              '          ' + // Numero do fax
              '                                                  ' + // E-mail na internet
              Copy(QCadastroSCIDT_CADASTRO.Text, 4, 2) +
              Copy(QCadastroSCIDT_CADASTRO.Text, 7, 4) + // Cliente desde MES/ANO
              FormatMaskText('CCCCCCCCCCCC',
              QCadastroSCICOD_CONTA_RECEBER_CAB.Text) +
              'N' + // Natureza do titulo N=Nota Fiscal
              'R$  ' + // Moeda
              RMaskCGC_CPF(FloatToStr(QCadastroSCIVAL_TITULO.Value * 100), 13) +
              // Valor do titulo/com centavos
            RMaskCGC_CPF(FloatToStr(mValorPago * 100), 13) +
              // Valor pago/com centavos
            Copy(QCadastroSCIDT_EMISSAO.Text, 1, 2) +
              // Data  - Emissão do titulo.
            Copy(QCadastroSCIDT_EMISSAO.Text, 4, 2) + // da
              Copy(QCadastroSCIDT_EMISSAO.Text, 7, 4) + // Venda
              mDataVencimento + // Data de vencimento do titulo.
              mDataPagamento + Chr(13) + Chr(10);
            QCadastroSCI.Next;

          end;
        end
        else // Trata layout para pessoa juridica
        begin
          while not QCadastroSCI.Eof do
          begin
            if length(QCadastroSCINUM_CGC_CPF.TEXT) > 14 then
            begin
              if (QCadastroSCIDT_BAIXA.Text <> '') then
              begin
                mValorPago := QCadastroSCIVAL_TITULO.Value +
                  QCadastroSCIVAL_JUROS.Value;
                mDataPagamento := Copy(QCadastroSCIDT_BAIXA.Text, 1, 2) +
                  Copy(QCadastroSCIDT_BAIXA.Text, 4, 2) +
                  Copy(QCadastroSCIDT_BAIXA.Text, 7, 4);
              end
              else
              begin
                mValorPago := 0;
                mDataPagamento := '        ';
              end;

              mDataVencimento := Copy(QCadastroSCIDT_VENCIMENTO.Text, 1, 2) +
                Copy(QCadastroSCIDT_VENCIMENTO.Text, 4, 2) +
                Copy(QCadastroSCIDT_VENCIMENTO.Text, 7, 4);
              // Verifica as datas se estão em branco e preenche com ASCII 32
              if Trim(mDataVencimento) = '' then
                mDataVencimento := CHR(32) + CHR(32) + CHR(32) + CHR(32) +
                  CHR(32) + CHR(32) + CHR(32) + CHR(32);

              if Trim(mDataPagamento) = '' then
                mDataPagamento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                  + CHR(32) + CHR(32) + CHR(32);

              if Length(QCadastroSCIDESC_TELEFONE.Text) > 10 then
                wTelefone := Copy(QCadastroSCIDESC_TELEFONE.Text, 5,
                  length(QCadastroSCIDESC_TELEFONE.Text))
              else
                wTelefone := QCadastroSCIDESC_TELEFONE.Text;

              wTelefone := Bib.LimpaString(wTelefone, '-');
              //----elimina traço do numero do telefone
              wTelefone := Bib.LimpaString(wTelefone, '.');
              //----elimina ponto do numero do telefone
              wTelefone := Bib.LimpaString(wTelefone, ' ');
              //----elimina espaço em branco do numero do telefone
              wEndereco :=
                Bib.LimpaString(RemoveAcento(QCadastroSCIDESC_ENDERECO.Value),
                'ª');
              wEndereco :=
                Bib.LimpaString(RemoveAcento(QCadastroSCIDESC_ENDERECO.Value),
                'º');
              wEndereco := Bib.LimpaString(wEndereco, '-');
              wEndereco := Bib.LimpaString(wEndereco, '.');

              if (QCadastroSCIDT_VENCIMENTO.Value < (date - 15)) then
                wTipoRegistro := 'U' // Negativação de cadastro.
              else
                wTipoRegistro := 'J';
              S := S + wTipoRegistro +
                RMaskCGC_CPF(QCadastroSCINUM_CGC_CPF.Text, 14) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCINOME.Value)) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCIDESC_FANTASIA.Value)) +
                'M' + // M=Matriz C=Cobrança E=Entrega
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', wEndereco) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
                RemoveAcento(QCadastroSCIDESC_CIDADE.Value)) +
                FormatMaskText('CC', QCadastroSCICOD_ESTADO.Value) +
                RMaskCGC_CPF(QCadastroSCIDESC_CEP.Value, 8) +
                '    ' + // DDD do telefone
                '          ' {---desc telefone } +
                '    ' + // DDD do fax
                '          ' + // Numero do fax
                '                                                  ' + // E-mail na internet
                Copy(QCadastroSCIDT_CADASTRO.Text, 4, 2) +
                Copy(QCadastroSCIDT_CADASTRO.Text, 7, 4) +
                FormatMaskText('CCCCCCCCCCCC',
                QCadastroSCICOD_CONTA_RECEBER_CAB.Text) +
                'N' + // Natureza do titulo N=Nota Fiscal
                'R$  ' + // Moeda
                RMaskCGC_CPF(FloatToStr(QCadastroSCIVAL_TITULO.Value * 100), 13) +
                // Valor do titulo/com centavos
              RMaskCGC_CPF(FloatToStr(mValorPago * 100), 13) +
                // Valor pago/com centavos
              Copy(QCadastroSCIDT_EMISSAO.Text, 1, 2) +
                // Data  - Emissão do titulo.
              Copy(QCadastroSCIDT_EMISSAO.Text, 4, 2) + // da
                Copy(QCadastroSCIDT_EMISSAO.Text, 7, 4) + // Venda
                mDataVencimento + // Data de vencimento do titulo.
                mDataPagamento + Chr(13) + Chr(10);
            end;
            QCadastroSCI.Next;
          end;
        end;
        // ---------------- Final da geração do arquivo.--------------\\
        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
          Rewrite(F);
          Writeln(F, S);
          CloseFile(F);
          MessageDlg('Arquivo SCI Gerado com Sucesso!', mtInformation, [mbOk],
            0);
        end
        else
          MessageDlg('Arquivo SCI não foi Gerado!', mtWarning, [mbOk], 0);

      end
      else
        ShowMessage('Não existem registros a serem gerados.');
    end;
  end;
end;

procedure TFContasReceberCad.EmissoRecibo1Click(Sender: TObject);
begin
  inherited;
  if FRRecibo = nil then
    FRRecibo := TFRRecibo.Create(Application);

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',
    DMContasReceber.QContasReceber_CabCod_Filial.Value);
  DMFilial.QFilial.Open;
  FRRecibo.QRLRecebido.Caption :=
    DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
    DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
  FRRecibo.QRLRecebido1.Caption :=
    DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
    DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
  FRRecibo.QRLDataEmissao.Caption :=
    DMContasReceber.QContasReceber_CabDt_Emissao.Text;
  FRRecibo.QRLDataEmissao1.Caption :=
    DMContasReceber.QContasReceber_CabDt_Emissao.Text;
  FRRecibo.QRLValor.Caption :=
    DMContasReceber.QContasReceber_CabVal_Titulo.text;
  FRRecibo.QRLValor_Juros.Caption := '0,00';
  FRRecibo.QRLValor_Baixa.Caption := '0,00';
  FRRecibo.QRLDesconto.Caption := '0.00';
  FRRecibo.QRLValor1.Caption :=
    DMContasReceber.QContasReceber_CabVal_Titulo.text;
  FRRecibo.QRLValor_Juros1.Caption := '0,00';
  FRRecibo.QRLValor_Baixa1.Caption := '0,00';
  FRRecibo.QRLDesconto1.Caption := '0.00';
  FRRecibo.QRLValorExtenso.Caption :=
    Bib.Extenso(DMContasReceber.QContasReceber_CabVal_Titulo.Value, 'REAL');
  FRRecibo.QRLValorExtenso1.Caption :=
    Bib.Extenso(DMContasReceber.QContasReceber_CabVal_Titulo.Value, 'REAL');
  FRRecibo.QRLDescricao.Caption :=
    DMContasReceber.QContasReceber_CabDesc_Finalidade.Text + ' - ' +
    DMContasReceber.QContasReceber_CabDesc_Observacao.Text;
  FRRecibo.QRLDescricao1.Caption :=
    DMContasReceber.QContasReceber_CabDesc_Finalidade.Text + ' - ' +
    DMContasReceber.QContasReceber_CabDesc_Observacao.Text;
  FRRecibo.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy',
    DMContasReceber.QContasReceber_CabDt_Emissao.Value);
  FRRecibo.QRLData1.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy',
    DMContasReceber.QContasReceber_CabDt_Emissao.Value);
  FRRecibo.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.Value;
  FRRecibo.QRLResponsavel1.Caption := DMFilial.QFilialDesc_Filial.Value;
  FRRecibo.QRDBTitulo.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBTitulo.DataField := 'NUM_TITULO';
  FRRecibo.QRDBTitulo1.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBTitulo1.DataField := 'NUM_TITULO';
  FRRecibo.QRDBParcela.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBParcela.DataField := 'NUM_PARCELA';
  FRRecibo.QRDBParcela1.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBParcela1.DataField := 'NUM_PARCELA';
  FRRecibo.QRDBVenc.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBVenc.DataField := 'DT_VENCIMENTO';
  FRRecibo.QRDBVenc1.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBVenc1.DataField := 'DT_VENCIMENTO';
  FRRecibo.QRDBCod_Conta.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBCod_Conta.DataField := 'COD_CONTA_RECEBER_CAB';
  FRRecibo.QRDBCod_Conta1.DataSet := DMContasReceber.QContasReceber_Cab;
  FRRecibo.QRDBCod_Conta1.DataField := 'COD_CONTA_RECEBER_CAB';
  FRRecibo.QRLSaldo.Caption := '0';
  FRRecibo.QRLSaldo1.Caption := '0';
  FRRecibo.QuickRep1.Preview;
end;

procedure TFContasReceberCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  //  DMContasReceber.QContasReceber_Mov.Close;
  //  DMContasReceber.QContasReceber_Mov.Open;
end;

procedure TFContasReceberCad.Capitalizao1Click(Sender: TObject);
begin
  inherited;
  if FContasReceber_Capitalizacao = nil then
    FContasReceber_Capitalizacao :=
      TFContasReceber_Capitalizacao.Create(Application);
  FContasReceber_Capitalizacao.Showmodal;
end;

procedure TFContasReceberCad.ResumoPorSiglaBanco1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[16].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME18CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME18DtInicial.text) = '') or
      (Trim(FContasReceberParam.ME18DtFinal.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRContasReceberResumo.Close;
      if Trim(FContasReceberParam.ME18CodCliente.Text) <> '' then
        QRContasReceberResumo.SetVariable('CADASTRO',
          FContasReceberParam.ME18CodCliente.Text)
      else
        QRContasReceberResumo.SetVariable('CADASTRO', Null);

      if Trim(FContasReceberParam.ME18CodFinalidade.Text) <> '' then
        QRContasReceberResumo.SetVariable('FINALIDADE',
          FContasReceberParam.ME18CodFinalidade.Text)
      else
        QRContasReceberResumo.SetVariable('FINALIDADE', Null);
      if Trim(FContasReceberParam.ME18CodBanco.Text) <> '' then
        QRContasReceberResumo.SetVariable('BANCO',
          FContasReceberParam.ME18CodBanco.Text)
      else
        QRContasReceberResumo.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.ME18CodDepto.Text) <> '' then
        QRContasReceberResumo.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME18CodDepto.Text)
      else
        QRContasReceberResumo.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME18CodFilial.Text) <> '' then
        QRContasReceberResumo.SetVariable('FILIAL',
          FContasReceberParam.ME18CodFilial.Text)
      else
        QRContasReceberResumo.SetVariable('FILIAL', Null);

      QRContasReceberResumo.SetVariable('DT_VENC_INICIAL',
        FContasReceberParam.ME18DtInicial.Text);
      QRContasReceberResumo.SetVariable('DT_VENC_FINAL',
        FContasReceberParam.ME18DtFinal.Text);
      QRContasReceberResumo.Open;
      if FRContasReceberResumo = nil then
        FRContasReceberResumo := TFRContasReceberResumo.Create(Application);
      FRContasReceberResumo.QRLPeriodo.Caption := 'PERIODO DE: ' +
        FContasReceberParam.Me18DtInicial.Text + ' ATÉ : ' +
        FContasReceberParam.Me18DtFinal.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberResumo.QRPrimario.Preview
      else
        FRContasReceberResumo.QRPrimario.Print;
      QRContasReceberResumo.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ArquivoRemessaHSBC1Click(Sender: TObject);
var
  mTipoInscricao, mNUM_CEDENTE: string;
  mCodNossoNumero, mBrancos, S: string;
  x, mSequencial: Integer;
  mSEQ_REMESSA: Real;
  F: TextFile;
begin
  inherited; // Rotina para banco H.S.B.C  {CODIGO RANGER HSBC-59863}
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;
      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if QRemessa.RecordCount > 0 then
      begin
        try
          // REGISTRO HEADER ARQUIVO REMESSA

          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_HSBC');

          mBrancos := '';
          for x := 1 to 277 do
          begin
            mBrancos := mBrancos + ' ';
          end;

          S := ''; // Inicia variavel.

          S := S + '01REMESSA01COBRANCA       0' +
            RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
            '55' +
            RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
            RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Value, 7) +
            '  ' +
            FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
            '399HSBC           ' +
            Copy(DateToStr(Date), 1, 2) +
            Copy(DateToStr(Date), 4, 2) +
            RMaskCGC_CPF(Copy(DateToStr(Date), 9, 2), 2) +
            '01600' +
            'BPI' +
            '  ' +
            'LANCV08' +
            mBrancos +
            '000001' + Chr(13) + Chr(10);

          // REGISTRO DETALHE ARQUIVO REMESSA

          mSequencial := 2; { 1=Registro HEADER }
          while not QRemessa.Eof do
          begin

            if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'F' then
              // Pessoa fisica
              mTipoInscricao := '01' // CPF
            else if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'J' then
              // Pessoa juridica
              mTipoInscricao := '02' // CNPJ
            else if Trim(QRemessaIND_FISICA_JURIDICA.Value) = '' then
              // Nada gravado.
              mTipoInscricao := '98' // Não tem
            else
              mTipoInscricao := '99'; // Outros

            // Isto é necessario para nosso numero com letras exemplo : X
            mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;
            while Pos(' ', mCodNossoNumero) > 0 do
              mCodNossoNumero[Pos(' ', mCodNossoNumero)] := '0';

            { Número da sequencia segundo layout DETALHE }
            S := S + '1' +
              mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) + '0' + {19-22}
              RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) + '55' + //SERGIO ALTERADO ERA 97 {25-35}
              RMaskCGC_CPF(IntToStr(QRemessaCOD_AGENCIA.Value) +
              QRemessaNUM_CONTA_CORRENTE.Value, 11) + '  ' + {38-62} '*' +
              RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text +
              QRemessaNUM_TITULO.Text, 24) + RMaskCGC_CPF(mCodNossoNumero, 11) +
              {74-79}'999999' +
              '00000000000' + //SERGIO ALTERADO ERA '        002'
              '999999' +
              '00000000000' + //SERGIO ALTERADO ERA '        002'
              '1' + // Cobrança simples
              '01' + // Remessa
            {111-120}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
              Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2) +
              {128-139}StrZero(QRemessaVAL_TITULO.Value, 13, 2) + '399' + '00000'; {148-149}
            S := S + '98';
            S := S + 'N' + // N= Não aceito - aceito
              Copy(QRemessaDT_EMISSAO.Text, 1, 2) + Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              RMaskCGC_CPF(Copy(QRemessaDT_EMISSAO.Text, 9, 2), 2) +
              {157-158}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2) + '00';
            {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              S := S + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value
                / DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                (QRemessaVal_Titulo.Value / 100)), 13, 2)
            else
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
            {174-179}S := S + '999999' +
              '0000000000000' + //SERGIO ALTERADO ERA '        002'
              '0000000000000' + //SERGIO ALTERADO ERA '        002'
              '0000000000000' + //SERGIO ALTERADO ERA '        002'
              mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaNOME.Text))) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
              '  ' + // NÃO SEI O QUE VAI AQUI
              FormatMaskText('CCCCCCCCCCCC', Trim(QRemessaDESC_BAIRRO.Text)) +
              RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              FormatMaskText('CCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
              FormatMaskText('CC', UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text))
              +
              '                                       ' +
              ' ' +
              '  ' +
              '9' + // Tipo de moeda 9=Real
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end; // fim do while
          // -------------   Registro Trailler -------------- \\
          mBrancos := '';
          for x := 1 to 393 do
          begin
            mBrancos := mBrancos + ' '; // Usado anteriormente também.
          end;
          S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
          // +Chr(13)+Chr(10);

        //------------------ Fim --------------------------\\

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA-HSBC Gerado com Sucesso!',
              mtInformation,
              [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA-HSBC não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.RetornoRemessaHSBC1Click(Sender: TObject);
var
  wCont, wCont1, i: integer;
  x, wRECUSA: string;
  F: TextFile;
  S: string;
begin
  inherited; // RETORNO H.S.B.C
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  FContaCorrenteCons.ShowModal;

  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }
    wCont1 := 0;
    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 10, 2) <> '01' then //alterado por marcos 14/11/06
      raise exception.Create('Retorno Inválido!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 4) <> 'HSBC' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-HSBC}

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> ' ') and (Trim(Copy(S, 1, 1)) = '1') do
      // Arquivo contém registro para processar.
    begin
      x := '100'; // Inicializa valor para número do erro/recusa.

      if StrToInt(Copy(Trim(S), 109, 2)) in [06, 07, 15, 16, 32, 33] then
        // Ver tabela explicativa NOTA 13
      begin
        BaixaTituloHSBC(S); // Chama procedimento para baixa de titulo.
        inc(wCont1);
      end
      else if Copy(Trim(S), 109, 2) = '03' then
        // Houve recusa do registro enviado.
      begin
        x := Copy(Trim(S), 302, 2);

        case StrToInt(x) of
          1: wRECUSA := 'Valor de desconto não informado';
          2: wRECUSA :=
            'Inexistëncia de agëncia do HSBC na praça do sacado informado';
          3: wRECUSA := 'CEP do sacado incorreto ou inválido';
          4: wRECUSA := 'Cadastro do cedente não aceita banco correspondente';
          5: wRECUSA := 'Tipo de moeda inválido';
          6: wRECUSA := 'Prazo de protesto indefinido/inválido';
          7: wRECUSA := 'Data do vencimento inválida';
          8: wRECUSA :=
            'Nosso número(Número bancário) utilizado não possui vinculação com a conta cobrança';
          9: wRECUSA := 'Taxa mensal de mora acima do permitido (170% ao mës).';
          10: wRECUSA := 'Taxa de multa acima do permitido (10% ao mës)';
          11: wRECUSA := 'Data limite do desconto inválida';
          12: wRECUSA :=
            'Código da agëncia depositaria do HSBC informado é inválido.';
          13: wRECUSA := 'Taxa de multa inválida';
          14: wRECUSA := 'Valor diário da multa não informado.)';
          15: wRECUSA :=
            'Quantidade de dias após vencimento para incidëncia da multa não informada.';
          16: wRECUSA := 'Outras irregularidades.';
          17: wRECUSA := 'Data de ínicio da multa inválida.';
          18: wRECUSA :=
            'Nosso número (número bancario) já existe para outro título.';
          19: wRECUSA := 'Valor do título inválido';
          20: wRECUSA := 'Ausëncia do nome do sacado';
          21: wRECUSA := 'Título sem borderö';
          22: wRECUSA := 'Número da conta do cedente não cadastrado.';
          23: wRECUSA :=
            'Instrução não permitida para título em garantia de operação.';
          24: wRECUSA :=
            'Condição de desconto não permitida para titulo em garantia de operação.';
          25: wRECUSA := 'Utilizada mais de uma instrução de multa.';
          26: wRECUSA := 'Ausëncia do endereço do sacado.';
          27: wRECUSA := 'Ausëncia do CEP do sacado.';
          28: wRECUSA :=
            'Ausëncia do CPF/CNPJ do sacado em título com instrução de protesto.';
          29: wRECUSA := 'Agëncia cedente informada inválida.';
          30: wRECUSA := 'Número da conta do cedente inválida.';
          31: wRECUSA := 'Contrato garantia não cadastrado/inválido.';
          32: wRECUSA := 'Tipo de carteira inválido.';
          33: wRECUSA :=
            'Conta corrente do cedente não compativel com orgão do contratante.';
          34: wRECUSA := 'Faixa de aplicação não cadastrada/ínválida.';
          36: wRECUSA := 'Data de emissão do titulo inválido';
          37: wRECUSA :=
            'Valor dos títulos acima de R$ 5.000.000,00(Cinco milhões de reais).';
          38: wRECUSA := 'Data de desconto menor que data de emissão.';
          39: wRECUSA := 'Espécie inválida.';
          40: wRECUSA := 'Auséncia no nome do sacador avalista.';
          41: wRECUSA := 'Data de ínicio de multa menor que data de emissão.';
          42: wRECUSA := 'Quantidade de moeda variavel inválida.';
          43: wRECUSA := 'Controle de participante inválido.';
          44: wRECUSA :=
            'Nosso número (número bancário) duplicado no mesmo movimento.';
          50: wRECUSA :=
            'Título baixado em ../../...(Vide data nas posições 111 a 116).';
          51: wRECUSA := 'Data de emissão da ocorrëncia inválida.';
          52: wRECUSA := 'Nosso número (número bancário) duplicado.';
          53: wRECUSA := 'Código de ocorrëncia comandada inválido.';
          54: wRECUSA :=
            'Valor do desconto concedido inválido.(Víde valor nas posições 228 a 240).';
          55: wRECUSA := 'Data de prorrogação de vencimento não informada.';
          56: wRECUSA := 'Outras irregularidades.';
          57: wRECUSA :=
            'Instrução não permitida para título em garantia de operações.';
          58: wRECUSA :=
            'Nosso número (número bancário) comando na instr/ocorr não possui vinculação com a conta cobrança.';
          59: wRECUSA :=
            'Nosso número (número bancário) comandado na baixa não possui vinculação com a conta cobrança.';
          60: wRECUSA :=
            'Valor do desconto igual ou maior que o valor do título.';
          61: wRECUSA :=
            'Título com valor em moeda variável não possui não permite condição de desconto.';
          62: wRECUSA :=
            'Data do desconto informada não coincide com o registro do título.';
          63: wRECUSA := 'Título não possui condição de desconto diário';
          64: wRECUSA :=
            'Título baixado em ../../...(Vide data nas posições 111 a 116).';
          65: wRECUSA :=
            'Título devolvido em ../../...(Vide data nas posições 111 a 116).';
          66: wRECUSA := 'Valor do título não confere com o registrado.';
          67: wRECUSA := 'Nosso número (Número bancário) não informado.';
          68: wRECUSA := 'Nosso número (Número bancário) não inválido.';
          69: wRECUSA :=
            'Concessão de abatimento não é permitida para moeda diferente de Real.';
          70: wRECUSA :=
            'Valor do abatimento concedido inválido.(Víde valor nas posições 111 a 116).';
          71: wRECUSA := 'Cancelamento comandado sobre título sem abatimento.';
          72: wRECUSA :=
            'Concessão de desconto não é permitida para moeda diferente de real.';
          73: wRECUSA := 'Valor do desconto não informado.';
          74: wRECUSA := 'Cancelamento comandado sobre título sem desconto';
          75: wRECUSA :=
            'Data de vencimento alterado inválida.(Víde data nas posições 111 a 116).';
          76: wRECUSA := 'Data de prorrogação de vencimento inválida.';
          77: wRECUSA := 'Data de instrução inválida.';
          78: wRECUSA := 'Protesto comandado em duplicidade no mesmo dia.';
          79: wRECUSA := 'Título não possui instrução de protesto.';
          80: wRECUSA := 'Título não possui condição de desconto.';
          81: wRECUSA := 'Título não possui instrução de abatimento.';
          82: wRECUSA := 'Valor de juros inválido.';
          83: wRECUSA := 'Nosso número (Número bancário) inexistente.';
          84: wRECUSA := 'Baixa/Liquidação por orgão não autorizado.';
          85: wRECUSA := 'Instrução de protesto recusada/inválida.';
          86: wRECUSA := 'Instrução não permitida para banco correspondente.';
          87: wRECUSA := 'Valor de instrução inválida.';
          88: wRECUSA := 'Instrução inválida para tipo de carteira.';
          89: wRECUSA :=
            'Valor do desconto informado não coincide com o registro do título.';
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;

        if wCont = 1 then
        begin
          Imp.WriteXY(6.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - HSBC  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(1, wCont,
            'Titulo     Cliente   Nº Registro    Cmd. de Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(1, wCont,
            '----------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        Imp.WriteXY(5, wCont, Copy(S, 117, 10) + ' ' + Copy(S, 23, 08) + ' ' +
          IntToStr(i) + '                   ' + x + '           ' + wRECUSA);
        Inc(WCont);
        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
  end; // Fim do begin OpenDialog.
  ShowMessage('Baixado ' + IntToStr(wCont1) + 'Títulos');
  CloseFile(F); // Fecha arquivo aberto.
end;

procedure TFContasReceberCad.BaixaTituloRURAL(S: string);
var
  wValor_Juro, wValor_Desconto, wValor_Baixa, wPagto_Juro: Real;
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  NNumero: string;
  mDataLiquidacao, mDataCredito: string;
  CC, wFilial, wFilial_Contabil: Integer;
begin
  DMContasReceber.pBaixaMagenetico := 'S';
  wValor_Juro := 0;
  wValor_Desconto := 0;
  wValor_Baixa := 0;
  wPagto_Juro := 0;
  mDataLiquidacao := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' + Copy(S,
    300, 02);
  mDataCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' + Copy(S, 300,
    02);

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  NNumero := Copy(S, 63, 8);
  //Nosso numero com o dígito verificador ( Numero do titulo no banco )
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK',
          DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;

        // Verifica se valor para baixar é diferente de zero.

        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor pago.
          wValor_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          raise exception.Create('Titulo com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wValor_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wPagto_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wValor_Desconto := StrToFloat(Copy(S, 241, 13)) / 100 +
            StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. JUROS';

              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value :=
                  StrToDate(mDataLiquidacao); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;

                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. PRINCIPAL';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
                  StrToDate(mDataLiquidacao); // data do credito ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wValor_Baixa; //SERGIO 25/11/02 - wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_BAIXA_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'DESC. CONCEDIDO';

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_DEB FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
                QContasReceberBaixaMov.Post;
              end;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar.');
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';

end;

procedure TFContasReceberCad.BaixaTituloHSBC(S: string);
var
  wValor_Juro, wValor_Desconto, wValor_Baixa, wPagto_Juro: Real;
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  NNumero: string;
  mDataLiquidacao, mDataCredito: string;
  CC, wFilial_Contabil, wFilial: Integer;
begin
  DMContasReceber.pBaixaMagenetico := 'S';
  wValor_Juro := 0;
  wValor_Desconto := 0;
  wValor_Baixa := 0;
  wPagto_Juro := 0;
  mDataLiquidacao := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S,
    115, 02);
  mDataCredito := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S, 115,
    02);

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  NNumero := Copy(S, 127, 11);
  //Nosso numero com o dígito verificador ( Numero do titulo no banco )
  wNum_Titulo := copy(S, 117, 10);
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    QAchaTitulo.SetVariable('TITULO', wNum_Titulo);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK',
          DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;

        // Verifica se valor para baixar é diferente de zero.

        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor pago.
          wValor_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          raise exception.Create('Titulo com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wValor_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wPagto_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wValor_Desconto := StrToFloat(Copy(S, 241, 13)) / 100 +
            StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. JUROS';

              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value :=
                  StrToDate(mDataLiquidacao); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;

                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. PRINCIPAL';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
                  StrToDate(mDataLiquidacao); // data do credito ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wValor_Baixa; //SERGIO 25/11/02 - wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_BAIXA_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'DESC. CONCEDIDO';

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_DEB FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
                QContasReceberBaixaMov.Post;
              end;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar. NN-'
          + NNumero);
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';

end;

procedure TFContasReceberCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMContasReceber do
  begin
    QcontasReceber_Cab.Open;
    QContasReceber_Mov.Open;
  end;
  Action := CaFree;
  FContasReceberCad := nil;
end;

procedure TFContasReceberCad.EmissoBloquetoTotal1Click(Sender: TObject);
var
  wBanco: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[17].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if Trim(FContasReceberParam.ME19CodContaCorrente.Text) = '' then
      raise Exception.Create('Informe o Código da Conta Corrente');
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME19CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if FContasReceberParam.Rg19Vencimento.ItemIndex = 0 then
        DmContasReceber.pVencimentoBloqueto := 'S'
      else
        DmContasReceber.pVencimentoBloqueto := 'N';

      wBanco := DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA',
        'COD_BANCO_AGENCIA = ' + Trim(FContasReceberParam.ME19CodBanco.Text),
        True);
      if wBanco = '422' then
        Monta_Sql_Bloqueto_Safra
      else
        Monta_Sql_Bloqueto; //VAI MONTAR SQL ESTA NO DATA MODULO CONTAS RECEBER

      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
        Trim(FContasReceberParam.ME19CodContaCorrente.Text));
      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
        Trim(FContasReceberParam.ME19CodBanco.Text));

      if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
          Trim(FContasReceberParam.ME19CodNota.Text));
      if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
          Trim(FContasReceberParam.ME19CodNotaF.Text));
      if Trim(FContasReceberParam.ME19CodContaReceberCab.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = '
          + Trim(FContasReceberParam.ME19CodContaReceberCab.Text));
      if Trim(FContasReceberParam.ME19CodBanco.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.ME19CodBanco.Text));
      if Trim(FContasReceberParam.ME19CodFilial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME19CodFilial.Text));
      if Trim(FContasReceberParam.ME19Inicial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
          chr(39) + Trim(FContasReceberParam.ME19Inicial.Text) + chr(39));
      if Trim(FContasReceberParam.ME19Final.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
          chr(39) + Trim(FContasReceberParam.ME19Final.Text) + chr(39));
      QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');

      if trim(FContasReceberParam.ME19Instrucoes.Text) <> '' then
        DMContasReceber.pCodMensagem :=
          strtoint(trim(FContasReceberParam.ME19Instrucoes.Text))
      else
        DMContasReceber.pCodMensagem := 0;

      if wBanco = '422' then
      begin
        QRBloqueto.open;
        if QRBloqueto.RecordCount = 0 then
          FContasReceberCad.Monta_SQL_Safra_Bradesco
        else
        begin
          if FRBloqueto_SAFRA = nil then
            FRBloqueto_SAFRA := TFRBloqueto_SAFRA.Create(Application);
          FRBloqueto_SAFRA.QRPrimario.Print;
        end;
      end
      else
        Chama_Emissao_Bloqueto; // VAI IMPRIMIR O BLOQUETO ESTÁ NO DATA MODULO CONTAS A RECEBER

      DMContasReceber.pCodMensagem := 0;
    end;
  end;
end;

procedure TFContasReceberCad.atualiza_BloquetoCompleto;
begin
end;

procedure TFContasReceberCad.VoltarStatusregistros1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberTituloEnviado = nil then
    FContasReceberTituloEnviado :=
      TFContasReceberTituloEnviado.Create(Application);
  FContasReceberTituloEnviado.ShowModal;
end;

procedure TFContasReceberCad.ResumoCtaReceberDiario1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[18].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.MEEmissaoI18.Text) = '') or
      (Trim(FContasReceberParam.MEEmissaoF18.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.MECodFilial18.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContaReceberTotalDia.Close;

      if Trim(FContasReceberParam.MECodFilial18.Text) <> '' then
        QRContaReceberTotalDia.SetVariable('COD_FILIAL',
          FContasReceberParam.MECodFilial18.Text)
      else
        QRContaReceberTotalDia.SetVariable('COD_FILIAL', Null);
      QRContaReceberTotalDia.SetVariable('DT_VENCIMENTO_I',
        FContasReceberParam.MEEmissaoI18.Text);
      QRContaReceberTotalDia.SetVariable('DT_VENCIMENTO_F',
        FContasReceberParam.MEEmissaoF18.Text);

      QRContaReceberTotalDia.Open;

      if FRContaReceberTotalDia = nil then
        FRContaReceberTotalDia := TFRContaReceberTotalDia.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContaReceberTotalDia.QRPrimario.Preview
      else
        FRContaReceberTotalDia.QRPrimario.Print;
      QRContaReceberTotalDia.Close;
    end;
  end;
end;

procedure TFContasReceberCad.LiberaBaixaClick(Sender: TObject);
begin
  inherited;
  if FLiberaBaixa = nil then
    FLiberaBaixa := TFLiberaBaixa.create(Application);
  FLiberaBaixa.ShowModal;
end;

procedure TFContasReceberCad.ReciboComplementarJuro1Click(Sender: TObject);
var
  wCont: Integer;

begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[19].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (FContasReceberParam.ME20Val_Juro.Text <> '') and
      (FContasReceberParam.ME20DT_Vencimento.Text <> '') then
    begin
      with DmContasReceber do
      begin
        DMCadastro.QCadastro.Close;
        DMCadastro.QCadastro.SetVariable('PK',
          QContasReceber_CabConsCod_Cadastro.Value);
        DMCadastro.QCadastro.Open;

        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora; //----------abre impressora
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 40);
        //-----configurar pagina
        wCont := 6;
        Imp.WriteXY(13.7, wCont, copy(DateToStr(date), 1, 2));
        Imp.WriteXY(14.8, wCont, copy(DateToStr(date), 4, 2));
        Imp.WriteXY(15.9, wCont, copy(DateToStr(date), 7, 4));
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(12.5, wCont,
          DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' +
          DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CONTA_RECEBER_CAB',
          'COD_CONTA_RECEBER_CAB = ' +
          QContasReceber_CabConsCod_conta_Receber_Cab.Text, True)));
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(11.8, wCont,
          IntToStr(DMSequencia.Sequencia(QContasReceber_CabConsCod_Filial.Value,
          'RECIBO')));
        wCont := 16;
        Imp.WriteXY(6.0, wCont,
          IntToStr(QContasReceber_CabConsNum_Titulo.Value));
        Imp.WriteXY(13.0, wCont, FContasReceberParam.ME20DT_Vencimento.Text);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(3.0, wCont,
          Bib.NumToTexto(StrToFloat(FContasReceberParam.ME20Val_Juro.Text), 2,
          6));
        Inc(wCont);
        Inc(wCont);
        Inc(wCont);
        Imp.WriteXY(6.0, wCont,
          Bib.NumToTexto(StrToFloat(FContasReceberParam.ME20Val_Juro.Text), 2,
          6));
        Imp.WriteXY(16.0, wCont, FContasReceberParam.ME20DT_Vencimento.Text);
        wCont := 24;
        Imp.WriteXY(3.0, wCont, DMCadastro.QCadastroNome.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.0, wCont, DMCadastro.QCadastroDesc_Endereco.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.0, wCont, DMCadastro.QCadastroDesc_Cidade.Value);
        Imp.WriteXY(12.5, wCont, DMCadastro.QCadastroCod_Estado.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(3.0, wCont, DMCadastro.QCadastroDesc_Cidade.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.5, wCont, DMCadastro.QCadastroNUM_CGC_CPF.Value);
        Imp.WriteXY(12.5, wCont, DMCadastro.QCadastroNum_Inscricao.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(4.0, wCont,
          Bib.extenso(StrToFloat(FContasReceberParam.ME20Val_Juro.Text),
          'REAL'));
        Imp.SaltaPagina;
        Imp.FechaImpressora; // Finaliza os serviços de Impressao
      end;
    end
    else
      showmessage('Devem ser informados a data de vencimento e o valor do Juro');
  end;
end;

procedure TFContasReceberCad.BtContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Conta_Corrente.Value :=
        DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
end;

function RetornaCodCarteira(wNCarteira: Integer): char;
var
  Cod: Char;
begin
  Cod := ' ';
  case (wNCarteira) of
    168: Cod := '3';
    147: Cod := 'E';
    166: Cod := 'F';
    112, 212, 104, 105, 114, 113, 108, 109, 110, 111, 210, 126, 121, 221, 180,
      280, 175, 198, 122,
      142, 143, 179, 174, 177, 120, 129, 139, 169, 140, 141, 172, 102, 195, 107,
      173, 103, 196, 106
      : Cod := 'I';
    150: Cod := 'U';
  end;

  Result := Cod;
end;

procedure TFContasReceberCad.ArquivoRemessaIta1Click(Sender: TObject);
var
  mBrancos: string;
  x: Integer;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  S: string;
  F: TextFile;
  wNumCC: string;
  //  mCodNossoNumero       : String;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;

      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me17NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if QRemessa.RecordCount > 0 then
      begin
        try
          // REGISTRO HEADER ARQUIVO REMESSA ITAU

          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_ITAU');

          mBrancos := '';
          for x := 1 to 294 do
          begin
            mBrancos := mBrancos + ' ';
          end;

          wNumCC :=
            RMaskCGC_CPF(Trim(DMContasReceber.QRemessaNUM_CONTA_CORRENTE.Text),
            6);

          S := ''; // Inicia variavel.

          S := S + '01REMESSA01COBRANCA       ' +
            RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
            '00' +
            Copy(wNumCC, 1, 5) +
            Copy(wNumCC, 6, 1) +
            Bib.FormataTexto(' ', 8) +
            Bib.FormataTexto(RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Text)),
            30) +
            '341' +
            'BANCO ITAU SA  ' +
            Copy(DateToStr(Date), 1, 2) +
            Copy(DateToStr(Date), 4, 2) +
            Copy(DateToStr(Date), 9, 2) +
            mBrancos +
            '000001' + Chr(13) + Chr(10); // Sequencial do registro=0001

          // REGISTRO DETALHE ARQUIVO REMESSA
          mSequencial := 2; { 1=Registro HEADER }
          while not QRemessa.Eof do
          begin
            mBrancos := '';

            {1 e 3}S := S + '102' +
              RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14) +
              RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
              '00' +
              Copy(wNumCC, 1, 5) +
              Copy(wNumCC, 6, 1) +
              '    ' +
              {34-37}'0000' +
              Bib.FormataTexto(QRemessaNUM_TITULO.Text, 10) +
              Bib.FormataTexto(QRemessaCOD_CONTA_RECEBER_CAB.Text, 15) +
              {*no banco é definido como VC2 15 Nota 3}RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 8) +
              RMaskCGC_CPF('0', 13) +
              RMaskCGC_CPF(QRemessaCARTEIRA.Text, 3) +
              {*87-107    Uso do banco}Bib.FormataTexto(' ', 21) +
              RetornaCodCarteira(QRemessaCARTEIRA.Value) +
              '01' +
              {111-120 }Bib.FormataTexto(QRemessaNUM_TITULO.Text, 10) +
              Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              Copy(QRemessaDT_VENCIMENTO.Text, 9, 2) +
              intdecimais(QRemessaVAL_TITULO.Text, 13, 2) +
              '341' +
              '00000' +
              {148-149}'01'; //DUPLICATA MERCANTIL
            if QRemessaIND_ACEITE.Text = 'SIM' then
              S := S + 'A'
            else
              S := S + 'N';
            S := S + Copy(QRemessaDT_EMISSAO.Text, 1, 2) +
              Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              Copy(QRemessaDT_EMISSAO.Text, 9, 2) +
              {157-158}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2) +
            {*159-160}'  ';
            {*161-173}if (Trim(QRemessaIND_TIPO_JURO.Text) = 'VALOR') then
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            else
              S := S + IntDecimais(FloatToStr(QRemessaVAL_TITULO.Value *
                QRemessainstrucao_juro.Value / 100 / 30), 13, 2);
            {*}S := S + '000000' +
            {*182-192}'0000000000000' +
            {*}'0000000000000' +
            {*}'0000000000000';
            {219-220}if QRemessaIND_FISICA_JURIDICA.Text = 'J' then
              S := S + '02'
            else
              S := S + '01';
            S := S + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaNOME.Text)), 30) +
              '          ';
            S := S +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text)), 40);
            S := S +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_BAIRRO.Text)),
              12);
            S := S + RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text)), 15) +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ESTADO_COBRANCA.Text)), 02);
            {352-381}S := S +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_AVALISTA1.Text)), 30) +
              '    ' +
              {*386-391}'000000' +
            {392-393}RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2) +
              ' ' +
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);

            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;

          end; // fim do while

          // -------------   Registro Trailler -------------- \\

          mBrancos := '';
          for x := 1 to 393 do
          begin
            mBrancos := mBrancos + ' '; // Usado anteriormente também.
          end;
          S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
          //Verificar mSequencial

        //------------------ Fim --------------------------\\

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA Itaú Gerado com Sucesso!',
              mtInformation,
              [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA Itaú não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

//****** PROCEDIMENTO DE RETORNO DE ERROS **************************************

function TFContasReceberCad.RetornaErroItau(CodErro, Erro: string): string;
var
  Res: string;
begin
  if (Copy(Erro, 1, 2) <> '') and (Copy(Erro, 1, 2) <> '00') then
  begin
    if CodErro = '03' then
    begin
      case StrToInt(Erro) of
        3: Res :=
          'NÃO FOI POSSÍVEL ATRIBUIR A AGÊNCIA  PELO CEP OU CEP INVÁLIDO ';
        4: Res := 'SIGLA do ESTADO INVÁLIDA';
        5: Res :=
          'PRAZO DA OPERAÇÃO MENOR QUE PRAZO MÍNIMO OU MAIOR QUE O MÁXIMO';
        7: Res := 'VALOR DO TÍTULO MAIOR QUE 10.000.000,00';
        8: Res := 'NÃO INFORMADO OU DESLOCADO ';
        9: Res := 'AGÊNCIA ENCERRADA';
        10: Res := 'Não INFORMADO ou DESLOCADO (logradouro)';
        11: Res := 'CEP não Numérico';
        12: Res := 'NOME NÃO INFORMADO OU DESLOCADO (BANCOS CORRESPONDENTES) ';
        13: Res := 'CEP INCOMPATÍVEL COM A SIGLA DO ESTADO';
        14: Res :=
          'NOSSO NÚMERO JÁ REGISTRADO NO CADASTRO DO BANCO OU FORA DA FAIXA';
        15: Res := 'NOSSO NÚMERO EM DUPLICIDADE NO MESMO MOVIMENTO';
        18: Res := 'DATA DE ENTRADA INVÁLIDA PARA OPERAR COM ESTA CARTEIRA';
        19: Res := 'OCORRÊNCIA INVÁLIDA';
        21: Res := ' - CARTEIRA NÃO ACEITA DEPOSITÁRIA CORRESPONDENTE' +
          ' - ESTADO DA AGÊNCIA DIFERENTE DO ESTADO DO SACADO' +
            ' - AG. COBRADORA NÃO CONSTA NO CADASTRO OU  ENCERRANDO';
        22: Res := 'CARTEIRA NÃO PERMITIDA (NECESSÁRIO CADASTRAR FAIXA LIVRE)';
        27: Res := 'CGC DO CEDENTE INAPTO';
        29: Res := 'CATEGORIA DA CONTA INVÁLIDA';
        35: Res := 'IOF MAIOR QUE 5%';
        36: Res := 'QUANTIDADE DE MOEDA INCOMPATÍVEL COM VALOR DO TÍTULO';
        37: Res := 'NÃO NUMÉRICO OU IGUAL A ZEROS';
        42: Res := 'NOSSO NÚMERO FORA DE FAIXA';
        52: Res := 'EMPRESA NÃO ACEITA BANCO CORRESPONDENTE';
        53: Res :=
          'EMPRESA NÃO ACEITA BANCO CORRESPONDENTE  - COBRANÇA MENSAGEM';
        54: Res :=
          'BANCO CORRESPONDENTE - TÍTULO COM VENCIMENTO INFERIOR A 15 DIAS';
        55: Res := 'CEP NÃO PERTENCE A DEPOSITÁRIA INFORMADA';
        56: Res := 'VENCTO SUPERIOR A 180 DIAS DA DATA DE ENTRADA';
        57: Res :=
          'CEP SÓ DEPOSITÁRIA BCO DO BRASIL COM VENCTO INFERIOR A 8 DIAS';
        60: Res := 'VALOR DO ABATIMENTO INVÁLIDO';
        61: Res := 'JUROS DE MORA MAIOR QUE O PERMITIDO';
        62: Res := 'VALOR DO DESCONTO MAIOR QUE O VALOR DO TÍTULO';
        63: Res := 'NÃO PERMITIDO (IMPORTÂNCIA POR DIA DE DESCONTO)';
        64: Res := 'DATA DE EMISSÃO DO TÍTULO INVÁLIDA (VENDOR)';
        65: Res := 'TAXA INVÁLIDA (VENDOR)';
        66: Res :=
          'INVALIDA/FORA DE PRAZO DE OPERAÇÃO (MÍNIMO OU MÁXIMO, DATA VENCTO)';
        67: Res := 'VALOR DO TÍTULO/QUANTIDADE DE MOEDA INVÁLIDO';
        68: Res := 'CARTEIRA INVÁLIDA';

        { Para carteiras 102,103,106,107,172,173,195,196  }
        91: Res := 'DAC AGÊNCIA / CONTA CORRENTE INVÁLIDO';
        92: Res := 'DAC AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO INVÁLIDO';
        93: Res := 'SIGLA ESTADO INVÁLIDA';
        94: Res := 'SIGLA ESTADO INCOMPATÍVEL COM CEP DO SACADO';
        95: Res := 'CEP DO SACADO NÃO NUMÉRICO OU INVÁLIDO';
        96: Res := 'ENDEREÇO / NOME / CIDADE SACADO INVÁLIDO';

        98: Res :=
          'REGISTRO MENSAGEM SEM FLASH CADASTRADO OU FLASH INFORMADO DIFERENTE DO CADASTRADO';
        99: Res :=
          'CONTA DE COBRANÇA COM FLASH CADASTRADO E SEM REGISTRO DE MENSAGEM CORRESPONDENTE';
      end;
    end;

    if CodErro = '15' then
    begin
      case StrToInt(Erro) of
        1: Res := 'CARTEIRA/Nº NÚMERO NÃO NUMÉRICO';
        4: Res := 'NOSSO NÚMERO EM DUPLICIDADE NUM MESMO MOVIMENTO';
        5: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO JÁ BAIXADO OU LIQUIDADO ';
        6: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO NÃO REGISTRADO NO SISTEMA ';
        7: Res :=
          'COBRANÇA PRAZO CURTO - SOLICITAÇÃO DE BAIXA P/ TÍTULO NÃO REGISTRADO NO SISTEMA';
        8: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO EM FLOATING';
      end;
    end;

    if CodErro = '16' then
    begin
      case StrToInt(Erro) of
        1: Res := 'INSTRUÇÃO/OCORRÊNCIA NÃO EXISTENTE';
        6: Res := 'NOSSO NÚMERO IGUAL A ZEROS';
        9: Res := 'CGC/CPF  DO SACADOR/AVALISTA INVÁLIDO';
        10: Res := 'VALOR DO ABATIMENTO IGUAL OU MAIOR QUE O VALOR DO TÍTULO';
        14: Res := 'REGISTRO EM DUPLICIDADE ';
        15: Res := 'CGC/CPF INFORMADO SEM NOME DO SACADOR/AVALISTA';
        21: Res := 'TÍTULO NÃO REGISTRADO NO SISTEMA';
        23: Res :=
          'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
        24: Res :=
          'INSTRUÇÃO INCOMPATÍVEL - EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
        25: Res :=
          'INSTRUÇÃO INCOMPATÍVEL - NÃO EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
        26: Res :=
          'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
        27: Res :=
          'INSTRUÇÃO NÃO ACEITA POR NÃO TER SIDO EMITIDA A ORDEM DE PROTESTO AO CARTÓRIO';
        28: Res :=
          'JÁ EXISTE UMA MESMA INSTRUÇÃO CADASTRADA ANTERIORMENTE PARA O TÍTULO';
        29: Res :=
          'VALOR LÍQUIDO + VALOR DO ABATIMENTO DIFERENTE DO VALOR DO TÍTULO REGISTRADO, OU VALOR DO ABATIMENTO MAIOR QUE 90% DO VALOR DO TÍTULO';
        30: Res := 'EXISTE UMA INSTRUÇÃO DE NÃO PROTESTAR ATIVA PARA O TÍTULO';
        31: Res := 'EXISTE UMA OCORRÊNCIA DO SACADO QUE BLOQUEIA A INSTRUÇÃO';
        32: Res :=
          'DEPOSITÁRIA DO TÍTULO = 9999 OU CARTEIRA NÃO ACEITA PROTESTO';
        33: Res :=
          'ALTERAÇÃO DE VENCIMENTO IGUAL À REGISTRADA NO SISTEMA OU QUE TORNA O TÍTULO VENCIDO';
        34: Res :=
          'INSTRUÇÃO DE EMISSÃO DE AVISO DE COBRANÇA PARA TÍTULO VENCIDO ANTES DO VENCIMENTO';
        35: Res := 'SOLICITAÇÃO DE CANCELAMENTO DE INSTRUÇÃO INEXISTENTE';
        36: Res :=
          'TÍTULO SOFRENDO ALTERAÇÃO DE CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
        37: Res := 'INSTRUÇÃO NÃO PERMITIDA PARA A CARTEIRA';
      end;
    end;

    if CodErro = '17' then
    begin
      case StrToInt(Erro) of
        2: Res := 'AGÊNCIA COBRADORA INVÁLIDA OU COM O MESMO CONTEÚDO';
        4: Res := 'SIGLA DO ESTADO INVÁLIDA';
        5: Res := 'DATA DE VENCIMENTO INVÁLIDA OU COM O MESMO CONTEÚDO';
        6: Res := 'VALOR DO TÍTULO COM OUTRA ALTERAÇÃO SIMULTÂNEA';
        8: Res := 'NOME DO SACADO COM O MESMO CONTEÚDO';
        9: Res := 'AGÊNCIA/CONTA INCORRETA';
        11: Res := 'CEP INVÁLIDO';
        13: Res := 'SEU NÚMERO COM O MESMO CONTEÚDO';
        16: Res :=
          'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADA';
        21: Res :=
          'AGÊNCIA COBRADORA NÃO CONSTA NO CADASTRO DE DEPOSITÁRIA OU EM ENCERRAMENTO';
        53: Res := 'INSTRUÇÃO COM O MESMO CONTEÚDO';
        54: Res :=
          'DATA VENCIMENTO PARA BANCOS CORRESPONDENTES INFERIOR AO ACEITO PELO BANCO';
        55: Res :=
          'ALTERAÇÕES IGUAIS PARA O MESMO CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
        56: Res := 'CGC/CPF INVÁLIDO NÃO NUMÉRICO OU ZERADO';
        57: Res := 'PRAZO DE VENCIMENTO INFERIOR A 15 DIAS';
        60: Res :=
          'VALOR DE IOF - ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE N.S. - MOEDA VARIÁVEL';
        61: Res :=
          'TÍTULO JÁ BAIXADO OU LIQUIDADO OU NÃO EXISTE TÍTULO CORRESPONDENTE NO SISTEMA';
        66: Res :=
          'ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE NOTAS DE SEGUROS - MOEDA VARIÁVEL';
        81: Res := 'ALTERAÇÃO BLOQUEADA - TÍTULO COM PROTESTO';
      end;
    end;

    if CodErro = '18' then
    begin
      case StrToInt(Erro) of
        16: Res :=
          'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADOS';
      end;
    end;

  end;
  Result := (Res);
end;

procedure TFContasReceberCad.RetornoRemessaIta1Click(Sender: TObject);
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  Erro1, Erro2, Erro3, Erro4: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  inherited; // RETORNO ITAU
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    // Abre arquivo de retorno ITAU
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont1 := 0;
      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 1, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 2, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo invalida!');
      if Copy(Trim(S), 3, 7) <> 'RETORNO' then
        // Verifica se realmente é um arquivo de retorno.
        raise exception.Create('Não é um arquivo de RETORNO!');
      if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
        raise exception.Create('Não é um arquivo de COBRANÇA!');
      if Copy(Trim(S), 80, 15) <> 'BANCO ITAU S.A.' then
        raise exception.Create('Nome do banco invalido!');

      {Acima está sendo verificado se o registro HEADER é
       realmente um arquivo de retorno-ITAU}

      Readln(F, S); //Le a proxima linha do arquivo
      while (Trim(S) <> '') do // Arquivo contém registro para processar.
      begin
        // Condições possiveis para executar baixa do titulo.
        if Copy(Trim(S), 1, 1) = '1' then //identificacao de registro transacao
        begin
          if StrToInt(Copy(Trim(S), 109, 2)) in [6, 8, 10] then
            // ???? Ver tabela explicativa NOTA 17
          begin
            wVal_Juro := 0;
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;

            wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
              Copy(S, 115, 02);
            wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
              Copy(S, 300, 02);
            wNNumero := Copy(S, 127, 8);
            // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
            wNum_Titulo := Trim(Copy(S, 38, 6));
            // Verifica se valor para baixar é diferente de zero.
            if StrToFloat(Copy(S, 254, 13)) <> 0 then
              // Valor recebido + valor despesa de cobranca
              wVal_Baixa := (StrToFloat(Copy(S, 254, 13)) / 100) +
                (StrToFloat(Copy(S, 176, 13)) / 100)
            else
              raise exception.Create('Titulo com valor p/baixar igual a zero!');

            if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
            begin
              wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
              wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
            end;

            if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
                StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
              wNNumero, wDtLiquida, wDtCredito);
            // Chama procedimento para baixa de titulo.
            inc(wCont1);
          end;

          // Erros
          if Copy(Trim(S), 109, 2) = '03' then
            // Houve recusa do registro enviado.
          begin
            Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378,
              2));
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380,
              2));
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382,
              2));
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384,
              2));
          end;

          if Copy(Trim(S), 109, 2) = '15' then
            // Houve recusa do registro enviado.
          begin
            Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378,
              2));
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380,
              2));
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382,
              2));
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384,
              2));
          end;

          if Copy(Trim(S), 109, 2) = '16' then
            // Houve recusa do registro enviado.
          begin
            Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378,
              2));
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380,
              2));
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382,
              2));
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384,
              2));
          end;

          if Copy(Trim(S), 109, 2) = '17' then
            // Houve recusa do registro enviado.
          begin
            Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378,
              2));
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380,
              2));
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382,
              2));
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384,
              2));
          end;

          if Copy(Trim(S), 109, 2) = '18' then
            // Houve recusa do registro enviado.
          begin
            Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378,
              2));
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380,
              2));
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382,
              2));
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384,
              2));
          end;

          // Inicia impressao dos erros \\
          if Imp = nil then
            Imp := TImp.Create;
          Imp.AbreImpressora;
          Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

          if wCont = 1 then
          begin
            Imp.WriteXY(4.5, wCont,
              'R E L A T O R I O   D E   E R R O S  - ITAÚ  -RETORNO    -    Data: ' +
              DateTimeToStr(Now));
            wCont := wCont + 2;
            Inc(wCont);
            Imp.WriteXY(0, wCont,
              'Titulo     Num. Registro    Cod.Recusa    Mensagem');
            Inc(WCont);
            Imp.WriteXY(0, wCont,
              '--------------------------------------------------------------------------------------------------------------------');
            Inc(WCont);
          end;
          if Erro1 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
              '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 378, 2)
              +
              '       ' + Erro1);
            Inc(WCont);
          end;
          if Erro2 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
              '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 380, 2)
              +
              '       ' + Erro2);
            Inc(WCont);
          end;
          if Erro3 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
              '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 382, 2)
              +
              '       ' + Erro3);
            Inc(WCont);
          end;
          if Erro4 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
              '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 384, 2)
              +
              '       ' + Erro4);
            Inc(WCont);
          end;
          if wCont >= 66 then
          begin
            Imp.SaltaPagina;
            wCont := 1;
          end;
        end;
        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end; // Fim do while

      if imp <> nil then
        // É necessario pois caso não tenha impressão ocorre erro.
      begin
        Imp.SaltaPagina;
        Imp.FechaImpressora; // Finaliza os serviços de Impressao}
      end;
      ShowMessage('Baixado ' + IntToStr(wCont1) + ' Títulos');
      CloseFile(F); // Fecha arquivo aberto.
    end; // Fim do begin OpenDialog.
  end; // Fim do modalresutl
end;

procedure TFContasReceberCad.CartadeCobrana1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[20].TabVisible := True;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') then
  begin
    FContasReceberParam.RG20Cartas.visible := true;
    FContasReceberParam.ME20DtCarta.visible := true;
    FContasReceberParam.Label162.visible := true;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
    FContasReceberParam.RG20Modelo.visible := true;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME20DtIni.Text) = '') or
      (Trim(FContasReceberParam.ME20DtFin.Text) = '') then
      raise Exception.Create('Informar o Período');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME20CodFilial.Text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRCartaCobranca.Close;
      if Trim(FContasReceberParam.ME20CodCliente.Text) <> '' then
        QRCartaCobranca.SetVariable('CADASTRO',
          Trim(FContasReceberParam.ME20CodCliente.Text))
      else
        QRCartaCobranca.SetVariable('CADASTRO', null);
      if Trim(FContasReceberParam.ME20CodFilial.Text) <> '' then
        QRCartaCobranca.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME20CodFilial.Text))
      else
        QRCartaCobranca.SetVariable('FILIAL', null);
      if Trim(FContasReceberParam.ME20DtIni.Text) <> '' then
        QRCartaCobranca.SetVariable('DATA_INICIAL',
          Trim(FContasReceberParam.ME20DtIni.Text));
      if Trim(FContasReceberParam.ME20DtFin.Text) <> '' then
        QRCartaCobranca.SetVariable('DATA_FINAL',
          Trim(FContasReceberParam.ME20DtFin.Text));
      QRCartaCobranca.Open;
    end;

    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') then
    begin
      if FRCartaCobrancaFaville = nil then
        FRCartaCobrancaFaville := TFRCartaCobrancaFaville.Create(Application);
      FRCartaCobrancaFaville.QRlabel12.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QRlabel13.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QRDbText7.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QrExpr2.Font.Color := ClWindowText;
      case FContasReceberParam.RG20Cartas.ItemIndex of
        0, 2:
          begin
            FRCartaCobrancaFaville.QRLabel8.Caption :=
              'AVISO DE FALTA DE PAGAMENTO DE TÍTULO';
            FRCartaCobrancaFaville.QRLabel20.Caption := '        ' +
              DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text +
              ', localizada na rodovia BR163-Km277 na cidade de Marechal Cândido Rondon, Estado do Paraná, vem, por' +
              ' intermédio desta, notificá-lo de que consta em nosso sistema a existência de débitos referentes ao não' +
              ' pagamento de títulos, conforme demonstrativo abaixo:';
            if FContasReceberParam.RG20Cartas.ItemIndex = 2 then
            begin
              FRCartaCobrancaFaville.QRLabel14.Caption :=
                'Informamos que os valores serao acrescidos de juros e correção monetaria na data do pagamento.';
              FRCartaCobrancaFaville.QRlabel12.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QRlabel13.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QRDbText7.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QrExpr2.Font.Color := ClWhite;
            end
            else
              FRCartaCobrancaFaville.QRLabel14.Caption :=
                'Informamos que os valores foram corrigidos até a data de ' +
                DateToStr(DMOracle.DataServ) +
                ', utilizando-se como índice o INPC + 1% de juros.';
            FRCartaCobrancaFaville.QRLabel15.Caption :=
              'Com o intuito de uma solução amigável, solicitamos que entre em contato, junto ao departamento de ' +
              'CONTAS A RECEBER, na pessoa da Sr.(a) ' +
              DMContasReceber.QRCartaCobrancaCONTATO_FILIAL.Text + ', pelo fone '
              + DMContasReceber.QRCartaCobrancaFONE_FILIAL.Text +
              ', para que possamos regularizar sua situação. ';
            FRCartaCobrancaFaville.QRLabel16.Caption :=
              'Obs: Caso o referido débito já tenha sido quitado ao tempo do recebimento desta, favor desconsiderar essa notificação.';
            FRCartaCobrancaFaville.QRLabel17.Caption :=
              'Certos de que seremos prontamente atendidos nesse pedido, prosseguindo com nosso bom relacionamento comercial,' +
              'desde já agradecemos sua compreensão.';
            FRCartaCobrancaFaville.QRLabel18.Caption := 'Atenciosamente,';
          end;
        1:
          begin
            FRCartaCobrancaFaville.QRLabel8.Caption :=
              '2° E ÚLTIMO AVISO DE FALTA DE PAGAMENTO DE TÍTULO';
            FRCartaCobrancaFaville.QRLabel20.Caption := '        ' +
              DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text +
              ', localizada na rodovia BR163-Km277 na cidade de Marechal Cândido Rondon, Estado do Paraná, vem, por' +
              ' intermédio desta, expor o que se segue:                      ' +
              '        Em data de ' + FContasReceberParam.ME20DtCarta.Text +
              ', Vossa Senhoria foi devidamente notificado de que consta em nosso sistema a existência de débitos referentes ao não' +
              ' pagamento de títulos, conforme demonstrativo abaixo:';
            FRCartaCobrancaFaville.QRLabel14.Caption := '';
            FRCartaCobrancaFaville.QRLabel15.Caption :=
              '        Como não houve resposta à notificação anterior, a qual foi dado ciência de recebimento em data de ' +
              FContasReceberParam.ME20DtCarta.Text +
              ', solicitamos, novamente, que entre em contato, no PRAZO ' +
              'MÁXIMO DE 3 (TRÊS) DIAS do recebimento desta, com o DEPARTAMENTO JURÍDICO desta empresa, na pessoa do Sr. Jean, pelo fone ' +
              DMContasReceber.QRCartaCobrancaFONE_FILIAL.Text +
              ', sob pena de serem tomadas as medidas judiciais cabíveis.';

            FRCartaCobrancaFaville.QRLabel16.Caption :=
              'Obs: Caso o referido débito já tenha sido quitado ao tempo do recebimento desta, favor desconsiderar essa notificação.';
            FRCartaCobrancaFaville.QRLabel17.Caption :=
              '        Pedimos que entre em contato e solucione a pendência acima exposta para que possamos continuar nosso bom relacionamento comercial.';
            FRCartaCobrancaFaville.QRLabel18.Caption := 'Atenciosamente,';
          end;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobrancaFaville.QRepCartaCobrancaFaville.Preview
      else
        FRCartaCobrancaFaville.QRepCartaCobrancaFaville.Print;
    end
    else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
    begin
      if FRCartaCobrancaCiviero = nil then
        FRCartaCobrancaCiviero := TFRCartaCobrancaCiviero.Create(Application);
      case FContasReceberParam.RG20Modelo.ItemIndex of
        0: FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
          ('Notamos que sua parcela passou despercebida, pedimos o seu comparecimento para a solução.');
        1:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('É lamentável o descumprimento do seu contrato, pedimos o seu comparecimento em 48 horas para a solução.')
              +
              ('                                                                                                                                          ')
              + ('Atenciosamente : Departamento Jurídico');
            FRCartaCobrancaCiviero.QRMemo3.Lines.Text :=
              ('Departamento Jurídico');
          end;
        2:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('Atenção : Aviso de Interpelação Extra-Judicial                                                                                             ')
              +
              ('Comunicamos a vossa senhoria que estaremos ajuizando ação de execução contra devedor solvente no Fórum ')
              +
              ('desta Comarca. Pedimos o seu comparecimento imediato, como última tentativa de solução amigável.');
            FRCartaCobrancaCiviero.QRMemo3.Lines.Text :=
              ('Departamento Jurídico');
          end;
        3:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('                                  NÃO PERCA ESTA OPORTUNIDADE')
              +
              chr(13)
              +
              ('                                         REABILITE SEU CREDITO')
              + chr(13) + chr(13)
              +
              ('A Radiolândia está oferecendo a oportunidade de quitar seus débitos em atraso sem juros.')
              + chr(13)
              +
              ('                                Se preferir podendo utilizar seu 13 salário')
              + chr(13) + chr(13)
              + ('Venha a nossa loja para negociar à vista ou parcelado') +
              chr(13) + chr(13)
              + ('A hora é agora, não espere para amanhã.') + chr(13) + chr(13)
              + chr(13)
              + ('Favor trazer esta carta quando vier a loja');
          end;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobrancaCiviero.QRepCartaCobranca.Preview
      else
        FRCartaCobrancaCiviero.QRepCartaCobranca.Print;
    end
    else
    begin
      if FRCartaCobranca = nil then
        FRCartaCobranca := TFRCartaCobranca.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
      begin
        FRCartaCobranca.QRLabel3.Font.Color := ClWhite;
        FRCartaCobranca.QRDbText3.Font.Color := ClWhite;
        FRCartaCobranca.QRExpr2.Font.Color := ClWhite;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobranca.QRepCartaCobranca.Preview
      else
        FRCartaCobranca.QRepCartaCobranca.Print;
    end;
  end;
  DMContasReceber.QRCartaCobranca.Close;
end;

procedure TFContasReceberCad.SbOrdemCompraClick(Sender: TObject);
begin
  inherited;
  if FOrdemCompraCons = nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  if FOrdemCompraCons.ShowModal = mrOk then
    DMContasReceber.QContasReceber_CabCod_Ordem_Compra_Cab.Value :=
      DMOrdemCompra.QOrdemCompraConsCod_Ordem_Compra_Cab.Value;

end;

procedure TFContasReceberCad.ArquivoRemessaSicrediClick(Sender: TObject);
var
  mSequencial: Integer;
  mSEQ_REMESSA, wDesconto: Real;
  S: string;
  F: TextFile;
  wNumCC, wPraca: string;
begin
  inherited; //SERGIO 08/10/2002
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
      'CONTAS A RECEBER');
    mSequencial := 1;
    with DMContasReceber do
    begin
      QRemessa.Close;

      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me17NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;
      if QRemessa.RecordCount > 0 then
      begin
        try
          // INICIO REGISTRO HEADER ARQUIVO REMESSA SICREDI--------------------------------\\
          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_SICREDI');
          S := ''; // Inicia variavel.
          S := '01REMESSA01COBRANCA       ' +
            RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5) +
            {32-45}RMaskCGC_CPF(Trim(DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', ' COD_FILIAL = ' +
            Trim(QRemessaCOD_FILIAL.Text), True)), 14) +
          {46-76}Bib.FormataTexto(' ', 31) +
            '748BANSICREDI     ' +
            FormatDateTime('yyyymmdd', Date) +
            {111-117}Bib.FormataTexto(' ', 8);
          if mSEQ_REMESSA > 9999999 then
            raise Exception.Create('A sequência precisa ser reinicializada')
          else
            S := S + RMaskCGC_CPF(FloatToStr(mSEQ_REMESSA), 7);
          S := S + Bib.FormataTexto(' ', 273) +
            '2.00' +
            RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
          Inc(mSequencial);
          // FIM DO REGISTRO HEADER ARQUIVO REMESSA SICREDI---------------------------------\\

          // INICIO REGISTRO DETALHE ARQUIVO REMESSA SICREDI--------------------------------\\
          while not QRemessa.Eof do
          begin
            S := S + '1AAA' +
              Bib.FormataTexto(' ', 12) +
              'A' +
              {18-18}'A';
            {19-19}if Trim(QRemessaIND_TIPO_JURO.Text) = 'VALOR' then
              S := S + 'A'
            else
              S := S + 'B';
            {20-31}S := S + Bib.FormataTexto(' ', 12) +
            //alterado por Marcos 01/10/2008 conf. email do sicredi
          //{*20-23}    S := S + RMaskCGC_CPF( Trim(QRemessaPRIMEIRA_INSTR_COD.Text), 4)                  +
          //            '00000000'                                                                        +
              {32-47}Bib.FormataTexto(' ', 16) +
            {*48-62}RMaskCGC_CPF(Trim(QRemessaCOD_NOSSO_NUMERO.Text), 9) +
              '      ' +
              {*}FormatDateTime('yyyymmdd', Date) +
            {*71-72}' ' +
            {*72-72}'N' +

            //pos.73 alter. Marcos 1/8/08
              {*73-73}' ' +
            //{*73-73}    'N'                                                                              +
                {74-74}'B' +
            {75-78}'0000' +
              '    ' +
              {83-92}'0000000000' +
            {93-96}'0000' +
              Bib.FormataTexto(' ', 12) +
              '01';
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
              {111-120}S := S + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10)
            else
              {111-120}S := S + RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text, 10);
            S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value), 6) +
              intdecimais(QRemessaVAL_TITULO.Text, 13, 2) +
              Bib.FormataTexto(' ', 9) +
              {149-149}'A';
            if Trim(QRemessaIND_ACEITE.Text) = 'NAO' then
              S := S + 'N'
            else
              S := S + 'S';
            {151-156}S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_EMISSAO.Value), 6);
            {157-160}if QRemessaNR_DIAS_PROTESTO.Value > 0 then // instrucoes de protesto
              S := S + '06' + RMaskCGC_CPF(Trim(QRemessaNR_DIAS_PROTESTO.Text), 2)
            else
              S := S + '0000';
            {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            else
              S := S + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 13, 2);

            S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value), 6);
            wDesconto := StrToFloat('0' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + QRemessaCOD_CADASTRO.Text, True));
            wDesconto := ((QRemessaVAL_TITULO.Value * wDesconto) / 100);
            S := S + IntDecimais(FloatToStr(wDesconto), 13, 2);

            S := S + RMaskCGC_CPF('0', 13) + RMaskCGC_CPF('0', 13);
            {219-219}if QRemessaIND_FISICA_JURIDICA.Text = 'J' then
              S := S + '2'
            else
              S := S + '1';
            S := S + '0' +
              RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaNOME.Text)), 40) +
              Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text)), 40) +
              {315-319}RMaskCGC_CPF('0', 5);
            //-----inicio da alteracao Fabio 29/09/2003--- buscar cod.praça do cad.Cidade
            //{**}        '010850' {verificar no arquivo fornecido}
            //----alter. MArcos 1/8/08 - nao precisa mais cod. praça
             {           wPraca := DMOracle.BuscaNome('SELECT TB_CIDADE.COD_PRACA FROM TB_CIDADE, TB_CADASTRO, TB_PRACA',
                                                    'TB_CIDADE.COD_CIDADE = TB_CADASTRO.COD_CIDADE AND '+
                                                    'TB_PRACA.COD_PRACA = TB_CIDADE.COD_PRACA AND TB_PRACA.DESC_SIGLA = TB_CIDADE.COD_ESTADO '+
                                                    'AND NOT TB_PRACA.IND_SITUACAO = '+chr(39)+'C'+chr(39)+' AND TB_CADASTRO.COD_CADASTRO = '+
                                                    trim(QRemessaCod_Cadastro.Text),True);
                        if(wPraca<>'')then
                          S := S + Bib.StrZero(wPraca,6)
                        else
                          S := S + '000000';  }
            //---final alteracao
              {320-326}S := S + '       ' +
            {327-334}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
            //alter. Marcos 1/8/08
              {335-339}RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 5) +
            //{335-339}   Bib.StrZero( '0',5 )                                                                 +
              {340-353}Bib.FormataTexto(' ', 14) +
            {354-394}Bib.FormataTexto(' ', 41) +
            {395-400}RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);

            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end; // fim do while
          // FIM REGISTRO DETALHE ARQUIVO REMESSA SICREDI

          //-INICIO DO REGISTRO TRAILER---------------------------------------------------\\
          S := S + '91748' +
            RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5) +
            Bib.FormataTexto(' ', 384) +
            RMaskCGC_CPF(IntToStr(mSequencial), 6);
          // FIM DO REGISTRO TRAILER------------------------------------------------------\\

          //------------------ Fim --------------------------\\
          wNumCC := ''; //USADO PARA MONTAR O NOME DO ARQUIVO REMESSA
          mSequencial := StrToInt(FormatDateTime('MM', Date));
          case mSequencial of
            10: wNumCC := 'O';
            11: wNumCC := 'N';
            12: wNumCC := 'D';
          else
            wNumCC := IntToStr(mSequencial);
          end;

          Insert(RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5), wNumCC, 1);
          wNumCC := wNumCC + FormatDateTime('dd', Date) + '.CRM';
          FContasReceberParam.SDlg_Remessa.FileName := wNumCC;
          FContasReceberParam.SDlg_Remessa.Filter :=
            'Arquivo de Remessa Bansicredi';
          FContasReceberParam.SDlg_Remessa.DefaultExt := '';
          FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, wNumCC);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA Sicredi Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA Sicredi não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

function TFContasReceberCad.RetornoErroSicredi(wErro: string): string;
var
  Aux: Integer;
  wS: string;
begin
  wS := '';
  if UpperCase(wErro) = ' A' then
    wS := 'Aceito';
  if UpperCase(wErro) = ' D' then
    wS := 'Desprezado';
  if UpperCase(wErro) = 'A1' then
    wS := 'Praça do Sacado não cadastrada';
  if UpperCase(wErro) = 'A3' then
    wS :=
      'Agência Depositária divergente: ATUALIZA O CADASTRO DE PRAÇAS DA AG.CEDENTE';
  if UpperCase(wErro) = 'A4' then
    wS := 'Cedente não cadastrado ou possui CGC/CIC Inválido';
  if UpperCase(wErro) = 'A5' then
    wS := 'Sacado não cadastrado';
  if UpperCase(wErro) = 'A6' then
    wS := 'Data da Instrução/Ocorrência Inválida';
  if UpperCase(wErro) = 'A8' then
    wS :=
      'Recebimento da Liquidação fora da rede Bansicredi - via Compensação Eletrônica';
  if UpperCase(wErro) = 'A9' then
    wS := 'Manutenção de Título Vencido';
  if UpperCase(wErro) = 'B1' then
    wS := 'Baixa da Carteira';
  if UpperCase(wErro) = 'B3' then
    wS := 'Registro de Entrada do Título';
  if UpperCase(wErro) = 'B4' then
    wS := 'Tipo de Moeda Inválido';
  if UpperCase(wErro) = 'B5' then
    wS := 'Tipo de Desconto/Jusros Inválido';
  if UpperCase(wErro) = 'B6' then
    wS := 'Mensagem padrão não cadastrada';
  if UpperCase(wErro) = 'B7' then
    wS := 'Seu Número Inválido';
  if UpperCase(wErro) = 'B8' then
    wS := 'Percentual de multa Inválido';
  if UpperCase(wErro) = 'B9' then
    wS := 'Valor ou percentual de juros Inválido';
  if UpperCase(wErro) = 'C1' then
    wS := 'Data limite para concessão de desconto Inválida';
  if UpperCase(wErro) = 'C2' then
    wS := 'Aceite do Título Inválido';
  if UpperCase(wErro) = 'C3' then
    wS := 'Campo alterado na Instrução 31 (Alteração de Outros Dados) Inválido';
  if UpperCase(wErro) = 'C4' then
    wS := 'Título ainda não confirmado pela Centralizadora';
  if UpperCase(wErro) = 'C5' then
    wS := 'Título rejeitado pela Centralizadora';
  if UpperCase(wErro) = 'C6' then
    wS := 'Título já baixado';
  if UpperCase(wErro) = 'C7' then
    wS := 'Título já liquidado';
  if UpperCase(wErro) = 'C8' then
    wS := 'Existe mesma Instrução pendente de confirmação para este Título';
  if UpperCase(wErro) = 'C9' then
    wS :=
      'Instrução prévia de Concessão de Abatimento não existe ou não confirmada';
  if UpperCase(wErro) = 'D1' then
    wS := 'Título dentro do prazo de vencimento (em dia)';
  if UpperCase(wErro) = 'D2' then
    wS := 'Espécie de documento não permite protesto de Título';
  if UpperCase(wErro) = 'D3' then
    wS := 'Título possui instrução de baixa pendente de confirmação';
  if UpperCase(wErro) = 'D4' then
    wS := 'Quantidade de Mensagens Padrão excede o limite permitido';
  if UpperCase(wErro) = 'D5' then
    wS :=
      'Quantidade Inválida no Pedido de Bloquetos Pré-Impressos da Cobrança SEM Registro';
  if UpperCase(wErro) = 'D6' then
    wS := 'Tipo de Impressão inválida para Cobrança SEM Registro';
  if UpperCase(wErro) = 'D7' then
    wS := 'Cidade ou Estado do sacado não Informados';
  if UpperCase(wErro) = 'D8' then
    wS := 'Sequencia para composição do Nosso Número do ano atual esgotada';
  if UpperCase(wErro) = 'D9' then
    wS :=
      'Registro Mensagem (instruções para impressão no bloqueto da Cobrança SEM Registro) para Título não cadastrado';
  if UpperCase(wErro) = 'E2' then
    wS :=
      'Registro COMPLEMENTAR ao cadastro do Título da Cobrança COM Registro não Cadastrado';
  if UpperCase(wErro) = 'X1' then
    wS := 'Regularização Centralizadora - Rede Bansicredi';
  if UpperCase(wErro) = 'X2' then
    wS := 'Regularização Centralizadora - Compensação';
  if UpperCase(wErro) = 'X3' then
    wS := 'Regularização Centralizadora - Banco Correspondente';
  if (wS = '') and (Trim(wErro) <> '') then
  begin
    try
      Aux := StrToInt(Trim(wErro));
      case Aux of
        1: wS := 'Código do Banco Inválido';
        2: wS := 'Código do Registro Detalhe Inválido';
        3: wS := 'Código da Ocorrência Inválido';
        4: wS := 'Código de Ocorrência não permitida para a Carteira';
        5: wS := 'Código de Ocorrência não numérico';
        7: wS := 'Agência/Conta/Dígito Inválidos';
        8: wS := 'Nosso Número Inválido';
        9: wS := 'Nosso Número duplicado';
        10: wS := 'Carteira Inválida';
        14: wS := 'Título Protestado';
        15: wS := 'Carteira/Agência/Conta/Nosso Número Inválidos';
        16: wS := 'Data de Vencimento Inválida';
        17: wS := 'Data de Vencimento anterior à data de Emissão';
        18: wS := 'Vencimento fora do prazo de operação';
        20: wS := 'Valor do Título Inválido';
        21: wS := 'Espécie do Título Inválida';
        22: wS := 'Espécie não permitida para a Carteira';
        24: wS := 'Data de Emissão Inválida';
        29: wS := 'Valor do Desconto maior/igual ao valor do Título';
        31: wS := 'Concessão de Desconto - existe desconto anterior';
        33: wS := 'Valor do Abatimento Inválido';
        34: wS := 'Valor do Abatimento maior/igual ao valor do Título';
        36: wS := 'Concessão de Abatimento - existe abatimento anterior';
        38: wS := 'Prazo para Protesto Inválido';
        39: wS := 'Pedido para protesto não permitido para o Título';
        40: wS := 'Título com ordem de protesto emitida';
        41: wS := 'Pedido Cancelamento/Sustação sem Instrução de Protesto';
        44: wS := 'Agência Cedente não prevista';
        45: wS := 'Nome do Sacado Inválido';
        46: wS := 'Tipo/Número de Inscrição do Sacado Inválidos';
        47: wS := 'Endereço do sacado não Informado';
        48: wS := 'CEP irregular';
        49: wS := 'Número de Inscrição do Sacador/Avalista Inválido';
        50: wS := 'Sacador/Avalista não Informado';
        60: wS := 'Movimento para Título não cadastrado';
        63: wS := 'Entrada para Título já cadastrado';
      end;
    except
      on EConvertError do
    end;
  end;
  Result := wS;
end;

procedure TFContasReceberCad.RetornoRemessaSicredi1Click(Sender: TObject);
var
  wCont: integer;
  F: TextFile;
  S: string;
  wErro1, wErro2, wErro3, wErro4, wErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  inherited; // RETORNO SICREDI
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    wErro1 := '';
    wErro2 := '';
    wErro3 := '';
    wErro4 := '';
    wErro5 := '';
    // Abre arquivo de retorno SICREDI
    OpenDialog1.Filter := 'Arquivo de Retorno Bansicredi';
    OpenDialog1.FilterIndex := 0;
    OpenDialog1.DefaultExt := '*.CRT';
    OpenDialog1.FileName := '*.CRT';

    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 1, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 2, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo invalida!');
      if Copy(Trim(S), 3, 7) <> 'RETORNO' then
        // Verifica se realmente é um arquivo de retorno.
        raise exception.Create('Não é um arquivo de RETORNO!');
      if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
        raise exception.Create('Não é um arquivo de COBRANÇA!');
      if Copy(Trim(S), 80, 15) <> 'BANSICREDI     ' then
        raise exception.Create('Nome do banco invalido!');

      {Acima está sendo verificado se o registro HEADER é
       realmente um arquivo de retorno-SICREDI}

      Readln(F, S); //Le a proxima linha do arquivo
      while (Trim(S) <> '') do // Arquivo contém registro para processar.
      begin
        if Copy(Trim(S), 1, 1) = '1' then //registro detalhe
        begin
          // Condições possiveis para executar baixa do titulo.
          if StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17] then
          begin
            wVal_Juro := 0;
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;

            wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
              Copy(S, 115, 02);
            wDtCredito := Copy(S, 335, 02) + '/' + Copy(S, 333, 02) + '/' +
              Copy(S, 331, 02);
            wNNumero := Copy(S, 48, 9); // Nosso numero
            // Verifica se valor para baixar é diferente de zero.
            if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
              wVal_Baixa := (StrToFloat(Copy(S, 254, 13)) / 100)
            else
              raise exception.Create('Titulo com valor p/baixar igual a zero!');

            if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
            begin
              wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100 +
                (StrToFloat(Copy(S, 280, 13)) / 100);
              wpgto_juro := (StrToFloat(Copy(S, 267, 13)) / 100) +
                (StrToFloat(Copy(S, 280, 13)) / 100);
            end;

            if (StrToFloat(Copy(S, 241, 13)) <> 0) or (StrToFloat(Copy(S, 228, 13)) <> 0) then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
                StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
              wNNumero, wDtLiquida, wDtCredito);
            // Chama procedimento para baixa de titulo.
          end;

          // Definindo valor default. Se o erro nao for encontrado na tabela de erros,
          // ira imprimir traço.
          wErro1 := '-';
          wErro2 := '-';
          wErro3 := '-';
          wErro4 := '-';
          wErro5 := '-';
          // Erros
          if Copy(Trim(S), 109, 2) = '03' then // Entrada Rejeitada
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 321, 2));
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 323, 2));
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 325, 2));
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 327, 2));
          end;

          if Copy(Trim(S), 109, 2) = '24' then
            // Entrada Rejeitada por CEP irregular
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := '';
            wErro3 := '';
            wErro4 := '';
            wErro5 := '';
          end;

          if Copy(Trim(S), 109, 2) = '27' then // Baixa Rejeitada
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 321, 2));
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 323, 2));
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 325, 2));
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 327, 2));
          end;

          if Copy(Trim(S), 109, 2) = '28' then // Tarifa
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 321, 2));
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 323, 2));
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 325, 2));
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 327, 2));
          end;

          if Copy(Trim(S), 109, 2) = '30' then // Alteraçao Rejeitada
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 321, 2));
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 323, 2));
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 325, 2));
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 327, 2));
          end;

          if Copy(Trim(S), 109, 2) = '32' then // Instruçao Rejeitada
          begin
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 319, 2));
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 321, 2));
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 323, 2));
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 325, 2));
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 327, 2));
          end;

          // Inicia impressao dos erros \\
          if Imp = nil then
            Imp := TImp.Create;
          Imp.AbreImpressora;
          Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

          if wCont = 1 then
          begin
            Imp.WriteXY(4.5, wCont,
              'R E L A T O R I O   D E   E R R O S  - SICREDI  -RETORNO    -    Data: ' +
              DateTimeToStr(Now));
            wCont := wCont + 2;
            Inc(wCont);
            Imp.WriteXY(0, wCont,
              'Titulo(NN)        Cliente   Num.Registro    Codigo        Mensagem');
            Inc(WCont);
            Imp.WriteXY(0, wCont,
              '-----------------------------------------------------------------------------------------------------------------------');
            Inc(WCont);
          end;
          if wErro1 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 48, 15) + '    ' + Copy(S, 20, 05) +
              '      ' + Copy(S, 395, 6) + '          ' + Copy(Trim(S), 109, 2)
              +
              '-' + Copy(Trim(S), 319, 2) + '       ' + wErro1);
            Inc(WCont);
          end;
          if wErro2 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 48, 15) + '    ' + Copy(S, 20, 05) +
              '      ' + Copy(S, 395, 6) + '          ' + Copy(Trim(S), 109, 2)
              +
              '-' + Copy(Trim(S), 321, 2) + '       ' + wErro2);
            Inc(WCont);
          end;
          if wErro3 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 48, 15) + '    ' + Copy(S, 20, 05) +
              '      ' + Copy(S, 395, 6) + '          ' + Copy(Trim(S), 109, 2)
              +
              '-' + Copy(Trim(S), 323, 2) + '       ' + wErro3);
            Inc(WCont);
          end;
          if wErro4 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 48, 15) + '    ' + Copy(S, 20, 05) +
              '      ' + Copy(S, 395, 6) + '          ' + Copy(Trim(S), 109, 2)
              +
              '-' + Copy(Trim(S), 325, 2) + '       ' + wErro4);
            Inc(WCont);
          end;
          if wErro5 <> '' then
          begin
            Imp.WriteXY(0, wCont, Copy(S, 48, 15) + '    ' + Copy(S, 20, 05) +
              '      ' + Copy(S, 395, 6) + '          ' + Copy(Trim(S), 109, 2)
              +
              '-' + Copy(Trim(S), 327, 2) + '       ' + wErro5);
            Inc(WCont);
          end;
          if wCont >= 66 then
          begin
            Imp.SaltaPagina;
            wCont := 1;
          end;
        end;
        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end; // Fim do while

      if imp <> nil then
        // É necessario pois caso não tenha impressão ocorre erro.
      begin
        Imp.SaltaPagina;
        Imp.FechaImpressora; // Finaliza os serviços de Impressao}
      end;
      CloseFile(F); // Fecha arquivo aberto.
    end; // Fim do begin OpenDialog.

  end; // Fim do modalresutl
end;

procedure TFContasReceberCad.ArquivoRemessaBradesco1Click(Sender: TObject);
var
  wstrS: string;
  wstrCodEmpresa: string;
  wintContador: Integer;
  wintSeqArquivo: Integer;
  F: TextFile;
  wDesconto: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;

      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me17NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if (QRemessa.RecordCount > 0) then
      begin
        try
          wintContador := 2;
          wstrS := '';
          wstrCodEmpresa := '';

          wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_BRADESCO');
          wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
            IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
            IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
            + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

          //REGISTRO HEADER
 {001-046}wstrS := '01REMESSA01COBRANCA       ' +
            IntDecimais(Bib.StrZero(QRemessaCODIGO_CEDENTE.Text, 20), 20, 0) +
            {047-076}Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
          {077-079}'237BRADESCO       ' +
          {095-110}FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) +
            'MX' +
            {111-117}IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
          {118-400}Bib.FormataTexto(' ', 277) + '000001' + Chr(13) + Chr(10);

          //REGISTRO DETALHE
          while not QRemessa.Eof do
          begin
            {001-037}wstrS := wstrS + '1' + RMaskCGC_CPF('0', 19) +
              wstrCodEmpresa +
              {038-070}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 25) +
              RMaskCGC_CPF('0', 8) +
              {071-082}RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
            {083-106}RMaskCGC_CPF('0', 10) + '2N' + Bib.FormataTexto(' ', 11) +
              '2' +
              {107-120}'  01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
            {121-126}FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
            {127-139}IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
            {140-147}'0000000001';
            {150-150}if (QRemessaIND_ACEITE.Text = 'SIM') then
              wstrS := wstrS + 'A'
            else
              wstrS := wstrS + 'N';
            {151-156}wstrS := wstrS + FormatDateTime('DDMMYY',
              QRemessaDT_EMISSAO.Value) +
            {157-160}'0605';
            {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              //alterado Marcos 12/12/05
              wstrS := wstrS +
                IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                (QRemessaVal_Titulo.Value / 100)), 13, 2);
            {174-179}wstrs := wstrS + RMaskCGC_CPF('0', 6);
            //dala limite p/ concessao de desconto

          {180-192}if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value =
              'FAVILLE') or
              (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL')) then
            begin
              wDesconto :=
                StrToFloat(DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
              wDesconto := ((DMContasReceber.QRBloquetoVAL_TITULO.Value *
                wDesconto) / 100);
              wstrs := wstrS + IntDecimais(FloatToStr(wDesconto), 13, 2);
              //valor do desconto
            end
            else
              wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

            {193-205}wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
            {206-218}wstrS := wstrS + RMaskCGC_CPF('0', 13);
            //valor do abatimento a ser concedido ou cancelado

          {219-220}if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
              wstrS := wstrS + '01'
            else
            begin
              if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                wstrS := wstrS + '02'
              else
                wstrS := wstrS + '98';
            end;
            {221-234}wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14)
              +
              {235-274}Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
            {275-314}Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
            {315-326}Bib.FormataTexto(' ', 12) +
            {327-334}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
            {335-394}Bib.FormataTexto(' ', 60) +
            {395-400}RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) +
              Chr(10);
            Inc(wintContador);
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end; //fim do while

          //registro trailler
          wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
            //        RMaskCGC_CPF(IntToStr(wintContador),6) + Chr(13)+Chr(10); comentada p/ Fabio 23/03/04, eliminar linha em branco no final
          RMaskCGC_CPF(IntToStr(wintContador), 6);

          FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
            FormatDateTime('DDMM', Date) + '01.REM';
          FContasReceberParam.SDlg_Remessa.Filter :=
            'Arquivo de Remessa Bradesco';
          FContasReceberParam.SDlg_Remessa.DefaultExt := '';
          FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, wstrS);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA Bradesco Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA Bradesco não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        raise Exception.Create('Não foi encontrado nenhum registro');
    end;
  end;
end;

function TFContasReceberCad.RetornaErroBradesco(wstrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de ocorrência não numérico';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Dublicado';
    10: wstrS := 'Carteira Inválida';
    15: wstrS := 'Carteira/Agência/Conta/Nosso Número Inválidos';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie não permitida para a carteira';
    24: wstrS := 'Data de emissão Inválida';
    28: wstrS := 'Código de desconto via Telebradesco Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução via Telebradesco inválido';
    44: wstrS := 'Agência Cedente não prevista';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    50: wstrS := 'CEP irregular - Banco Correspondente';
    53: wstrS := 'Tipo de inscrição do sacador avalista inválidos';
    60: wstrS := 'Movimento para Título não cadastrado';
    63: wstrS := 'Entrada para Título já cadastrado';
    68: wstrS := 'Débito não agendado - erro nos dados de remessa';
    69: wstrS :=
      'Débito não agendado - Sacado não consta no cadastro de autorizante';
    70: wstrS := 'Débito não agendado - Cedente não autorizado pelo Sacado';
    71: wstrS :=
      'Débito não agendado - Cedente não participa da modalidade de débito automático';
    72: wstrS := 'Débito não agendado - Código de moeda diferente de R$';
    73: wstrS := 'Débito não agendado - Data de vencimento inválida';
    74: wstrS :=
      'Débito não agendado - Conforme seu pedido. Título não registrado';
    75: wstrS :=
      'Débito não agendado - Tipo de número de inscrição do debitado inválido';
    77: wstrS := 'Transferência para desconto não permitido para a carteira';
    85: wstrS := 'Título com pagamento vinculado';
    86: wstrS := 'Seu número inválido';
  end;
  Result := (wstrS);
end;

procedure TFContasReceberCad.RetornoRemessaBradesco1Click(Sender: TObject);
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  inherited; //RETORNO BRADESCO
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    // Abre arquivo de retorno BRADESCO
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont1 := 0;
      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 1, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 2, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo invalida!');
      if Copy(Trim(S), 3, 7) <> 'RETORNO' then
        // Verifica se realmente é um arquivo de retorno.
        raise exception.Create('Não é um arquivo de RETORNO!');
      if Copy(Trim(S), 10, 2) <> '01' then //alterado por marcos 14/11/06
        raise exception.Create('Retorno Inválido!');
      if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
        raise exception.Create('Não é um arquivo de COBRANÇA!');
      if Copy(Trim(S), 80, 8) <> 'BRADESCO' then
        raise exception.Create('Nome do banco inválido!');

      {Acima está sendo verificado se o registro HEADER é
       realmente um arquivo de retorno-BRADESCO}

      Readln(F, S); //Le a proxima linha do arquivo
      while ((Trim(S) <> '') and (Copy(Trim(S), 1, 1) <> '9')) do
        // Arquivo contém registro para processar.
      begin
        // Condições possiveis para executar baixa do titulo.
        if StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17] then // PAGINA 36
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;
          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
            Copy(S, 115, 02);
          wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
            Copy(S, 300, 02);
          wNNumero := Copy(S, 135, 12); // Numero do titulo no banco
          wNum_Titulo := Trim(Copy(S, 117, 10)); //
          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
            wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
          else
            ShowMessage('Titulo ' + Copy(S, 117, 10) +
              ' com valor p/baixar igual a zero!');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
            wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
          end;

          if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 + StrToFloat(Copy(S,
              228, 13)) / 100; // Valor do abatimento

          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
          // Chama procedimento para baixa de titulo.
          inc(wCont1);
        end;
        // Erros
        if Copy(Trim(S), 109, 2) = '02' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := 'ENTRADA CONFIRMADA';
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;
        if Copy(Trim(S), 109, 2) = '03' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '24' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '27' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '30' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '32' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

        if wCont = 1 then
        begin
          Imp.WriteXY(4.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - BRADESCO  - RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(0, wCont,
            'Titulo     Num. Registro    Cod.Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(0, wCont,
            '--------------------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        if wstrErro1 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
            '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 319, 2) +
            '       ' + wstrErro1);
          Inc(WCont);
        end;
        if wstrErro2 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
            '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 321, 2) +
            '       ' + wstrErro2);
          Inc(WCont);
        end;
        if wstrErro3 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
            '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 323, 2) +
            '       ' + wstrErro3);
          Inc(WCont);
        end;
        if wstrErro4 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
            '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 325, 2) +
            '       ' + wstrErro4);
          Inc(WCont);
        end;
        if wstrErro5 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
            '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 327, 2) +
            '       ' + wstrErro5);
          Inc(WCont);
        end;
        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;

        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end; // Fim do while

      if imp <> nil then
        // É necessario pois caso não tenha impressão ocorre erro.
      begin
        Imp.SaltaPagina;
        Imp.FechaImpressora; // Finaliza os serviços de Impressao}
      end;
      showMessage('Baixado ' + IntToStr(wCont1) + 'Títulos');
      CloseFile(F); // Fecha arquivo aberto.
    end; // Fim do begin OpenDialog.
  end; // Fim do modalresutl
end;

procedure TFContasReceberCad.TtulosporFinalidade1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
  begin
    FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.ME21DtBase.Text := DateToStr(Date);
  end;
  FContasReceberParam.PGRelatorio.Pages[21].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME21DtInicio.Text) = '') or
      (Trim(FContasReceberParam.ME21DtFim.Text) = '') then
      raise Exception.Create('Informar o Período');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME21CodFilial.Text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Finalidade.Close;

      if Trim(FContasReceberParam.ME21CodFilial.Text) <> '' then
        QRContasReceber_Finalidade.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME21CodFilial.Text))
      else
        QRContasReceber_Finalidade.SetVariable('FILIAL', null);

      if Trim(FContasReceberParam.Me21CodFinalidade.Text) <> '' then
        QRContasReceber_Finalidade.SetVariable('FINALIDADE',
          Trim(FContasReceberParam.Me21CodFinalidade.Text))
      else
        QRContasReceber_Finalidade.SetVariable('FINALIDADE', null);

      QRContasReceber_Finalidade.SetVariable('DT_INICIAL',
        Trim(FContasReceberParam.ME21DtInicio.Text));
      QRContasReceber_Finalidade.SetVariable('DT_FINAL',
        Trim(FContasReceberParam.ME21DtFim.Text));

      DMContasReceber.pDataBase :=
        StrToDate(FContasReceberParam.ME21DtBase.Text);
      QRContasReceber_Finalidade.Open;

      if FRContasReceber_Finalidade = nil then
        FRContasReceber_Finalidade :=
          TFRContasReceber_Finalidade.Create(Application);
      FRContasReceber_Finalidade.QRLbFilial.Caption := 'Filial: ' +
        Trim(FContasReceberParam.Me21CodFilial.Text) +
        Trim(FContasReceberParam.Me21Filial.Text);
      FRContasReceber_Finalidade.QRLbPeriodo.Caption := 'Período de ' +
        FContasReceberParam.Me21DtInicio.Text + ' Até ' +
        FContasReceberParam.Me21DtFim.Text + ' Data base: ' +
        FContasReceberParam.Me21DtBase.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Finalidade.QRPrimario.Preview
      else
        FRContasReceber_Finalidade.QRPrimario.Print;
      QRContasReceber_Finalidade.Close;
    end;
  end;
end;

procedure TFContasReceberCad.TtulospDtEmisso1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[22].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME22DtInicio.Text) = '') or
      (Trim(FContasReceberParam.ME22DtFim.Text) = '') then
      raise Exception.Create('Informar o Período');
    if (Trim(FContasReceberParam.ME22CodFinalidade.Text) = '') then
      raise Exception.Create('Informe uma Finalidade');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME21CodFilial.Text),
      'CONTAS A RECEBER');

    with DMContasReceber do
    begin
      QRTituloEmissao.Close;

      if Trim(FContasReceberParam.ME22CodFilial.Text) <> '' then
        QRTituloEmissao.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME22CodFilial.Text))
      else
        QRTituloEmissao.SetVariable('FILIAL', null);

      if Trim(FContasReceberParam.Me22CodFinalidade.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_FINALIDADE',
          Trim(FContasReceberParam.Me22CodFinalidade.Text))
      else
        QRTituloEmissao.SetVariable('COD_FINALIDADE', null);

      if Trim(FContasReceberParam.ME22CodBanco.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_BANCO_AGENCIA',
          Trim(FContasReceberParam.ME22CodBanco.Text))
      else
        QRTituloEmissao.SetVariable('COD_BANCO_AGENCIA', null);

      if Trim(FContasReceberParam.Fm22Departamento.MeDepartamento.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.Fm22Departamento.MeDepartamento.Text))
      else
        QRTituloEmissao.SetVariable('COD_DEPARTAMENTO', null);

      QRTituloEmissao.SetVariable('DATA_I',
        Trim(FContasReceberParam.ME22DtInicio.Text));
      QRTituloEmissao.SetVariable('DATA_F',
        Trim(FContasReceberParam.ME22DtFim.Text));

      case FContasReceberParam.RG22Situacao.ItemIndex of
        0: QRTituloEmissao.SetVariable('SITUACAO', 'ABERTO');
        1: QRTituloEmissao.SetVariable('SITUACAO', 'BAIXA_PARCIAL');
        2: QRTituloEmissao.SetVariable('SITUACAO', 'BAIXA_TOTAL');
        3: QRTituloEmissao.SetVariable('SITUACAO', null);
      end;
      QRTituloEmissao.Open;

      if FRTitulosEmissao = nil then
        FRTitulosEmissao := TFRTitulosEmissao.Create(Application);
      FRTitulosEmissao.QRLFilial.Caption :=
        Trim(FContasReceberParam.Me22CodFilial.Text) + ' - ' +
        Trim(FContasReceberParam.Me22Filial.Text);
      FRTitulosEmissao.QRLPeriodo.Caption := 'Período de ' +
        FContasReceberParam.Me22DtInicio.Text + ' Até ' +
        FContasReceberParam.Me22DtFim.Text;
      FRTitulosEmissao.QRLFinalidade.Caption :=
        Trim(FContasReceberParam.Me22CodFinalidade.Text) + ' - ' +
        Trim(FContasReceberParam.Me22Finalidade.Text);

      FRTitulosEmissao.QRLBanco.Caption :=
        Trim(FContasReceberParam.ME22CodBanco.Text) + ' - ' +
        Trim(FContasReceberParam.ME22Banco.Text);

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRTitulosEmissao.QRPrimario.Preview
      else
        FRTitulosEmissao.QRPrimario.Print;
      QRTituloEmissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ReciboComissao1Click(Sender: TObject);
var
  wQBVendedor: Integer;
  wVal_Comissao: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[12].TabVisible := True;
  FContasReceberParam.Rg12TipoRelatorio.Visible := False;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME12CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissao.Close;
      if Trim(FContasReceberParam.ME12CodFilial.Text) <> '' then
        QRComissao.SetVariable('FILIAL', FContasReceberParam.ME12CodFilial.Text)
      else
        QRComissao.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> '' then
        QRComissao.SetVariable('COD_SERIE',
          FContasReceberParam.Me12TipoDocumento.Text)
      else
        QRComissao.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.ME12CodVendedor.Text) <> '' then
        QRComissao.SetVariable('VENDEDOR',
          FContasReceberParam.ME12CodVendedor.Text)
      else
        QRComissao.SetVariable('VENDEDOR', Null);

      if Trim(FContasReceberParam.ME12DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_I', FContasReceberParam.ME12DTInicial.text);

      if Trim(FContasReceberParam.ME12DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_F', FContasReceberParam.ME12DtFinal.text);

      if Trim(FContasReceberParam.ME12DtEmissao.text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado');
      if Trim(FContasReceberParam.ME12DtVencto.Text) = '' then
        QRComissao.SetVariable('DT_VENCTO', Null)
      else
        QRComissao.SetVariable('DT_VENCTO',
          StrToDate(Trim(FContasReceberParam.ME12DtVencto.Text)));
      QRComissao.SetVariable('DT_EMISSAO',
        FContasReceberParam.ME12DtEmissao.text);
      if Trim(FContasReceberParam.ME12DtEmissaoFinal.text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO_FINAL',
          FContasReceberParam.ME12DtEmissaoFinal.text);
      if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ZADIMEL' then
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '3')
          //paga comissao tambem para notas com cheque
      else
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '0');
      if FReciboComissao = nil then
        FReciboComissao := TFReciboComissao.create(Application);
      QRComissao.Open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',
        StrToInt(Trim(FContasReceberParam.ME12CodFilial.Text)));
      DMFilial.QFilial.Open;
      wQBVendedor := Trunc(QRComissaoCod_Vendedor.Value);
      wVal_Comissao := 0;
      while not (QRComissao.Eof) do
      begin
        if QRComissaoCod_Vendedor.Value <> wQBVendedor then
        begin
          Imprime_Comissao(wQBVendedor, wVal_Comissao);
          wQBVendedor := Trunc(QRComissaoCod_Vendedor.Value);
          wVal_Comissao := 0;
        end;
        wVal_Comissao := wVal_Comissao + QRComissaoVal_Comissao.Value;
        QRComissao.Next;
      end;
      Imprime_Comissao(wQBVendedor, wVal_Comissao);
      // este serve para o ultimo vendedor
      QRComissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.Imprime_Comissao(wVendedor: Integer; wComissao:
  Real);
var
  wIRRF, wVal_Liquido: Real;
begin
  DMVendedor.QVendedor.Close;
  DMVendedor.QVendedor.SetVariable('Pk', wVendedor);
  DMVendedor.QVendedor.Open;
  with FReciboComissao do
  begin
    QRLCodigoVendedor.Caption := IntToStr(wVendedor);
    QRLNomeVendedor.Caption := DMVendedor.QVendedorNome.Value;
    QRLEndereco.Caption := DMVendedor.QVendedorDESC_ENDERECO.Value;
    QRLCep.Caption := DMVendedor.QVendedorDESC_CEP.Value;
    QRLCidade.Caption := DMVendedor.QVendedorDESC_CIDADE.Value;
    QRLEstado.Caption := DMVendedor.QVendedorCOD_ESTADO.Value;
    QRLCnpj.Caption := DMVendedor.QVendedorDESC_CPF.Value;
    QRLFone.Caption := DMVendedor.QVendedorDESC_TELEFONE.Value;
    QRLComissao.Caption := Bib.NumToTexto(wComissao, 2, 13);
    wIRRF := 0;
    if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> 'PE' then
    begin
      if DMVendedor.QVendedorPerc_Irrf.Value <> 0 then
        wIrrf := wComissao * DMVendedor.QVendedorPerc_Irrf.Value / 100;
      if wIrrf <= 10 then
        wIrrf := 0;
    end;
    QRLIrrf.Caption := Bib.NumToTexto(wIrrf, 2, 13);
    wVal_Liquido := wComissao - wIrrf;
    QRLValLiquido.Caption := Bib.NumToTexto(wVal_Liquido, 2, 13);
    QRLExtenso.Caption := Bib.extenso(wVal_Liquido, 'REAL');
    QRLDescFilial.Caption := FContasReceberParam.ME12Filial.Text;
    QRLHistorico.Caption := 'RECEBIMENTO DE COMISSAO REF ' +
      Copy(FContasReceberParam.ME12DtFinal.text, 4, 7);
    QRLDescCidade.Caption := DMFilial.QFilialDesc_Cidade.Text;
    QRLVendedor.Caption := DMVendedor.QVendedorNome.Value;
    QRLData.Caption := FormatDateTime('dd", de" mmmm "de" yyyy"."',
      StrToDate(FContasReceberParam.ME12DtFinal.text));
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FReciboComissao.QRPrimario.Preview
    else
      FReciboComissao.QRPrimario.Print;
  end;
end;
{procedure TFContasReceberCad.RelatoSerasa1Click(Sender: TObject);

var
  F               : TextFile;
  S               : String;
  mValorPago      : Real;
  mDataVencimento : String;
  mDataPagamento  : String;
  wTelefone       : String;
  wEndereco       : String;
  wTipoRegistro   : String;
  cont            : Integer;
begin
   inherited;
   cont := 0;
  if FContasReceberParam = Nil then
     FContasReceberParam := TFContasReceberParam.Create(Application);
     FContasReceberParam.PGRelatorio.Pages[23].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then

    with DMContasReceber do
    begin
    DmUsuario.Checar_Filial_Usuario( Trim(FContasReceberParam.ME23Filial.Text),'CONTAS A RECEBER');
     If ( (Trim(FContasReceberParam.Me23DtInicial.Text) = '') OR (Trim(FContasReceberParam.Me23DtFinal.Text) = '') ) Then
        raise Exception.Create('É necessário informar um Período!');

      QRelatoSerasa.Close;
      QRelatoSerasaVista.close;
      QRelatoSerasa.SetVariable( 'DATA_I', Trim(FContasReceberParam.Me23DtInicial.Text) );
      QRelatoSerasa.SetVariable( 'DATA_F', Trim(FContasReceberParam.Me23DtFinal.Text) ) ;
      QRelatoSerasaVista.SetVariable( 'DT_INICIAL', Trim(FContasReceberParam.Me23DtInicial.Text));
      QRelatoSerasaVista.SetVariable( 'DT_FINAL', Trim(FContasReceberParam.Me23DtFinal.Text));

     if Trim(FContasReceberParam.ME23Filial.Text)<>'' then
        raise exception.create('É Necessário Informar a Filial');

        QRelatoSerasa.SetVariable('FILIAL',FContasReceberParam.ME23Filial.Text);
        QRelatoSerasaVista.SetVariable('FILIAL',FContasReceberParam.ME23Filial.Text);

      QRelatoSerasa.Open;
      QrelatoSerasaVista.open;
      QRelatoSerasa.First;
      If QRelatoSerasa.IsEmpty Then
        raise Exception.Create('Não existem registros a serem gerados no período!');

      begin
        S := S + '00'                                                                  + // Inicializa valor da variavel.
        'CONV INF COMERCIAL  '                                                         +
        RMaskCGC_CPF (QRelatoSerasaNUM_CGC.Text,8)                                     +
        RMaskCGC_CPF (FContasReceberParam.Me23Filial.Text,2)                           +
        copy(FContasReceberParam.Me23DtInicial.Text,7,4)                               +
        copy(FContasReceberParam.Me23DtInicial.Text,4,2)                               +
        copy(FContasReceberParam.Me23DtInicial.Text,1,2)                               +
        copy(FContasReceberParam.Me23DtFinal.Text,7,4)                                 +
        copy(FContasReceberParam.Me23DtFinal.Text,4,2)                                 +
        copy(FContasReceberParam.Me23DtFinal.Text,1,2)                                 +
        'M'                                                                            +
        '                                                   '                          +
        Chr(13)+Chr(10);
      End;

      if ((QRelatoSerasaDT_EMISSAO.Value) >= StrToDate(FContasReceberParam.Me23DtInicial.Text))and
          ((QRelatoSerasaDT_EMISSAO.Value) <= StrToDate(FContasReceberParam.Me23DtFinal.Text))then
      while not QRelatoSerasa.Eof do
        begin
          S := S + '01'                                                                +
          RMaskCGC_CPF (QRelatoSerasaNUM_CGC_CPF.Text,8)                               +
          '00'                                                                         +
          '01'                                                                         +
          copy(QRelatoSerasaDT_CADASTRO.Text,7,4)                                      +
          copy(QRelatoSerasaDT_CADASTRO.Text,4,2)                                      +
          copy(QRelatoSerasaDT_CADASTRO.Text,1,2)                                      +
          '0000'                                                                       +
          '                                                                         '  +
          Chr(13)+Chr(10);
         // QRelatoSerasa.Next;
        //end;

        Begin
          S := S + '01'                                                                +
          RMaskCGC_CPF (QRelatoSerasaNUM_CGC_CPF.Text,8)                               +
          '00'                                                                         +
          '02'                                                                         +
          RMaskCGC_CPF (FloatToStr(QRelatoSerasavl_ultima_compra.Value * 100),13)      +
          copy(QRelatoSerasaDT_ULTIMA_COMPRA.Text,7,4)                                 +
          copy(QRelatoSerasaDT_ULTIMA_COMPRA.Text,4,2)                                 +
          copy(QRelatoSerasaDT_ULTIMA_COMPRA.Text,1,2)                                 +
          RMaskCGC_CPF (FloatToStr(QRelatoSerasaVL_MAIOR_FATURA.Value * 100),13)       +
          copy(QRelatoSerasadt_maior_fatura.Text,7,4)                                  +
          copy(QRelatoSerasadt_maior_fatura.Text,4,2)                                  +
          copy(QRelatoSerasadt_maior_fatura.Text,1,2)                                  +
          '0000000000000'                                                              +
          '00000000'                                                                   +
          '0000'                                                                       +
          '                   '                                                        +
          Chr(13)+Chr(10);
          QRelatoSerasa.Next;
          end;

          cont := cont + 1;
          S := S + '01'                                                                +
          RMaskCGC_CPF (QRelatoSerasaNUM_CGC_CPF.Text,8)                               +
          '00'                                                                         +
          '03'                                                                         +
          '0000'                                                                       +
          copy(QRelatoSerasaDT_EMISSAO.Text,7,4)                                       +
          copy(QRelatoSerasaDT_EMISSAO.Text,4,2)                                       +
          RMaskCGC_CPF (IntToStr(cont),5)                                              +
          RMaskCGC_CPF (FloatToStr(QRelatoSerasaVistaTOTALAVISTA.Value * 100),13)      +
          '0000'                                                                       +
          '                                                      ' ;

       end;
        // ---------------- Final da geração do arquivo.--------------\\

        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile( F, FContasReceberParam.SDlg_Remessa.FileName );
          Rewrite(F);
          Writeln(F, S);
          CloseFile(F);
          MessageDlg('Arquivo SCI Gerado com Sucesso!', mtInformation,[mbOk], 0);
        end
        else
          MessageDlg('Arquivo SCI não foi Gerado!', mtWarning,[mbOk], 0);

      end
      else
         ShowMessage('Não existem registros a serem gerados.');
    end;  }

procedure TFContasReceberCad.RelatoSerasa1Click(Sender: TObject);
var
  mTipoInscricao, mNUM_CEDENTE: string;
  mCodNossoNumero, mBrancos, S: string;
  x, mSequencial: Integer;
  mSEQ_REMESSA: Real;
  F: TextFile;
begin
  inherited; // Rotina para banco Rural
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;
      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME17DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME17DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME17DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if QRemessa.RecordCount > 0 then
      begin
        try
          // REGISTRO HEADER ARQUIVO REMESSA

          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_BCO_RURAL');

          mBrancos := '';
          for x := 1 to 279 do
          begin
            mBrancos := mBrancos + ' ';
          end;

          S := ''; // Inicia variavel.
          S := S + '09REMESSA01COBRANCA       ' +
            RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
            RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Value, 10) +
            '      ' +
            FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
            '453RURAL                         ' +
            'CD0V01' +
            mBrancos +
            '000001' + Chr(13) + Chr(10);

          // REGISTRO DETALHE ARQUIVO REMESSA

          mSequencial := 2; { 1=Registro HEADER }
          while not QRemessa.Eof do
          begin

            if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'F' then
              // Pessoa fisica
              mTipoInscricao := '01' // CPF
            else
              mTipoInscricao := '02'; // CNPJ

            mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;

            { Número da sequencia segundo layout DETALHE }
            S := S + '1' +
              '                ' +
              {04-17}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
              RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.text, 10) +
              {32-33}'05' +
            {34-35}'00' +
            {36-37}'2' +
              '4' +
              {38-62}RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text +
              QRemessaNUM_TITULO.Text, 25) +
              RMaskCGC_CPF(mCodNossoNumero, 8) +
              {71-80}RMaskCGC_CPF(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10) +
            {81-82}'  ' +
              mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14) +
              '         ' +
              '2' +
              '01' +
              {111-120}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
            {121-126}formatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value) +
            {127-139}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
              '0000000' +
              ' ' +
              '01A' +
              {151-156}formatDateTime('ddmmyy', QRemessaDT_EMISSAO.Value) +
            {157-160}'0000';
            {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            else
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
            {174-179}S := S + '      ' +
            {180-192}'0000000000000' +
            {193-205}'0000000000000' +
            {206-218}'0000000000000' +
            {206-218}mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaNOME.Text))) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
              '            ' + // NÃO SEI O QUE VAI AQUI
              RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              FormatMaskText('CCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
              FormatMaskText('CC', UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text))
              +
              '1' +
              '                                          ' +
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            //--------- registro mensagem ----------------------\\
            mBrancos := '';
            for x := 1 to 193 do
            begin
              mBrancos := mBrancos + ' '; // Usado anteriormente também.
            end;
            S := S + '2' +
              'PROTESTAR NO 5 (QUINTO) DIA APOS O VENCIMENTO.    ' +
              '                                                  ' +
              '                                                  ' +
              '                                                  ' +
              mbrancos +
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
            //--------- final registro mensagem ----------------------\\
            QRemessa.Next;
          end; // fim do while --final registro detalhe

          // -------------  Inicio Registro Trailler -------------- \\
          mBrancos := '';
          for x := 1 to 393 do
          begin
            mBrancos := mBrancos + ' '; // Usado anteriormente também.
          end;
          S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
          // +Chr(13)+Chr(10);

        //------------------ Fim --------------------------\\

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA-RURAL Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA-RURAL não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.RetornoRemessaBancoRural1Click(
  Sender: TObject);
var
  wCont, i: integer;
  x, wRECUSA, wErro: string;
  F: TextFile;
  S: string;
begin
  inherited; // RETORNO BANCO RURAL
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  FContaCorrenteCons.ShowModal;

  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 9) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 15) <> 'RURAL' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-BANCO RURAL}

    Readln(F, S); //Le a proxima linha do arquivo
    S := Trim(S);
    while (S <> '') do // Arquivo contém registro para processar.
    begin
      x := '100'; // Inicializa valor para número do erro/recusa.

      // Condições possiveis para executar baixa do titulo.
      if StrToInt(copy(S, 109, 2)) <> 3 then // Ver tabela explicativa NOTA 13
        BaixaTituloRURAL(S);
      // Chama procedimento para baixa de titulo BANCO RURAL

      if Copy(S, 109, 2) = '03' then // Houve recusa do registro enviado.
      begin

        //---bloco de montagem da string que contem os erros
        x := Copy(S, 334, 61); //copia lista erros no reg. de entrada de remessa
        wErro := '';
        for i := 1 to 61 do //indenfica erro pela posicao
        begin
          if copy(x, i, 1) <> '0' then
            if StrToInt(x) < 10 then
              wErro := wErro + '0' + IntToStr(i)
            else
              wErro := wErro + IntToStr(i);
        end;
        //---fim do bloco de montagem da string que contem os erros
        i := 1;
        while (i <= length(wErro) / 2) do
        begin
          case StrToInt(copy(wErro, i, 2)) of
            1: wRECUSA := wRECUSA + 'CÓDIGO MOEDA INVÁLIDO' + chr(13) + chr(10);
            2: wRECUSA := wRECUSA + 'CÓDIGO MOEDA INVÁLIDO PARA SEGURO - REAIS'
              + chr(13) + chr(10);
            3: wRECUSA := wRECUSA + 'CÓDIGO MOEDA / MORA INCONSISTENTES' +
              chr(13) + chr(10);
            4: wRECUSA := wRECUSA + 'VALOR EM REAIS - MORA EM MOEDA' + chr(13) +
              chr(10);
            5: wRECUSA := wRECUSA + 'PROIBIDO PROTESTAR - TÍTULO NÃO VENCIDO' +
              chr(13) + chr(10);
            6: wRECUSA := wRECUSA + 'ESPÉCIE DOCUMENTO INVÁLIDA' + chr(13) +
              chr(10);
            7: wRECUSA := wRECUSA + 'ESPÉCIE DOCUMENTO INEXISTENTE' + chr(13) +
              chr(10);
            8: wRECUSA := wRECUSA + 'TIPO DE OPERAÇÃO INV. P/ SEGUROS C/ IOS' +
              chr(13) + chr(10);
            9: wRECUSA := wRECUSA + 'TIPO DE OPERAÇÃO INEXISTENTE' + chr(13) +
              chr(10);
            10: wRECUSA := wRECUSA + 'CONTRATO PROIBIDO PARA ESTA CARTEIRA' +
              chr(13) + chr(10);
            11: wRECUSA := wRECUSA + 'FALTA NÚMERO DO CONTRATO' + chr(13) +
              chr(10);
            12: wRECUSA := wRECUSA + 'PROIBIDO INFORMAR TIPO DE CONTA' + chr(13)
              + chr(10);
            13: wRECUSA := wRECUSA + 'TIPO DE CONTA DO CONTRATO INEXISTENTE' +
              chr(13) + chr(10);
            14: wRECUSA := wRECUSA + 'DÍGITO DO CONTRATO NÃO CONFERE' + chr(13)
              + chr(10);
            15: wRECUSA := wRECUSA + 'CONTRATO INEXISTENTE' + chr(13) + chr(10);
            16: wRECUSA := wRECUSA + 'DATA DA EMISSÃO INVÁLIDA' + chr(13) +
              chr(10);
            17: wRECUSA := wRECUSA + 'VALOR DO TÍTULO INVÁLIDO' + chr(13) +
              chr(10);
            18: wRECUSA := wRECUSA + 'DATA VENCIMENTO INVÁLIDA' + chr(13) +
              chr(10);
            19: wRECUSA := wRECUSA + 'DATA DE VENCIMENTO ANTERIOR À EMISSÃO' +
              chr(13) + chr(10);
            20: wRECUSA := wRECUSA + 'FALTA VENCIMENTO DESCONTO' + chr(13) +
              chr(10);
            21: wRECUSA := wRECUSA + 'DATA VENCIMENTO DESCONTO INVÁLIDA' +
              chr(13) + chr(10);
            22: wRECUSA := wRECUSA + 'DATA DESCONTO POSTERIOR AO VENCIMENTO' +
              chr(13) + chr(10);
            23: wRECUSA := wRECUSA + 'FALTA VALOR DESCONTO' + chr(13) + chr(10);
            24: wRECUSA := wRECUSA;
            25: wRECUSA := wRECUSA + 'BANCO/AGÊNCIA COBRADOR INEXISTENTE' +
              chr(13) + chr(10);
            26: wRECUSA := wRECUSA;
            27: wRECUSA := wRECUSA + 'VALOR/TAXA DE MORA MUITO ALTO' + chr(13) +
              chr(10);
            28: wRECUSA := wRECUSA + 'FALTA CEP, BANCO E AGÊNCIA COBRADOR' +
              chr(13) + chr(10);
            29: wRECUSA := wRECUSA + 'FALTA NOME DO SACADO' + chr(13) + chr(10);
            30: wRECUSA := wRECUSA + 'FALTA ENDEREÇO' + chr(13) + chr(10);
            31: wRECUSA := wRECUSA + 'FALTA CIDADE' + chr(13) + chr(10);
            32: wRECUSA := wRECUSA + 'FALTA ESTADO' + chr(13) + chr(10);
            33: wRECUSA := wRECUSA + 'ESTADO INVÁLIDO' + chr(13) + chr(10);
            34: wRECUSA := wRECUSA + 'FALTA CPF/CGC DO SACADO' + chr(13) +
              chr(10);
            35: wRECUSA := wRECUSA + 'FALTA NUMERAÇÃO - BLOQUETE CLIENTE' +
              chr(13) + chr(10);
            36: wRECUSA := wRECUSA + 'TÍTULO PRÉ-NUMERADO JÁ EXISTENTE' + chr(13)
              + chr(10);
            37: wRECUSA := wRECUSA + 'DÍGITO NOSSO NÚMERO NÃO CONFERE' + chr(13)
              + chr(10);
            38: wRECUSA := wRECUSA + 'SERVIÇO INVÁLIDO' + chr(13) + chr(10);
            39: wRECUSA := wRECUSA + 'REGISTRO 2 - MENSAGEM INVÁLIDO OU INEXIST.'
              + chr(13) + chr(10);
            40: wRECUSA := wRECUSA + 'DÍGITO DO CLIENTE /CONTRATO COM ERRO' +
              chr(13) + chr(10);
            41: wRECUSA := wRECUSA;
            42: wRECUSA := wRECUSA + 'TÍTULO INEXISTENTE' + chr(13) + chr(10);
            43: wRECUSA := wRECUSA + 'TÍTULO LIQUIDADO' + chr(13) + chr(10);
            44: wRECUSA := wRECUSA + 'TÍTULO NÃO PODE SER BAIXADO' + chr(13) +
              chr(10);
            45: wRECUSA := wRECUSA + 'VALOR NOMINAL INCORRETO' + chr(13) +
              chr(10);
            46: wRECUSA := wRECUSA;
            47: wRECUSA := wRECUSA + 'FALTA TIPO DE CONTA DO CONTRATO' + chr(13)
              + chr(10);
            48: wRECUSA := wRECUSA + 'CPF/CNPJ DO SACADOR COM ERRO' + chr(13) +
              chr(10);
            49: wRECUSA := wRECUSA +
              'CPF/CNPJ DO SACADOR IGUAL CPF/CNPJ DO CEDENTE' + chr(13) +
                chr(10);
            50: wRECUSA := wRECUSA +
              'CPF/CNPJ DO SACADOR IGUAL CPF/CNPJ DO SACADO' + chr(13) +
                chr(10);
            51: wRECUSA := wRECUSA;
            52: wRECUSA := wRECUSA + 'VALOR ABATIMENTO INVÁLIDO' + chr(13) +
              chr(10);
            53: wRECUSA := wRECUSA;
            54: wRECUSA := wRECUSA;
            55: wRECUSA := wRECUSA + 'FALTA TIPO DE PESSOA PARA ALTERAR CGC/CPF'
              + chr(13) + chr(10);
            56: wRECUSA := wRECUSA + 'CPF/CNPJ DO SACADO COM ERRO' + chr(13) +
              chr(10);
            57: wRECUSA := wRECUSA;
            58: wRECUSA := wRECUSA;
            59: wRECUSA := wRECUSA + 'ACEITE INVÁLIDO PARA ESPÉCIE DOCUMENTO' +
              chr(13) + chr(10);
            60: wRECUSA := wRECUSA + 'ALTERAÇÃO PRAZO PROTESTO INVÁLIDO' +
              chr(13) + chr(10);
            61: wRECUSA := wRECUSA + 'DEPOSITÁRIA NÃO CADASTRADA' + chr(13) +
              chr(10);
          end;
          i := i + 2;
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;

        if wCont = 1 then
        begin
          Imp.WriteXY(6.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - BANCO RURAL  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(1, wCont,
            'Titulo     Cliente   Nº Registro    Cmd. de Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(1, wCont,
            '----------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        Imp.WriteXY(5, wCont, Copy(S, 117, 10) + ' ' + Copy(S, 23, 08) + ' ' +
          IntToStr(i) + '                   ' + x + '           ' + wRECUSA);
        Inc(WCont);
        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
  end; // Fim do begin OpenDialog.

  CloseFile(F); // Fecha arquivo aberto.
end;

procedure TFContasReceberCad.EmissoCarn1Click(Sender: TObject);
var
  wCont: Integer;
  wTotal, wComando: string;
begin
  inherited;

  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[23].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then

    with DMContasReceber do
    begin
      QEmissaoCarne.close;

      if Trim(FContasReceberParam.ME23Filial.Text) <> '' then
        QEmissaoCarne.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME23Filial.Text))
      else
        QEmissaoCarne.SetVariable('FILIAL', null);

      if Trim(FContasReceberParam.Me23Cliente.Text) <> '' then
        QEmissaoCarne.SetVariable('CADASTRO',
          Trim(FContasReceberParam.Me23Cliente.Text))
      else
        QEmissaoCarne.SetVariable('CADASTRO', null);

      if Trim(FContasReceberParam.ME23Titulo.Text) <> '' then
        QEmissaoCarne.SetVariable('TITULO',
          Trim(FContasReceberParam.ME23Titulo.Text))
      else
        QEmissaoCarne.SetVariable('TITULO', null);

      if Trim(FContasReceberParam.ME23Parcela.Text) <> '' then
        QEmissaoCarne.SetVariable('PARCELA',
          Trim(FContasReceberParam.ME23Parcela.Text))
      else
        QEmissaoCarne.SetVariable('PARCELA', null);

      QEmissaoCarne.open;

      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO') then
      begin
        if QEmissaoCarneCOD_CADASTRO.Text = '' then
          raise Exception.Create('Nenhum Cliente Selecionado!');
        if imp = nil then
          imp := Timp.create;
        imp.AbreImpressora;
        imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 22);
        QEmissaoCarne.First;
        while not QEmissaoCarne.EOF do
        begin
          wCont := 3;
          Imp.WriteXY(0.5, wCont, QEmissaoCarneNOME.Value);
          Imp.WriteXY(8, wCont, QEmissaoCarneNOME.Value);
          Imp.WriteXY(15.2, wCont, QEmissaoCarneNOME.Value);
          wCont := 6;
          Imp.WriteXY(1, wCont, QEmissaoCarneCOD_CADASTRO.Text);
          Imp.WriteXY(4, wCont, QEmissaoCarneNUM_TITULO.Text);
          Imp.WriteXY(8.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
          Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_TITULO.Text);
          Imp.WriteXY(15.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
          Imp.WriteXY(18.5, wCont, QEmissaoCarneNUM_TITULO.Text);
          WCont := 8;
          Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
          Imp.WriteXY(2.7, wCont, QEmissaoCarneNUM_PARCELA.Text);
          Imp.WriteXY(3.8, wCont,
            Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 10));
          Imp.WriteXY(7.9, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
          Imp.WriteXY(10, wCont, QEmissaoCarneNUM_PARCELA.Text);
          Imp.WriteXY(11, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
            2, 10));
          Imp.WriteXY(15, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
          Imp.WriteXY(17.1, wCont, QEmissaoCarneNUM_PARCELA.Text);
          Imp.WriteXY(18, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
            2, 10));
          Imp.SaltaPagina;
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
              Chr(39) + 'SIM' + Chr(39);
            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
              FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
          QEmissaoCarne.Next;
        end;
        DMOracle.DBCemapa.Commit;
        Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
        Imp.FechaImpressora;
        QEmissaoCarne.Close;
      end;

      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') then
      begin
        if QEmissaoCarneCOD_CADASTRO.Text = '' then
          raise Exception.Create('Nenhum Cliente Selecionado!');
        if not (QEmissaoCarneCod_Nota_Cab.Value = Null) then
          wTotal :=
            DMOracle.BuscaNome('SELECT SUM(VAL_ORIGINAL) FROM TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB =' + QEmissaoCarneCod_Nota_Cab.Text);
        if imp = nil then
          imp := Timp.create;
        imp.AbreImpressora;
        imp.ConfiguraImpressora('CONDENSADO_OFF', 'OITAVOS', 24);
        QEmissaoCarne.First;
        while not QEmissaoCarne.EOF do
        begin
          if wTotal = Null then
            wTotal := QEmissaoCarneVAL_ORIGINAL.Text;
          wCont := 0;
          Imp.WriteXY(8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
          Imp.WriteXY(18.8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
          wCont := 4;
          Imp.WriteXY(0.8, wCont, QEmissaoCarneNOME.Value);
          Imp.WriteXY(11.2, wCont, QEmissaoCarneNOME.Value);
          wCont := 8;
          Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_EMISSAO.Text);
          Imp.WriteXY(4, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
          Imp.WriteXY(8, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
            2, 8));
          Imp.WriteXY(11.2, wCont, QEmissaoCarneDT_EMISSAO.Text);
          Imp.WriteXY(15, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
          Imp.WriteXY(18.1, wCont,
            Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 7));
          wCont := 12;
          Imp.WriteXY(0.8, wCont, QEmissaoCarneNUM_PARCELA.Text);
          Imp.WriteXY(2.2, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
          Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_PARCELA.Text);
          Imp.WriteXY(12.8, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
          wCont := 18;
          Imp.WriteXY(0.8, wCont, 'Juro diario de R$ ' + FormatFloat('#,##0.00',
            (QEmissaoCarnePERC_TAXA.Value /
            DMoracle.DiasNoMes(QEmissaoCarneDT_VENCIMENTO.Value) *
            QEmissaoCarneVal_Original.Value / 100)) + ' por atraso de Pgto.');
          Imp.SaltaPagina;
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
              Chr(39) + 'SIM' + Chr(39);
            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
              FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
          QEmissaoCarne.Next;
        end;
        DMOracle.DBCemapa.Commit;
        Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
        Imp.FechaImpressora;
        QEmissaoCarne.Close;
      end;
    end;
end;

procedure TFContasReceberCad.GeraContratoClick(Sender: TObject);
var
  Path, campo: string;
begin
  inherited;
  if DMContasReceber.QContasReceber_cabCOD_CONTA_RECEBER_CAB.value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMContasReceber.QContasReceber_cabCOD_FILIAL.Text), 'CONTAS A RECEBER');
    Path := ExtractFilePath(ParamStr(0)) + 'Contratos\';
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;
    DMFinalidade.QFinalidade.Close;
    DMFinalidade.QFinalidade.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FINALIDADE.Value);
    DMFinalidade.QFinalidade.Open;

    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'ContratoContasReceber.Doc');

    campo := DMFilial.QFilialDESC_FILIAL.Value;
    Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialNum_CGC.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMFilial.QFilialDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialCod_estado.Value;
    Doc.Content.Find.Execute(FindText := '%estado_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%inscricao_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroNOME.Value;
    Doc.Content.Find.Execute(FindText := '%nome_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%rg_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_CGC_CPF.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroCOD_ESTADO.value;
    Doc.Content.Find.Execute(FindText := '%uf_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := FormatFloat('#,##0.00',
      DMContasReceber.QContasReceber_cabVAL_TITULO.value);
    Doc.Content.Find.Execute(FindText := '%valor_titulo', ReplaceWith := campo,
      Replace := 2);
    campo := Bib.extenso(DMContasReceber.QContasReceber_cabVAL_TITULO.value,
      'REAL');
    Doc.Content.Find.Execute(FindText := '%extenso', ReplaceWith := campo,
      Replace := 2);
    campo := FormatFloat('#,##0.00', DMFinalidade.QFinalidadePERC_TAXA.value);
    Doc.Content.Find.Execute(FindText := '%taxa_juro', ReplaceWith := campo,
      Replace := 2);
    campo := DateToStr(DMContasReceber.QContasReceber_cabDT_EMISSAO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_emissao', ReplaceWith := campo,
      Replace := 2);
    campo := DateToStr(DMContasReceber.QContasReceber_cabDT_VENCIMENTO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_vencimento', ReplaceWith := campo,
      Replace := 2);

    // Grava documento
    Doc.SaveAs(Path + 'ContratoContasReceber1.Doc');
    // Imprime
    //Doc.PrintOut(false);
    // Fecha o Word
//      WinWord.Quit;
  end
  else
    MessageDlg('Primeiro selecione uma Conta para IMPRESSÃO', mtInformation,
      [mbOk], 0);

end;

procedure TFContasReceberCad.ArquivoRemessaCNAB2401Click(Sender: TObject);
var
  mNUM_CEDENTE: string; // 2a Edition by Robson.
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x, iSeq: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  s, wVal: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  iQtdRegLote: integer;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[24].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    S := '';
    with DMContasReceber do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME24CodFilial.text), 'CONTAS A RECEBER');
      QRemessa.Close;

      if Trim(FContasReceberParam.ME24CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME24CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME24CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME24CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME24DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME24DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME24DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME24DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me24NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me24NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if not QRemessa.Eof then
      begin
        try
          {-------HEADER DO ARQUIVO - REGISTRO 0-------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0000'; {004-007|04|LOTE DE SERVICO}
          s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
          s := s + '        '; {009-016|08|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {017-017|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
          s := s + wVal; {018-032|15|N DE INSCRICAO DA EMPRESA}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
          s := s + wVal; {033-036|04|AGENCIA MANTENEDORA DA CONTA}

          wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
          s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            9)), 9);
          s := s + wVal; {038-046|09|NUMERO DA CONTA CORRENTE}

          wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1, 1);
          s := s + wVal; {047-047|01|DIGITO VERIFICADOR DA CONTA}

          s := s + '                         ';
          {048-072|25|PARA USO RESERVADO DO BANCO}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {073-102|30|NOME DA EMPRESA}

          wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
            '                              ', 1, 30);
          s := s + wVal; {103-132|30|NOME DO BANCO}

          s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

          s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
            '');
          s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

          s := s + '      '; {152-157|06|PARA USO RESERVADO DO BANCO}

          if QRemessaCOD_BANCO.Text = '347' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SUDAMERIS')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '353' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SANTANDER')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end;

          s := s + '040'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

          s := s + '                    ';
          {167-240|74|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {167-240|74|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {167-240|74|PARA USO RESERVADO DO BANCO}
          s := s + '              '; {167-240|74|PARA USO RESERVADO DO BANCO}

          {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

          {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
          s := s + #13#10; {QUEBRA DE LINHA}

          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
          s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
          s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
          s := s + '01'; {010-011|02|TIPO DE SERVICO}
          s := s + '  '; {012-013|02|USO DO BANCO}

          if QRemessaCOD_BANCO.Text = '347' then
            s := s + '040' {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          else
            s := s + '030'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
          s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

          s := s + '                    '; {--034-053|20|USO DO BANCO---}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
          s := s + wVal; {054-057|04|AGENCIA MANTENEDORA DA CONTA}

          wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
          s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            9)), 9);
          s := s + wVal; {059-067|09|NUMERO DA CONTA CORRENTE}

          wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1, 1);
          s := s + wVal; {068-068|01|DIGITO VERIFICADOR DA CONTA}

          s := s + '     '; {069-073|05|USO DO BANCO---}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {074-103|30|NOME DA EMPRESA}

          wVal := '                                        ';
          s := s + wVal; {104-143|40|MENSAGEM 1}

          wVal := '                                        ';
          s := s + wVal; {144-183|40|MENSAGEM 2}

          if QRemessaCOD_BANCO.Text = '347' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SUDAMERIS')), 8);
            s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
          end
          else if QRemessaCOD_BANCO.Text = '353' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SANTANDER')), 8);
            s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
          end;

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
            '');
          s := s + wVal; {192-199|08|DATA DE GRAVACAO REMESSA/RETORNO}

          wVal := '                                         ';
          s := s + wVal; {200-240|41|USO DO BANCO}
          {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

          iSeq := 1;
          iQtdRegLote := 2; //2--> header e trailer
          while not QRemessa.Eof do
          begin
            s := s + #13#10;
            {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
            s := s + wVal; {018-021|04|AGENCIA MANTENEDORA DA CONTA}

            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
            s := s + wVal; {022-022|01|DIGITO VERIFICADOR DA AGENCIA}

            wVal :=
              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
              9)), 9);
            s := s + wVal; {023-031|09|NUMERO DA CONTA CORRENTE}

            wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1,
              1);
            s := s + wVal; {032-032|01|DIGITO VERIFICADOR DA CONTA}

            wVal :=
              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10)), 10);
            s := s + wVal; {033-041|09|NUMERO DA CONTA CORRENTE}
            {042-042|01|DIGITO VERIFICADOR DA CONTA}

// wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text+'0',1,1);
// s := s + wVal;       {042-042|01|DIGITO VERIFICADOR DA CONTA}

            s := s + '  '; {043-044|02|USO DO BANCO}

            wVal := RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 13);
            s := s + wVal; {045-057|13|NOSSO NUMERO}

            s := s + '3'; {058-058|01|TIPO DE COBRANÇA}

            wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
            s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

            wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text + '0', 1, 1);
            s := s + wVal;
            {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

            s := s + '  '; {061-062|02|USO DO BANCO}

            wVal := copy(QRemessaNUM_TITULO.Text + '000000000000000', 1, 15);
            s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

            wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
            s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
            s := s + wVal; {101-104|04|AGENCIA MANTENEDORA DA CONTA}

            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
            s := s + wVal; {105-105|01|DIGITO VERIFICADOR DA AGENCIA}

            s := s + ' '; {106-106|01|USO DO BANCO}

            s := s + '02'; {107-108|02|ESPECIE DO TITULO}

            wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
            s := s + wVal;
            {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

            wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
              copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              copy(QRemessaDT_EMISSAO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

            s := s + '2'; {118-118|01|CODIGO DE JUROS DE MORA}

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

            wVal := StrZero(QRemessaPERC_JURO_BLOQUETO.Value, 15, 2);
            s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

            s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
            s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
            s := s + '000000000000000';
            {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
            s := s + '000000000000000';
            {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
            s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

            wVal := RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 6);
            s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
            s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
            s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
            s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
            s := s + '0000'; {217-220|4|USO DA CEMAPA}

            wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1);
            s := s + wVal;
            {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}

            wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
            s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

            s := s + '2';
            {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

            s := s + '000';
            {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
            s := s + '00'; {228-229|02|CODIGO DA MOEDA (REAL)}

            s := s + '           '; {230-240|11|USO EXCLUSIVO DO BANCO}

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            s := s + #13#10; {QUEBRA DE LINHA}
            {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';

            s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {019-033|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {034-073|40|NOME}

            wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
              '                                        ', 1, 40);
            s := s + wVal; {074-113|40|ENDERECO}

            wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
            s := s + wVal; {114-128|15|BAIRRO}

            wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              '     ', 1, 8);
            s := s + wVal; {129-136|08|CEP}

            // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
            // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

            wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
              1, 15);
            s := s + wVal; {137-151|15|CIDADE}

            wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
            s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';
            s := s + wVal; {154-154|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {155-169|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

            s := s + '000'; {210-212|03|IDENTIFICADOR DE CARNE}

            s := s + '000';
            {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}

            s := s + '000'; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}

            s := s + '000'; {219-221|03|NUMERO DO PLANO}

            s := s + '                   '; {222-240|19|USO DO BANCO}

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end;

          QRemessa.First;

          s := s + #13#10;
          {------------TRAILER DE LOTE--------------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {LOTE DE SERVICO}
          s := s + '5'; {REGISTRO TRAILER DE LOTE}
          s := s + '         '; {USO EXCLUSIVO DO BANCO}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
          s := s + wVal; {QUANTIDADE DE REGISTROS DO LOTE}

          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------FIM - TRAILER DE LOTE--------------------}

          s := s + #13#10; {QUEBRA DE LINHA}
          {------------TRAILER DE ARQUIVO-----------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}

          s := s + '9999'; {LOTE DE SERVICO}
          s := s + '9'; {REGISTRO TRAILER DE ARQUIVO}
          s := s + '         '; {USO EXCLUSIVO FEBRABAN}
          s := s + '000001'; {QUANTID. DE LOTES DO ARQUIV}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
          s := s + wVal; {QTDADE DE REGISTROS DO ARQUIV}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '           '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------TRAILER DE ARQUIVO-----------------}

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA CNAB240 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end;
        except
          MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
        end;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.HistricoContrato1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[25].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then

    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.MEContrato.Text) = '' then
        raise exception.create('É necessário escolher um Contrato');

      QRHistoricoContrato.Close;
      QRHistoricoContrato.setVariable('COD_OBRA_CONTRATO',
        Trim(FContasReceberParam.MEContrato.Text));
      QRHistoricoContrato.open;

      if FRHistoricoContrato = nil then
        FRHistoricoContrato := TFRHistoricoContrato.Create(Application);

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRHistoricoContrato.QRPrimario.Preview
      else
        FRHistoricoContrato.QRPrimario.Print;
    end;
end;

procedure TFContasReceberCad.RelDescontoCheque1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME17CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber_Rel do
    begin
      QRRemessaDesconto.Close;
      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
        QRRemessaDesconto.SetVariable('COD_FILIAL',
          FContasReceberParam.ME17CodFilial.text)
      else
        raise exception.Create('Código da Filial não pode ficar em branco');
      if Trim(FContasReceberParam.Me17NrTitulo.text) <> '' then
        QRRemessaDesconto.SetVariable('NUM_TITULO',
          FContasReceberParam.Me17NrTitulo.text)
      else
        QRRemessaDesconto.SetVariable('NUM_TITULO', Null);
      if Trim(FContasReceberParam.ME17CodContaCorrente.text) <> '' then
        QRRemessaDesconto.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME17CodContaCorrente.text)
      else
        raise
          exception.Create('Código da Conta Corrente não pode ficar em branco');
      if Trim(FContasReceberParam.ME17DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRRemessaDesconto.SetVariable('DT_INICIAL',
        FContasReceberParam.ME17DtInicial.text);
      if Trim(FContasReceberParam.ME17DtFinal.text) <> '' then
        QRRemessaDesconto.SetVariable('DT_FINAL',
          FContasReceberParam.ME17DtFinal.text)
      else
        raise exception.Create('Data Final não pode ficar em branco');

      if FContasReceberParam.RG17Ordem.ItemIndex = 0 then
        QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO '
      else
        QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.NUM_TITULO  ';

      QRRemessaDesconto.Open;
      if FRRemessasDesconto = nil then
        FRRemessasDesconto := TFRRemessasDesconto.create(Application);
      FRRemessasDesconto.QRLTitulo.Caption := FContasReceberParam.Me17Titulo.Text
        + FContasReceberParam.ME17DtInicial.text + ' até ' +
        FContasReceberParam.ME17DtFinal.text;
      FRRemessasDesconto.QRLEmpresa.Caption := 'Filial: ' +
        FContasReceberParam.ME17Filial.text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRRemessasDesconto.QRPrimario.Preview
      else
        FRRemessasDesconto.QRPrimario.Print;
      QRRemessaDesconto.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ClculodeDesconto1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[26].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin

    if trim(FContasReceberParam.ME26Cadastro.Text) = '' then
      raise Exception.Create('Informe o cadastro.');

    if trim(FContasReceberParam.ME26PercDescAntecipacao.Text) = '' then
      raise Exception.Create('Informe o percentual de Antecipação.');

    if trim(FContasReceberParam.ME26PercDescPontualidade.Text) = '' then
      raise Exception.Create('Informe o percentual de Pontualidade.');

    if trim(FContasReceberParam.ME26DtVencimentoInicio.Text) = '' then
      raise Exception.Create('Informe a data de vencimento inicial.');

    if trim(FContasReceberParam.ME26DtVencimentoFim.Text) = '' then
      raise Exception.Create('Informe a data de vencimento final.');

    if trim(FContasReceberParam.ME26DtPagamento.Text) = '' then
      raise Exception.Create('Informe a data de pagamento.');

    with DMContasReceber_Rel do
    begin
      QRCalculoDesconto.Close;

      QRCalculoDesconto.SetVariable('COD_CADASTRO',
        strtoint(trim(FContasReceberParam.ME26Cadastro.Text)));
      QRCalculoDesconto.SetVariable('PERC_ANTECIPACAO_MES',
        StrToFloat(trim(FContasReceberParam.ME26PercDescAntecipacao.Text)));
      QRCalculoDesconto.SetVariable('PERC_PONTUALIDADE',
        StrToFloat(trim(FContasReceberParam.ME26PercDescPontualidade.Text)));
      QRCalculoDesconto.SetVariable('DT_VENCIMENTO_INI',
        StrToDate(trim(FContasReceberParam.ME26DtVencimentoInicio.Text)));
      QRCalculoDesconto.SetVariable('DT_VENCIMENTO_FIM',
        StrToDate(trim(FContasReceberParam.ME26DtVencimentoFim.Text)));
      QRCalculoDesconto.SetVariable('DT_PAGAMENTO',
        StrToDate(trim(FContasReceberParam.ME26DtPagamento.Text)));
      if trim(FContasReceberParam.FM26Departamento.MeDepartamento.Text) = '' then
        QRCalculoDesconto.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QRCalculoDesconto.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.FM26Departamento.MeDepartamento.Text));

      QRCalculoDesconto.Open;
      if FRCalculoDesconto = nil then
        FRCalculoDesconto := TFRCalculoDesconto.create(Application);

      FRCalculoDesconto.QRLCliente.Caption :=
        FContasReceberParam.Ed26Cadastro.Text;
      FRCalculoDesconto.QRLDtPagamento.Caption :=
        trim(FContasReceberParam.ME26DtPagamento.Text);
      FRCalculoDesconto.QRLVencimentoIni.Caption :=
        trim(FContasReceberParam.ME26DtVencimentoInicio.Text);
      FRCalculoDesconto.QRLVencimentoFim.Caption :=
        trim(FContasReceberParam.ME26DtVencimentoFim.Text);
      FRCalculoDesconto.QRLDescAntecipacao.Caption := FormatFloat('#,##0.00%',
        StrToFloat(trim(FContasReceberParam.ME26PercDescAntecipacao.Text)));
      FRCalculoDesconto.QRLDescPontualidade.Caption := FormatFloat('#,##0.00%',
        StrToFloat(trim(FContasReceberParam.ME26PercDescPontualidade.Text)));

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCalculoDesconto.QRPrimario.Preview
      else
        FRCalculoDesconto.QRPrimario.Print;
      QRRemessaDesconto.Close;
    end;
  end;
end;

procedure TFContasReceberCad.RemessaV0801Click(
  Sender: TObject);
var
  mNUM_CEDENTE: string; // 2a Edition by Robson.
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x, iSeq: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  s, wVal: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  iQtdRegLote: integer;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[24].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    S := '';
    with DMContasReceber do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME24CodFilial.text), 'CONTAS A RECEBER');
      QRemessa.Close;

      if Trim(FContasReceberParam.ME24CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME24CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME24CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME24CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME24DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME24DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME24DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME24DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me24NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me24NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if not QRemessa.Eof then
      begin

        try
          {-------HEADER DO ARQUIVO - REGISTRO 0-------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0000'; {004-007|04|LOTE DE SERVICO}
          s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14);
          s := s + wVal; {019-032|14|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
          begin
            wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 16);
            s := s + wVal; {033-048|16|N DE INSCRICAO DA EMPRESA}

            s := s + '    '; {049-052|04|uso exclusivo caixa}
          end
          else
          begin
            wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 20);
            s := s + wVal; {033-052|20|N DE INSCRICAO DA EMPRESA}
          end;

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {053-057|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1);
          s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {059-070|12|NUMERO DA CONTA CORRENTE}

          wVal := RMaskCGC_CPF(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1);
          s := s + wVal; {071-071|01|DIGITO VERIFICADOR DA CONTA}

          if QRemessaCOD_BANCO.Text = '748' then
            wVal := ' '
          else
            wVal := RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_CEDENTE.Text, 1);
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {073-102|30|NOME DA EMPRESA}

          wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
            '                              ', 1, 30);
          s := s + wVal; {103-132|30|NOME DO BANCO}

          s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

          s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
            '');
          s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''HH24MISS'') FROM DUAL',
            '');
          s := s + wVal; {152-157|06|DATA DE GERACAO DO ARQUIVO}

          if QRemessaCOD_BANCO.Text = '422' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SAFRA')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '748' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SICREDI-V240')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '104' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_CEF')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_UNIBANCO')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end;

          if QRemessaCOD_BANCO.Text = '104' then
            s := s + '030' {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}
            //versao caixa
          else
            s := s + '080'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

          s := s + '00000'; {167-171|05|DENSIDADE DA GRAVAÇÃO DO ARQUIVO}

          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '         '; {172-240|69|PARA USO RESERVADO DO BANCO}

          {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

          {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
          s := s + #13#10; {QUEBRA DE LINHA}

          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
          s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
          s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
          s := s + '01'; {010-011|02|TIPO DE SERVICO}

          if QRemessaCOD_BANCO.Text = '104' then
          begin
            s := s + '00'; {012-013|02|USO DO BANCO} //VERSAO CAIXA
            s := s + '020'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          end
          else
          begin
            s := s + '  '; {012-013|02|USO DO BANCO}
            s := s + '040'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          end;
          s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
          s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
          begin
            wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 16);
            s := s + wVal; {034-049|16|N DE INSCRICAO DA EMPRESA}

            s := s + '    '; {050-053|04|uso exclusivo caixa}
          end
          else
          begin
            wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 20);
            s := s + wVal; {034-053|20|N DE INSCRICAO DA EMPRESA}
          end;

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {054-058|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
          s := s + wVal; {059-059|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {060-071|12|NUMERO DA CONTA CORRENTE}

          wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1, 1);
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA}

          wVal := RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_CEDENTE.Text, 1);
          s := s + wVal; {073-073|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {074-103|30|NOME DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
          begin
            wVal := '                                        ' +
              '                                        ' +
              '000000000000000000000000                ' +
              '                 ';
            s := s + wVal; {104-240|137|USO DO BANCO}
          end
          else
          begin
            wVal := '                                        ' +
              '                                        ' +
              '                                        ' +
              '                 ';
            s := s + wVal; {104-240|137|USO DO BANCO}
          end;
          {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

          iSeq := 1;
          iQtdRegLote := 2; //2--> header e trailer
          while not QRemessa.Eof do
          begin
            s := s + #13#10;
            {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
            s := s + wVal; {018-022|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
            s := s + wVal; {023-023|01|DIGITO VERIFICADOR DA AGENCIA}

            wVal :=
              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
              12)), 12);
            s := s + wVal; {024-035|12|NUMERO DA CONTA CORRENTE}

            wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1,
              1);
            s := s + wVal; {036-036|01|DIGITO VERIFICADOR DA CONTA}

            wVal := ' ';
            s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA CONTA}

            if QRemessaCOD_BANCO.Text = '104' then
            begin
              s := s + '         ';
              wVal := copy(QRemessaCOD_NOSSO_NUMERO.Text + '00000000000', 1,
                11);
              s := s + wVal; {038-057|20|NOSSO NUMERO}
            end
            else
            begin
              wVal := copy(QRemessaCOD_NOSSO_NUMERO.Text +
                '00000000000000000000', 1, 20);
              s := s + wVal; {038-057|20|NOSSO NUMERO}
            end;

            s := s + '1'; {058-058|01|TIPO DE COBRANÇA}

            wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
            s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

            wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text, 1, 1);
            s := s + wVal;
            {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

            wVal := copy(QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text + '0', 1, 1);
            s := s + wVal; {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}

            wVal := copy(QRemessaCOD_IDENTIF_DISTRIBUICAO.Text + ' ', 1, 1);
            s := s + wVal; {062-062|01|IDENTIFICAÇÃO DA DISTRIBUIÇÃO)}

            if QRemessaCOD_BANCO.Text = '104' then
            begin
              wVal := copy(QRemessaNUM_TITULO.Text + '00000000000', 1, 11);
              s := s + wVal; {063-073|15|NUMERO DO DOCUMENTO DE COBRANCA}
              S := s + '    ';
            end
            else
            begin
              wVal := copy(QRemessaNUM_TITULO.Text + '000000000000000', 1, 15);
              s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}
            end;

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

            wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
            s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
            s := s + wVal; {101-105|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
            s := s + wVal; {106-106|01|DIGITO VERIFICADOR DA AGENCIA}

            s := s + '02'; {107-108|02|ESPECIE DO TITULO}

            wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
            s := s + wVal;
            {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

            wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
              copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              copy(QRemessaDT_EMISSAO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

            s := s + '2'; {118-118|01|CODIGO DE JUROS DE MORA}

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

            if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              //alterado Marcos 15/05/06
              wVal := IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                (QRemessaVal_Titulo.Value / 100)), 15, 2)
            else
              wVal := StrZero(QRemessaPERC_TAXA.Value, 15, 2);

            s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

            s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
            s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
            s := s + '000000000000000';
            {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
            s := s + '000000000000000';
            {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
            s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

            wVal := copy('000000' + QRemessaCOD_FILIAL.Text, 1, 6);
            s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
            s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
            s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
            s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
            s := s + '0000'; {217-220|4|USO DA CEMAPA}

            wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1);
            s := s + wVal;
            {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}

            wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
            s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

            s := s + '2';
            {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

            s := s + '000';
            {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
            s := s + '09'; {228-229|02|CODIGO DA MOEDA (REAL)}

            s := s + '           '; {230-240|11|USO EXCLUSIVO DO BANCO}

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            s := s + #13#10; {QUEBRA DE LINHA}
            {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';

            s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {019-033|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {034-073|40|NOME}

            wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
              '                                        ', 1, 40);
            s := s + wVal; {074-113|40|ENDERECO}

            wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
            s := s + wVal; {114-128|15|BAIRRO}

            wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              '     ', 1, 8);
            s := s + wVal; {129-136|08|CEP}

            // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
            // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

            wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
              1, 15);
            s := s + wVal; {137-151|15|CIDADE}

            wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
            s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';
            s := s + wVal; {154-154|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {155-169|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

            if QRemessaCOD_BANCO.Text = '104' then
            begin
              s := s + '            '; {210-221|012|CAIXA ECONOMICA}
              s := s + '                   '; {222-240|19|CAIXA ECONOMICA}
            end
            else
            begin
              s := s + '000'; {210-212|03|IDENTIFICADOR DE CARNE}
              s := s + '   ';
              {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}
              s := s + '   '; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}
              s := s + '   '; {219-221|03|NUMERO DO PLANO}
              s := s + '                   '; {222-240|19|USO DO BANCO}
            end;

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end;

          QRemessa.First;

          s := s + #13#10;
          {------------TRAILER DE LOTE--------------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVICO}
          s := s + '5'; {008-008|01|REGISTRO TRAILER DE LOTE}
          s := s + '         '; {009-017|09|USO EXCLUSIVO DO BANCO}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
          s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}

          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------FIM - TRAILER DE LOTE--------------------}

          s := s + #13#10; {QUEBRA DE LINHA}
          {------------TRAILER DE ARQUIVO-----------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}

          s := s + '9999'; {004-007|04|LOTE DE SERVICO}
          s := s + '9'; {008-008|01|REGISTRO TRAILER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN}
          s := s + '000001'; {018-023|06|QUANTID. DE LOTES DO ARQUIV}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
          s := s + wVal; {024-029|06|QTDADE DE REGISTROS DO ARQUIV}
          s := s + '000000'; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '     '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------TRAILER DE ARQUIVO-----------------}

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA CNAB240 VERSÃO 080 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end;
        except
          MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
        end;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.CpiadeBloqueto1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[17].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if Trim(FContasReceberParam.ME19CodContaCorrente.Text) = '' then
      raise Exception.Create('Informe o Código da Conta Corrente');
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME19CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      Monta_Sql_Bloqueto_Copia; //VAI MONTAR SQL ESTA NO DATA MODULO CONTAS RECEBER

      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
        Trim(FContasReceberParam.ME19CodContaCorrente.Text));
      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
        Trim(FContasReceberParam.ME19CodBanco.Text));

      if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
          Trim(FContasReceberParam.ME19CodNota.Text));
      if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
          Trim(FContasReceberParam.ME19CodNotaF.Text));
      if Trim(FContasReceberParam.ME19CodContaReceberCab.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = '
          + Trim(FContasReceberParam.ME19CodContaReceberCab.Text));
      if Trim(FContasReceberParam.ME19CodBanco.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.ME19CodBanco.Text));
      if Trim(FContasReceberParam.ME19CodFilial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME19CodFilial.Text));
      if Trim(FContasReceberParam.ME19Inicial.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
          chr(39) + Trim(FContasReceberParam.ME19Inicial.Text) + chr(39));
      if Trim(FContasReceberParam.ME19Final.Text) <> '' then
        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
          chr(39) + Trim(FContasReceberParam.ME19Final.Text) + chr(39));
      QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');
      if FContasReceberParam.Rg19Vencimento.ItemIndex = 0 then
        DmContasReceber.pVencimentoBloqueto := 'S'
      else
        DmContasReceber.pVencimentoBloqueto := 'N';
      Chama_Emissao_Bloqueto; // VAI IMPRIMIR O BLOQUETO ESTÁ NO DATA MODULO CONTAS A RECEBER
    end;
  end;
end;

procedure TFContasReceberCad.ArquivoRetornoCNAB2401Click(Sender: TObject);
var
  wCont, wNum_Baixa, wNN: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  inherited;
  wVal_Baixa := 0;
  wVal_Juro := 0;
  wVal_Desc := 0;
  wPgto_Juro := 0;
  wNum_Baixa := 0;
  wNN := 0;
  // RETORNO CNAB240 SANTANDER
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    // Abre arquivo de retorno
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 8, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 103, 15) <> 'BANCO SANTANDER' then
        raise exception.Create('Nome do banco invalido!');
      if Copy(Trim(S), 143, 1) <> '2' then
        raise exception.Create('Não é um arquivo de RETORNO!!');

      {Acima está sendo verificado se o registro HEADER é
       realmente um arquivo de retorno-SANTANDER}

      Readln(F, S); //Le a proxima linha do arquivo
      while (Trim(S) <> '') do // Arquivo contém registro para processar.
      begin
        // Condições possiveis para executar baixa do titulo.
        if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'T')) then
          //identificacao de registro transacao
        begin
          if StrToInt(Copy(Trim(S), 16, 2)) in [06, 09, 17] then
            // ???? Ver tabela explicativa NOTA 17
          begin
            wNN := StrToInt(Copy(S, 41, 13));
            wVal_Baixa := 0;
            wNNumero := Copy(S, 41, 13);
            // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
            wNum_Titulo := Trim(copy(S, 116, 6));
            // Verifica se valor para baixar é diferente de zero.
            if StrToFloat(Copy(S, 78, 15)) <> 0 then
              // Valor recebido + valor despesa de cobranca
              wVal_Baixa := (StrToFloat(Copy(S, 78, 15)) / 100) +
                (StrToFloat(Copy(S, 194, 15)) / 100)
            else
              Showmessage('Titulo do NN ' + IntToStr(wNN) +
                ' com valor p/baixar igual a zero!');

            Readln(F, S); //Le a proxima linha do arquivo
            if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'U')) then //identificacao de registro transacao
            begin
              wVal_Juro := 0;
              wVal_Desc := 0;
              wVal_Baixa := 0;
              wpgto_juro := 0;

              wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' +
                Copy(S, 142, 04);
              wDtCredito := Copy(S, 146, 02) + '/' + Copy(S, 148, 02) + '/' +
                Copy(S, 150, 04);

              //Verifica se valor recebido é diferente de zero.
              if StrToFloat(Copy(S, 78, 15)) <> 0 then // Valor pago pelo sacado
                wVal_Baixa := (StrToFloat(Copy(S, 78, 15)) / 100)
              else
                Showmessage('Titulo do NN ' + IntToStr(wNN) +
                  ' com valor p/baixar igual a zero!');

              if StrToFloat(Copy(S, 18, 15)) <> 0 then
                // Juros de mora/multa/encargos
              begin
                wVal_Juro := StrToFloat(Copy(S, 18, 15)) / 100;
                wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100;
              end;

              if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
                wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                  StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento
            end;
            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
              wNNumero, wDtLiquida, wDtCredito);
            // Chama procedimento para baixa de titulo.
            inc(wNum_Baixa);
          end;

        end;

        // Erros
        if Copy(Trim(S), 16, 2) = '03' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroSantander(Copy(Trim(S), 209, 2));
          wstrErro2 := RetornaErroSantander(Copy(Trim(S), 211, 2));
          wstrErro3 := RetornaErroSantander(Copy(Trim(S), 213, 2));
          wstrErro4 := RetornaErroSantander(Copy(Trim(S), 215, 2));
          wstrErro5 := RetornaErroSantander(Copy(Trim(S), 217, 2));
          ReadLn(F, S); // Pula para proximo registro no arquivo texto.
        end;

        if Copy(Trim(S), 16, 2) = '26' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroSantander(Copy(Trim(S), 209, 2));
          wstrErro2 := RetornaErroSantander(Copy(Trim(S), 211, 2));
          wstrErro3 := RetornaErroSantander(Copy(Trim(S), 213, 2));
          wstrErro4 := RetornaErroSantander(Copy(Trim(S), 215, 2));
          wstrErro5 := RetornaErroSantander(Copy(Trim(S), 217, 2));
          ReadLn(F, S); // Pula para proximo registro no arquivo texto.
        end;

        if Copy(Trim(S), 16, 2) = '30' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroSantander(Copy(Trim(S), 209, 2));
          wstrErro2 := RetornaErroSantander(Copy(Trim(S), 211, 2));
          wstrErro3 := RetornaErroSantander(Copy(Trim(S), 213, 2));
          wstrErro4 := RetornaErroSantander(Copy(Trim(S), 215, 2));
          wstrErro5 := RetornaErroSantander(Copy(Trim(S), 217, 2));
          ReadLn(F, S); // Pula para proximo registro no arquivo texto.
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

        if wCont = 1 then
        begin
          Imp.WriteXY(4.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - SANTANDER  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(0, wCont,
            'Titulo     Num. Registro    Cod.Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(0, wCont,
            '--------------------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        if wstrErro1 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 55, 15) + '    ' + Copy(S, 41, 13) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 209, 2) +
            '       ' + wstrErro1);
          Inc(WCont);
        end;
        if wstrErro2 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 55, 15) + '    ' + Copy(S, 41, 13) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 211, 2) +
            '       ' + wstrErro2);
          Inc(WCont);
        end;
        if wstrErro3 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 55, 15) + '    ' + Copy(S, 41, 13) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 213, 2) +
            '       ' + wstrErro3);
          Inc(WCont);
        end;
        if wstrErro4 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 55, 15) + '    ' + Copy(S, 41, 13) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 215, 2) +
            '       ' + wstrErro4);
          Inc(WCont);
        end;
        if wstrErro5 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 55, 15) + '    ' + Copy(S, 41, 13) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 217, 2) +
            '       ' + wstrErro5);
          Inc(WCont);
        end;

        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end;
      ShowMessage('Baixado ' + IntToStr(wNum_Baixa) + ' Títulos');
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
  //End; // Fim do modalresutl
end;

function TFContasReceberCad.RetornaErroSantander(wStrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de movimento inválido';
    06: wstrS := 'Tipo/número de inscrição do cedente inválidos';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Duplicado';
    10: wstrS := 'Carteira Inválida';
    11: wstrS := 'Forma de cadastramento do titulo inválida';
    12: wstrS := 'Tipo de documento inválido';
    13: wstrS := 'Identificação da emissão do bloqueto Inválida';
    14: wstrS := 'Identificação da distribuição do bloqueto Inválida';
    15: wstrS := 'Características da cobrança imcompatíveis';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    19: wstrS :=
      'Título a cargo de bancos correspondentes com vencimento inferior a XX dias';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie não permitida para a carteira';
    23: wstrS := 'aceite inválido';
    24: wstrS := 'Data de emissão Inválida';
    25: wstrS := 'Data de emissão posterior a data de entrada';
    26: wstrS := 'Código de juros de mora inválido';
    27: wstrS := 'Valor/taxa de juros de mora inválido';
    28: wstrS := 'Código de desconto Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    32: wstrS := 'Valor do IOF';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    35: wstrS := 'Abatimento a conceder não confere';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    37: wstrS := 'Código para protesto inválido';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução inválido';
    43: wstrS := 'Prazo para baixa/devolução inválido';
    44: wstrS := 'Código de moeda inválido';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    49: wstrS := 'CEP sem praça de cobrança(não localizado)';
    50: wstrS := 'CEP irregular referente a um Banco Correspondente';
    51: wstrS := 'CEP incompatível com a unidade de federação';
    52: wstrS := 'Unidade de federação inválida';
    53: wstrS := 'Tipo/número de inscrição do sacador/avalista inválidos';
    54: wstrS := 'Sacador/avalista não informado';
    55: wstrS := 'Nosso Número no banco correspondente não informado';
    56: wstrS := 'Código do banco correspondente não informado';
    57: wstrS := 'Código da Multa inválido';
    58: wstrS := 'Data da multa inválida';
    59: wstrS := 'Valor/Percentual da multa inválido';
    60: wstrS := 'Movimento para Título não cadastrado';
    61: wstrS := 'Alteração de agência cobradora/dv inválida';
    62: wstrS := 'Tipo de impressão inválido';
    63: wstrS := 'Entrada para Título já cadastrado';
    64: wstrS := 'Número da linha inválido';
  end;
  Result := (wstrS);
end;

procedure TFContasReceberCad.RetornoV0801Click(
  Sender: TObject);
var
  wCont: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  wVal_Baixa := 0;
  wVal_Desc := 0;
  wPgto_Juro := 0;
  wVal_Juro := 0;
  inherited; // RETORNO CNAB240 SANTANDER
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    // Abre arquivo de retorno ITAU
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 8, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 143, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo invalida!');
      //if Copy(Trim(S),3,7) <> 'RETORNO' then  // Verifica se realmente é um arquivo de retorno.
        //raise exception.Create('Não é um arquivo de RETORNO!');
      //if Copy(Trim(S),12,15) <> 'COBRANCA       ' then
        //raise exception.Create('Não é um arquivo de COBRANÇA!');
      if Copy(Trim(S), 103, 14) <> 'BANCO UNIBANCO' then
        raise exception.Create('Nome do banco invalido!');

      {Acima está sendo verificado se o registro HEADER é
       realmente um arquivo de retorno-SANTANDER}

      Readln(F, S); //Le a proxima linha do arquivo
      while (Trim(S) <> '') do // Arquivo contém registro para processar.
      begin
        // Condições possiveis para executar baixa do titulo.
        if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'T')) then
          //identificacao de registro transacao
        begin
          if StrToInt(Copy(Trim(S), 16, 2)) in [06, 09, 17] then
            // ???? Ver tabela explicativa NOTA 17
          begin
            wVal_Baixa := 0;
            wNNumero := Copy(S, 38, 20);
            // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
          // Verifica se valor para baixar é diferente de zero.
            if StrToFloat(Copy(S, 82, 15)) <> 0 then
              // Valor recebido + valor despesa de cobranca
              wVal_Baixa := (StrToFloat(Copy(S, 82, 15)) / 100) +
                (StrToFloat(Copy(S, 199, 15)) / 100)
            else
              raise exception.Create('Titulo com valor p/baixar igual a zero!');

            Readln(F, S); //Le a proxima linha do arquivo
            if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'U')) then //identificacao de registro transacao
            begin
              wVal_Juro := 0;
              wVal_Desc := 0;
              wVal_Baixa := 0;
              wpgto_juro := 0;
              wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' +
                Copy(S, 142, 04);
              wDtCredito := Copy(S, 146, 02) + '/' + Copy(S, 148, 02) + '/' +
                Copy(S, 150, 04);

              //Verifica se valor recebido é diferente de zero.
              if StrToFloat(Copy(S, 78, 15)) <> 0 then // Valor pago pelo sacado
                wVal_Baixa := (StrToFloat(Copy(S, 78, 15)) / 100)
              else
                raise
                  exception.Create('Titulo com valor p/baixar igual a zero!');

              if StrToFloat(Copy(S, 18, 15)) <> 0 then
                // Juros de mora/multa/encargos
              begin
                wVal_Juro := StrToFloat(Copy(S, 18, 15)) / 100;
                wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100;
              end;

              if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
                wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                  StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento
            end;
          end;
          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
          // Chama procedimento para baixa de titulo.
        end;

        // Erros

        if Copy(Trim(S), 16, 2) = '02' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
        end;

        if Copy(Trim(S), 16, 2) = '03' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
        end;

        if Copy(Trim(S), 16, 2) = '26' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
        end;

        if Copy(Trim(S), 16, 2) = '30' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

        if wCont = 1 then
        begin
          Imp.WriteXY(4.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - SANTANDER  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(0, wCont,
            'Titulo     Num. Registro    Cod.Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(0, wCont,
            '--------------------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        if wstrErro1 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 214, 2) +
            '       ' + wstrErro1);
          Inc(WCont);
        end;
        if wstrErro2 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 216, 2) +
            '       ' + wstrErro2);
          Inc(WCont);
        end;
        if wstrErro3 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 218, 2) +
            '       ' + wstrErro3);
          Inc(WCont);
        end;
        if wstrErro4 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 220, 2) +
            '       ' + wstrErro4);
          Inc(WCont);
        end;
        if wstrErro5 <> '' then
        begin
          Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
            '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 222, 2) +
            '       ' + wstrErro5);
          Inc(WCont);
        end;

        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
  //End; // Fim do modalresutl
end;

function TFContasReceberCad.RetornaErroUnibanco(wStrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de movimento inválido';
    06: wstrS := 'Tipo/número de inscrição do cedente inválidos';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Duplicado';
    10: wstrS := 'Carteira Inválida';
    11: wstrS := 'Forma de cadastramento do titulo inválida';
    12: wstrS := 'Tipo de documento inválido';
    13: wstrS := 'Identificação da emissão do bloqueto Inválida';
    14: wstrS := 'Identificação da distribuição do bloqueto Inválida';
    15: wstrS := 'Características da cobrança imcompatíveis';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    19: wstrS :=
      'Título a cargo de bancos correspondentes com vencimento inferior a XX dias';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie do Título não permitida para a carteira';
    23: wstrS := 'aceite inválido';
    24: wstrS := 'Data de emissão Inválida';
    25: wstrS := 'Data de emissão posterior a data de entrada';
    26: wstrS := 'Código de juros de mora inválido';
    27: wstrS := 'Valor/taxa de juros de mora inválido';
    28: wstrS := 'Código de desconto Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    32: wstrS := 'Valor do IOF inválido';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    35: wstrS := 'Abatimento a conceder não confere';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    37: wstrS := 'Código para protesto inválido';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução inválido';
    43: wstrS := 'Prazo para baixa/devolução inválido';
    44: wstrS := 'Código de moeda inválido';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    49: wstrS := 'CEP sem praça de cobrança(não localizado)';
    50: wstrS := 'CEP irregular referente a um Banco Correspondente';
    51: wstrS := 'CEP incompatível com a unidade de federação';
    52: wstrS := 'Unidade de federação inválida';
    53: wstrS := 'Tipo/número de inscrição do sacador/avalista inválidos';
    54: wstrS := 'Sacador/avalista não informado';
    55: wstrS := 'Nosso Número no banco correspondente não informado';
    56: wstrS := 'Código do banco correspondente não informado';
    57: wstrS := 'Código da Multa inválido';
    58: wstrS := 'Data da multa inválida';
    59: wstrS := 'Valor/Percentual da multa inválido';
    60: wstrS := 'Movimento para Título não cadastrado';
    61: wstrS := 'Alteração de agência cobradora/dv inválida';
    62: wstrS := 'Tipo de impressão inválido';
    63: wstrS := 'Entrada para Título já cadastrado';
    64: wstrS := 'Número da linha inválido';
    65: wstrS := 'Código do Banco para Débito Inválido';
    66: wstrS := 'Agência/conta/DV para Débito Inválido';
    67: wstrS :=
      'Dados para débito incompatível com a identificação da emissaõ do bloqueto';
    68: wstrS := 'Débito automático agendado';
    69: wstrS := 'Débito não agendado - Erro nos dados da Remessa';
    70: wstrS :=
      'Débito não agendado - Sacado não consta do cadastro de autorizante';
    71: wstrS := 'Débito não agendado - Cedente não autorizado pelo sacado';
    72: wstrS :=
      'Débito não agendado - Cedente não participa da modalidade débito automático';
    73: wstrS := 'Débito não agendado - Código da moeda diferente de real(R$)';
    74: wstrS := 'Débito não agendado - Data Vencimento Inválida';
    75: wstrS :=
      'Débito não agendado, conforme seu pedido, título não registrado';
    76: wstrS :=
      'Débito não agendado, Tipo/Num. Inscrição do debitado, inválido';
    77: wstrS :=
      'Tranferência para desconto não permitida para a carteira do título';
    78: wstrS := 'Data Inferior ou igual ao vencimento para débito automático';
    79: wstrS := 'Data juros de mora inválido';
    80: wstrS := 'Data do desconto inválida';
    81: wstrS := 'Tentativas de débito esgotadas - Baixado';
    82: wstrS := 'Tentativas de débito esgotadas - Pendente';
    83: wstrS := 'Limite Excedido';
    84: wstrS := 'Número Autorização Inexistente';
    85: wstrS := 'Título com pagamento vinculado';
    86: wstrS := 'Seu Número Inválido';
    87: wstrS := 'e-mail/SMS enviado';
    88: wstrS := 'e-mail lido';
    89: wstrS :=
      'e-mail/SMS devolvido - endereço de e-mail ou número do celular incorreto';
    90: wstrS := 'e-mail devolvido - caixa postal cheia';
    91: wstrS := 'e-mail/número do celular do saado não informado';
    92: wstrS := 'Sacado optante por bloqueto eletrônico - e-mail não enviado';
    93: wstrS := 'Código para emissão de bloqueto não permite envio e-mail';
    94: wstrS := 'Código da Carteira inválido para envio de e-mail';
    95: wstrS := 'Contrato não permite o envio de e-mail';
    96: wstrS := 'Número de Contrato Inválido';
  end;
  Result := (wstrS);
end;

procedure TFContasReceberCad.GeraArquivoSERASA1Click(Sender: TObject);
var
  F: TextFile;
  S, wVencto, wTipoCliente, wCont: string;
  wContRelac, wContDupli: Integer;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[27].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    wContRelac := 0;
    wContDupli := 0;
    with DMContasReceber_rel do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME27Filial.Text),
        'CONTAS A RECEBER');
      QRSerasa.Close;
      QRSerasa_Tempo.Close;
      QSerasa_Recebto.Close;

      if Trim(FContasReceberParam.ME27Filial.Text) <> '' then
      begin
        QRSerasa.SetVariable('COD_FILIAL', FContasReceberParam.ME27Filial.Text);
        QSerasa_Recebto.SetVariable('COD_FILIAL',
          FContasReceberParam.ME27Filial.Text);
      end
      else
        raise exception.Create('Informar código da filial');

      if Trim(FContasReceberParam.ME27DATA_I.Text) <> '' then
      begin
        QRSerasa.SetVariable('DATA_I',
          StrtoDate(FContasReceberParam.ME27DATA_I.Text));
        QSerasa_Recebto.SetVariable('DATA_I',
          StrtoDate(FContasReceberParam.ME27DATA_I.Text));
      end
      else
      begin
        QRSerasa.SetVariable('DATA_I', Null);
        QSerasa_Recebto.SetVariable('DATA_I', Null);
      end;

      if Trim(FContasReceberParam.ME27DATA_F.Text) <> '' then
      begin
        QRSerasa.SetVariable('DATA_F',
          StrtoDate(FContasReceberParam.ME27DATA_F.Text));
        QSerasa_Recebto.SetVariable('DATA_F',
          StrtoDate(FContasReceberParam.ME27DATA_F.Text));
      end
      else
      begin
        QRSerasa.SetVariable('DATA_F', Null);
        QSerasa_Recebto.SetVariable('DATA_F', Null);
      end;
      QRSerasa.Open;
      QRSerasa_Tempo.Open;
      QSerasa_Recebto.Open;

      if QRSerasa.RecordCount <= 0 then
        raise exception.create('Não Existem registros a serem exportados');

      //----Inicio Registro Header
   {01}S := '00';
      {02}S := S + 'RELATO COMP NEGOCIOS';
      {03}S := S +
        RMaskCGC_CPF(DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL',
        'COD_FILIAL =' + Trim(FContasReceberParam.ME27Filial.Text), True), 14);
      if FContasReceberParam.Rg27Tipo.ItemIndex = 0 then
        {04}S := S + FormatDateTime('yyyymmdd',
          StrToDate(FContasReceberParam.ME27Data_I.text))
      else
        S := S + 'CORRECAO';
      {05}S := S + FormatDateTime('yyyymmdd',
        StrToDate(FContasReceberParam.ME27Data_F.text));
      {06}case FContasReceberParam.Rg27Periodicidade.ItemIndex of
        0: S := S + 'D';
        1: S := S + 'M';
        2: S := S + 'S';
        3: S := S + '1';
      end;
      {07}S := S + '               ';
      {08}S := S + '   ';
      {09}S := S + Bib.FormataTexto(' ', 29);
      {10/11}S := S + 'V.01';
      {12}S := S + Bib.FormataTexto(' ', 26);
      S := S + Chr(13) + Chr(10);
      //----FINAL Registro Header

            //----Inicio Registro Detalhe (TEMPO DE RELACIONAMENTO)
      QRSerasa_Tempo.First;
      while not (QRSerasa_Tempo.eof) do
      begin
        inc(wContRelac);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QRSerasa_TempoNum_CGC_CPF.Text, 14);
        {03}S := S + '01';
        {04}S := S + FormatDateTime('yyyymmdd',
          QRSerasa_TempoDt_Cadastro.Value);
        if (date - QRSerasa_TempoDt_Cadastro.Value) > 365 then
          wTipoCliente := '1'
        else
          wTipoCliente := '2';
        {05}S := S + wTipoCliente;
        {6-9}S := S + Bib.FormataTexto(' ', 103) + Chr(13) + Chr(10);
        QRSerasa_Tempo.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContRelac = 1000 then
            Break;
      end;
      //----FINAL Registro TEMPO DE RELACIONAMENTO

      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)
      QRSerasa.First;
      while not (QRSerasa.eof) do
      begin
        inc(wContDupli);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QRSerasaNum_CGC_CPF.Text, 14);
        {03}S := S + '05';
        {04}S := S + RMaskCGC_CPF(QRSerasaNum_Nota.Text +
          QRSerasaNum_Parcela.Text, 10);
        {05}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
        if QRSerasaVal_Original.Text <> '' then
        begin
          {06}S := S + intdecimais(QRSerasaVAL_ORIGINAL.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Vencimento.Value);
          // VENCIMENTO
        {08}S := S + '        '; // DATA DE PAGAMENTO
        end
        else
        begin
          {06}S := S + intdecimais(QRSerasaVAL_TITULO.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
          {08}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
          ;
        end;
        {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        QRSerasa.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContDupli >= 1000 then
            Break;
      end;
      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)

      //----Inicio Registro Detalhe (TITULOS BAIXADOS)
      QSerasa_Recebto.First;
      while not (QSerasa_Recebto.eof) do
      begin
        if QSerasa_RecebtoVal_Titulo.Value > 0 then
        begin
          inc(wContDupli);
          {01}S := S + '01';
          {02}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_CGC_CPF.Text, 14);
          {03}S := S + '05';
          {04}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text + 'A', 10);
          {05}S := S + FormatDateTime('yyyymmdd',
            QSerasa_RecebtoDt_Emissao.Value);
          {06}S := S + intdecimais(QSerasa_RecebtoVal_Titulo.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd',
            QSerasa_RecebtoDt_Vencimento.Value); // VENCIMENTO
          {08}S := S + '        '; // DATA DE PAGAMENTO
          {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        end;
        // até aqui foi para gerar o valor do titulo que ficou em aberto
        // agora vai gerar a baixa do titulo
        inc(wContDupli);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_CGC_CPF.Text, 14);
        {03}S := S + '05';
        wCont := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_RECEBER_MOV',
          'COD_CONTA_RECEBER_CAB =' + QSerasa_RecebtoCod_Conta_Receber_Cab.Text
          +
          ' And Ind_Tipo_Movimento=' + Chr(39) + 'RECEBTO. PRINCIPAL' +
          Chr(39));
        if StrToInt(wCont) = 1 then
          // quando gera pela primeira vez - é a parcela na baixa parcial é colocado um A no numero da parcela
          {04}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text +
            QSerasa_RecebtoNum_Parcela.Text, 10)
        else
          S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text + 'A', 10);
        {05}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Emissao.Value);
        {06}S := S + intdecimais(QSerasa_RecebtoVal_Movimento.Text, 13, 2);
        {07}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Vencimento.Value); // VENCIMENTO
        {08}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Movimento.Value); // DATA DE PAGAMENTO
        {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        QSerasa_Recebto.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContDupli >= 1000 then
            Break;
      end;
      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)

      //----Inicio Registro Trailer
        {01}S := S + '99';
      {02}S := S + RMaskCGC_CPF(IntToStr(wContRelac), 11);
      {03}S := S + Bib.FormataTexto(' ', 44);
      {04}S := S + RMaskCGC_CPF(IntToStr(wContDupli), 11);
      {08}S := S + Bib.FormataTexto(' ', 61);
      QRSerasa.next;
      //--------Fim Registro Trailer

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        MessageDlg('Arquivo Serasa Gerado com Sucesso!', mtInformation, [mbOk],
          0);
      end
      else
        MessageDlg('Arquivo Serasa não foi Gerado!', mtWarning, [mbOk], 0);
    end;
  end;

end;

procedure TFContasReceberCad.TotaldeCRporPerodo1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[28].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME28Filial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber_Rel do
    begin
      QRTotalCRPeriodo.Close;

      if Trim(FContasReceberParam.ME28Class.Text) <> '' then
        QRTotalCRPeriodo.SetVariable('CLASSIFICACAO',
          FContasReceberParam.ME28Class.Text)
      else
        QRTotalCRPeriodo.SetVariable('CLASSIFICACAO', Null);

      if Trim(FContasReceberParam.ME28Filial.Text) <> '' then
        QRTotalCRPeriodo.SetVariable('FILIAL',
          FContasReceberParam.ME28Filial.Text)
      else
        QRTotalCRPeriodo.SetVariable('FILIAL', Null);

      if ((Trim(FContasReceberParam.ME28DtInicial.text) = '') or
        (Trim(FContasReceberParam.ME28Dtfinal.text) = '')) then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado')
      else
        QRTotalCRPeriodo.SetVariable('DT_INICIAL',
          FContasReceberParam.ME28DtInicial.Text);
      QRTotalCRPeriodo.SetVariable('DT_FINAL',
        FContasReceberParam.ME28DtFinal.Text);

      QRTotalCRPeriodo.Open;
    end;
    if FRTotalCRPeriodo = nil then
      FRTotalCRPeriodo := TFRTotalCRPeriodo.Create(Application);
    FRTotalCRPeriodo.QRLPeriodo.Caption := 'Período de : ' +
      FContasReceberParam.Me28DtInicial.Text + ' Até : ' +
      FContasReceberParam.Me28DtFinal.Text;
    FRTotalCRPeriodo.QRLFilial.Caption := 'Filial:' +
      Trim(FContasReceberParam.Me28Filial.Text) + ' - ' +
      FContasReceberParam.Ed28Filial.Text +
      ' Classificação: ' + FContasReceberParam.Ed28Class.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRTotalCRPeriodo.QRPrimario.Preview
    else
      FRTotalCRPeriodo.QRPrimario.Print;

    DMContasReceber_Rel.QRTotalCRPeriodo.Close;
  end;
end;

procedure TFContasReceberCad.BoletimdeRegistroSCPC1Click(Sender: TObject);
var
  Path, campo: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[29].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    Path := ExtractFilePath(ParamStr(0)) + 'doc\';
    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'scpc.doc');

    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('SELECT ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DT_NASCIMENTO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NUM_INSCRICAO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NUM_CGC_CPF, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_ENDERECO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_BAIRRO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_CEP, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_PAI, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_MAE, ');
    DMOracle.QExecSQL.SQL.Add('  TE.DESC_ESTADO_CIVIL, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_CONJUGE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DT_NASCIMENTO_CONJUGE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_NATURALIDADE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_ESTADO_NATURAL ');
    DMOracle.QExecSQL.SQL.Add('FROM');
    DMOracle.QExecSQL.SQL.Add('  TB_CADASTRO TC,');
    DMOracle.QExecSQL.SQL.Add('  TB_ESTADO_CIVIL TE');
    DMOracle.QExecSQL.SQL.Add('WHERE');
    DMOracle.QExecSQL.SQL.Add('  TC.COD_ESTADO_CIVIL = TE.COD_ESTADO_CIVIL(+)');
    DMOracle.QExecSQL.SQL.Add('  AND');
    DMOracle.QExecSQL.SQL.Add('  TC.COD_CADASTRO = ' +
      DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
    DMOracle.QExecSQL.open;

    campo := DMOracle.QExecSQL.fieldbyName('NOME').AsString;
    Doc.Content.Find.Execute(FindText := '%nome_completo', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DT_NASCIMENTO').AsString;
    Doc.Content.Find.Execute(FindText := '%dt_nascimento_pessoa', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NUM_INSCRICAO').AsString;
    Doc.Content.Find.Execute(FindText := '%rg', ReplaceWith := campo, Replace :=
      2);

    campo := DMOracle.QExecSQL.fieldbyName('NUM_CGC_CPF').AsString;
    Doc.Content.Find.Execute(FindText := '%cpf', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ENDERECO').AsString;
    Doc.Content.Find.Execute(FindText := '%endereco', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_BAIRRO').AsString;
    Doc.Content.Find.Execute(FindText := '%bairro', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_CEP').AsString;
    Doc.Content.Find.Execute(FindText := '%cep', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NOME_MAE').AsString + '/' +
      DMOracle.QExecSQL.fieldbyName('NOME_PAI').AsString;
    Doc.Content.Find.Execute(FindText := '%filiacao', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ESTADO_CIVIL').AsString;
    Doc.Content.Find.Execute(FindText := '%estado_civil', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NOME_CONJUGE').AsString;
    Doc.Content.Find.Execute(FindText := '%nome_esposa', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DT_NASCIMENTO_CONJUGE').AsString;
    Doc.Content.Find.Execute(FindText := '%dt_nascimento_esposa', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_NATURALIDADE').AsString;
    Doc.Content.Find.Execute(FindText := '%naturalidade_devedor', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ESTADO_NATURAL').AsString;
    Doc.Content.Find.Execute(FindText := '%estado_naturalidade_devedor',
      ReplaceWith := campo, Replace := 2);

    campo := FContasReceberParam.ME29NomeAvalista.Text;
    Doc.Content.Find.Execute(FindText := '%nome_avalista', ReplaceWith := campo,
      Replace := 2);

    if FContasReceberParam.RG29RegistroIntercambio.ItemIndex = 0 then
    begin
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_sim',
        ReplaceWith := 'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_nao',
        ReplaceWith := ' ', Replace := 2);
    end;

    if FContasReceberParam.RG29RegistroIntercambio.ItemIndex = 1 then
    begin
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_sim',
        ReplaceWith := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_nao',
        ReplaceWith := 'X', Replace := 2);
    end;

    campo := DMContasReceber.QContasReceber_CabDT_EMISSAO.Text;
    Doc.Content.Find.Execute(FindText := '%dt_compra', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Text;
    Doc.Content.Find.Execute(FindText := '%dt_vencimento', ReplaceWith := campo,
      Replace := 2);

    campo := FContasReceberParam.ME29DtEmissaoSCPC.Text;
    Doc.Content.Find.Execute(FindText := '%dt_envio_scpc', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabNUM_TITULO.Text;
    Doc.Content.Find.Execute(FindText := '%num_contrato', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabVAL_TITULO.Text;
    Doc.Content.Find.Execute(FindText := '%val_divida', ReplaceWith := campo,
      Replace := 2);

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 0 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := ' ',
        Replace := 2);
    end;

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 1 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := 'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := ' ',
        Replace := 2);
    end;

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 2 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := 'X',
        Replace := 2);
    end;

    Doc.SaveAs(Path + 'scpc_gerado.Doc');
  end;
end;

procedure TFContasReceberCad.ResumoMovContasaReceber1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[30].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME30CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME30Inicial.text) = '') or
      (Trim(FContasReceberParam.ME30Final.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRResumoMovCReceber.Close;
      if Trim(FContasReceberParam.ME30CodCliente.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME30CodCliente.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME30CodDepto.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME30CodDepto.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME30CodFilial.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_FILIAL',
          FContasReceberParam.ME30CodFilial.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME30CodVendedor.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME30CodVendedor.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME30CC.Text) <> '' then
        QRResumoMovCReceber.SetVariable('CC', FContasReceberParam.ME30CC.Text)
      else
        QRResumoMovCReceber.SetVariable('CC', Null);

      if Trim(FContasReceberParam.ME30Finalidade.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_FINALIDADE',
          trim(FContasReceberParam.ME30Finalidade.Text))
      else
        QRResumoMovCReceber.SetVariable('COD_FINALIDADE', Null);

      QRResumoMovCReceber.SetVariable('INICIAL',
        FContasReceberParam.ME30Inicial.Text);
      QRResumoMovCReceber.SetVariable('FINAL',
        FContasReceberParam.ME30Final.Text);

      case FContasReceberParam.RG30FormaPagamento.ItemIndex of
        0: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;

      QRResumoMovCReceber.open;
    end;
    if FRResumoMovCReceber = nil then
      FRResumoMovCReceber := TFRResumoMovCReceber.Create(Application);
    FRResumoMovCReceber.QRLPeriodo.Caption := 'PERIODO DE: ' +
      FContasReceberParam.ME30Inicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME30Final.Text;
    //   FRResumoMovCReceber.QRLCC.Caption:='Conta Corrente: '+FContasReceberParam.Ed2CC.Text;

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRResumoMovCReceber.QRPrimario.Preview
    else
      FRResumoMovCReceber.QRPrimario.Print;

  end;
end;

procedure TFContasReceberCad.SpeedButton1Click(Sender: TObject);
var
  wObs, wComando: string;
begin
  inherited;
  if InputQuery('Alteração', 'Observação', wObs) then
  begin
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET DESC_OBSERVACAO=' + Chr(39) +
        wObs + Chr(39);
      wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
  end;
end;

procedure TFContasReceberCad.Autorizaodefatura1Click(Sender: TObject);
var
  Path, campo, rg_contato_cli, cpf_contato_cli, cid_contato_cli,
    est_contato_cli, rg_contato_fil, cpf_contato_fil, cid_contato_fil,
    est_contato_fil: string;
begin
  if DMContasReceber.QContasReceber_cabCOD_CONTA_RECEBER_CAB.value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMContasReceber.QContasReceber_cabCOD_FILIAL.Text), 'CONTAS A RECEBER');
    Path := ExtractFilePath(ParamStr(0)) + 'Contratos\';

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;

    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'Autorizacao');

    campo := DMFilial.QFilialDESC_FILIAL.Value;
    Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialNum_CGC.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMFilial.QFilialDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialCod_estado.Value;
    Doc.Content.Find.Execute(FindText := '%estado_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%I.E._filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_CEP.Value;
    Doc.Content.Find.Execute(FindText := '%cep_filial', ReplaceWith := campo,
      Replace := 2);

    campo := DMCadastro.QCadastroNOME.Value;
    Doc.Content.Find.Execute(FindText := '%nome_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := IntToStr(DMCadastro.QCadastroCOD_CADASTRO.Value);
    Doc.Content.Find.Execute(FindText := '%cod_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%rg_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_CGC_CPF.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroCOD_ESTADO.value;
    Doc.Content.Find.Execute(FindText := '%uf_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%I.E._cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroDESC_CEP.Value;
    Doc.Content.Find.Execute(FindText := '%cep_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    Doc.Content.Find.Execute(FindText := '%inscricao_municipal_cadastro',
      ReplaceWith := campo, Replace := 2);

    //campo:=DateToStr(DMContasReceber.QContasReceber_CabDT_EMISSAO.Value);
    //Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
    //campo:=DateToStr(DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value);
    //Doc.Content.Find.Execute(FindText := '%dt_vencimento',ReplaceWith := campo,Replace:=2);
    campo := FormatDateTime(' dd "de" MMMM "de" yyyy',
      DMContasReceber.QContasReceber_CabDT_EMISSAO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_emissao_ext', ReplaceWith :=
      campo, Replace := 2);
    campo := FormatDateTime(' dd "de" MMMM "de" yyyy',
      DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_venc_ext', ReplaceWith := campo,
      Replace := 2);

    // Grava documento
    Doc.SaveAs(Path + 'Autorizacao-' + chr(39) + DMCadastro.QCadastroNOME.Value
      + chr(39));
    // Imprime
    //Doc.PrintOut(false);
    // Fecha o Word
//      WinWord.Quit;
  end
  else
    MessageDlg('Primeiro selecione uma CONTA a RECEBER', mtInformation, [mbOk],
      0);
end;

procedure TFContasReceberCad.TitAbertosSintticoporDepto1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[31].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME31Filial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME31DtInicial.text) = '') or
      (Trim(FContasReceberParam.ME31DtFinal.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber_Rel do
    begin
      QRTitulosAberto_Depto_Sint.Close;

      if Trim(FContasReceberParam.ME31Departamento.Text) <> '' then
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME31Departamento.Text)
      else
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME31Filial.Text) <> '' then
        QRTitulosAberto_Depto_Sint.SetVariable('FILIAL',
          FContasReceberParam.ME31Filial.Text)
      else
        QRTitulosAberto_Depto_Sint.SetVariable('FILIAL', Null);

      QRTitulosAberto_Depto_Sint.SetVariable('DT_INICIAL',
        FContasReceberParam.ME31DtInicial.Text);
      QRTitulosAberto_Depto_Sint.SetVariable('DT_FINAL',
        FContasReceberParam.ME31DtFinal.Text);

      QRTitulosAberto_Depto_Sint.open;
    end;
    if FRTituloAberto_Depto_Sint = nil then
      FRTituloAberto_Depto_Sint :=
        TFRTituloAberto_Depto_Sint.Create(Application);
    FRTituloAberto_Depto_Sint.QRLPeriodo.Caption := 'PERIODO DE: ' +
      FContasReceberParam.ME31DtInicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME31DtFinal.Text;

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRTituloAberto_Depto_Sint.QRPrimario.Preview
    else
      FRTituloAberto_Depto_Sint.QRPrimario.Print;

  end;

end;

procedure TFContasReceberCad.RelatrioMovimentao1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[32].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    if (Trim(FContasReceberParam.ME32Data_I.text) = '') or
      (Trim(FContasReceberParam.ME32Data_F.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');

    if (Trim(FContasReceberParam.ME32Cadastro.text) = '') then
      raise Exception.Create('Cadastro não pode ficar em branco!');

    with DMContasReceber_Rel do
    begin
      QRMovimentacao.close;
      if Trim(FContasReceberParam.ME32Filial.Text) <> '' then
        QRMovimentacao.SetVariable('COD_FILIAL',
          FContasReceberParam.ME32Filial.Text)
      else
        QRMovimentacao.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME32Cadastro.Text) <> '' then
        QRMovimentacao.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME32Cadastro.Text)
      else
        QRMovimentacao.SetVariable('COD_CADASTRO', Null);

      QRMovimentacao.SetVariable('DATA_I', FContasReceberParam.ME32Data_I.Text);
      QRMovimentacao.SetVariable('DATA_F', FContasReceberParam.ME32Data_F.Text);

      if FContasReceberParam.RG32Ordem.ItemIndex = 1 then
        QRMovimentacao.SQL[QRMovimentacao.SQL.Count - 1] :=
          'TB_CONTA_RECEBER_CAB.NUM_TITULO, TB_CONTA_RECEBER_CAB.NUM_PARCELA';

      QRMovimentacao.open;
    end;

    if FRMovimentacao = nil then
      FRMovimentacao := TFRMovimentacao.Create(Application);

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRMovimentacao.QRPrimario.Preview
    else
      FRMovimentacao.QRPrimario.Print;
  end;
end;

procedure TFContasReceberCad.DBEdit19KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 123 then //123 --> F12
    BtCliente.Click;
end;

procedure TFContasReceberCad.Sicredicnab240v0811Click(Sender: TObject);
var
  mNUM_CEDENTE, mNUM_CONVENENTE, mBrancos, mPrefixoTitulo, mContaCaucao,
    mTipoInscricao, s, wVal, mCodNossoNumero: string;
  wNumTitulo, wNumCC: string;
  x, iSeq, mSequencial, iQtdRegLote: Integer;
  mSEQ_REMESSA, wval_total: Real;
  F: TextFile;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[24].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    S := '';
    with DMContasReceber do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME24CodFilial.text), 'CONTAS A RECEBER');
      QRemessa.Close;

      if Trim(FContasReceberParam.ME24CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME24CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME24CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME24CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME24DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME24DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME24DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME24DtFinal.text)
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me24NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me24NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if not QRemessa.Eof then
      begin

        try
          {-------HEADER DO ARQUIVO - REGISTRO 0-------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0000'; {004-007|04|LOTE DE SERVICO}
          s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14);
          s := s + wVal; {019-032|14|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '1' then
            wVal := copy(QRemessaNUM_CONVENIO.Text + '                    ', 1,
              20)
          else
            wVal := '                    ';
          s := s + wVal; {033-052|20|N convenio DA EMPRESA}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {053-057|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := ' ';
          s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {059-070|12|NUMERO DA CONTA CORRENTE}

          wVal := ' ';
          s := s + wVal; {071-071|01|DIGITO VERIFICADOR DA CONTA}

          wVal := ' ';
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {073-102|30|NOME DA EMPRESA}

          wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
            '                              ', 1, 30);
          s := s + wVal; {103-132|30|NOME DO BANCO}

          s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

          s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
            '');
          s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''HH24MISS'') FROM DUAL',
            '');
          s := s + wVal; {152-157|06|DATA DE GERACAO DO ARQUIVO}

          if QRemessaCOD_BANCO.Text = '1' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_BB')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '422' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SAFRA')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '748' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SICREDI-V240')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_UNIBANCO')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end;

          if QRemessaCOD_BANCO.Text = '1' then
            s := s + '082' {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}
          else
            s := s + '081'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

          s := s + '01600'; {167-171|05|DENSIDADE DA GRAVAÇÃO DO ARQUIVO}

          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '         '; {172-240|69|PARA USO RESERVADO DO BANCO}

          {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

          {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
          s := s + #13#10; {QUEBRA DE LINHA}

          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
          s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
          s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
          s := s + '01'; {010-011|02|TIPO DE SERVICO}
          s := s + '  '; {012-013|02|USO DO BANCO}
          s := s + '040'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
          s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '1' then
            wVal := copy(QRemessaNUM_CONVENIO.Text + '                    ', 1,
              20)
          else
            wVal := '                    ';
          s := s + wVal; {--034-053|20|CODIGO DO CONVENIO NO BANCO---}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {054-058|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := ' ';
          s := s + wVal; {059-059|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {060-071|12|NUMERO DA CONTA CORRENTE}

          wVal := ' ';
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA}

          wVal := ' ';
          s := s + wVal; {073-073|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {074-103|30|NOME DA EMPRESA}

          wVal := '                                        ' +
            '                                        ' +
            '                00000000                ' +
            '                 ';
          s := s + wVal; {104-240|137|USO DO BANCO}
          {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

          iSeq := 1;
          iQtdRegLote := 2; //2--> header e trailer
          while not QRemessa.Eof do
          begin
            s := s + #13#10;
            {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
            s := s + wVal; {018-022|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := ' ';
            s := s + wVal; {023-023|01|DIGITO VERIFICADOR DA AGENCIA}

            wVal :=
              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
              12)), 12);
            s := s + wVal; {024-035|12|NUMERO DA CONTA CORRENTE}

            wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1,
              1);
            s := s + wVal; {036-036|01|DIGITO VERIFICADOR DA CONTA}

            wVal := ' ';
            s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA CONTA}

            wVal := copy(QRemessaCOD_NOSSO_NUMERO.Text + '00000000000000000000',
              1, 20);
            s := s + wVal; {038-057|20|NOSSO NUMERO}

            s := s + '1'; {058-058|01|TIPO DE COBRANÇA}

            wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
            s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

            wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text + ' ', 1, 1);
            s := s + wVal;
            {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

          //wVal := copy(QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text+' ',1,1);
          //s := s + wVal;       {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}
            if QRemessaCOD_NOSSO_NUMERO.Text = '' then
              wVal := '1'
            else
              wVal := '2';
            s := s + wVal; {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}

            wVal := copy(QRemessaCOD_IDENTIF_DISTRIBUICAO.Text + ' ', 1, 1);
            s := s + wVal; {062-062|01|IDENTIFICAÇÃO DA DISTRIBUIÇÃO)}

            wVal := copy(QRemessaNUM_TITULO.Text + '               ', 1, 15);
            s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

            wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
            wval_total := wval_total + QRemessaVAL_TITULO.Value;
            s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

            wVal := '00000';
            s := s + wVal; {101-105|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := ' ';
            s := s + wVal; {106-106|01|DIGITO VERIFICADOR DA AGENCIA}

            s := s + '03'; {107-108|02|ESPECIE DO TITULO}

            wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
            s := s + wVal;
            {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

            wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
              copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              copy(QRemessaDT_EMISSAO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

            s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA}

            //wVal := copy(QRemessaDT_VENCIMENTO.Text,1,2) +
            //        copy(QRemessaDT_VENCIMENTO.Text,4,2) +
            //        copy(QRemessaDT_VENCIMENTO.Text,7,4);
            //wVal := copy(wVal + '        ',1,8);
            wVal := '00000000';
            s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

            if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              //alterado Marcos 15/05/06
              wVal := IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                (QRemessaVal_Titulo.Value / 100)), 15, 2)
            else
              wVal := StrZero(QRemessaPERC_TAXA.Value, 15, 2);

            s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

            s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
            s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
            s := s + '000000000000000';
            {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
            s := s + '000000000000000';
            {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
            s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

            wVal := copy('      ' + QRemessaCOD_FILIAL.Text, 1, 6);
            s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
            s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
            s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
            s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
            s := s + '    '; {217-220|4|USO DA CEMAPA}

            if QRemessaCOD_PROTESTO.Value = '1' then
              wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1)
            else
              wVal := '3';
            s := s + wVal;
            {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}

            wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
            s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

            s := s + '1';
            {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

            s := s + ' 60';
            {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
            s := s + '09'; {228-229|02|CODIGO DA MOEDA (REAL)}

            s := s + '0000000000'; {230-239|11|USO EXCLUSIVO DO BANCO}

            s := s + ' '; {240-240|11|USO EXCLUSIVO DO BANCO}
            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            s := s + #13#10; {QUEBRA DE LINHA}
            {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text, 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';

            s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {019-033|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {034-073|40|NOME}

            wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
              '                                        ', 1, 40);
            s := s + wVal; {074-113|40|ENDERECO}

            wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
            s := s + wVal; {114-128|15|BAIRRO}

            wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              '     ', 1, 8);
            s := s + wVal; {129-136|08|CEP}

            // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
            // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

            wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
              1, 15);
            s := s + wVal; {137-151|15|CIDADE}

            wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
            s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}

            //wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text,1,1);
            //if wVal = 'F' then
            //  wVal := '1'
            //else if wVal = 'J' then
            //  wVal := '2'
            //else
            //  wVal := '0';
            //s := s + wVal;       {154-154|01|TIPO DE INSCRICAO}

            //wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,15);
            //s := s + wVal;       {155-169|15|N DE INSCRICAO}
            wVal := '0000000000000000';
            s := s + wVal; {154-154|01|TIPO DE INSCRICAO}
            {155-169|15|N DE INSCRICAO}

            wVal := '                                        ';
            s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

            s := s + '000'; {210-212|03|Cod. banco correpondente}

            s := s + '   ';
            {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}

            s := s + '   '; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}

            s := s + '   '; {219-221|03|NUMERO DO PLANO}

            s := s + '                   '; {222-240|19|USO DO BANCO}

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end;

          QRemessa.First;

          s := s + #13#10;
          {------------TRAILER DE LOTE--------------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVICO}
          s := s + '5'; {008-008|01|REGISTRO TRAILER DE LOTE}
          s := s + '         '; {009-017|09|USO EXCLUSIVO DO BANCO}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
          s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}

          wVal := RMaskCGC_CPF(FloatToStr((iQtdRegLote - 2) / 2), 6);
          s := s + wVal; {024-029|06|QUANTIDADE DE TITULOS EM COBRANÇA}

          wVal := StrZero(wval_total, 17, 2);
          s := s + wVal; {030-046|15,2|VALOR TOTAL DOS TITULOS EM CARTEIRA}

          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------FIM - TRAILER DE LOTE--------------------}

          s := s + #13#10; {QUEBRA DE LINHA}
          {------------TRAILER DE ARQUIVO-----------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}

          s := s + '9999'; {004-007|04|LOTE DE SERVICO}
          s := s + '9'; {008-008|01|REGISTRO TRAILER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN}
          s := s + '000001'; {018-023|06|QUANTID. DE LOTES DO ARQUIV}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
          s := s + wVal; {024-029|06|QTDADE DE REGISTROS DO ARQUIV}
          s := s + '000000'; {030-035|06|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '     '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------TRAILER DE ARQUIVO-----------------}

                   //------------------ Fim --------------------------\\
          wNumCC := ''; //USADO PARA MONTAR O NOME DO ARQUIVO REMESSA
          mSequencial := StrToInt(FormatDateTime('MM', Date));
          case mSequencial of
            10: wNumCC := 'O';
            11: wNumCC := 'N';
            12: wNumCC := 'D';
          else
            wNumCC := IntToStr(mSequencial);
          end;

          Insert(RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5), wNumCC, 1);
          wNumCC := wNumCC + FormatDateTime('dd', Date) + '.CRM';
          FContasReceberParam.SDlg_Remessa.FileName := wNumCC;
          FContasReceberParam.SDlg_Remessa.Filter :=
            'Arquivo de Remessa Bansicredi';
          FContasReceberParam.SDlg_Remessa.DefaultExt := '';
          FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, wNumCC);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA Sicredi CNAB240 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA Sicredi não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);

      //  if FContasReceberParam.SDlg_Remessa.Execute then
    //    begin
    //      AssignFile( F, FContasReceberParam.SDlg_Remessa.FileName );
     //     Rewrite(F);
     //     Writeln(F, S);
     //     CloseFile(F);
    //      DMOracle.DBCemapa.Commit;
    //      MessageDlg('Arquivo REMESSA CNAB240 VERSÃO 080 Gerado com Sucesso!', mtInformation,[mbOk], 0);
    //    end;
   //   except
   //   MessageDlg('Sem Movimento nesse Periodo', mtInformation,[mbOk], 0);
   //   end;
    end;
  end;
end;

procedure TFContasReceberCad.NumBloqEmitidosporBanco1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[33].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBloquetosEmitidosBanco.Close;

      if FContasReceberParam.Me34CodFilial.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('COD_FILIAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('COD_FILIAL',
          StrToInt(trim(FContasReceberParam.Me34CodFilial.Text)));

      if FContasReceberParam.Me34CodBanco.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('COD_BANCO', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('COD_BANCO',
          StrToInt(trim(FContasReceberParam.Me34CodBanco.Text)));

      if FContasReceberParam.ME34DataI.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('DT_INICIAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('DT_INICIAL',
          StrToDate(trim(FContasReceberParam.Me34DataI.Text)));

      if FContasReceberParam.ME34DataF.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('DT_FINAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('DT_FINAL',
          StrToDate(trim(FContasReceberParam.Me34DataF.Text)));

      QRBloquetosEmitidosBanco.Open;
    end;
  end;

  if FRBloqEmitBanco = nil then
    FRBloqEmitBanco := TFRBloqEmitBanco.Create(Application);

  if FContasReceberParam.RGPreview.ItemIndex = 0 then
    FRBloqEmitBanco.QRPrimario.Preview
  else
    FRBloqEmitBanco.QRPrimario.Print;

end;

procedure TFContasReceberCad.Monta_SQL_Safra_Bradesco;
begin
  with DMContasReceber do
  begin
    QRBloqueto.Close;
    QRBloqueto.Sql.Clear;
    QRBloqueto.Sql.Add('SELECT ');
    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
    QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
    QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
    QRBloqueto.Sql.Add('NVL(Tb_banco_agencia.NOSSO_NUMERO,TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) AS NOSSO_NUMERO,');
    QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
    QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
    QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_FILIAL,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.IND_ACEITE,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_VENDEDOR,');
    QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,TB_CADASTRO.NOME AS NOME_SACADO,');
    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
    QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.CARTEIRA,');
    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_BAIRRO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
    QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA '); //--- adicionado por Fabio na Faville 16/07/2004
    QRBloqueto.Sql.Add('FROM ');
    QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL ');
    QRBloqueto.Sql.Add('WHERE ');
    QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE');
    QRBloqueto.Sql.Add('AND Tb_conta_receber_cab.COD_BANCO_AGENCIA = Tb_banco_agencia.COD_BANCO_AGENCIA ');
    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO is NULL');
    //Sergio alterado 01/08/2003}
    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
      'BAIXA TOTAL' + CHR(39));

    DmContasReceber.pVencimentoBloqueto := 'S';

    QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
      Trim(FContasReceberParam.ME19CodContaCorrente.Text));
    QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
      Trim(FContasReceberParam.ME19CodBanco.Text));

    if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
        Trim(FContasReceberParam.ME19CodNota.Text));
    if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
        Trim(FContasReceberParam.ME19CodNotaF.Text));
    if Trim(FContasReceberParam.ME19CodContaReceberCab.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = ' +
        Trim(FContasReceberParam.ME19CodContaReceberCab.Text));
    if Trim(FContasReceberParam.ME19CodBanco.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
        Trim(FContasReceberParam.ME19CodBanco.Text));
    if Trim(FContasReceberParam.ME19CodFilial.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
        Trim(FContasReceberParam.ME19CodFilial.Text));
    if Trim(FContasReceberParam.ME19Inicial.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39)
        + Trim(FContasReceberParam.ME19Inicial.Text) + chr(39));
    if Trim(FContasReceberParam.ME19Final.Text) <> '' then
      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39)
        + Trim(FContasReceberParam.ME19Final.Text) + chr(39));
    QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');
    if FContasReceberParam.Rg19Vencimento.ItemIndex = 0 then
      DmContasReceber.pVencimentoBloqueto := 'S'
    else
      DmContasReceber.pVencimentoBloqueto := 'N';

    QRBloqueto.Open;
  end;
  //If QRBloquetoCod_Banco.Value = 237 then
//Begin
  if (FRBloqueto_Bradesco = nil) then
    FRBloqueto_Bradesco := TFRBloqueto_Bradesco.Create(Application);
  FRBloqueto_Bradesco.QRPrimario.Print;
  //End;
  //QRBloqueto.Close;
end;

procedure TFContasReceberCad.ZerarComisso1Click(Sender: TObject);
var
  wComissao: string;
begin
  inherited;
  wComissao := '0';
  if InputQuery('Informe Nova Comissão', 'Comissão', wComissao) then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      with DMOracle do
      begin
        if DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value <> 0 then
        begin
          wComissao := Bib.TrocaVirgulaPorPonto(wComissao);
          QexecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTA_RECEBER_CAB SET PERC_COMISSAO = ' +
            wComissao);
          QExecSQL.SQL.Add('WHERE COD_CONTA_RECEBER_CAB =' +
            FloatToStr(DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value));
          QExecSQL.ExecSQL;
          if DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value <> Null then
          begin
            QexecSQL.Close;
            QExecSQL.SQL.Clear;
            QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET PERC_COMISSAO = ' +
              wComissao);
            QExecSQL.SQL.Add('WHERE TB_NOTA_CAB.COD_NOTA_CAB =' +
              FloatToStr(DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value));
            QExecSQL.ExecSQL;

            QexecSQL.Close;
            QExecSQL.SQL.Clear;
            QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM SET PERC_COMISSAO = ' +
              wComissao);
            QExecSQL.SQL.Add('WHERE TB_NOTA_ITEM.COD_NOTA_CAB =' +
              FloatToStr(DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value));
            QExecSQL.ExecSQL;
          end;
          DMOracle.DBCemapa.Commit;
          DMContasReceber.QContasReceber_Cab.Close;
          DMContasReceber.QContasReceber_Cab.Open;
          ShowMessage('Operação Efetuada com Sucesso')
        end
        else
          ShowMessage('Selecionar o Titulo Para Zerar Comissão');
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Operação não Efetuada!');
    end;
  end;
end;

procedure TFContasReceberCad.SBVendedorPublicarClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.SBVendedorPublicar1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor1.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.RelComissaoClick(Sender: TObject);
begin
  inherited;
  // Relatório de Comissao somente para PUBLICAR
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[34].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.FmFilial35.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissaoPublicar.Close;
      if Trim(FContasReceberParam.FmFilial35.MeFilial.Text) <> '' then
        QRComissaoPublicar.SetVariable('FILIAL',
          Trim(FContasReceberParam.FmFilial35.MeFilial.Text))
      else
        QRComissaoPublicar.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me35TipoDocumento.Text) <> '' then
        QRComissaoPublicar.SetVariable('COD_SERIE',
          Trim(FContasReceberParam.Me35TipoDocumento.Text))
      else
        QRComissaoPublicar.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.Fm1Vendedor35.MeVendedor.Text) <> '' then
        QRComissaoPublicar.SetVariable('VENDEDOR',
          Trim(FContasReceberParam.Fm1Vendedor35.MeVendedor.Text))
      else
        QRComissaoPublicar.SetVariable('VENDEDOR', Null);
      if Trim(FContasReceberParam.Me35MovimentoData_I.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissaoPublicar.SetVariable('DATA_I',
        Trim(FContasReceberParam.Me35MovimentoData_I.text));

      if Trim(FContasReceberParam.Me35MovimentoData_F.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRComissaoPublicar.SetVariable('DATA_F',
        Trim(FContasReceberParam.Me35MovimentoData_F.text));

      if Trim(FContasReceberParam.Me35EmissaoData_I.Text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado')
      else
        QRComissaoPublicar.SetVariable('DT_EMISSAO',
          Trim(FContasReceberParam.Me35EmissaoData_I.Text));
      if Trim(FContasReceberParam.Me35EmissaoData_F.Text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissaoPublicar.SetVariable('DT_EMISSAO_FINAL',
          Trim(FContasReceberParam.Me35EmissaoData_F.Text));
      if Trim(FContasReceberParam.Me35Data_Vencimento.Text) = '' then
        QRComissaoPublicar.SetVariable('DT_VENCTO', Null)
      else
        QRComissaoPublicar.SetVariable('DT_VENCTO',
          StrToDate(Trim(FContasReceberParam.Me35Data_Vencimento.Text)));

      if FContasReceberParam.Rg35Abertos.ItemIndex = 0 then
        QRComissaoPublicar.SetVariable('LISTAR_TITULOS_ABERTOS', 'SIM')
      else
        QRComissaoPublicar.SetVariable('LISTAR_TITULOS_ABERTOS', 'NAO');

      if FRComissaoPublicar = nil then
        FRComissaoPublicar := TFRComissaoPublicar.create(Application);

      if FContasReceberParam.RG35TipoRelatorio.ItemIndex = 0 then
        FRComissaoPublicar.pTipoRelatorio := 'ANALITICO'
      else
        FRComissaoPublicar.pTipoRelatorio := 'SINTETICO';

      QRComissaoPublicar.Open;

      FRComissaoPublicar.QRLTitulo.Caption := 'Relatorio de Comissao De: ' +
        FContasReceberParam.Me35MovimentoData_I.Text + ' Ate : ' +
        FContasReceberParam.Me35MovimentoData_F.Text;
      FRComissaoPublicar.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.FmFilial35.MeFilial.Text;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRComissaoPublicar.QRPrimario.Preview
      else
        FRComissaoPublicar.QRPrimario.Print;
      QRComissaoPublicar.Close;
    end;
  end;

end;

procedure TFContasReceberCad.SBAlterarClick(Sender: TObject);
begin
  if DMContasReceber.QContasReceber_CabInd_Situacao.Value = 'BAIXA TOTAL' then
    raise Exception.Create('Não é Possível Alterar um Titulo Com Baixas');
  inherited;

end;

procedure TFContasReceberCad.BloquetoAgrupadopPeriodo1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[35].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME36Filial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRBloqueto.Close;
      QRBloqueto.Sql.Clear;
      QRBloqueto.Sql.Add('SELECT ');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
      QRBloqueto.SQL.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) as NOSSO_NUMERO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.IND_TIPO_JURO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_BANCO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_AGENCIA,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
      QRBloqueto.SQL.Add('SUM(TB_CONTA_RECEBER_CAB.VAL_TITULO) AS VAL_TITULO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.NOME AS NOME_SACADO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.COD_CADASTRO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_TELEFONE,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CEP_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.NUM_CGC_CPF,');
      QRBloqueto.SQL.Add('TB_CADASTRO.COD_ESTADO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_BAIRRO,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.VARIACAO,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.CARTEIRA,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL,');
      QRBloqueto.SQL.Add('TB_FILIAL.DESC_FILIAL,');
      QRBloqueto.SQL.Add('TB_BANCO_AGENCIA.COD_CONVENIO_CUSTODIA,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.DIG_VERIFICADOR_AGENCIA_CONTA,');
      QRBloqueto.SQL.Add('to_date(' + chr(39) +
        FContasReceberParam.ME36Vencimento.Text + chr(39) +
        ',''DD/MM/YYYY'') AS DT_VENCIMENTO,');
      QRBloqueto.SQL.Add('to_date(' + chr(39) + DateToStr(date) + chr(39) +
        ',''DD/MM/YYYY'') AS DT_EMISSAO,');
      QRBloqueto.SQL.Add('0 AS NUM_TITULO,');
      QRBloqueto.SQL.Add('0 AS COD_NOTA_CAB,');
      QRBloqueto.SQL.Add('0 AS NUM_PARCELA,');
      QRBloqueto.SQL.Add(chr(39) + 'BLO' + chr(39) +
        ' AS DESC_TIPO_DOCUMENTO,');
      QRBloqueto.SQL.Add(chr(39) + 'N' + chr(39) + ' AS IND_ACEITE,');
      QRBloqueto.SQL.Add('0 AS COD_VENDEDOR,');
      QRBloqueto.SQL.Add('0 AS COD_CONTA_RECEBER_CAB');

      QRBloqueto.SQL.Add(' FROM ');
      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL');
      QRBloqueto.SQL.Add(' WHERE ');
      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO and ');
      QRBloqueto.SQL.Add('TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA and ');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE and ');
      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL = TB_CONTA_RECEBER_CAB.COD_FILIAL and ');
      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
        'BAIXA TOTAL' + CHR(39));

      if Trim(FContasReceberParam.ME36Filial.Text) <> '' then
        QRBloqueto.SQL.Add(' and TB_FILIAL.COD_FILIAL =' +
          Trim(FContasReceberParam.ME36Filial.Text));

      if Trim(FContasReceberParam.FMCadastro36.MECadastro.Text) <> '' then
        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_CADASTRO =' +
          Trim(FContasReceberParam.FMCadastro36.MECadastro.Text));

      if Trim(FContasReceberParam.ME36ContaCorrente.Text) <> '' then
        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE =' +
          Trim(FContasReceberParam.ME36ContaCorrente.Text))
      else
        raise Exception.Create('Informe a Conta Corrente!');

      if Trim(FContasReceberParam.ME36Banco.Text) <> '' then
        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA =' +
          Trim(FContasReceberParam.ME36Banco.Text))
      else
        raise Exception.Create('Informe a Conta Corrente!');

      if (Trim(FContasReceberParam.ME36DtInicial.Text) = '') or
        (Trim(FContasReceberParam.ME36DtFinal.Text) = '') then
        raise Exception.Create('Informe o Período desejado!')
      else
      begin
        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
          chr(39) + Trim(FContasReceberParam.ME36DtInicial.Text + chr(39)));
        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
          chr(39) + Trim(FContasReceberParam.ME36DtFinal.Text) + chr(39));
      end;

      QRBloqueto.SQL.Add(' GROUP BY ');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE),');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE),');
      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO),');
      QRBloqueto.SQL.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO),');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.IND_TIPO_JURO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_BANCO,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_AGENCIA,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.NOME,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.COD_CADASTRO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_TELEFONE,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CEP_COBRANCA,');
      QRBloqueto.SQL.Add('TB_CADASTRO.NUM_CGC_CPF,');
      QRBloqueto.SQL.Add('TB_CADASTRO.COD_ESTADO,');
      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_BAIRRO,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.VARIACAO,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.CARTEIRA,');
      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL,');
      QRBloqueto.SQL.Add('TB_FILIAL.DESC_FILIAL,');
      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,');
      QRBloqueto.SQL.Add('tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA');

      QRBloqueto.SQL.Add(' ORDER BY ');
      QRBloqueto.SQL.Add('Tb_CADASTRO.COD_CADASTRO');

      QRBloqueto.open;

      //BANCO DO BRASIL
      if QRBloquetoCod_Banco.Value = 001 then
      begin
        if FRBoletaBB = nil then
          FRBoletaBB := TFRBoletaBB.Create(Application);
        FRBoletaBB.QRPrimario.Print;
      end;

      //BANCO BRADESCO
      if QRBloquetoCod_Banco.Value = 237 then
      begin
        if FRBloqueto_Bradesco = nil then
          FRBloqueto_Bradesco := TFRBloqueto_Bradesco.Create(Application);
        FRBloqueto_Bradesco.QRPrimario.Print;
      end;

    end;
  end;
end;

procedure TFContasReceberCad.tulosAbertosOutrasMoedas1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[36].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.Me37DtInicial.Text) = '' then
        raise Exception.Create('Por favor, informe a data inicial.');
      if Trim(FContasReceberParam.Me37DtFinal.Text) = '' then
        raise Exception.Create('Por favor, informe a data final.');
      if Trim(FContasReceberParam.ME37DtBase.Text) = '' then
        raise Exception.Create('Por favor, informe a data base.');
      QRTitulosAbertos_OutrasMoedas.Close;
      if Trim(FContasReceberParam.Fm37Filial.MeFilial.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL',
          Trim(FContasReceberParam.Fm37Filial.MeFilial.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL', null);
      if Trim(FContasReceberParam.Fm37Departamento.MeDepartamento.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.Fm37Departamento.MeDepartamento.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO', null);
      if Trim(FContasReceberParam.Fm37Finalidade.MeFinalidade.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE',
          Trim(FContasReceberParam.Fm37Finalidade.MeFinalidade.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE', null);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_INICIAL',
        FContasReceberParam.Me37DtInicial.Text);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_FINAL',
        FContasReceberParam.Me37DtFinal.Text);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_BASE',
        FContasReceberParam.ME37DtBase.Text);

      if FRTitulosAbertos_OutrasMoedas = nil then
        FRTitulosAbertos_OutrasMoedas :=
          TFRTitulosAbertos_OutrasMoedas.Create(Application);
      with FRTitulosAbertos_OutrasMoedas do
      begin
        QRLFilial.Caption := FContasReceberParam.Fm37Filial.EdFilial.Text;
        QRLFinalidade.Caption :=
          FContasReceberParam.Fm37Finalidade.EdFinalidade.Text;
        QRLDtInicial.Caption := FContasReceberParam.Me37DtInicial.Text;
        QRLDtFinal.Caption := FContasReceberParam.Me37DtFinal.Text;
        QRLDtBase.Caption := FContasReceberParam.ME37DtBase.Text;
        QRLDepartamento.Caption :=
          FContasReceberParam.Fm37Departamento.EdDepartamento.Text;
      end;
      QRTitulosAbertos_OutrasMoedas.open;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Preview
      else
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Print;
      QRTitulosAbertos_OutrasMoedas.Close;
    end;
  end;
end;

procedure TFContasReceberCad.CalculaVariaoCambial1Click(Sender: TObject);
var
  wDD, wMM, WYY: string;
  wDtAnterior, wDtAtual: tDateTime;
  wVariacao, wVlMoeda: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[37].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm38Filial.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.Me38DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      if Trim(FContasReceberParam.Me38DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      if Trim(FContasReceberParam.Me38DtBase.text) = '' then
        raise Exception.Create('Campo Data Base Deve Ser Informado');
      QVariacao_Cambial.Close;
      if Trim(FContasReceberParam.Fm38Filial.MeFilial.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_FILIAL',
          FContasReceberParam.Fm38Filial.MeFilial.Text)
      else
        QVariacao_Cambial.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.Fm38Departamento.MeDepartamento.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.Fm38Departamento.MeDepartamento.Text)
      else
        QVariacao_Cambial.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Fm38Finalidade.MeFinalidade.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_FINALIDADE',
          FContasReceberParam.Fm38Finalidade.MeFinalidade.Text)
      else
        QVariacao_Cambial.SetVariable('COD_FINALIDADE', Null);

      if Trim(FContasReceberParam.Fm38Cadastro.MeCadastro.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_CADASTRO',
          FContasReceberParam.Fm38Cadastro.MeCadastro.Text)
      else
        QVariacao_Cambial.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.Fm38Contrato.MeContrato.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_CONTRATO_VEND',
          FContasReceberParam.Fm38Contrato.MeContrato.Text)
      else
        QVariacao_Cambial.SetVariable('COD_CONTRATO_VEND', Null);

      QVariacao_Cambial.SetVariable('DT_INICIAL',
        FContasReceberParam.Me38DtInicial.text);
      QVariacao_Cambial.SetVariable('DT_FINAL',
        FContasReceberParam.Me38DtFinal.text);
      QVariacao_Cambial.SetVariable('DT_EMISSAO',
        FContasReceberParam.Me38DtBase.text);
      pDataBase := StrToDate(FContasReceberParam.Me38DtBase.text);
      QVariacao_Cambial.Open;

      if QVariacao_Cambial.Eof then
        raise
          Exception.Create('Neste Periodo Não Tem Contas a Receber em Dólar');
      DMMoeda.QCotacaoDia.Close;
      DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
      DMMoeda.QCotacaoDia.SetVariable('Data',
        FContasReceberParam.Me38DtBase.text);
      DMMoeda.QCotacaoDia.Open;
      if DMMoeda.QCotacaoDia.Eof then
        raise Exception.Create('Dólar Não Cadastrado Para Data Base');
      wVlMoeda := DMMoeda.QCotacaoDiaVlr_Cotacao.Value;
      DMOracle.DBCemapa.StartTransaction;
      try
        while not (QVariacao_Cambial.Eof) do
        begin
          //              wDD      := '01';
          //              wMM      := Copy(FContasReceberParam.Me38DtBase.Text,4,2);
          //              wYY      := Copy(FContasReceberParam.Me38DtBase.Text,7,4);
          //              wDtAnterior := StrToDate(wDD+'/'+wMM+'/'+wYY) - 1;   // pega ultimo dia do mes anterior
          //              If QVariacao_CambialDt_Emissao.Value > wDtAnterior Then
          wDtAnterior := QVariacao_CambialDt_Emissao.Value;
          DMMoeda.QCotacaoDia.Close;
          DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
          DMMoeda.QCotacaoDia.SetVariable('Data', wDtAnterior);
          DMMoeda.QCotacaoDia.Open;
          if DMMoeda.QCotacaoDia.Eof then
            raise
              Exception.Create('Dolar não cadastrado para contas a receber');
          wVariacao := (QVariacao_CambialVal_Titulo.Value -
            (QVariacao_CambialVal_Original.Value /
            DMMoeda.QCotacaoDiaVlr_Cotacao.Value -
            QVariacao_Cambialval_dolar_baixa.Value) * wVlMoeda) * -1;

          QContasReceber_Cab.Close;
          QContasReceber_Cab.SetVariable('Pk',
            QVariacao_CambialCod_Conta_Receber_Cab.Value);
          QContasReceber_Cab.Open;

          QContasReceber_Mov.Insert;
          QContasReceber_MovDt_Movimento.Value :=
            StrToDate(FContasReceberParam.Me38DtBase.text);
          QContasReceber_MovVal_Movimento.Value := wVariacao;
          QContasReceber_MovDesc_Observacao.Value :=
            'Gerado a partir de uma Variacao cambial';
          QContasReceber_MovInd_Tipo_Movimento.Value := 'VARIACAO';
          QContasReceber_Mov.Post;
          QVariacao_Cambial.Next;
        end;
      except
        QVariacao_Cambial.Cancel;
        DMOracle.DBCemapa.RollBack;
        raise;
      end;
      DMOracle.DBCemapa.Commit;
      QVariacao_Cambial.Close;
      DMMoeda.QCotacaoDia.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ProtocolodeEntregadeDocumentos1Click(
  Sender: TObject);
begin
  inherited;
  if FRProtocoloEntregaDocumento = nil then
    FRProtocoloEntregaDocumento :=
      TFRProtocoloEntregaDocumento.Create(Application);
  FRProtocoloEntregaDocumento.MMensagem.Lines.Text :=
    'Declaro para os devidos fins, que recebi a documentação relativa ao Boleto Nº ' +
    DMContasReceber.QContasReceber_CabCOD_NOSSO_NUMERO.Text +
    ' com vencimento em '
    + FormatDateTime('dd/MM/yyyy',
    DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value) + ' no valor de R$ '
    +
    FormatFloat('#,##0.00', DMContasReceber.QContasReceber_CabVAL_TITULO.Value)
    +
    ' referente à compra de produtos e/ou assistência técnica prestados, conforme relatório em anexo.';
  FRProtocoloEntregaDocumento.LEmpresa.Caption :=
    DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO ', 'COD_CADASTRO = ' +
    DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LEndereco.Caption :=
    DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO ',
    'COD_CADASTRO = '
    + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LTelefone.Caption :=
    DMOracle.BuscaNome('SELECT DESC_TELEFONE FROM TB_CADASTRO ',
    'COD_CADASTRO = '
    + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LData.Caption := FormatDateTime('dd/MM/yyyy',
    Date);
  FRProtocoloEntregaDocumento.QRPrimario.Preview;
end;

procedure TFContasReceberCad.ExportaContas1Click(Sender: TObject);
var
  wSql, S: string;
  F: TextFile;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[4].TabVisible := True;
  FContasReceberParam.CB4SituacaoVendedor.ItemIndex := 0;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME4CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitulosAberto.Close;
      QRContasReceber_TitulosAberto.SQL.Clear;
      wsql :=
        ('SELECT TB_CADASTRO.NOME,TB_VENDEDOR.NOME AS NOME_VENDEDOR,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CELULAR,TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB');
      wSql := wsql +
        (',TB_CADASTRO.desc_endereco,TB_CADASTRO.desc_cidade,TB_CADASTRO.desc_cep,TB_CADASTRO.cod_estado,TB_CADASTRO.num_cgc_cpf');
      wSql := wsql +
        (',TB_CADASTRO.DESC_FONE_EMPRESA,Tb_conta_RECEBER_cab.COD_FILIAL,Tb_conta_RECEBER_cab.COD_FINALIDADE,Tb_conta_RECEBER_cab.COD_BANCO_AGENCIA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_CADASTRO,Tb_conta_RECEBER_cab.COD_VENDEDOR,Tb_conta_RECEBER_cab.NUM_TITULO,Tb_conta_RECEBER_cab.NUM_PARCELA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_TIPO_DOCUMENTO,Tb_conta_RECEBER_cab.DT_MOVIMENTO,Tb_conta_RECEBER_cab.DT_BAIXA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_VENCIMENTO,Tb_conta_RECEBER_cab.DT_EMISSAO,Tb_conta_RECEBER_cab.DT_CAPITALIZACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_CAPITALIZACAO_MOEDA,Tb_conta_RECEBER_cab.VAL_TITULO AS VALT_TITULO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_NOTA_CAB,Tb_conta_RECEBER_cab.DESC_OBSERVACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.IND_ACEITE,Tb_conta_RECEBER_cab.IND_SITUACAO,Tb_conta_RECEBER_cab.VAL_JUROS');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.VAL_ORIGINAL,Tb_filial.DESC_FILIAL,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA');
      wsql := wsql +
        (',TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_AVALISTA1,TB_FINALIDADE.NUM_DIAS_CARENCIA ');
      wsql := wsql +
        (' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_FILIAL,TB_FINALIDADE,TB_CLASS_CADASTRO ');
      wsql := wsql +
        ('WHERE Tb_conta_RECEBER_cab.COD_FILIAL = Tb_filial.COD_FILIAL ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ');
      wsql := wsql +
        (' AND Tb_cadastro.COD_CLASS_CADASTRO = Tb_class_cadastro.COD_CLASS_CADASTRO');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_FINALIDADE = Tb_finalidade.COD_FINALIDADE ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
        wsql := wsql + (' AND (Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'BAIXA TOTAL' + chr(39) + ')')
      else
      begin
        wsql := wsql + (' AND ((Tb_conta_RECEBER_cab.IND_SITUACAO = ' + chr(39)
          +
          'BAIXA PARCIAL' + chr(39) + ')');
        if Trim(FContasReceberParam.ME4DtRefEmissao.Text) <> '' then
        begin
          wsql := wsql + ' OR (Tb_conta_RECEBER_cab.DT_BAIXA > ' + chr(39) +
            FContasReceberParam.ME4DtRefEmissao.Text + chr(39) + ')';
          wsql := wsql + ' OR  (Tb_conta_RECEBER_cab.DT_BAIXA IS NULL))';
        end;
      end;
      if Trim(FContasReceberParam.ME4CodCliente.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = ' +
          Trim(FContasReceberParam.ME4CodCliente.Text));
      if Trim(FContasReceberParam.ME4CodFilial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.ME4CodFilial.Text));
      if Trim(FContasReceberParam.ME4CodRegiao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_REGIAO = ' +
          Trim(FContasReceberParam.ME4CodRegiao.Text));
      if Trim(FContasReceberParam.ME4CodVendedor.Text) <> '' then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.ME4CodVendedor.Text))
        else
          wsql := wsql + (' AND TB_CADASTRO.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.ME4CodVendedor.Text));
      if Trim(FContasReceberParam.ME4CodBanco.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.ME4CodBanco.Text));
      if Trim(FContasReceberParam.ME4CodFinalidade.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE In (' +
          Trim(FContasReceberParam.ME4CodFinalidade.Text) + ')');
      if Trim(FContasReceberParam.ME4DescDocumento.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO = ' +
          chr(39) + Trim(FContasReceberParam.ME4DescDocumento.Text) + chr(39));
      if Trim(FContasReceberParam.ME4CodDepto.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' +
          Trim(FContasReceberParam.ME4CodDepto.Text));
      wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) +
        FContasReceberParam.ME4DtRefEmissao.Text + chr(39));
      if Trim(FContasReceberParam.ME4Inicial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39)
          + FContasReceberParam.ME4Inicial.Text + chr(39));
      if Trim(FContasReceberParam.ME4final.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39)
          + FContasReceberParam.ME4Final.Text + chr(39));
      if Trim(FContasReceberParam.ME4ContaNao1.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao1.Text));
      if Trim(FContasReceberParam.ME4ContaNao2.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao2.Text));
      if Trim(FContasReceberParam.ME4ContaNao3.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao3.Text));
      if Trim(FContasReceberParam.ME4ContaNao4.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao4.Text));
      if Trim(FContasReceberParam.ME4ContaNao5.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao5.Text));
      if Trim(FContasReceberParam.ME4ContaNao6.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao6.Text));
      if Trim(FContasReceberParam.ME4ContaNao7.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao7.Text));
      if Trim(FContasReceberParam.ME4ContaNao8.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao8.Text));
      if Trim(FContasReceberParam.ME4ContaNao9.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao9.Text));
      if Trim(FContasReceberParam.ME4ContaNao10.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao10.Text));
      if Trim(FContasReceberParam.Me4Classificacao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_CLASS_CADASTRO = ' +
          Trim(FContasReceberParam.Me4Classificacao.Text));
      if Trim(FContasReceberParam.Me4ContratoVenda.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' +
          Trim(FContasReceberParam.Me4ContratoVenda.Text));
      if FContasReceberParam.Rg4Notas.ItemIndex = 0 then
        // SOMENTE LISTAR TITULOS QUE FORAM EMITIDOS POR NOTA FISCAL
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB > 0 ');
      case FContasReceberParam.CB4SituacaoVendedor.ItemIndex of
        1: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) + 'ATIVO'
            + Chr(39));
        2: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) +
            'INATIVO' + Chr(39));
      end;
      if FContasReceberParam.Me4Valor.Text <> '' then
        Wsql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL <= ' +
          FContasReceberParam.Me4Valor.Text);
      case FContasReceberParam.RG4Ordem.ItemIndex of
        0: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        2: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
        3: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
      end;

      QRContasReceber_TitulosAberto.SQL.Add(wSql);
      DMContasReceber.pDataBase := StrToDate(FContasReceberParam.ME4DtRefEmissao.Text);
      DMContasReceber.pDataReferencia := StrToDate(FContasReceberParam.ME4DtReferencia.Text);
      QRContasReceber_TitulosAberto.Open;
    end;
    S := '';
    while not (DMContasReceber.QRContasReceber_TitulosAberto.Eof) do
    begin
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Cadastro.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Filial.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoNum_Titulo.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoNum_Parcela.Value, 6, 0);
      S := S + FormatMaskText('CCC', DMContasReceber.QRContasReceber_TitulosAbertoDesc_Tipo_Documento.Text);
      S := S + DMContasReceber.QRContasReceber_TitulosAbertoDt_Emissao.Text;
      S := S + DMContasReceber.QRContasReceber_TitulosAbertoDt_Vencimento.Text;
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Finalidade.Value, 6, 0);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertoVal_Titulo.Value), 13, 2);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertoVal_Original.Value), 13, 2);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertosVal_Juros.Value), 13, 2);
      S := S + FormatMaskText('CCCCCCCCCCCCC', DMContasReceber.QRContasReceber_TitulosAbertoInd_Situacao.Text);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoPerc_Comissao.Value * 100, 5, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoPerc_Taxa.Value * 100, 5, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Vendedor.Value, 6, 0);
      S := S + Chr(13) + Chr(10);
      DMContasReceber.QRContasReceber_TitulosAberto.Next;
    end;
    if FContasReceberParam.SDlg_Remessa.Execute then
    begin
      AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
    end;
    DMContasReceber.QRContasReceber_TitulosAberto.Close;
  end;
end;

procedure TFContasReceberCad.ExportarparaSISCOBRA1Click(Sender: TObject);
begin
  wExportar := True;
  RelaodeTtulosAbertos1.Click;
  wExportar := False;
end;

procedure TFContasReceberCad.ExportarSISCOBRA_novo;
var
  f: TextFile;
  linha: string;
  wCadastroAtual, wTituloAtual: Integer;
  wEstadoCivil, wSexo: string;
  wClientes, wTitulos: Integer;
  wValVencidos, wValNaoVencidos, wVenc, wNaoVenc: Extended;
begin
  try
    try
      if (not (SdArquivo.Execute)) then
        Exit;

      AssignFile(f, SdArquivo.FileName);
      Rewrite(f);

      wClientes := 0;
      wTitulos := 0;
      wValVencidos := 0;
      wValNaoVencidos := 0;

      with DMContasReceber do
      begin
        QRContasReceber_TitulosAberto.First;
        wCadastroAtual := -1;
        wTituloAtual := -1;

        while not QRContasReceber_TitulosAberto.Eof do
        begin
         //Só mostra o cadastro quando mudar
          if wCadastroAtual <> QRContasReceber_TitulosAbertoCOD_CADASTRO.Value then
          begin
            wCadastroAtual := QRContasReceber_TitulosAbertoCOD_CADASTRO.Value;

            //Registro 00
            Write(f, '00');
            Write(f, FormatDateTime('ddmmyyyy', DMOracle.DataServ));
            Write(f, Bib.AjustaStr('', 590));
            WriteLn(f);

            //Registro 01
            Write(f, '01');
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(QRContasReceber_TitulosAbertoNUM_CGC_CPF.Value), 1, 18)), 18));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoNOME.Value, 1, 40)), 40));
            Write(f, DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text));
            wSexo := DMOracle.BuscaNome('SELECT NVL(IND_SEXO_CATEGORIA, ' + QuotedStr(' ') + ') FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text);
            if wSexo = '' then
              wSexo := ' ';
            Write(f, wSexo);
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(bib.RemoveNumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value, Bib.NumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value)), 1, 40)), 40));
            Write(f, bib.AjustaStr(trim(copy(Bib.NumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value), 1, 10)), 10));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_BAIRRO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 2)), 2));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(QRContasReceber_TitulosAbertoDESC_CEP.Value), 1, 9)), 9));
            Write(f, Bib.AjustaStr('', 40));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_TELEFONE.Value, 1, 20)), 20));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_FAX FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 14)), 14));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_CELULAR.Value, 1, 20)), 20));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)), 1, 18)), 18));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_ORGAO_EMISSOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 5)), 5));
            Write(f, Bib.AjustaStr('', 2));
            Write(f, Bib.AjustaStr('', 8));
            try
              Write(f, FormatDateTime('ddmmyyyy', StrToDate(DMOracle.BuscaNome('SELECT decode(IND_FISICA_JURIDICA, ' + QuotedStr('F') + ', DT_NASCIMENTO, DT_FUNDACAO) FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text))));
            except
              Write(f, '        ');
            end;
            wEstadoCivil := DMOracle.BuscaNome('SELECT E.DESC_ESTADO_CIVIL FROM TB_CADASTRO C INNER JOIN TB_ESTADO_CIVIL E ON C.COD_ESTADO_CIVIL = E.COD_ESTADO_CIVIL', 'C.COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text);
            if wEstadoCivil = 'Casado' then
              Write(f, 'C')
            else if wEstadoCivil = 'Solteiro' then
              Write(f, 'S')
            else if wEstadoCivil = 'Divorciado' then
              Write(f, 'D')
            else if wEstadoCivil = 'Desquitado' then
              Write(f, 'R')
            else if wEstadoCivil = 'Viúvo' then
              Write(f, 'V')
            else
              Write(f, 'X');
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_NATURALIDADE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_ESTADO_NATURAL FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 2)), 2));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_MAE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_PAI FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, Bib.AjustaStr('', 20));
            Write(f, Bib.AjustaStr('', 70));
            Write(f, bib.AjustaStr(trim(QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 20));
            Write(f, Bib.AjustaStr('', 18));
            WriteLn(f);

            if DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text) = 'F' then
            begin
              //Registro 02
              Write(f, '02');
              Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
              Write(f, Bib.AjustaStr('', 20));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 40));
              Write(f, Bib.AjustaStr('', 6));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 2));
              Write(f, Bib.AjustaStr('', 9));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_FONE_EMPRESA.Value, 1, 20)), 20));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 14));
              Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_FUNCAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
              Write(f, Bib.AjustaStr('', 8));
              Write(f, FormatFloat('00000000000', Trunc(StrToFloat(DMOracle.BuscaNome('SELECT NVL(VAL_SALARIO, 0) FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)) * 100)));
              Write(f, Bib.AjustaStr('', 302));
              WriteLn(f);
            end;

            //Registro 03
            Write(f, '03');
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(DMOracle.BuscaNome('SELECT DESC_CPF_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)), 1, 15)), 15));
            try
              Write(f, FormatDateTime('ddmmyyyy', StrToDate(DMOracle.BuscaNome('SELECT DT_NASCIMENTO_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text))));
            except
              Write(f, '        ');
            end;
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_EMPRESA_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, Bib.AjustaStr('', 45));
            Write(f, Bib.AjustaStr('', 10));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 9));
            Write(f, Bib.AjustaStr('', 2));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, Bib.AjustaStr('', 20));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_PROFISSAO_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
            Write(f, Bib.AjustaStr('', 290));
            WriteLn(f);

            inc(wClientes);
          end;

          //Só mostra o título quando mudar
          if wTituloAtual <> QRContasReceber_TitulosAbertoNUM_TITULO.Value then
          begin
            wTituloAtual := QRContasReceber_TitulosAbertoNUM_TITULO.Value;

            wVenc := StrToFloat(DMOracle.BuscaNome('SELECT NVL(SUM(Tb_conta_receber_cab.VAL_TITULO) + SUM(Tb_conta_receber_cab.VAL_JUROS), 0) from tb_conta_receber_cab', 'DT_VENCIMENTO < CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text));
            wNaoVenc := StrToFloat(DMOracle.BuscaNome('SELECT NVL(SUM(Tb_conta_receber_cab.VAL_TITULO), 0) from tb_conta_receber_cab', 'DT_VENCIMENTO >= CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text));

            //Registro 04
            Write(f, '04');
            Write(f, bib.AjustaStr(trim(QRContasReceber_TitulosAbertoNUM_TITULO.Text), 20));
            Write(f, Bib.AjustaStr('', 3));
            Write(f, FormatFloat('00000', QRContasReceber_TitulosAbertoCOD_FILIAL.Value));
            Write(f, FormatFloat('000', StrToInt(DMOracle.BuscaNome('SELECT COUNT(*) from tb_conta_receber_cab', 'DT_VENCIMENTO >= CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text))));
            Write(f, FormatDateTime('ddmmyyyy', QRContasReceber_TitulosAbertoDT_EMISSAO.Value));
            Write(f, Bib.AjustaStr('', 14));
            Write(f, FormatFloat('00000000000', Trunc(wVenc * 100)));
            Write(f, FormatFloat('00000000000', Trunc(wNaoVenc * 100)));
            Write(f, Bib.AjustaStr('', 8));
            Write(f, Bib.AjustaStr('', 15));
            Write(f, Bib.AjustaStr('', 500));
            WriteLn(f);

            inc(wTitulos);
            wValVencidos := wValVencidos + wVenc;
            wValNaoVencidos := wValNaoVencidos + wNaoVenc;
          end;

          //Registro 06
          Write(f, '06');
          Write(f, FormatFloat('000', QRContasReceber_TitulosAbertoNUM_PARCELA.Value));
          Write(f, FormatFloat('00000000000', Trunc(QRContasReceber_TitulosAbertoVALT_TITULO.Value * 100)));
          Write(f, FormatDateTime('ddmmyyyy', QRContasReceber_TitulosAbertoDT_VENCIMENTO.Value));
          Write(f, Bib.AjustaStr('', 576));
          WriteLn(f);

          QRContasReceber_TitulosAberto.Next;
        end;

        //Registro 99
        Write(f, '99');
        Write(f, FormatFloat('0000000000', wClientes));
        Write(f, FormatFloat('0000000000', wTitulos));
        Write(f, FormatFloat('00000000000000', Trunc(wValVencidos * 100)));
        Write(f, FormatFloat('00000000000000', Trunc(wValNaoVencidos * 100)));
        Write(f, Bib.AjustaStr('', 550));
        WriteLn(f);
      end;
    except
      MessageDlg('Erro na geração do arquivo.', mtError, [mbOK], 0);
      Exit;
    end;
  finally
    CloseFile(f);
  end;
  MessageDlg('Arquivo gerado com sucesso.', mtInformation, [mbOK], 0);
end;

procedure TFContasReceberCad.LanaJurosManual1Click(Sender: TObject);
begin
  inherited;
  If DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Text = '' Then
     Raise Exception.Create('Selecionar Titulo Para Lançar Juros');
  If FContasReceberParam=Nil then
    FContasReceberParam:=TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[38].TabVisible:=True;
  If FContasReceberParam.ShowModal = MrOk then
   Begin
     Try
       DMContasReceber.QContasReceber_Cab.Edit;
       DMContasReceber.QContasReceber_Mov.Insert;
       DMContasReceber.QContasReceber_MovDt_Movimento.Value := StrToDate(Trim(FContasReceberParam.Me39DtLancamento.Text));
       DMContasReceber.QContasReceber_MovVal_Movimento.Value := StrToFloat(Trim(FContasReceberParam.Me39VlJiuros.Text));
       DMContasReceber.QContasReceber_MovDesc_Observacao.Value := Trim(FContasReceberParam.Me39Observacao.Text);
       DMContasReceber.QContasReceber_MovInd_Tipo_Movimento.Value := 'JUROS';
       DMContasReceber.QContasReceber_Mov.Post;
       DMContasReceber.QContasReceber_CabVal_Juros.Value := DMContasReceber.QContasReceber_CabVal_Juros.Value +
                                                             StrToFloat(Trim(FContasReceberParam.Me39VlJiuros.Text));
       DMContasReceber.QContasReceber_Cab.Post;
       DMOracle.DBCemapa.Commit;
     except
       DMContasReceber.QContasReceber_Mov.Cancel;
       DMContasReceber.QContasReceber_Cab.Cancel;
       DMOracle.DBCemapa.RollBack;
       raise exception.create('Erro! Transação não efetuada');
     end;
   End;

end;

end.

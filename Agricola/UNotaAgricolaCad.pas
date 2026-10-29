unit UNotaAgricolaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ComCtrls, ImgList, Menus, Db, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, DBDirceu,OracleData, OraTeste, QRExport, variants,
  QuickRpt, ActnList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;


type
  TFNotaAgricolaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    BtCadastro: TBitBtn;
    BtConsMensagem: TBitBtn;
    BtConsOperacao: TBitBtn;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit17: TDBEdit;
    Label15: TLabel;
    DBEdit18: TDBEdit;
    Label16: TLabel;
    DBEdit19: TDBEdit;
    Label17: TLabel;
    DBEdit20: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsLote: TBitBtn;
    BtConsTributacao: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Operaes1: TMenuItem;
    Confirma1: TMenuItem;
    Cancela1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    VoltaCancelamento1: TMenuItem;
    DBE_Aux_MudaMenu: TDBEdit;
    DSItemNF: TDataSource;
    LananoContratodeVenda1: TMenuItem;
    SpeedButton1: TSpeedButton;
    BTExcluiMov: TSpeedButton;
    ConsultaSaldoaFixar1: TMenuItem;
    NotasaFixar1: TMenuItem;
    FunRuralnoPerodo1: TMenuItem;
    EmissoCpiadeNota1: TMenuItem;
    TransferenciaSaldoaFixar1: TMenuItem;
    RelatriodeFixaes1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    FechamentodeCereais1: TMenuItem;
    ResumoFechamentodeCereais1: TMenuItem;
    ComprovantedeCompraseVendasImpostoRenda1: TMenuItem;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    BtParceiro: TBitBtn;
    ValorFixaesNoPeriodoPorCliente1: TMenuItem;
    MovimentoEstoque1: TMenuItem;
    RelaoEstoqueemOutrosArmazens1: TMenuItem;
    FechamentodeCereaisCPFUF1: TMenuItem;
    ControledesojaRR1: TMenuItem;
    AcertoNotaaFixarDevoluo1: TMenuItem;
    RelatorioComparativoFechamento1: TMenuItem;
    PosioCompradaVendida1: TMenuItem;
    ResumoPosiodeCereais1: TMenuItem;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    EmissoReciboFixao1: TMenuItem;
    QRCompositeReport1: TQRCompositeReport;
    DBRGBaixaContrato: TDBRadioGroup;
    PosioCompradaVendidaMs1: TMenuItem;
    RelatrioMovimentaoProdutosRR1: TMenuItem;
    RelMovEstoqueporProdutoeCliente1: TMenuItem;
    InutilizaodenumeraoNFe1: TMenuItem;
    EnviarviaemailNFe1: TMenuItem;
    ReemitirDanfe1: TMenuItem;
    ReconsultarNFe1: TMenuItem;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    DBTSituacao: TDBText;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    DBTSitSefaz: TDBText;
    N2: TMenuItem;
    ImprimirCabecalhoNFProdutor1: TMenuItem;
    ExportarNFe1: TMenuItem;
    RelatrioPreoMdio1: TMenuItem;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    lblModelo: TLabel;
    btSerieCons: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    RelatrioExtratoProdutoAgrcola1: TMenuItem;
    procedure BtCadastroClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure VoltaCancelamento1Click(Sender: TObject);
    procedure DBE_Aux_MudaMenuChange(Sender: TObject);
    procedure LananoContratodeVenda1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BTExcluiMovClick(Sender: TObject);
    procedure ConsultaSaldoaFixar1Click(Sender: TObject);
    procedure NotasaFixar1Click(Sender: TObject);
    procedure FunRuralnoPerodo1Click(Sender: TObject);
    procedure EmissoCpiadeNota1Click(Sender: TObject);
    procedure TransferenciaSaldoaFixar1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelatriodeFixaes1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FechamentodeCereais1Click(Sender: TObject);
    procedure ResumoFechamentodeCereais1Click(Sender: TObject);
    procedure ComprovantedeCompraseVendasImpostoRenda1Click(
      Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBAlterarClick(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure ValorFixaesNoPeriodoPorCliente1Click(Sender: TObject);
    procedure MovimentoEstoque1Click(Sender: TObject);
    procedure RelaoEstoqueemOutrosArmazens1Click(Sender: TObject);
    procedure FechamentodeCereaisCPFUF1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControledesojaRR1Click(Sender: TObject);
    procedure AcertoNotaaFixarDevoluo1Click(Sender: TObject);
    procedure RelatorioComparativoFechamento1Click(Sender: TObject);
    procedure PosioCompradaVendida1Click(Sender: TObject);
    procedure ResumoPosiodeCereais1Click(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure EmissoReciboFixao1Click(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure PosioCompradaVendidaMs1Click(Sender: TObject);
    procedure RelatrioMovimentaoProdutosRR1Click(Sender: TObject);
    procedure RelMovEstoqueporProdutoeCliente1Click(Sender: TObject);
    procedure InutilizaodenumeraoNFe1Click(Sender: TObject);
    procedure EnviarviaemailNFe1Click(Sender: TObject);
    procedure ReemitirDanfe1Click(Sender: TObject);
    procedure ReconsultarNFe1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure AlterarInserirestanotaemLoteNFe1Click(Sender: TObject);
    procedure EnviarReenviarloteparaSEFAZ1Click(Sender: TObject);
    procedure ConsultarlotedeNFe1Click(Sender: TObject);
    procedure ImprimirCabecalhoNFProdutor1Click(Sender: TObject);
    procedure ExportarNFe1Click(Sender: TObject);
    procedure RelatrioPreoMdio1Click(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RelatrioExtratoProdutoAgrcola1Click(Sender: TObject);
  private
    fTipo_Impressao : Boolean;
    procedure ChamaGeraMov(Origem, Docto: String);
    { Private declarations }
  public
    Property pTipo_Impressao : Boolean Read fTipo_Impressao Write fTipo_Impressao Default False;
    { Public declarations }
  end;

var
  FNotaAgricolaCad: TFNotaAgricolaCad;

implementation

uses UOracle_cl, UCadastroCons, UMensagemCons, UOperacaoCons,
  UProdutoCons, UProduto_cl, UTipoLoteCons, UTipoLote_cl, UTributacaoCons,
  UNotaAgricolaConf, UCadastro_cl, UMensagem_cl, UOperacao_cl,
  UTributacao_cl, UNotaEntrada_cl, UNotaEntradaCons,
  UNotaEntrada_Cancela, UBaixaItemNota, UGeraCVenda, Ucontrato_cl,
  UExcluiMovvend_NFItem, URomConsultaFixar, UContrato_Param,
  URNotaAgricola_Aberto, UNotaEntradaParam, URFunruralPeriodo,
  UNotaImpressao, UTransferenciaSaldoFixar, UParamSistema_cl,
  URRelatorioFixacao, UFechamentoCereais, URResumoFechaCereais,
  URomaneioParam, URImpostoRenda, UUsuario_cl, UImpostoRenda_cl,
  URImpostoRenda_Insumos, URImpostoRenda_Financeiro, URImpostoRenda_Outros,
  UrRomaneioFixacaoCliente, URomaneioAgricola_cl, UEstoque_cl,
  URMovEstoqueProduto, UrEstoqueArmazens, URFechamentoCereais1,
  UNotaSaida_cl, UDevolucaoFixar, UBiblioteca, UImpostoRendaRelTXT_cl,
  URomaneioRel_cl, URControleSojaRRAnalitico, URControleSojaRRSintetico,
  UNotaTransferenciaFixar, UrComparativoFechamento,
  URPosicaoCompradaVendida, URPosicaoCompradaVendida_Res,
  UrResumoPosicaoCereais, UFilial_cl, UReciboFixar, URReciboNFA,
  UrReciboMilhoConsumo, UrPosicaoCompradaVendidaMes, UNfeImpressao,
  UTipoNota, UrControleProdutosRR, URMovEstoqueProdutoCLiente, UNfe_cl,
  UNfEletronicaLote_cl, UNfEletronicaLoteCons, UNFeParam, StrUtils,
  UrNotaPrecoMedio, USerieCons, USerie_cl, MaskUtils,
  URExtratoNotaAgricola;

{$R *.DFM}

procedure geraArquivo();
var
  f1, f2 : TextFile;
  linha,Arq : string;

begin
  WITH DMIMPOSTORENDA DO
  ARQ:=DMImpostoRenda.QRImpostoRendaCadastroNUM_CGC_CPF.Value;
  Arq := Bib.LimpaString(Arq,'.');
  Arq := Bib.LimpaString(Arq,'/');
  Arq := Bib.LimpaString(Arq,'-');
  assignfile(f2, 'c:\ArquivosIR\' + Arq + '.txt');
  Rewrite(f2);

  assignfile(f1, 'c:\IRAgricola.txt');
  Reset(f1);
  while not eof(f1) do
  begin
    readln(f1, linha);
    Writeln(f2, linha);
  end;
  CloseFile(f1);

  assignfile(f1, 'c:\IRInsumos.txt');
  Reset(f1);
  while not eof(f1) do
  begin
    readln(f1, linha);
    Writeln(f2, linha);
  end;
  CloseFile(f1);

  assignfile(f1, 'c:\IRFinanceiro.txt');
  Reset(f1);
  while not eof(f1) do
  begin
    readln(f1, linha);
    Writeln(f2, linha);
  end;
  CloseFile(f1);

  assignfile(f1, 'c:\IROutros.txt');
  Reset(f1);
  while not eof(f1) do
  begin
    readln(f1, linha);
    Writeln(f2, linha);
  end;
  CloseFile(f1);
  CloseFile(f2);
end;

procedure TFNotaAgricolaCad.BtCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMNotaEntrada.QNotaEntradaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaAgricolaCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
     FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
     DMNotaEntrada.QNotaEntradaCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;

end;

procedure TFNotaAgricolaCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  //  FOperacaoCons.RGTipoOperacao.ItemIndex := 0;
  //  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaEntrada.QNotaEntradaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFNotaAgricolaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMNotaEntrada.QItemNF.Edit;
    DMNotaEntrada.QItemNFCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
  End;

end;

procedure TFNotaAgricolaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    DMNotaEntrada.QItemNF.Edit;
    DMNotaEntrada.QItemNFCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  End;

end;

procedure TFNotaAgricolaCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
  Begin
    DMNotaEntrada.QItemNF.Edit;
    DMNotaEntrada.QItemNFCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
  End;
End;

procedure TFNotaAgricolaCad.Confirma1Click(Sender: TObject);
var x, y: array of string;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaEntrada.QNotaEntradaDt_Emissao.Value Then
     Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');

  setLength(x, 4); //3 sql diferentes
  setLength(y, 4);
  x[0] := 'SELECT COD_RAMO FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text;
  x[1] := 'SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text;
  x[2] := 'SELECT DESC_INSCRICAO_MUNICIPAL FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text;
  x[3] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text;
  DMOracle.BuscaNomes(x, y);

  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
     If (Y[0] = '1') And
        (Y[1] = 'F') And
        (Y[2] = '') Then
         Raise Exception.Create('Cadastro de produtor sem CADPRO');
  {If (Y[1] = 'J') And
     (DMNotaEntrada.QNotaEntradaNUM_NOTA.Value = 0) And
     (DMNotaEntrada.QNotaEntradaCod_Serie.Value <> 'IMP') And
     (Y[3] <> 'ISENTO') Then
     Raise Exception.Create('Para pessoa juridica deve-se informar o número da nota');
Solicitado por Weliton da Inovar e autorizado pelo Cesar, para emitir NFe de compra a fixar para CNPJ. Alex 28/02/2024.}
  DMNotaEntrada.PContabiliza_Extra := 'N';
  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
    Raise Exception.Create('Nota Fiscal já confirmada!');
  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
    Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
  If DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR.Text <> '' Then
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_NOTA_CAB','COD_NOTA_CAB =' +DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR.Text) <> '2' Then
        Raise Exception.Create('Nota Fiscal de Devolução - Não Foi Confirmada');
  If FNotaAgricolaConf = Nil then
    FNotaAgricolaConf := TFNotaAgricolaConf.Create(Application);
//  FNotaSaida_Confirma.pAtivado := False;
//  DMNotaSaida.pConfirmando := True;

  DMNotaEntrada.ChecaSaldoFixar;
  If DMNotaEntrada.QNotaEntradaIND_CONDICAO_PAGTO.Value = '2' Then
     FNotaAgricolaConf.GBCPNota.Visible := True
  Else
     FNotaAgricolaConf.GBCPNota.Visible := False;
  FNotaAgricolaConf.ShowModal;
//  DMNotaSaida.pConfirmando := False;
//  FNotaSaida_Confirma.pAtivado := False;
end;

procedure TFNotaAgricolaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMNotaEntrada do
  begin
    DMNotaEntrada.pTipoNota := 'AGRICOLA';
    QNotaEntrada.Open;
    QItemNF.Open;
  End;
end;

procedure TFNotaAgricolaCad.SBConsultaClick(Sender: TObject);
Var wComando : String;
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
  With DMNotaEntrada do
  Begin
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CITY')   Then
     If DMNotaEntrada.QNotaEntradaConsNum_Nota.Value = 999999 then
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_NOTA_CAB SET NUM_NOTA = 0'
            +' WHERE COD_NOTA_CAB = ' + QNotaEntradaConsCOD_NOTA_CAB.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Commit;
        End;
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK',DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value);
    QNotaEntrada.Open;
  End;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFNotaAgricolaCad.SBConfirmarClick(Sender: TObject);
// var wFunRural :Real;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
{  wFunRural :=0;
  DMNotaEntrada.PContabiliza_Extra := 'N';  // ROTINA DE CONTABILIZACAO MENSAL ROTINA EXTRA
  DMNotaEntrada.QItemNF.First;
  while not(DMNotaEntrada.QItemNF.Eof) do
    begin
      wFunRural:=DMNotaEntrada.CalculaFunrural(DMNotaEntrada.QItemNFCOD_PRODUTO.value,
                                               DMNotaEntrada.QNotaEntradaCOD_OPERACAO.value,
                                               DMNotaEntrada.QNotaEntradaCod_Cadastro.value,
                                               DMNotaEntrada.QItemNFVAL_TOTAL.value)+wFunRural;
      DMNotaEntrada.QItemNF.Next;
    end;
  DMNotaEntrada.QNotaEntradaVAL_FUNRURAL.value:=wFunRural;
  //DMNotaEntrada.CalculaDesconto; }
  inherited;
  DMOracle.DBCemapa.Commit;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFNotaAgricolaCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
//  DMOracle.DBCemapa.RollBack;
end;

procedure TFNotaAgricolaCad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
  If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaEntrada.QNotaEntradaDt_Recebimento.Value Then
     Raise Exception.Create('Não é Permitido Voltar Confirmação - Período Contábil');
  If (DMNotaEntrada.QNotaEntradaCod_Contrato_Mov.Value <> 0) or not(DMNotaEntrada.QNotaEntradaCod_Contrato_Mov.IsNull) or
     (DMNotaEntrada.QNotaEntradaCod_Contrato_gp_Mov.Value <> 0) or not(DMNotaEntrada.QNotaEntradaCod_Contrato_gp_Mov.IsNull) Then
     Raise Exception.Create('Não é possível voltar a confirmação de um registro gerado pelo contrato');
  DMNotaEntrada.pTipo_Lote := 1;
  DMNotaEntrada.PVoltaConfirmacao := True;
  DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Volta Confirmação' );
  DMNotaEntrada.VoltaConfirmacao(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value,'S', '1');
  DMNotaEntrada.PVoltaConfirmacao := False;
  DMNotaEntrada.pTipo_Lote := 0;
end;

procedure TFNotaAgricolaCad.Cancela1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
    Raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
    Raise Exception.Create('Esta Nota Fiscal já está cancelada!');
  with DMNotaEntrada do
  begin
    if QNotaEntradaCod_Nota_Cab.Value <> DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value then
    begin
      QNotaEntrada.Close;
      QNotaEntrada.SetVariable('PK',DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value);
      QNotaEntrada.Open;
    end;
  end;
  If FNotaEntrada_Cancela = Nil then
    FNotaEntrada_Cancela := TFNotaEntrada_Cancela.Create(Application);
  FNotaEntrada_Cancela.ShowModal;
end;

procedure TFNotaAgricolaCad.VoltaCancelamento1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
  if (not DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.isNull) then
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value);
      QFilial.Open;

      if (QFilialIND_SISTEMA_NFE.Value = 2) then
        with DMNfe do
        begin
          SetaNfe(DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.Value);
          if StrToInt('0' + QNfeSIT_CANC.Value) in SIT_NFE_CANCELA then
          begin
            MessageDlg('Nota já está cancelada na SEFAZ, não é possível voltar.', mtError, [mbOK], 0);
            Exit;
          end;
        end;
    end;
  DMNotaEntrada.VoltaCancelamento(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value);
end;

procedure TFNotaAgricolaCad.DBE_Aux_MudaMenuChange(Sender: TObject);
begin
  inherited;
  With DMNotaEntrada do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QNotaEntradaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QNotaEntradaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QNotaEntradaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QNotaEntradaInd_Situacao.Value = '3';
  End;

end;

procedure TFNotaAgricolaCad.LananoContratodeVenda1Click(Sender: TObject);
begin
  inherited;
  if FBaixaItemNota = Nil then
    FBaixaItemNota:=TFBaixaItemNota.Create(Application);
  DMOracle.DBCemapa.StartTransaction;
  FBaixaItemNota.ShowModal;
  SBRefreshClick(Self);
end;

procedure TFNotaAgricolaCad.SpeedButton1Click(Sender: TObject);
Var OP1,OP2,OP3 : String;
begin
  inherited;
  If DmNotaEntrada.QNotaEntradaIND_SITUACAO.Value <> '2' Then
     Raise Exception.Create ('Nota Cancelada ou Não Confirmada');
  If DmNotaEntrada.QNotaEntradaCOD_OPERACAO.Text <> '' Then
  Begin
    OP1:=DMOracle.BuscaNome('SELECT IND_FIXAR_EMPRESA FROM TB_OPERACAO','COD_OPERACAO = '+DmNotaEntrada.QNotaEntradaCOD_OPERACAO.text,True);
    OP2:=DMOracle.BuscaNome('SELECT IND_FIXAR_OUTRAS_EMP FROM TB_OPERACAO','COD_OPERACAO = '+DmNotaEntrada.QNotaEntradaCOD_OPERACAO.text,True);
    OP3:=DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO','COD_OPERACAO = '+DmNotaEntrada.QNotaEntradaCOD_OPERACAO.text,True);
  End;
  if (OP1 <> 'F') and (OP2 <> 'O') and (OP3 <> 'C') then
    ShowMessage('Atenção! Só é possível gerar um movimento em uma nota de Fixação')
  else
    ChamaGeraMov('Vend','NFA');
  SBRefreshClick(Self);
end;

procedure TFNotaAgricolaCad.ChamaGeraMov(Origem, Docto: String);
var
  SaldoAplicar, Valor :Real;
  wCodClasse,wClasse,wSubClasse : Integer;
begin
  inherited;
  with DMNotaEntrada do
    begin
      QContratoMovVend_Mov_NFItem.Open;
      if (QContratoMovVend_Mov_NFItemTotal_Quantidade.Value <> null) and (QContratoMovVend_Mov_NFItemTotal_Quantidade.Value < Trunc(QITemNFQT_QUANTIDADE.Value*100)/100) then
        begin
          SaldoAplicar:=QItemNFQT_QUANTIDADE.Value - QContratoMovVend_Mov_NFItemTotal_Quantidade.Value;
          SaldoAplicar :=StrToFloat(FormatFloat('0.00',SaldoAplicar));
          Valor := SaldoAplicar*QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value;
          wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNfCod_Produto.Value),True));
          wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse),True));
          wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse),True));
          DMContrato.MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',2);
          if DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value <> 0 then
            begin
              if FGeraMovCVenda = nil then
                FGeraMovCVenda := TFGeraMovCVenda.Create(Application);
              if not(DMOracle.DBCemapa.inTransaction) then
                DMOracle.DBCemapa.StartTransaction;
              FGeraMovCVenda.LQuantidade.caption:=FormatFloat('#,##0',SaldoAplicar);
              FGeraMovCVenda.LValor.caption:=FormatFloat('#,##0.00',Valor);
              FGeraMovCVenda.pValor:=Valor;
              FGeraMovCVenda.pQtde:=SaldoAplicar;
              FGeraMovCVenda.pOrigem:=Origem;
              FGeraMovCVenda.pDocumento := Docto;
              FGeraMovCVenda.ShowModal;
            end
          else
            ShowMessage('Não existem Contratos de Venda Abertos para este Produto e Filial');
          DMContrato.QContrato_VendCons.Close;
        end
      else
        ShowMessage('Não há mais saldo a aplicar neste movimento');
      QContratoMovVend_Mov_NFItem.Close;
    end;
end;

procedure TFNotaAgricolaCad.BTExcluiMovClick(Sender: TObject);
begin
  inherited;
  if FExcluiMovVend_NFItem=nil then
    FExcluiMovVend_NFItem := TFExcluiMovVend_NFItem.Create(Application);
  FExcluiMovVend_NFItem.ShowModal;
  SBRefreshClick(Self);
end;

procedure TFNotaAgricolaCad.ConsultaSaldoaFixar1Click(Sender: TObject);
begin
  inherited;
  If FRomConsultaFixar = Nil then
    FRomConsultaFixar := TFRomConsultaFixar.Create(Application);
  FRomConsultaFixar.GBGeraNota.Visible := False;
  FRomConsultaFixar.ShowModal;
end;

procedure TFNotaAgricolaCad.NotasaFixar1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[8].TabVisible:=True;
  if FContratoParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME8CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRNotaAgricola_Aberto.Close;
          if trim(FContratoParam.ME8CodFilial.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('COD_FILIAL',FContratoParam.ME8CodFilial.text)
          else
            QRNotaAgricola_Aberto.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME8CodProduto.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('COD_PRODUTO',FContratoParam.ME8CodProduto.text)
          else
            QRNotaAgricola_Aberto.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.ME8CodCliente.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('COD_CADASTRO',FContratoParam.ME8CodCliente.Text)
          else
            QRNotaAgricola_Aberto.SetVariable('COD_CADASTRO',Null);
          if Trim(FContratoParam.Me8CadastroParceiro.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('COD_CADASTRO_PARCEIRO',FContratoParam.Me8CadastroParceiro.Text)
          else
            QRNotaAgricola_Aberto.SetVariable('COD_CADASTRO_PARCEIRO',Null);
          if Trim(FContratoParam.Me8Classe.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('NUM_CLASSE',FContratoParam.Me8Classe.Text)
          else
            QRNotaAgricola_Aberto.SetVariable('NUM_CLASSE',Null);
          if Trim(FContratoParam.Me8SubClasse.text)<>'' then
            QRNotaAgricola_Aberto.SetVariable('NUM_SUBCLASSE',FContratoParam.Me8SubClasse.Text)
          else
            QRNotaAgricola_Aberto.SetVariable('NUM_SUBCLASSE',Null);

          QRNotaAgricola_Aberto.SetVariable('DATAI',StrToDate(FContratoParam.ME8DataI.Text));
          QRNotaAgricola_Aberto.SetVariable('DATAF',StrToDate(FContratoParam.ME8DataF.Text));
          QRNotaAgricola_Aberto.SQL[QRNotaAgricola_Aberto.SQL.Count-1] := '';
          Case FContratoParam.Rg8Ordem.ItemIndex of
             0 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY DT_EMISSAO');
             1 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY VAL_UNITARIO DESC');
             2 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY VAL_UNITARIO ');
             3 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY COD_FILIAL, VAL_UNITARIO DESC');
             4 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY COD_FILIAL, VAL_UNITARIO DESC');
             5 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY DT_EMISSAO, VAL_UNITARIO DESC');
             6 : QRNotaAgricola_Aberto.SQL.Add('ORDER BY DT_EMISSAO, VAL_UNITARIO ');
          End;
          QRNotaAgricola_Aberto.Open;
          if FRNotaAgricola_Aberto = nil then
            FRNotaAgricola_Aberto:=TFRNotaAgricola_Aberto.Create(Application);
          FRNotaAgricola_Aberto.QRLTitulo.Caption := 'Notas com Saldo em Aberto (Posição Comprada) de '+FContratoParam.ME8DataI.Text+' Ate '+FContratoParam.ME8DataF.Text;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRNotaAgricola_Aberto.QRPrimario.Preview
          else
            FRNotaAgricola_Aberto.QRPrimario.Print;
          QRNotaAgricola_Aberto.Close;
        end;
    end;
end;

procedure TFNotaAgricolaCad.FunRuralnoPerodo1Click(Sender: TObject);
var
  DtInicial,DtFinal:String;
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[5].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME5CodFilial.Text),'AGRICOLA');
      with DMNotaEntrada do
        begin
          QRFunRural.Close;
          if Trim(FNotaEntradaParam.ME5CodFilial.text) <>'' then
            QRFunRural.SetVariable('COD_FILIAL',FNotaEntradaParam.ME5CodFilial.text)
          else
            QRFunRural.SetVariable('COD_FILIAL',Null);

          if Trim(FNotaEntradaParam.Fm5Cadastro.MeCadastro.text) <> '' then
            QRFunRural.SetVariable('COD_CADASTRO',FNotaEntradaParam.Fm5Cadastro.MeCadastro.text)
          else
            QRFunRural.SetVariable('COD_CADASTRO',Null);
            
          if Trim(FNotaEntradaParam.ME5DtInicial.text) <>'' then
            begin
              QRFunRural.SetVariable('DT_INICIAL',StrToDate(FNotaEntradaParam.ME5DtInicial.text));
              DtInicial:=FNotaEntradaParam.ME5DtInicial.text;
            end
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Inicial');

           if Trim(FNotaEntradaParam.ME5DtFinal.text)<>'' then
            begin
              QRFunRural.SetVariable('DT_FINAL',StrToDate(FNotaEntradaParam.ME5DtFinal.text));
              DtFinal:=FNotaEntradaParam.ME5DtFinal.text;
            end
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Final');

          if FNotaEntradaParam.RG6ExibirSerieCon.ItemIndex = 0 then
            QRFunRural.SetVariable('SERIE_CON', Null)
          else
            QRFunRural.SetVariable('SERIE_CON', 'CON');

          QRFunRural.Open;
          if FRFunruralPeriodo = Nil then
            FRFunRuralPeriodo:=TFRFunRuralPeriodo.Create(Application);
          if FNotaEntradaParam.Rg6Agrupamento.ItemIndex = 0 then
          begin
            FRFunruralPeriodo.QRBand4.Enabled := True;
            FRFunruralPeriodo.QRBand6.Enabled := True;
          end
          else
          begin
            FRFunruralPeriodo.QRBand4.Enabled := False;
            FRFunruralPeriodo.QRBand6.Enabled := False;
          end;
          FRFunRuralPeriodo.QRLTitulo.Caption:='Relação de FunRural no Período de:'+DtInicial+' até:'+DtFinal;
          if FNotaEntradaParam.RGPreview.ItemIndex=0  then
            FRFunRuralPeriodo.QRPrimario.Preview
          else
            FRFunRuralPeriodo.QRPrimario.Print;
          QRFunRural.Close;
        end;
    end;
end;

procedure TFNotaAgricolaCad.EmissoCpiadeNota1Click(Sender: TObject);
var
  wLote: Integer;
  Modelo,wResult: String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text),'AGRICOLA');
  Modelo := DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value;
  if Modelo <> '55' then
    FNotaImpressao.EmiteNF(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value)
  else
  begin
    wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
    if wResult = '' then
      wLote := 0
    else
      wLote := StrToInt(wResult);
    if (not DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
      with DMNfe do
      begin
        SetaNfe(DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.Value, True);
        if QNfeind_aprovado.Value then
        begin
          if FNfEletronicaLoteCons = nil then
            FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
          FNfEletronicaLoteCons.CarregaNota(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value);
          FNfEletronicaLoteCons.Foco := nfDanfe;
          FNfEletronicaLoteCons.ShowModal;

          Exit;
        end;

        EmissaoNfe(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value,wLote,true);
        DMOracle.DBCemapa.Commit;

      end
    else
      FNotaImpressao.EmiteNF(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value,'',wLote,true);
  end;
end;

procedure TFNotaAgricolaCad.TransferenciaSaldoaFixar1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaTransferenciaFixar = nil then
    FNotaTransferenciaFixar:= TFNotaTransferenciaFixar.Create(Application);
  FNotaTransferenciaFixar.showModal;
end;

procedure TFNotaAgricolaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (13);
end;

procedure TFNotaAgricolaCad.RelatriodeFixaes1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME6Filial.Text),'AGRICOLA');
      with DMNotaEntrada do
        begin
          QRRelatorioFixacao.Close;
          if Trim(FNotaEntradaParam.ME6Filial.text) <>'' then
            QRRelatorioFixacao.SetVariable('FILIAL',FNotaEntradaParam.ME6Filial.text)
          else
            QRRelatorioFixacao.SetVariable('FILIAL',Null);
          if Trim(FNotaEntradaParam.ME6Cadastro.text) <> '' then
            QRRelatorioFixacao.SetVariable('CADASTRO',FNotaEntradaParam.ME6Cadastro.text)
          else
            QRRelatorioFixacao.SetVariable('CADASTRO',Null);
          if Trim(FNotaEntradaParam.ME6Produto.text) <> ''then
            QRRelatorioFixacao.SetVariable('PRODUTO',FNotaEntradaParam.ME6Produto.text)
          else
            QRRelatorioFixacao.SetVariable('PRODUTO',Null);
          if Trim(FNotaEntradaParam.ME6DtInicial.text) <>'' then
             QRRelatorioFixacao.SetVariable('DT_INICIAL',StrToDate(FNotaEntradaParam.ME6DtInicial.text))
          else
          begin
            FNotaEntradaParam.ME6DtInicial.SetFocus;
            raise exception.Create('Data Inicial não pode ficar em branco!');
          end;
          if Trim(FNotaEntradaParam.ME6DtFinal.text)<>'' then
             QRRelatorioFixacao.SetVariable('DT_FINAL',StrToDate(FNotaEntradaParam.ME6DtFinal.text))
          else
          begin
            FNotaEntradaParam.ME6DtFinal.SetFocus;
            raise exception.Create('Data Final não pode ficar em branco!');
          end;

          if FNotaEntradaParam.RG6TipoFixacao.ItemIndex = 0 then
          begin
            QRRelatorioFixacao.SetVariable('Fixar_Emp','F');
            QRRelatorioFixacao.SetVariable('Fixar_Outras',Null);
          end
          else
          begin
            QRRelatorioFixacao.SetVariable('Fixar_Outras','F');
            QRRelatorioFixacao.SetVariable('Fixar_Emp',Null);
          end;

          QRRelatorioFixacao.Open;

          if FRRelatorioFixacao = Nil then
            FRRelatorioFixacao:=TFRRelatorioFixacao.Create(Application);

         FRRelatorioFixacao.QRLTitulo.Caption:='Relatório de Fixação no Período de '+(FNotaEntradaParam.ME6DtInicial.text)+
         ' até '+(FNotaEntradaParam.ME6DtFinal.text);
         FRRelatorioFixacao.QRLEmpresa.Caption:='Empresa:'+(FNotaEntradaParam.Ed6Filial.text);
         if (DMParamSistema.CodEmpresa = 'INOVAR') then
         begin
           FRRelatorioFixacao.QRLabel12.Caption := 'V. Liquido'; //Caption DPI
           FRRelatorioFixacao.QRDBText9.DataField := 'VAL_LIQUIDO';
           FRRelatorioFixacao.QRExpr3.Expression := 'SUM(QRRelatorioFixacao.VAL_LIQUIDO)';
         end;
         if FNotaEntradaParam.RGPreview.ItemIndex=0  then
            FRRelatorioFixacao.QRPrimario.Preview
         else
            FRRelatorioFixacao.QRPrimario.Print;
         QRRelatorioFixacao.Close;
        end;
    end;
end;
procedure TFNotaAgricolaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMNotaEntrada.PContabiliza_Extra := 'N';  // ROTINA DE CONTABILIZACAO MENSAL ROTINA EXTRA
  DbEdit5.SetFocus;
end;

procedure TFNotaAgricolaCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Exclusão' );
  if MessageDlg('Apagar esta Nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (not DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
    begin
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      if DMFilial.QFilialIND_SISTEMA_NFE.Value = 2 then
      begin
        DMNfe.SetaNfe(DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.Value);
        if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
          if (MessageDlg('Essa nota está registrada na SEFAZ.'+#13+#10+
              'A exclusão dela é ALTAMENTE DESACONSELHADA.'+#13+#10+
              'Deseja excluir mesmo assim?', mtWarning, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
            Exit;
      end;
    end;
    DMNotaEntrada.ExcluiNota;
  end;
end;

procedure TFNotaAgricolaCad.FechamentodeCereais1Click(Sender: TObject);
Var wFormaPagto : String;
begin
  inherited;
 if FNotaEntradaParam = Nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[7].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME7_Filial.Text),'AGRICOLA');
      if Trim(FNotaEntradaParam.ME7_DataI.text) = ' ' then
       begin
         FNotaEntradaParam.ME7_DataI.SetFocus;
         raise exception.Create('Data Inicial não pode ficar em branco!');
       end;
      if Trim(FNotaEntradaParam.ME7_DataF.text) = ' ' then
       begin
         FNotaEntradaParam.ME7_DataF.SetFocus;
         raise exception.Create('Data Final não pode ficar em branco!');
       end;
      with DMNotaEntrada do
        begin
          QRFechamentoCereais.Close;
          QRFechamentoCereais.Sql.Clear;
          QRFechamentoCereais.Sql.Add('SELECT Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,');
          QRFechamentoCereais.Sql.Add('Tb_Produto.NUM_EMBALAGEM,Tb_nota_cab.DT_EMISSAO,Tb_nota_cab.VAL_FUNRURAL,Tb_nota_cab.NUM_NOTA,');
          QRFechamentoCereais.Sql.Add('Tb_nota_cab.COD_OPERACAO,Tb_nota_item.QT_QUANTIDADE,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DPI_TRANSGENICOS,tb_nota_cab.COD_NOTA_CAB ');
          QRFechamentoCereais.Sql.Add('FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_PRODUTO,TB_OPERACAO ');
          If FNotaEntradaParam.Rg7FormaPagto.ItemIndex <> 8 Then
             QRFechamentoCereais.Sql.Add(',TB_CONTA_PAGAR_CAB ');
          QRFechamentoCereais.Sql.Add('WHERE (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB) AND ');
          QRFechamentoCereais.Sql.Add('(Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO) AND ');
          QRFechamentoCereais.Sql.Add('(Tb_operacao.COD_OPERACAO = Tb_nota_cab.COD_OPERACAO) AND ');
          QRFechamentoCereais.Sql.Add('(Tb_produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO)  ');
          If FNotaEntradaParam.Rg7FormaPagto.ItemIndex <> 8 Then
           Begin
             QRFechamentoCereais.Sql.Add(' AND (Tb_nota_cab.COD_NOTA_CAB = TB_CONTA_PAGAR_CAB.COD_NOTA_CAB)');
             Case FNotaEntradaParam.Rg7FormaPagto.ItemIndex Of
               0 : wFormaPagto := 'Bloqueto';
               1 : wFormaPagto := 'Deposito';
               2 : wFormaPagto := 'Cheque';
               3 : wFormaPagto := 'Dinheiro';
               4 : wFormaPagto := 'Debito Automatico';
               5 : wFormaPagto := 'Adiantamento';
               6 : wFormaPagto := 'Devolução';
               7 : wFormaPagto := 'Sem Pagamento';
             End;
             QRFechamentoCereais.Sql.Add(' AND TB_CONTA_PAGAR_CAB.IND_FORMA_PAGAMENTO = ' + chr(39) + wFormaPagto + chr(39));
           End;
          QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'E' + chr(39));
          QRFechamentoCereais.Sql.Add(' AND TB_OPERACAO.IND_COMPRAS = ' +Chr(39) + 'C' + Chr(39));
          QRFechamentoCereais.Sql.Add(' AND TB_PRODUTO.IND_TIPO_PRODUTO = ' + chr(39) + 'AGRICOLA' + chr(39));
          If Trim(FNotaEntradaParam.ME7_Filial.text) <> '' then
             QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.ME7_Filial.text));
          If Trim(FNotaEntradaParam.ME7_Produto.text) <> '' then
             QRFechamentoCereais.Sql.Add(' AND TB_PRODUTO.COD_PRODUTO = ' + Trim(FNotaEntradaParam.ME7_Produto.text));
          If Trim(FNotaEntradaParam.ME7Cadastro.text) <> '' then
             QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.ME7Cadastro.text));
//          If Trim(FNotaEntradaParam.Me7CadastroParceiro.text) <> '' then
//             QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FNotaEntradaParam.Me7CadastroParceiro.text));
          If Trim(FNotaEntradaParam.Me7CadastroParceiro.text) <> '' then
            If Trim(FNotaEntradaParam.Me7CadastroParceiro.text) = '0' then
              QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO IS NULL')
            Else
              QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + FNotaEntradaParam.Me7CadastroParceiro.Text);
          Case FNotaEntradaParam.Rg7Situacao.ItemIndex Of
            0 : QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = ' + CHR(39) + '2' + CHR(39));
            1 : QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = ' + CHR(39) + '1' + CHR(39));
            2 : QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO <> ' + CHR(39) + '3' + CHR(39));
          End;
          If FNotaEntradaParam.Rg7BaixaContratos.ItemIndex = 1 Then
             QRFechamentoCereais.Sql.Add(' AND ((TB_NOTA_CAB.COD_CONTRATO_MOV is null) AND (TB_NOTA_CAB.COD_CONTRATO_GP_MOV is null) AND (TB_NOTA_CAB.IND_BAIXA_CONTRATO_CF = ' + QuotedStr('N') + ') ) ');
          QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + CHR(39) + FNotaEntradaParam.ME7_DataI.text + CHR(39));
          QRFechamentoCereais.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + CHR(39) + FNotaEntradaParam.ME7_DataF.text + CHR(39));
          QRFechamentoCereais.Sql.Add(' ORDER BY TB_PRODUTO.COD_PRODUTO,TB_NOTA_CAB.DT_EMISSAO,TB_NOTA_CAB.NUM_NOTA ');
          QRFechamentoCereais.Open;

          If FNotaEntradaParam.Rg7TipoRelatorio.ItemIndex = 0 Then
           Begin
             If FRFechamentoCereais = Nil then
               FRFechamentoCereais:=TFRFechamentoCereais.Create(Application);
             FRFechamentoCereais.QRLEmpresa.Caption:='Empresa: '+(FNotaEntradaParam.ED7_Filial.text);
             FRFechamentoCereais.QRLTitulo.Caption:='Relatório de Fechamento de Cereais '+(FNotaEntradaParam.ME7_DataI.text)+
             ' até '+(FNotaEntradaParam.ME7_DataF.text);

             If FNotaEntradaParam.RGPreview.ItemIndex = 0  then
               FRFechamentoCereais.QRPrimario.Preview
             else
                FRFechamentoCereais.QRPrimario.Print;
           End
          Else
             While not(QRFechamentoCereais.Eof) do
             Begin
               If FNotaEntradaParam.RGPreview.ItemIndex = 0  then   //manda direto para a impressora
                  pTipo_Impressao := False
               Else
                  pTipo_Impressao := True;
               DMNotaEntrada.QItemNF.Close;
               DMNotaEntrada.QNotaEntrada.Close;
               DMNotaEntrada.QNotaEntrada.SetVariable('Pk',QRFechamentoCereaisCod_Nota_Cab.Value);
               DMNotaEntrada.QNotaEntrada.Open;
               DMNotaEntrada.QItemNF.Open;
               FNotaAgricolaCad.EmissoReciboFixao1Click(Self);
               QRFechamentoCereais.Next;
             End;
          QRFechamentoCereais.Close;
          pTipo_Impressao := False;
       end;
    end;
end;

procedure TFNotaAgricolaCad.ResumoFechamentodeCereais1Click(
  Sender: TObject);
begin
 inherited;
 if FNotaEntradaParam = Nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[8].TabVisible:=True;
  If FNotaEntradaParam.ShowModal =  mrOk then
   begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME8_Filial.Text),'AGRICOLA');
      with DMNotaEntrada do
       begin
         If Trim(FNotaEntradaParam.ME8_DataI.text) = '' then
         begin
           FNotaEntradaParam.ME8_DataI.SetFocus;
           raise exception.Create('Data Inicial não pode ficar em branco!');
         end;
         If Trim(FNotaEntradaParam.ME8_DataF.text) = '' then
         begin
           FNotaEntradaParam.ME8_DataF.SetFocus;
           raise exception.Create('Data Final não pode ficar em branco!');
         end;
         QRResumoFechaCereais.Close;
         QRResumoFechaCereais.Sql.Clear;
         QRResumoFechaCereais.Sql.Add('SELECT Tb_nota_cab.COD_OPERACAO,Tb_operacao.DESC_OPERACAO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,');
         QRResumoFechaCereais.Sql.Add('Tb_nota_cab.DT_EMISSAO,Tb_produto.NUM_EMBALAGEM,SUM(Tb_nota_cab.VAL_FUNRURAL) AS TOTAL_FUNRURAL,SUM(Tb_nota_item.VAL_DPI_TRANSGENICOS) AS TOTAL_DPI, ');
         QRResumoFechaCereais.Sql.Add('SUM(Tb_nota_item.QT_QUANTIDADE) AS QT_TOTAL,SUM(Tb_nota_item.VAL_TOTAL) AS VALOR_TOTAL ');
         QRResumoFechaCereais.Sql.Add(' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_OPERACAO WHERE ');
         QRResumoFechaCereais.Sql.Add('Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ');
         QRResumoFechaCereais.Sql.Add('Tb_operacao.COD_OPERACAO = Tb_nota_cab.COD_OPERACAO AND ');
         QRResumoFechaCereais.Sql.Add('Tb_produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO AND ');
         QRResumoFechaCereais.Sql.Add('TB_NOTA_CAB.IND_SITUACAO = 2 AND ');
         QRResumoFechaCereais.Sql.Add('TB_OPERACAO.IND_COMPRAS = ' + Chr(39) + 'C' + Chr(39) + ' AND ');
         QRResumoFechaCereais.Sql.Add('TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + Chr(39) + 'E' + Chr(39));
         QRResumoFechaCereais.Sql.Add(' AND TB_PRODUTO.IND_TIPO_PRODUTO = ' + chr(39) + 'AGRICOLA' + chr(39));
         If Trim(FNotaEntradaParam.ME8_Filial.text) <> '' then
            QRResumoFechaCereais.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.ME8_Filial.text));
         If Trim(FNotaEntradaParam.ME8_Produto.text) <> '' then
            QRResumoFechaCereais.Sql.Add(' AND TB_PRODUTO.COD_PRODUTO = ' + Trim(FNotaEntradaParam.ME8_Produto.text));
         If Trim(FNotaEntradaParam.ME8Cadastro.text) <> '' then
            QRResumoFechaCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.ME8Cadastro.text));
         If Trim(FNotaEntradaParam.Me8CadastroParceiro.text) <> '' then
            QRResumoFechaCereais.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FNotaEntradaParam.Me8CadastroParceiro.text));
         If FNotaEntradaParam.Rg8BaixaContratos.ItemIndex = 1 Then
            QRResumoFechaCereais.Sql.Add(' AND ((TB_NOTA_CAB.COD_CONTRATO_MOV is null) AND (TB_NOTA_CAB.COD_CONTRATO_GP_MOV is null) AND (TB_NOTA_CAB.IND_BAIXA_CONTRATO_CF = ' + QuotedStr('N') + ') ) ');
         QRResumoFechaCereais.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + FNotaEntradaParam.ME8_DataI.text + chr(39));
         QRResumoFechaCereais.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + FNotaEntradaParam.ME8_DataF.text + chr(39));
         QRResumoFechaCereais.Sql.Add(' GROUP BY Tb_nota_cab.COD_OPERACAO,Tb_operacao.DESC_OPERACAO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_nota_cab.DT_EMISSAO,Tb_produto.NUM_EMBALAGEM ');
         QRResumoFechaCereais.Sql.Add(' ORDER BY Tb_nota_cab.COD_OPERACAO,TB_NOTA_CAB.DT_EMISSAO,Tb_produto.COD_PRODUTO');
         QRResumoFechaCereais.Open;
         If FRResumoFechaCereais = Nil then
            FRResumoFechaCereais:=TFRResumoFechaCereais.Create(Application);
         FRResumoFechaCereais.QRLTitulo.Caption:='Resumo de Fechamento de Cereais '+(FNotaEntradaParam.ME8_DataI.text)+
         ' até '+(FNotaEntradaParam.ME8_DataF.text);
         FRResumoFechaCereais.QRLEmpresa.Caption:='Empresa: '+(FNotaEntradaParam.ED8_Filial.text);
         If FNotaEntradaParam.RGPreview.ItemIndex = 0  then
            FRResumoFechaCereais.QRPrimario.Preview
         else
            FRResumoFechaCereais.QRPrimario.Print;
         QRResumoFechaCereais.Close;
       End;
   end;
end;
procedure TFNotaAgricolaCad.ComprovantedeCompraseVendasImpostoRenda1Click(
  Sender: TObject);
var
  Buscador: TBuscador;
  wFilial, wDescFilial: String;
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[9].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME9CodFilial.Text),'AGRICOLA');

      If FNotaEntradaParam.CB9TXT.Checked = True Then
      Begin
        showmessage('Aguarde!');
       with DMImpostoRenda do
         begin
           QRImpostoRenda_Agricola.Close;
           QRImpostoRenda_Vendas.Close;
           QRImpostoRenda_Receb.Close;
           QRImpostoRenda_Adiant.Close;
          if Trim(FNotaEntradaParam.ME9CodFilial.text) <>'' then
           Begin
            QRImpostoRenda_Agricola.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Vendas.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Receb.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Adiant.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
           End
          else
           Begin
            QRImpostoRenda_Agricola.SetVariable('FILIAL',Null);
            QRImpostoRenda_Vendas.SetVariable('FILIAL',Null);
            QRImpostoRenda_Receb.SetVariable('FILIAL',Null);
            QRImpostoRenda_Adiant.SetVariable('FILIAL',Null);
           End;
          if Trim(FNotaEntradaParam.ME9DtInicial.text) <>'' then
           Begin
             QRImpostoRenda_Agricola.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Vendas.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Receb.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Adiant.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
           End
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Inicial');

           if Trim(FNotaEntradaParam.ME9DtFinal.text)<>'' then
            Begin
              QRImpostoRenda_Agricola.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Vendas.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Receb.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Adiant.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
            end
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Final');

         QRImpostoRendaCadastro.Close;
         QRImpostoRendaCadastro.open;
         QRImpostoRendaCadastro.First;
       While not QRImpostoRendaCadastro.Eof do
       Begin
            QRImpostoRenda_Agricola.SetVariable('COD_CADASTRO',QRImpostoRendaCadastroCOD_CADASTRO.Value);
            QRImpostoRenda_Vendas.SetVariable('COD_CADASTRO',QRImpostoRendaCadastroCOD_CADASTRO.Value);
            QRImpostoRenda_Receb.SetVariable('COD_CADASTRO',QRImpostoRendaCadastroCOD_CADASTRO.Value);
            QRImpostoRenda_Adiant.SetVariable('COD_CADASTRO',QRImpostoRendaCadastroCOD_CADASTRO.Value);

          QRImpostoRenda_Agricola.Open;
          QRImpostoRenda_Vendas.Open;
          QRImpostoRenda_Receb.Open;
          QRImpostoRenda_Adiant.Open;

          if FRAgricolaImpostoRenda = Nil then
            FRAgricolaImpostoRenda:=TFRAgricolaImpostoRenda.Create(Application);
          if FRImpostoRenda_Insumos = Nil then
           FRImpostoRenda_Insumos:=TFRImpostoRenda_Insumos.Create(Application);
          if FRImpostoRenda_Financeiro = Nil then
            FRImpostoRenda_Financeiro:=TFRImpostoRenda_Financeiro.Create(Application);
          if FRImpostoRenda_Outros = Nil then
            FRImpostoRenda_Outros:=TFRImpostoRenda_Outros.Create(Application);
          FRAgricolaImpostoRenda.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Insumos.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Financeiro.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Outros.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRAgricolaImpostoRenda.QRLCadastro.Caption:='Cliente: '+QRImpostoRendaCadastroCOD_CADASTRO.Text+ '  '+QRImpostoRendaCadastroNOME.Text;
          FRImpostoRenda_Financeiro.QRLCadastro.Caption:='Cliente: '+QRImpostoRendaCadastroCOD_CADASTRO.Text+ '  '+QRImpostoRendaCadastroNOME.Text;
          FRImpostoRenda_Outros.QRLCadastro.Caption:='Cliente: '+QRImpostoRendaCadastroCOD_CADASTRO.Text+ '  '+QRImpostoRendaCadastroNOME.Text;
          FRImpostoRenda_Insumos.QRLCadastro.Caption:='Cliente: '+QRImpostoRendaCadastroCOD_CADASTRO.Text+ '  '+QRImpostoRendaCadastroNOME.Text;



          FRAgricolaImpostoRenda.QRPrimario.ExportToFilter(TQRAsciiExportFilter.Create('C:\IRAGRICOLA.TXT'));
          FRImpostoRenda_Insumos.QRPrimario.ExportToFilter(TQRAsciiExportFilter.Create('C:\IRINSUMOS.TXT'));
          FRImpostoRenda_Financeiro.QRPrimario.ExportToFilter(TQRAsciiExportFilter.Create('C:\IRFINANCEIRO.TXT'));
          FRImpostoRenda_Outros.QRPrimario.ExportToFilter(TQRAsciiExportFilter.Create('C:\IROUTROS.TXT'));
          GeraArquivo;
          QRImpostoRenda_Agricola.Close;
          QRImpostoRenda_Vendas.Close;
          QRImpostoRenda_Receb.Close;
          QRImpostoRenda_Adiant.Close;
          QRImpostoRendaCadastro.Next;
       end;
        ShowMessage('Arquivo Texto Gerado Com Sucesso!');
        QRImpostoRendaCadastro.Close;
      end;
    end
    else

      with DMImpostoRenda do
        begin
          QRImpostoRenda_Agricola.Close;
          QRImpostoRenda_Vendas.Close;
          QRImpostoRenda_Receb.Close;
          QRImpostoRenda_Adiant.Close;
          if Trim(FNotaEntradaParam.ME9CodFilial.text) <>'' then
           Begin
            QRImpostoRenda_Agricola.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Vendas.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Receb.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
            QRImpostoRenda_Adiant.SetVariable('FILIAL',FNotaEntradaParam.ME9CodFilial.text);
           End
          else
           Begin
            QRImpostoRenda_Agricola.SetVariable('FILIAL',Null);
            QRImpostoRenda_Vendas.SetVariable('FILIAL',Null);
            QRImpostoRenda_Receb.SetVariable('FILIAL',Null);
            QRImpostoRenda_Adiant.SetVariable('FILIAL',Null);
           End;
          if Trim(FNotaEntradaParam.ME9DtInicial.text) <>'' then
           Begin
             QRImpostoRenda_Agricola.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Vendas.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Receb.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
             QRImpostoRenda_Adiant.SetVariable('DATA_I',StrToDate(FNotaEntradaParam.ME9DtInicial.text));
           End
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Inicial');

           if Trim(FNotaEntradaParam.ME9DtFinal.text)<>'' then
            Begin
              QRImpostoRenda_Agricola.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Vendas.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Receb.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
              QRImpostoRenda_Adiant.SetVariable('DATA_F',StrToDate(FNotaEntradaParam.ME9DtFinal.text));
            end
          else
            ShowMessage('Atenção! Deve Ser Informado A Data Final');

          if Trim(FNotaEntradaParam.Me9Cadastro.text)<>'' then
           Begin
             QRImpostoRenda_Agricola.SetVariable('COD_CADASTRO',FNotaEntradaParam.Me9Cadastro.text);
             QRImpostoRenda_Vendas.SetVariable('COD_CADASTRO',FNotaEntradaParam.Me9Cadastro.text);
             QRImpostoRenda_Receb.SetVariable('COD_CADASTRO',FNotaEntradaParam.Me9Cadastro.text);
             QRImpostoRenda_Adiant.SetVariable('COD_CADASTRO',FNotaEntradaParam.Me9Cadastro.text);
           end
          else
            ShowMessage('Atenção! Deve Ser Informado O Código Cadastro');

          QRImpostoRenda_Agricola.Open;
          QRImpostoRenda_Vendas.Open;
          QRImpostoRenda_Receb.Open;
          QRImpostoRenda_Adiant.Open;

          if FRAgricolaImpostoRenda = Nil then
            FRAgricolaImpostoRenda:=TFRAgricolaImpostoRenda.Create(Application);
          if FRImpostoRenda_Insumos = Nil then
            FRImpostoRenda_Insumos:=TFRImpostoRenda_Insumos.Create(Application);
          if FRImpostoRenda_Financeiro = Nil then
            FRImpostoRenda_Financeiro:=TFRImpostoRenda_Financeiro.Create(Application);
          if FRImpostoRenda_Outros = Nil then
            FRImpostoRenda_Outros:=TFRImpostoRenda_Outros.Create(Application);
          FRAgricolaImpostoRenda.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Insumos.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Financeiro.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRImpostoRenda_Outros.QRLTitulo.Caption:='Demonstrativo Para Imposto de Renda '+FNotaEntradaParam.ME9DtInicial.text+' até '+FNotaEntradaParam.ME9DtFinal.text;
          FRAgricolaImpostoRenda.QRLCadastro.Caption:='Cliente: '+FNotaEntradaParam.ME9Cadastro.text+' - '+FNotaEntradaParam.Ed9Cadastro.text+' End.: '+DMCadastro.QCadastroConsDESC_ENDERECO.value;
          FRImpostoRenda_Financeiro.QRLCadastro.Caption:='Cliente: '+FNotaEntradaParam.ME9Cadastro.text+' - '+FNotaEntradaParam.Ed9Cadastro.text+' End.: '+DMCadastro.QCadastroConsDESC_ENDERECO.value;
          FRImpostoRenda_Outros.QRLCadastro.Caption:='Cliente: '+FNotaEntradaParam.ME9Cadastro.text+' - '+FNotaEntradaParam.Ed9Cadastro.text+' End.: '+DMCadastro.QCadastroConsDESC_ENDERECO.value;
          FRImpostoRenda_Insumos.QRLCadastro.Caption:='Cliente: '+FNotaEntradaParam.ME9Cadastro.text+' - '+FNotaEntradaParam.Ed9Cadastro.text+' End.: '+DMCadastro.QCadastroConsDESC_ENDERECO.value;

         if (DMParamSistema.CodEmpresa = 'INOVAR') then         //adc dados da empresa no cabeçalho do rel - vitor 03/03/21
         begin
           FRAgricolaImpostoRenda.QRLEndereco.Enabled := true;
           FRImpostoRenda_Insumos.QRLEndereco.Enabled := true;
           FRImpostoRenda_Financeiro.QRLEndereco.Enabled := true;
           FRImpostoRenda_Outros.QRLEndereco.Enabled := true;

           Buscador := TBuscador.Create;
           Buscador.Limpa;
           Buscador.Adiciona('DESC_FILIAL','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('NUM_CGC','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('DESC_TELEFONE','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('DESC_ENDERECO','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('DESC_CIDADE','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('COD_ESTADO','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Adiciona('DESC_CEP','TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaEntradaParam.ME9CodFilial.text));
           Buscador.Buscar;

           wFilial:= Buscador.Proximo+' CNPJ: '+Buscador.Proximo+ ' FONE: '+Buscador.Proximo;
           wDescFilial:= Buscador.Proximo + ' ' + Buscador.Proximo + ' - ' + Buscador.Proximo + ' CEP: ' + Buscador.Proximo;

           FRAgricolaImpostoRenda.QRLEmpresa.Caption:=  wFilial;
           FRImpostoRenda_Insumos.QRLEmpresa.Caption:=  wFilial;
           FRImpostoRenda_Financeiro.QRLEmpresa.Caption:= wFilial;
           FRImpostoRenda_Outros.QRLEmpresa.Caption:=  wFilial;

           FRAgricolaImpostoRenda.QRLEndereco.Caption:=  wDescFilial;
           FRImpostoRenda_Insumos.QRLEndereco.Caption:=  wDescFilial;
           FRImpostoRenda_Financeiro.QRLEndereco.Caption:= wDescFilial;
           FRImpostoRenda_Outros.QRLEndereco.Caption:=  wDescFilial;

         end;


          if FNotaEntradaParam.RGPreview.ItemIndex=0  then
            FRAgricolaImpostoRenda.QRCompositeReport1.Preview
          else
            FRAgricolaImpostoRenda.QRCompositeReport1.Print;
          QRImpostoRenda_Agricola.Close;
          QRImpostoRenda_Vendas.Close;
          QRImpostoRenda_Receb.Close;
          QRImpostoRenda_Adiant.Close;
        end;
    end;
end;

procedure TFNotaAgricolaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMNotaEntrada do
  begin
    QNotaEntrada.Close;
    QItemNF.Close;
  End;
  Action := CaFree;
  FNotaAgricolaCad := Nil;
end;

procedure TFNotaAgricolaCad.SBAlterarClick(Sender: TObject);
begin
  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value <> '1' Then
     Raise Exception.Create('Somente Notas Digitas Pode Ser Alteradas');
  inherited;

end;

procedure TFNotaAgricolaCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMNotaEntrada.QNotaEntradaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFNotaAgricolaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BtCadastro.Enabled:=True;
      BtConsOperacao.Enabled:=True;
      BtConsMensagem.Enabled:=True;
      BtParceiro.Enabled:=True;
    end
  else
    begin
      BtCadastro.Enabled:=False;
      BtConsOperacao.Enabled:=False;
      BtConsMensagem.Enabled:=False;
      BtParceiro.Enabled:=False;
    end;
  btSerieCons.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
end;

procedure TFNotaAgricolaCad.ValorFixaesNoPeriodoPorCliente1Click(
  Sender: TObject);
begin
  inherited;
  if FRomaneioParam = Nil then
    FRomaneioParam:= TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FRomaneioParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FRomaneioParam.Me6CodFilial.Text),'AGRICOLA');
      with DMRomaneioAgricola do
        begin
          QRFixacao_Cliente.Close;
          if Trim(FRomaneioParam.Me6CodFilial.Text) <>'' then
            QRFixacao_Cliente.SetVariable('FILIAL',FRomaneioParam.Me6CodFilial.text)
          else
            QRFixacao_Cliente.SetVariable('FILIAL',Null);
          if Trim(FRomaneioParam.Me6CodCadastro.text) <> '' then
            QRFixacao_Cliente.SetVariable('CADASTRO',FRomaneioParam.Me6CodCadastro.text)
          else
            QRFixacao_Cliente.SetVariable('CADASTRO',Null);
          if Trim(FRomaneioParam.ME6DtInicial.text) <> '' then
             QRFixacao_Cliente.SetVariable('DT_INICIAL',StrToDate(FRomaneioParam.Me6DtInicial.text))
          else
          begin
            FRomaneioParam.ME6DtInicial.SetFocus;
            Raise exception.Create('Data Inicial não pode ficar em branco!');
          end;
          if Trim(FRomaneioParam.ME6DtFinal.text)<>'' then
             QRFixacao_Cliente.SetVariable('DT_FINAL',StrToDate(FRomaneioParam.ME6DtFinal.text))
          else
          begin
            FRomaneioParam.ME6DtFinal.SetFocus;
            Raise exception.Create('Data Final não pode ficar em branco!');
          end;
          Case FRomaneioParam.Rg6Tipo.ItemIndex of
            0 : QRFixacao_Cliente.SetVariable('TIPO_PESSOA','F');
            1 : QRFixacao_Cliente.SetVariable('TIPO_PESSOA','J');
            2 : QRFixacao_Cliente.SetVariable('TIPO_PESSOA',Null);
          End;
          Case FRomaneioParam.Rg6TipoNota.ItemIndex of
            0 : QRFixacao_Cliente.SetVariable('IND_FIXAR_EMPRESA','E');
            1 : QRFixacao_Cliente.SetVariable('IND_FIXAR_EMPRESA','F');
            2 : QRFixacao_Cliente.SetVariable('IND_FIXAR_EMPRESA',Null);
          End;
          QRFixacao_Cliente.Open;

          if FrRomaneioFixacaoCliente = Nil then
            FrRomaneioFixacaoCliente:=TFrRomaneioFixacaoCliente.Create(Application);

         FrRomaneioFixacaoCliente.QRLTitulo.Caption:='Relatório de Fixação no Período de '+(FRomaneioParam.ME6DtInicial.text)+
         ' até '+(FRomaneioParam.ME6DtFinal.text);
         FrRomaneioFixacaoCliente.QRLEmpresa.Caption:='Empresa:'+(FRomaneioParam.Ed6Filial.text);

         if FRomaneioParam.RGPreview.ItemIndex=0  then
            FrRomaneioFixacaoCliente.QRPrimario.Preview
         else
            FrRomaneioFixacaoCliente.QRPrimario.Print;
         QRFixacao_Cliente.Close;
        end;
    end;

end;

procedure TFNotaAgricolaCad.MovimentoEstoque1Click(Sender: TObject);
var wSQL :String;
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[10].TabVisible:=True;
  FNotaEntradaParam.Me10EstoqueInicial.Visible := False;
  FNotaEntradaParam.Label13.Visible := False;
  FNotaEntradaParam.Me10EstoqueInicial.Enabled := False;
  FNotaEntradaParam.Label13.Enabled := False;
  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    with DMEstoque do
    begin
      QRMovEstoqueProduto.close;
      if trim(FNotaEntradaParam.ME10Filial.Text)<>'' then
        QRMovEstoqueProduto.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaEntradaParam.ME10Filial.Text)))
      else
        QRMovEstoqueProduto.SetVariable('COD_FILIAL',Null);

      if trim(FNotaEntradaParam.Me10Cadastro.Text)<>'' then
        QRMovEstoqueProduto.SetVariable('COD_CADASTRO_PARCEIRO', StrToInt(trim(FNotaEntradaParam.Me10Cadastro.Text)))
      else
        QRMovEstoqueProduto.SetVariable('COD_CADASTRO_PARCEIRO', Null);

      if trim(FNotaEntradaParam.ME10Produto.Text)<>'' then
         QRMovEstoqueProduto.SetVariable('COD_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO IN ('+Trim(FNotaEntradaParam.Me10Operacao.Text)+')')
      else
        QRMovEstoqueProduto.SetVariable('COD_PRODUTO','1=1');

      if trim(FNotaEntradaParam.ME10DtInicial.Text) <> '' then
        QRMovEstoqueProduto.SetVariable('DT_INICIAL',StrToDate(FNotaEntradaParam.ME10DtInicial.Text))
      else
      begin
        //FNotaEntradaParam.ME10DtInicial.SetFocus;
        Raise exception.Create('Data Inicial não pode ficar em branco!');
      end;

      if trim(FNotaEntradaParam.ME10DtFinal.Text)<>'' then
        QRMovEstoqueProduto.SetVariable('DT_FINAL',StrToDate(FNotaEntradaParam.ME10DtFinal.Text))
      else
      begin
        //FNotaEntradaParam.ME10DtFinal.SetFocus;
        Raise exception.Create('Data Final não pode ficar em branco!');
      end;
      If FNotaEntradaParam.Cb10TipoProduto.ItemIndex = 0 Then
         QRMovEstoqueProduto.SetVariable('IND_TIPO_PRODUTO',Null)
      Else
         QRMovEstoqueProduto.SetVariable('IND_TIPO_PRODUTO',Trim(FNotaEntradaParam.Cb10TipoProduto.Text));

      If Trim(FNotaEntradaParam.Me10Operacao.Text) <> '' Then
         QRMovEstoqueProduto.SetVariable('OPERACAO','TB_NOTA_CAB.COD_OPERACAO IN ('+Trim(FNotaEntradaParam.Me10Operacao.Text)+')')
      Else
         QRMovEstoqueProduto.SetVariable('OPERACAO','1=1');
      if FNotaEntradaParam.RG10Opcao.ItemIndex = 0 then
        wSQL := '((TB_OPERACAO.IND_ESTOQUE = ' + chr(39) + 'S' + chr(39) +
                ') AND ((TB_OPERACAO.IND_COMPRAS = ' + chr(39) + 'C' + chr(39) +
                ') OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + chr(39) + 'E' + chr(39) +
                ') OR (TB_OPERACAO.IND_DEPOSITO_EMPRESA = ' + chr(39) + 'E' + chr(39) +')))'
      else
        wSQL := '1 = 1';

      QRMovEstoqueProduto.SetVariable('SQL', wSQL);

      QRMovEstoqueProduto.Open;

      if FRMovEstoqueProduto = nil then
        FRMovEstoqueProduto := TFRMovEstoqueProduto.Create(Application);

      FRMovEstoqueProduto.QRLParceiro.Caption := 'Parceiro: ' + FNotaEntradaParam.Ed10Cadastro.Text;

      if FNotaEntradaParam.RG10AnaliticoSintetico.ItemIndex = 0 then
        FRMovEstoqueProduto.DetailBand1.Enabled := true
      else
        FRMovEstoqueProduto.DetailBand1.Enabled := false;

      FRMovEstoqueProduto.QRLPeriodo.Caption := 'De '+FNotaEntradaParam.ME10DtInicial.Text+' à '+FNotaEntradaParam.ME10DtFinal.Text;
      FRMovEstoqueProduto.QRLFilial.Caption := 'Filial:'+ FNotaEntradaParam.Ed10Filial.Text;
      if FNotaEntradaParam.RGPreview.ItemIndex=0  then
        FRMovEstoqueProduto.QRPrimario.Preview
      else
        FRMovEstoqueProduto.QRPrimario.Print;

      QRMovEstoqueProduto.Close;
    end;
  end;
end;

procedure TFNotaAgricolaCad.RelaoEstoqueemOutrosArmazens1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[10].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    with DMEstoque do
    begin
      QRMovEstoqueProduto1.close;
      if trim(FNotaEntradaParam.ME10DtInicial.Text) <> '' then
        QRMovEstoqueProduto1.SetVariable('DT_RECEBIMENTO_INIC',StrToDate(FNotaEntradaParam.ME10DtInicial.Text))
      else
      begin
        FNotaEntradaParam.ME10DtInicial.SetFocus;
        Raise exception.Create('Data Inicial não pode ficar em branco!');
      end;
      if trim(FNotaEntradaParam.ME10DtFinal.Text)<>'' then
        QRMovEstoqueProduto1.SetVariable('DT_RECEBIMENTO_FIM',StrToDate(FNotaEntradaParam.ME10DtFinal.Text))
      else
      begin
        FNotaEntradaParam.ME10DtFinal.SetFocus;
        Raise exception.Create('Data Final não pode ficar em branco!');
      end;
      If FNotaEntradaParam.Cb10TipoProduto.ItemIndex = 0 Then
         QRMovEstoqueProduto1.SetVariable('IND_TIPO_PRODUTO',Null)
      Else
         QRMovEstoqueProduto1.SetVariable('IND_TIPO_PRODUTO',Trim(FNotaEntradaParam.Cb10TipoProduto.Text));
      If FNotaEntradaParam.Rg10Saldo.ItemIndex = 0 Then
       Begin
         QRMovEstoqueProduto1.SetVariable('QT_REF_OUT',Null);
         QRMovEstoqueProduto1.SetVariable('QT_REF_EMP',Null);
       End
      else
       Begin
         QRMovEstoqueProduto1.SetVariable('QT_REF_OUT',0);
         QRMovEstoqueProduto1.SetVariable('QT_REF_EMP',0);
       End;
      QRMovEstoqueProduto1.Open;

      if FrEstoqueArmazens = nil then
        FrEstoqueArmazens := TFrEstoqueArmazens.Create(Application);

      FrEstoqueArmazens.QRLPeriodo.Caption := 'De '+FNotaEntradaParam.ME10DtInicial.Text+' à '+FNotaEntradaParam.ME10DtFinal.Text;

      if FNotaEntradaParam.RGPreview.ItemIndex=0  then
        FrEstoqueArmazens.QRPrimario.Preview
      else
        FrEstoqueArmazens.QRPrimario.Print;

      QRMovEstoqueProduto.Close;
    end;
  end;

end;

procedure TFNotaAgricolaCad.FechamentodeCereaisCPFUF1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = nil then
    FNotaEntradaParam:= TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[7].TabVisible:=True;
  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.ME7_Filial.Text),'AGRICOLA');
    if Trim(FNotaEntradaParam.ME7_DataI.text) = '' then
      raise exception.Create('Data Inicial não pode ficar em branco!');
    if Trim(FNotaEntradaParam.ME7_DataF.text) = '' then
      raise exception.Create('Data Final não pode ficar em branco!');
    with DMNotaEntrada do
    begin
      QRFechamentoCereais1.Close;
      QRFechamentoCereais1.Sql.Clear;
      QRFechamentoCereais1.Sql.Add('SELECT Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,');
      QRFechamentoCereais1.Sql.Add('Tb_Produto.NUM_EMBALAGEM,Tb_nota_cab.DT_EMISSAO,tb_cadastro.NUM_CGC_CPF,Tb_nota_cab.NUM_NOTA,');
      QRFechamentoCereais1.Sql.Add('Tb_Cadastro.COD_ESTADO,Tb_nota_item.QT_QUANTIDADE,Tb_nota_item.VAL_TOTAL,tb_nota_cab.COD_NOTA_CAB ');
      QRFechamentoCereais1.Sql.Add('FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_PRODUTO,TB_OPERACAO ');
      QRFechamentoCereais1.Sql.Add('WHERE (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB) AND ');
      QRFechamentoCereais1.Sql.Add('(Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO) AND ');
      QRFechamentoCereais1.Sql.Add('(Tb_operacao.COD_OPERACAO = Tb_nota_cab.COD_OPERACAO) AND ');
      QRFechamentoCereais1.Sql.Add('(Tb_produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO)');
      QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'E' + chr(39));
      QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.IND_MILHAGEM = ' + chr(39) + 'NAO' + chr(39));  // NOTAS MARCADAS PARA NAO SAIR NESTE RELATORIO ESTARAO COM SIM
      QRFechamentoCereais1.Sql.Add(' AND TB_OPERACAO.IND_COMPRAS = ' + chr(39) + 'C' + chr(39));
      QRFechamentoCereais1.Sql.Add(' AND TB_PRODUTO.IND_TIPO_PRODUTO = ' + chr(39) + 'AGRICOLA' + chr(39));
      if Trim(FNotaEntradaParam.ME7_Filial.text) <> '' then
        QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.ME7_Filial.text));
      if Trim(FNotaEntradaParam.ME7_Produto.text) <> '' then
        QRFechamentoCereais1.Sql.Add(' AND TB_PRODUTO.COD_PRODUTO = ' + Trim(FNotaEntradaParam.ME7_Produto.text));
      if Trim(FNotaEntradaParam.ME7Cadastro.text) <> '' then
        QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.ME7Cadastro.text));
      if Trim(FNotaEntradaParam.Me7CadastroParceiro.text) <> '' then
        QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FNotaEntradaParam.Me7CadastroParceiro.text));
      case FNotaEntradaParam.Rg7Situacao.ItemIndex of
        0 : QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = ' + CHR(39) + '2' + CHR(39));
        1 : QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = ' + CHR(39) + '1' + CHR(39));
        2 : QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO <> ' + CHR(39) + '3' + CHR(39));
      end;
      if DmParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
        QRFechamentoCereais1.Sql.Add(' AND TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'F'+ CHR(39));
      if FNotaEntradaParam.Rg7BaixaContratos.ItemIndex = 1 Then
        QRFechamentoCereais1.Sql.Add(' AND ((TB_NOTA_CAB.COD_CONTRATO_MOV is null) AND (TB_NOTA_CAB.COD_CONTRATO_GP_MOV is null)) ');
      QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + CHR(39) + FNotaEntradaParam.ME7_DataI.text + CHR(39));
      QRFechamentoCereais1.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + CHR(39) + FNotaEntradaParam.ME7_DataF.text + CHR(39));
      QRFechamentoCereais1.Sql.Add(' ORDER BY TB_PRODUTO.COD_PRODUTO,TB_NOTA_CAB.DT_EMISSAO,TB_NOTA_CAB.NUM_NOTA ');
      QRFechamentoCereais1.Open;
      if FRFechamentoCereais1 = nil then
        FRFechamentoCereais1:=TFRFechamentoCereais1.Create(Application);
      if Trim(FNotaEntradaParam.ED7_Filial.Text) = 'Todos' then
        FRFechamentoCereais1.QRLEmpresa.Caption:='Empresa: '+DMParamSistema.QParamSistemaCOD_EMPRESA.Text
      else
        FRFechamentoCereais1.QRLEmpresa.Caption:='Empresa: '+(FNotaEntradaParam.ED7_Filial.text);
      FRFechamentoCereais1.QRLTitulo.Caption:='Relatório de Fechamento de Cereais (CPF/UF) '+(FNotaEntradaParam.ME7_DataI.text)+
                                              ' até '+(FNotaEntradaParam.ME7_DataF.text);
      if FNotaEntradaParam.RGPreview.ItemIndex = 0  then
        FRFechamentoCereais1.QRPrimario.Preview
      else
        FRFechamentoCereais1.QRPrimario.Print;
      QRFechamentoCereais1.Close;
    end;
  end;
end;

procedure TFNotaAgricolaCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMNotaEntrada.QNotaEntrada;
end;

procedure TFNotaAgricolaCad.ControledesojaRR1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = Nil then
    FRomaneioParam:= TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[8].TabVisible:=True;
  if FRomaneioParam.ShowModal =  mrOk then
  begin

    if FRomaneioParam.RG9Tipo.ItemIndex = 0 then
    begin
      DMRomaneioRel.QRControleSojaRRAnalitico.close;

      if trim(FRomaneioParam.me9Filial.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_FILIAL', strtoint(trim(FRomaneioParam.me9Filial.Text)))
      else
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_FILIAL', null);

      if trim(FRomaneioParam.me9Cadastro.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_CADASTRO', strtoint(trim(FRomaneioParam.me9Cadastro.Text)))
      else
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_CADASTRO', null);

      if trim(FRomaneioParam.me9Produto.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_PRODUTO', strtoint(trim(FRomaneioParam.me9Produto.Text)))
      else
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('COD_PRODUTO', null);

      DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_EMISSAO_INI', null);
      DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_EMISSAO_FIM', null);
      if trim(FRomaneioParam.ME9Inicio.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_RECEBTO_INI', StrToDate(trim(FRomaneioParam.ME9Inicio.Text)))
      else
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_RECEBTO_INI', null);

      if trim(FRomaneioParam.ME9Fim.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_RECEBTO_FIM', StrToDate(trim(FRomaneioParam.ME9Fim.Text)))
      else
        DMRomaneioRel.QRControleSojaRRAnalitico.SetVariable('DT_RECEBTO_FIM', null);

      DMRomaneioRel.QRControleSojaRRAnalitico.open;

      if FRControleSojaRRAnalitico = nil then
        FRControleSojaRRAnalitico := TFRControleSojaRRAnalitico.create(application);

      FRControleSojaRRAnalitico.qrlfilial.Caption := 'Filial: ' +
                                                      FRomaneioParam.me9Filial.Text +
                                                      ' - ' + FRomaneioParam.Ed9Filial.Text + ' - ' +
                                                      DMOracle.FastSelect('NUM_CGC'
                                                                          , 'TB_FILIAL'
                                                                          , 'COD_FILIAL = ' + FRomaneioParam.me9Filial.Text);
      FRControleSojaRRAnalitico.qrlperiodo.Caption := 'Período: ' + FRomaneioParam.ME9Inicio.Text + ' até ' + FRomaneioParam.ME9Fim.Text;

      if FRomaneioParam.RGPreview.ItemIndex = 0 then
        FRControleSojaRRAnalitico.QRPrimario.Preview
      else
        FRControleSojaRRAnalitico.QRPrimario.print;

      DMRomaneioRel.QRControleSojaRRAnalitico.close;
    end
    else
    begin
      DMRomaneioRel.QRControleSojaRRSintetico.close;

      if trim(FRomaneioParam.me9Filial.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_FILIAL', strtoint(trim(FRomaneioParam.me9Filial.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_FILIAL', null);

      if trim(FRomaneioParam.me9Cadastro.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_CADASTRO', strtoint(trim(FRomaneioParam.me9Cadastro.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_CADASTRO', null);

      if trim(FRomaneioParam.me9Produto.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_PRODUTO', strtoint(trim(FRomaneioParam.me9Produto.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('COD_PRODUTO', null);

      if trim(FRomaneioParam.ME9Inicio.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('DT_EMISSAO_INI', strtodate(trim(FRomaneioParam.ME9Inicio.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('DT_EMISSAO_INI', null);

      if trim(FRomaneioParam.ME9Fim.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('DT_EMISSAO_FIM', strtodate(trim(FRomaneioParam.ME9Fim.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSintetico.SetVariable('DT_EMISSAO_FIM', null);

      DMRomaneioRel.QRControleSojaRRSintetico.open;

      DMRomaneioRel.QRControleSojaRRSinteticoReceb.close;

      if trim(FRomaneioParam.me9Filial.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_FILIAL', strtoint(trim(FRomaneioParam.me9Filial.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_FILIAL', null);

      if trim(FRomaneioParam.me9Cadastro.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_CADASTRO', strtoint(trim(FRomaneioParam.me9Cadastro.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_CADASTRO', null);

      if trim(FRomaneioParam.me9Produto.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_PRODUTO', strtoint(trim(FRomaneioParam.me9Produto.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('COD_PRODUTO', null);

      if trim(FRomaneioParam.ME9Inicio.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('DT_EMISSAO_INI', strtodate(trim(FRomaneioParam.ME9Inicio.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('DT_EMISSAO_INI', null);

      if trim(FRomaneioParam.ME9Fim.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('DT_EMISSAO_FIM', strtodate(trim(FRomaneioParam.ME9Fim.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoReceb.SetVariable('DT_EMISSAO_FIM', null);

      DMRomaneioRel.QRControleSojaRRSinteticoReceb.open;

      DMRomaneioRel.QRControleSojaRRFitasSintetico.close;

      if trim(FRomaneioParam.me9Filial.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_FILIAL', strtoint(trim(FRomaneioParam.me9Filial.Text)))
      else
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_FILIAL', null);

      if trim(FRomaneioParam.me9Cadastro.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_CADASTRO', strtoint(trim(FRomaneioParam.me9Cadastro.Text)))
      else
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_CADASTRO', null);

      if trim(FRomaneioParam.me9Produto.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_PRODUTO', strtoint(trim(FRomaneioParam.me9Produto.Text)))
      else
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('COD_PRODUTO', null);

      if trim(FRomaneioParam.ME9Inicio.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('DT_EMISSAO_INI', strtodate(trim(FRomaneioParam.ME9Inicio.Text)))
      else
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('DT_EMISSAO_INI', null);

      if trim(FRomaneioParam.ME9Fim.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('DT_EMISSAO_FIM', strtodate(trim(FRomaneioParam.ME9Fim.Text)))
      else
        DMRomaneioRel.QRControleSojaRRFitasSintetico.SetVariable('DT_EMISSAO_FIM', null);

      DMRomaneioRel.QRControleSojaRRFitasSintetico.open;

      DMRomaneioRel.QRControleSojaRRSinteticoInvent.close;

      if trim(FRomaneioParam.me9Filial.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_FILIAL', strtoint(trim(FRomaneioParam.me9Filial.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_FILIAL', null);

      if trim(FRomaneioParam.me9Cadastro.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_CADASTRO', strtoint(trim(FRomaneioParam.me9Cadastro.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_CADASTRO', null);

      if trim(FRomaneioParam.me9Produto.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_PRODUTO', strtoint(trim(FRomaneioParam.me9Produto.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('COD_PRODUTO', null);

      if trim(FRomaneioParam.ME9Inicio.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('DT_EMISSAO_INI', strtodate(trim(FRomaneioParam.ME9Inicio.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('DT_EMISSAO_INI', null);

      if trim(FRomaneioParam.ME9Fim.Text) <> '' then
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('DT_EMISSAO_FIM', strtodate(trim(FRomaneioParam.ME9Fim.Text)))
      else
        DMRomaneioRel.QRControleSojaRRSinteticoInvent.SetVariable('DT_EMISSAO_FIM', null);

      DMRomaneioRel.QRControleSojaRRSinteticoInvent.open;
      if FRControleSojaRRSintetico = nil then
        FRControleSojaRRSintetico := TFRControleSojaRRSintetico.create(application);
      if FRomaneioParam.RGPreview.ItemIndex = 0 then
      begin
        FRControleSojaRRSintetico.QRLEmpresa.Caption := FRControleSojaRRSintetico.QRLEmpresa.Caption + ' - ' +
                                                        DMOracle.FastSelect('NUM_CGC'
                                                                            , 'TB_FILIAL'
                                                                            , 'COD_FILIAL = ' + FRomaneioParam.me9Filial.Text);
        FRControleSojaRRSintetico.QRPrimario.Preview;
      end
      else
      begin
        FRControleSojaRRSintetico.QRLEmpresa.Caption := FRControleSojaRRSintetico.QRLEmpresa.Caption + ' - ' +
                                                        DMOracle.FastSelect('NUM_CGC'
                                                                            , 'TB_FILIAL'
                                                                            , 'COD_FILIAL = ' + FRomaneioParam.me9Filial.Text);
        FRControleSojaRRSintetico.QRPrimario.print;

      end;

      DMRomaneioRel.QRControleSojaRRSintetico.close;
    end;

  end;
end;

procedure TFNotaAgricolaCad.AcertoNotaaFixarDevoluo1Click(Sender: TObject);
begin
  inherited;
  if FDevolucaoFixar = Nil then
    FDevolucaoFixar:= TFDevolucaoFixar.Create(Application);
  FDevolucaoFixar.ShowModal;
  
end;

procedure TFNotaAgricolaCad.RelatorioComparativoFechamento1Click(
  Sender: TObject);
begin
  inherited;
  If FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[12].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 12;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioRel.QRFechamentoComparativo.close;

    if trim(FRomaneioParam.Fm13Filial.MeFilial.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_FILIAL', Trim(FromaneioParam.Fm13Filial.MeFilial.text))
    else
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_FILIAL', null);

    if trim(FRomaneioParam.Fm13Cadastro.MeCadastro.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_CADASTRO', Trim(FromaneioParam.Fm13Cadastro.MeCadastro.text))
    else
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_CADASTRO', null);

    if Trim(FRomaneioParam.Fm13Produto.MeProduto.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.Fm13Produto.MeProduto.Text))
    else
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_PRODUTO',Null);

    if Trim(FRomaneioParam.Fm13Departamento.MeDepartamento.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_DEPARTAMENTO',Trim(FRomaneioParam.Fm13Departamento.MeDepartamento.Text))
    else
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('COD_DEPARTAMENTO',Null);

    if trim(FRomaneioParam.Me13DtInicial.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('DATA_I', Trim(FromaneioParam.Me13DtInicial.text))
    else
      Raise Exception.Create('Informar a Data Inicial');

    if trim(FRomaneioParam.Me13DtFinal.Text) <> '' then
      DMRomaneioRel.QRFechamentoComparativo.SetVariable('DATA_F', Trim(FromaneioParam.Me13DtFinal.text))
    else
      Raise Exception.Create('Informar a Data Final');

    DMRomaneioRel.QRFechamentoComparativo.open;

    if FRComparativoFechamento = nil then
      FRComparativoFechamento := TFRComparativoFechamento.create(application);

    FRComparativoFechamento.QRLTitulo.Caption := 'Relatório comparativo valor fechamentos x preço dia de '+Trim(FromaneioParam.Me13DtInicial.text) + ' Até '+Trim(FromaneioParam.Me13DtFinal.text);
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FRComparativoFechamento.QRPrimario.Preview
    else
       FRComparativoFechamento.QRPrimario.Print;
    DMRomaneioRel.QRFechamentoComparativo.Close;

  end;
end;

procedure TFNotaAgricolaCad.PosioCompradaVendida1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[14].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 14;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioRel.QRPosicaoCompradaVendida.close;
    DMRomaneioRel.QRPosicaoCompradaVendida_Res.Close;

    if trim(FRomaneioParam.Fm15Filial.MeFilial.Text) <> '' then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_FILIAL', Trim(FromaneioParam.Fm15Filial.MeFilial.text));
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_FILIAL', Trim(FromaneioParam.Fm15Filial.MeFilial.text));
     End
    else
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_FILIAL', null);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_FILIAL', null);
     End;

    if Trim(FRomaneioParam.Fm15Produto.MeProduto.Text) <> '' then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.Fm15Produto.MeProduto.Text));
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.Fm15Produto.MeProduto.Text));
     End
    else
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_PRODUTO',Null);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_PRODUTO',Null);
     End;

    if Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text) <> '' then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_DEPARTAMENTO',Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text));
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_DEPARTAMENTO',Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text));
     End
    else
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('COD_DEPARTAMENTO',Null);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('COD_DEPARTAMENTO',Null);
     End;

    if trim(FRomaneioParam.Me15DataI.Text) <> '' then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('DATAI', Trim(FromaneioParam.Me15DataI.text));
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('DATAI', Trim(FromaneioParam.Me15DataI.text));
     End
    else
      Raise Exception.Create('Informar a Data Inicial');

    if trim(FRomaneioParam.Me15DataF.Text) <> '' then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('DATAF', Trim(FromaneioParam.Me15DataF.text));
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('DATAF', Trim(FromaneioParam.Me15DataF.text));
     End
    else
      Raise Exception.Create('Informar a Data Final');

    If Trim(FRomaneioParam.ME15Classe.Text)= ''   then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('CLASSE',Null);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('CLASSE',Null);
     End
    Else
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('CLASSE',FRomaneioParam.ME15Classe.Text);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('CLASSE',FRomaneioParam.ME15Classe.Text);
     End;

    If (Trim(FRomaneioParam.ME15SubClasse.Text)= '' ) or
       (Trim(FRomaneioParam.ME15SubClasse.Text)= '0') then
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('SUB_CLASSE',Null);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('SUB_CLASSE',Null);
     End
    Else
     Begin
      DMRomaneioRel.QRPosicaoCompradaVendida.SetVariable('SUB_CLASSE',FRomaneioParam.ME15SubClasse.Text);
      DMRomaneioRel.QRPosicaoCompradaVendida_Res.SetVariable('SUB_CLASSE',FRomaneioParam.ME15SubClasse.Text);
     End;
    DMRomaneioRel.QRPosicaoCompradaVendida.open;
    DMRomaneioRel.QRPosicaoCompradaVendida_Res.Open;

    if FrPosicaoCompradaVendida = nil then
      FrPosicaoCompradaVendida := tFrPosicaoCompradaVendida.create(application);
    if FrPosicaoCompradaVendida_Res = nil then
      FrPosicaoCompradaVendida_Res := TFrPosicaoCompradaVendida_Res.create(application);

    FrPosicaoCompradaVendida.QRLTitulo.Caption := 'Relatório posição comprada/vendida '+Trim(FromaneioParam.Me15DataI.text) + ' Até '+Trim(FromaneioParam.Me15DataF.text);
    FrPosicaoCompradaVendida.QRLClasse.Caption := 'Classe: '+Trim(FromaneioParam.Me15Classe.text) + ' SubClasse: '+Trim(FromaneioParam.Me15SubClasse.text)
                                                  + ' '+Trim(FromaneioParam.Ed15Classe.text);
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FrPosicaoCompradaVendida.QRCompositeReport1.Preview
    else
       FrPosicaoCompradaVendida.QRCompositeReport1.Print;
    DMRomaneioRel.QRPosicaoCompradaVendida.Close;
    DMRomaneioRel.QRPosicaoCompradaVendida_Res.Close;
  end;
end;

procedure TFNotaAgricolaCad.ResumoPosiodeCereais1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[14].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 14;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioRel.QRResumoPosicaoCereais.close;

    if trim(FRomaneioParam.Fm15Filial.MeFilial.Text) <> '' then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_FILIAL', Trim(FromaneioParam.Fm15Filial.MeFilial.text))
    else
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_FILIAL', null);

    if Trim(FRomaneioParam.Fm15Produto.MeProduto.Text) <> '' then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.Fm15Produto.MeProduto.Text))
    else
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_PRODUTO',Null);

    if Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text) <> '' then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_DEPARTAMENTO',Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text))
    else
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('COD_DEPARTAMENTO',Null);

    if trim(FRomaneioParam.Me15DataI.Text) <> '' then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('DATAI', Trim(FromaneioParam.Me15DataI.text))
    else
      Raise Exception.Create('Informar a Data Inicial');

    if trim(FRomaneioParam.Me15DataF.Text) <> '' then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('DATAF', Trim(FromaneioParam.Me15DataF.text))
    else
      Raise Exception.Create('Informar a Data Final');

    If Trim(FRomaneioParam.ME15Classe.Text)= ''   then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('CLASSE',Null)
    Else
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('CLASSE',FRomaneioParam.ME15Classe.Text);

    If (Trim(FRomaneioParam.ME15SubClasse.Text)= '' ) or
       (Trim(FRomaneioParam.ME15SubClasse.Text)= '0') then
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('SUB_CLASSE',Null)
    Else
      DMRomaneioRel.QRResumoPosicaoCereais.SetVariable('SUB_CLASSE',FRomaneioParam.ME15SubClasse.Text);

    DMRomaneioRel.QRResumoPosicaoCereais.open;

    if FrResumoPosicaoCereais = nil then
      FrResumoPosicaoCereais := tFrResumoPosicaoCereais.create(application);

    FrResumoPosicaoCereais.QRLTitulo.Caption := 'Resumo posição de cereais '+Trim(FromaneioParam.Me15DataI.text) + ' Até '+Trim(FromaneioParam.Me15DataF.text);
    FrResumoPosicaoCereais.QRLClasse.Caption := 'Classe: '+Trim(FromaneioParam.Me15Classe.text) + ' SubClasse: '+Trim(FromaneioParam.Me15SubClasse.text)
                                                  + ' '+Trim(FromaneioParam.Ed15Classe.text);
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FrResumoPosicaoCereais.QRPrimario.Preview
    else
       FrResumoPosicaoCereais.QRPrimario.Print;
    DMRomaneioRel.QRResumoPosicaoCereais.Close;
  end;

end;

procedure TFNotaAgricolaCad.DBEdit4Change(Sender: TObject);
begin
  inherited;
  If (DMParamsistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL') And
     (Trim(DBEdit4.Text) <> '')  Then // para as notas de devolucao de a fixar
   Begin
     DMOperacao.QOperacao.close;
     DMOperacao.QOperacao.SetVariable('Pk',Trim(DBEdit4.Text));
     DMOperacao.QOperacao.Open;
     If DMOperacao.QOperacaoIND_CONTA_PAGAR.Value = 'N' Then
        DMNotaEntrada.QNotaEntradaIND_CONDICAO_PAGTO.Value := '1';
   End;
end;

procedure TFNotaAgricolaCad.EmissoReciboFixao1Click(Sender: TObject);
var
 x, y: array of string;
 wVl_Outros : Real;
 wX: String;
 tam,i : integer;
begin
  inherited;
  If DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text = '' Then
     Raise Exception.Create('Deve-se ter uma nota para emissão do recibo');
  If DMNotaEntrada.QNotaEntradaIND_SITUACAO.Text = '3' Then
     Raise Exception.Create('Nota esta Cancelada');
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('Pk',DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value);
  DMFilial.QFilial.Open;
  setLength(x, 13); //13 sql diferentes
  setLength(y, 13);

  x[0] := 'SELECT VAL_PAGAMENTO_FIXACAO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[1] := 'SELECT DESC_PAGAMENTO_FIXACAO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[2] := 'SELECT DT_PAGAMENTO_FIXACAO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[3] := 'SELECT DESC_OBSERVACAO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[4] := 'SELECT NUM_RECIBO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[5] := 'SELECT DESC_CONTA_CORRENTE FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[6] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + DMNotaEntrada.QItemNfCod_Produto.Text;
  x[7] := 'SELECT NUM_ACERTO FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[8] := 'SELECT NOME FROM TB_USUARIO,tb_pagamento_fixacao WHERE tb_pagamento_fixacao.cod_usuario=tb_usuario.cod_usuario and COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text;
  x[9] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaEntrada.QNotaEntradaCod_Filial.Text;
  x[10] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaEntrada.QNotaEntradaCod_Filial.Text;
  X[11] := 'SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaEntrada.QNotaEntradaCod_Filial.Text;
  X[12] := 'SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaEntrada.QNotaEntradaCod_Filial.Text;
  DMOracle.BuscaNomes(x, y);

  If y[0] = '' Then
     Exit;
//    Raise Exception.Create('Esta nota nao permite emitir copia de recibo');
   wVl_Outros := 0;
   if Trim(Y[0]) <> '' then
      wVl_Outros := StrToFloat(Trim(Y[0]));
   DMOperacao.QOperacao.Close;
   DMOperacao.QOperacao.SetVariable('Pk',DMNotaEntrada.QNotaEntradaCod_Operacao.Value);
   DMOperacao.QOperacao.Open;
   If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or
      (DMOperacao.QOperacaoInd_Compras.Value       = 'C') Then
   Begin
     If FReciboFixar = nil then
       FReciboFixar := TFReciboFixar.Create(Application);
     FReciboFixar.pCodCadastro:=DMNotaEntrada.QNotaEntradaCod_Cadastro.Value;
     FReciboFixar.pCodFilial:=DMNotaEntrada.QNotaEntradaCod_Filial.Value;
     FReciboFixar.QRLProduto.Caption := y[6];
     If DMNotaEntrada.QItemNFCod_Lote_Tipo.Value <> 1 Then
        FReciboFixar.QRLProduto.Caption := Y[6] + ' Lote/Ph:'+DMNotaEntrada.QItemNFCod_Lote_Tipo.Text;
     if Trim(Y[0]) <> '' then
       FReciboFixar.QRLValOutros.Caption:=FormatFloat('#,##0.00',wVl_Outros)
     else
       FReciboFixar.QRLValOutros.Caption:='0,00';
     FReciboFixar.QRLOutros.Caption:=' ';
     tam := 0;
     if Trim(Y[1]) <> '' then
       begin
         wX:=' ';
         if Length(Y[1])< 67 then
           Tam:=67-Length(Y[1]);
         For i:=1 to tam do
           wX:=wX+'.';
         FReciboFixar.QRLOutros.Caption:=Y[1]+wX;
       end;
     FReciboFixar.QRLNumero.Caption:=Y[7];
     FReciboFixar.QRLDtPagto.Caption:=Y[2];
     FReciboFixar.QRLObservacao.Caption:=y[3];
     FReciboFixar.QRLDataExtenso.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(Y[2]));
     FReciboFixar.QRLContaCorrente.Caption := Y[5];
     DMCadastro.QCadastro.Close;
     DMCadastro.QCadastro.SetVariable('PK',DMNotaEntrada.QNotaEntradaCod_Cadastro.Value);
     DMCadastro.QCadastro.Open;
     FReciboFixar.pCodCadastro:=DMNotaEntrada.QNotaEntradaCod_Cadastro.Value;
     FReciboFixar.QRLDt_Recibo.Caption:=Y[2];
     FReciboFixar.pCodFilial:=DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value;
     FReciboFixar.QRLValorExtenso.Caption:=Bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - DmNotaEntrada.QItemNFVal_Facs.Value - DmNotaEntrada.QItemNfVal_Fethab.Value,'REAL');
     FReciboFixar.QRLValor.Caption:=FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - DmNotaEntrada.QItemNFVal_Facs.Value - DmNotaEntrada.QItemNfVal_Fethab.Value));
     FReciboFixar.QRLData.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(Y[2]));
     FReciboFixar.QRLNRRECIBO.Caption:=Y[4];
     FReciboFixar.QRLComplemento.Caption:='Referente a Venda de '+FormatFloat('#,##0',DmNotaEntrada.QItemNFQT_QUANTIDADE.Value)+' Kgs de ' +Y[6];
     FReciboFixar.QRLUsuario.Caption := 'Usuário:'+Y[8];
     FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+y[9];
     FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+Y[10];
     FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+Y[11];
     FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+Y[11];

{     if FRReciboNFA = Nil then
        FRReciboNFA:=TFRReciboNFA.Create(Application);
     FRReciboNFA.pCodCadastro:=DMNotaEntrada.QNotaEntradaCod_Cadastro.Value;
     FRReciboNFA.QRLDt_Recibo.Caption:=Y[2];
     FRReciboNFA.pCodFilial:=DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value;
     FRReciboNFA.QRLValorExtenso.Caption:=Bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - DmNotaEntrada.QItemNFVal_Facs.Value - DmNotaEntrada.QItemNfVal_Fethab.Value,'REAL');
     FRReciboNFA.QRLValor.Caption:=FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - DmNotaEntrada.QItemNFVal_Facs.Value - DmNotaEntrada.QItemNfVal_Fethab.Value));
     FRReciboNFA.QRLData.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(Y[2]));
     FRReciboNFA.QRLNRRECIBO.Caption:=Y[4];
     FRReciboNFA.QRLComplemento.Caption:='Referente a Venda de '+FormatFloat('#,##0',DmNotaEntrada.QItemNFQT_QUANTIDADE.Value)+' Kgs de ' +Y[6];
     FRReciboNFA.QRLUsuario.Caption := 'Usuário:'+Y[8];
     If pTipo_Impressao = False Then
        QRCompositeReport1.Preview
     Else
        QRCompositeReport1.Print;
     FRReciboNFA.Destroy;
     FRReciboNFA := Nil;
     FReciboFixar.Destroy;
     FReciboFixar := Nil;
}
     If pTipo_Impressao = False Then
        FReciboFixar.QuickRep1.Preview
     Else
        FReciboFixar.QuickRep1.Print;
   End
  Else
   Begin
     If FrReciboMilhoConsumo = nil then
       FrReciboMilhoConsumo := TFrReciboMilhoConsumo.Create(Application);
     FrReciboMilhoConsumo.pCodCadastro:=DMNotaEntrada.QNotaEntradaCod_Cadastro.Value;
     FrReciboMilhoConsumo.pCodFilial:=DMNotaEntrada.QNotaEntradaCod_Filial.Value;
     FrReciboMilhoConsumo.QRLProduto.Caption := DbDirceu4.Text;
     FrReciboMilhoConsumo.QRLNumero.Caption:=Y[6];
     FrReciboMilhoConsumo.QRPrimario.Preview;
     FrReciboMilhoConsumo.Destroy;
     FrReciboMilhoConsumo := Nil;
   End;
end;

procedure TFNotaAgricolaCad.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FReciboFixar.QuickRep1);
  QRCompositeReport1.Reports.Add(FRReciboNFA.QuickRep1);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',FReciboFixar.pCodCadastro);
  DMCadastro.QCadastro.Open;
  FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));

end;

procedure TFNotaAgricolaCad.PosioCompradaVendidaMs1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[14].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 14;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioRel.QRPosicaoCompradaVendida_Mes.Close;

    if trim(FRomaneioParam.Fm15Filial.MeFilial.Text) <> '' then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_FILIAL', Trim(FromaneioParam.Fm15Filial.MeFilial.text))
    else
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_FILIAL', null);

    if Trim(FRomaneioParam.Fm15Produto.MeProduto.Text) <> '' then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.Fm15Produto.MeProduto.Text))
    else
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_PRODUTO',Null);

    if Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text) <> '' then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_DEPARTAMENTO',Trim(FRomaneioParam.Fm15Departamento.MeDepartamento.Text))
    else
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('COD_DEPARTAMENTO',Null);

    if trim(FRomaneioParam.Me15DataI.Text) <> '' then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('DATAI', Trim(FromaneioParam.Me15DataI.text))
    else
      Raise Exception.Create('Informar a Data Inicial');

    if trim(FRomaneioParam.Me15DataF.Text) <> '' then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('DATAF', Trim(FromaneioParam.Me15DataF.text))
    else
      Raise Exception.Create('Informar a Data Final');

    If Trim(FRomaneioParam.ME15Classe.Text)= ''   then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('CLASSE',Null)
    Else
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('CLASSE',FRomaneioParam.ME15Classe.Text);

    If (Trim(FRomaneioParam.ME15SubClasse.Text)= '' ) or
       (Trim(FRomaneioParam.ME15SubClasse.Text)= '0') then
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('SUB_CLASSE',Null)
    Else
      DMRomaneioRel.QRPosicaoCompradaVendida_Mes.SetVariable('SUB_CLASSE',FRomaneioParam.ME15SubClasse.Text);
    DMRomaneioRel.QRPosicaoCompradaVendida_Mes.Open;

    if FrPosicaoCompradaVendidaMes = nil then
      FrPosicaoCompradaVendidaMes := TFrPosicaoCompradaVendidaMes.create(application);

    FrPosicaoCompradaVendidaMes.QRLTitulo.Caption := 'Relatório posição comprada/vendida Mês '+Trim(FromaneioParam.Me15DataI.text) + ' Até '+Trim(FromaneioParam.Me15DataF.text);
    FrPosicaoCompradaVendidaMes.QRLClasse.Caption := 'Classe: '+Trim(FromaneioParam.Me15Classe.text) + ' SubClasse: '+Trim(FromaneioParam.Me15SubClasse.text)
                                                  + ' '+Trim(FromaneioParam.Ed15Classe.text);
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FrPosicaoCompradaVendidaMes.QRPrimario.Preview
    else
       FrPosicaoCompradaVendida.QRPrimario.Print;
    DMRomaneioRel.QRPosicaoCompradaVendida_Mes.Close;
  end;

end;

procedure TFNotaAgricolaCad.RelatrioMovimentaoProdutosRR1Click(
  Sender: TObject);
begin
  inherited;
  If FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[16].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 16;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioRel.QRControleSojaRR.Close;

    if trim(FRomaneioParam.FmFilial17.MeFilial.Text) <> '' then
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_FILIAL', Trim(FromaneioParam.FmFilial17.MeFilial.text))
    else
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_FILIAL', null);

    if Trim(FRomaneioParam.FmProduto17.MeProduto.Text) <> '' then
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_PRODUTO',Trim(FRomaneioParam.FmProduto17.MeProduto.Text))
    else
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_PRODUTO',Null);

    if Trim(FRomaneioParam.FmCadastro17.MeCadastro.Text) <> '' then
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_CADASTRO',Trim(FRomaneioParam.FmCadastro17.MeCadastro.Text))
    else
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_CADASTRO',Null);

    if Trim(FRomaneioParam.FmOperacao17.MeOperacao.Text) <> '' then
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_OPERACAO',Trim(FRomaneioParam.FmOperacao17.MeOperacao.Text))
    else
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_OPERACAO',Null);

    if Trim(FRomaneioParam.FmClasse17.MeClasse.Text) <> '' then
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_OPERACAO',Trim(FRomaneioParam.FmOperacao17.MeOperacao.Text))
    else
      DMRomaneioRel.QRControleSojaRR.SetVariable('COD_OPERACAO',Null);
    DMRomaneioRel.QRControleSojaRR.SetVariable('Dt_Emissao_Ini',FRomaneioParam.FmDatas17.MeDtInicial.Text);
    DMRomaneioRel.QRControleSojaRR.SetVariable('Dt_Emissao_Fim',FRomaneioParam.FmDatas17.MeDtFinal.Text);
    DMRomaneioRel.QRControleSojaRR.Open;
    If FrControleProdutosRR = Nil Then
       FrControleProdutosRR := TFrControleProdutosRR.Create(Application);
    If FRomaneioParam.Rg17Tipo.ItemIndex = 0 Then
       FrControleProdutosRR.QRDetail.Enabled := True
    Else
       FrControleProdutosRR.QRDetail.Enabled := False;
    FrControleProdutosRR.QRLTitulo.Caption := 'Relatório Controle Produtos RR '+Trim(FromaneioParam.FmDatas17.MeDtInicial.Text) + ' Até '+Trim(FromaneioParam.FmDatas17.MeDtFinal.Text);
    FrControleProdutosRR.QRLPeriodo.Caption := 'Filial: '+Trim(FromaneioParam.FMFilial17.EdFilial.text) + ' Produto: '+Trim(FromaneioParam.FmProduto17.EdProduto.text)
                                                  + ' Cadastro:'+Trim(FromaneioParam.FmCadastro17.EdCadastro.text);
    if FromaneioParam.RGPreview.ItemIndex = 0 then
       FrControleProdutosRR.QRPrimario.Preview
    else
       FrControleProdutosRR.QRPrimario.Print;
    DMRomaneioRel.QRControleSojaRR.Close;
  end;


end;

procedure TFNotaAgricolaCad.RelMovEstoqueporProdutoeCliente1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[10].TabVisible:=True;
//  FNotaEntradaParam.Me10EstoqueInicial.Visible := True;
//  FNotaEntradaParam.Label13.Visible := True;
//  FNotaEntradaParam.Me10EstoqueInicial.Enabled := True;
//  FNotaEntradaParam.Label13.Enabled := True;

  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    with DMRomaneioAgricola do
    begin
      QRMovEstoqueCliente.close;
      if trim(FNotaEntradaParam.ME10Filial.Text)<>'' then
        QRMovEstoqueCliente.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaEntradaParam.ME10Filial.Text)))
      else
        QRMovEstoqueCliente.SetVariable('COD_FILIAL',Null);

      if trim(FNotaEntradaParam.Me10Cadastro.Text)<>'' then
        QRMovEstoqueCliente.SetVariable('COD_CADASTRO_PARCEIRO', StrToInt(trim(FNotaEntradaParam.Me10Cadastro.Text)))
      else
        QRMovEstoqueCliente.SetVariable('COD_CADASTRO_PARCEIRO', Null);

      if trim(FNotaEntradaParam.ME10Produto.Text)<>'' then
       Begin
         QRMovEstoqueCliente.SetVariable('COD_PRODUTO','TB_NOTA_ITEM.COD_PRODUTO IN ('+Trim(FNotaEntradaParam.Me10Produto.Text)+')');
         QRMovEstoqueCliente.SetVariable('COD_PRODUTO1','TB_ROMANEIO_AGRICOLA.COD_PRODUTO IN ('+Trim(FNotaEntradaParam.Me10Produto.Text)+')');
       End
      else
       Begin
         QRMovEstoqueCliente.SetVariable('COD_PRODUTO','1=1');
         QRMovEstoqueCliente.SetVariable('COD_PRODUTO1','1=1');
       End;
      if trim(FNotaEntradaParam.ME10DtInicial.Text) <> '' then
        QRMovEstoqueCliente.SetVariable('DT_INICIAL',StrToDate(FNotaEntradaParam.ME10DtInicial.Text))
      else
      begin
        //FNotaEntradaParam.ME10DtInicial.SetFocus;
        Raise exception.Create('Data Inicial não pode ficar em branco!');
      end;

      if trim(FNotaEntradaParam.ME10DtFinal.Text)<>'' then
        QRMovEstoqueCliente.SetVariable('DT_FINAL',StrToDate(FNotaEntradaParam.ME10DtFinal.Text))
      else
      begin
        //FNotaEntradaParam.ME10DtFinal.SetFocus;
        Raise exception.Create('Data Final não pode ficar em branco!');
      end;
      If FNotaEntradaParam.Cb10TipoProduto.ItemIndex = 0 Then
         QRMovEstoqueCliente.SetVariable('IND_TIPO_PRODUTO',Null)
      Else
         QRMovEstoqueCliente.SetVariable('IND_TIPO_PRODUTO',Trim(FNotaEntradaParam.Cb10TipoProduto.Text));

      If Trim(FNotaEntradaParam.Me10Operacao.Text) <> '' Then
         QRMovEstoqueCliente.SetVariable('OPERACAO','TB_NOTA_CAB.COD_OPERACAO IN ('+Trim(FNotaEntradaParam.Me10Operacao.Text)+')')
      Else
         QRMovEstoqueCliente.SetVariable('OPERACAO','1=1');
      Case FNotaEntradaParam.Rg10Pessoa.ItemIndex Of
        0 : QRMovEstoqueCliente.SetVariable('IND_FISICA_JURIDICA','F');
        1 : QRMovEstoqueCliente.SetVariable('IND_FISICA_JURIDICA','J');
        2 : QRMovEstoqueCliente.SetVariable('IND_FISICA_JURIDICA',NULL);
      End;

      QRMovEstoqueCliente.Open;

      if FRMovEstoqueProdutoCliente = nil then
        FRMovEstoqueProdutoCliente := TFRMovEstoqueProdutoCliente.Create(Application);

      if FNotaEntradaParam.RG10AnaliticoSintetico.ItemIndex = 0 then
        FRMovEstoqueProdutoCliente.QRBand3.Enabled := true
      else
        FRMovEstoqueProdutoCliente.QRBand3.Enabled := false;

      FRMovEstoqueProdutoCliente.QRLEmpresa.Caption := FNotaEntradaParam.ED10Filial.Text;
      FRMovEstoqueProdutoCliente.QRLTitulo.Caption := 'Fechamento de Safra';
      FRMovEstoqueProdutoCliente.QRLPeriodo.Caption := 'PeríodoDe '+FNotaEntradaParam.ME10DtInicial.Text+' à '+FNotaEntradaParam.ME10DtFinal.Text;

      if FNotaEntradaParam.RGPreview.ItemIndex=0  then
        FRMovEstoqueProdutoCliente.QRPrimario.Preview
      else
        FRMovEstoqueProdutoCliente.QRPrimario.Print;

      QRMovEstoqueCliente.Close;
    end;
  end;

end;

procedure TFNotaAgricolaCad.InutilizaodenumeraoNFe1Click(Sender: TObject);
begin
  inherited;
  if DMFilial.EmiteNfe(DMUsuario.CodFilialUsuario) then
    DMNfe.InutilizaNumeracaoNfe
  else
    MessageDlg('Sua filial não emite NF-e.', mtInformation, [mbOK], 0);
end;

procedure TFNotaAgricolaCad.EnviarviaemailNFe1Click(Sender: TObject);
begin
  inherited;
  if DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.IsNull then
  begin
    MessageDlg('Por favor, selecione uma NF-e antes de enviar e-mail.', mtError, [mbOK], 0);
    Exit;
  end;
  with DMNotaEntrada do
    if (not QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaEntradaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfEmail;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaAgricolaCad.ReemitirDanfe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaEntrada do
    if (not QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaEntradaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfDanfe;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaAgricolaCad.ReconsultarNFe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaEntrada do
    if (not QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaEntradaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfConsulta;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaAgricolaCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMNotaEntrada.QNotaEntradaIND_SITUACAO do
    if Value = SIT_NOTA_DIGITADA then
      DBTSituacao.Font.Color := clRed
    else if Value = SIT_NOTA_CONFIRMADA then
      DBTSituacao.Font.Color := clGreen
    else if Value = SIT_NOTA_CANCELADA then
      DBTSituacao.Font.Color := clBlue
    else
      DBTSituacao.Font.Color := clWindowText;
end;

procedure TFNotaAgricolaCad.AlterarInserirestanotaemLoteNFe1Click(
  Sender: TObject);
begin
  inherited;
  DMNfe.EmissaoNfe(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value);
  DMOracle.DBCemapa.Commit;
end;

procedure TFNotaAgricolaCad.EnviarReenviarloteparaSEFAZ1Click(
  Sender: TObject);
var
  Acs: TAcoesLote;
begin
  inherited;
  if FNfEletronicaLoteCons = nil then
    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
  if not DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.IsNull then
    FNfEletronicaLoteCons.CarregaNota(DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Value);
  if FNFeParam = nil then
    FNFeParam := TFNFeParam.Create(Application);
  FNFeParam.AtivaPagina(4);
  if FNFeParam.ShowModal = MrOk then
  begin
    with DMNfEletronicaLote do
    begin
      CDSNfeLoteItemCons.First;
      while not CDSNfeLoteItemCons.Eof do
      begin
        SetSelecaoItem;
        CDSNfeLoteItemCons.Edit;
        CDSNfeLoteItemConsEMAIL_XML.Value := IfThen(FNFeParam.CB4EmailXML.Checked, 'S', 'N');
        CDSNfeLoteItemConsEMAIL_PDF.Value := IfThen(FNFeParam.CB4EmailPDF.Checked, 'S', 'N');
        CDSNfeLoteItemCons.Post;

        CDSNfeLoteItemCons.Next;
      end;
    end;
    Acs := TAcoesLote.Create.Add(alEnvio).Add(alGeraXML).Add(alConsulta);
    if FNFeParam.CB4Danfe.Checked then
      Acs.Add(alDanfe);
    if FNFeParam.CB4Email.Checked then
      Acs.Add(alEmail);
    DMNfEletronicaLote.AcaoEmLote(Acs);
    DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFNotaAgricolaCad.ConsultarlotedeNFe1Click(Sender: TObject);
begin
  inherited;
  if FNfEletronicaLoteCons = nil then
    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
  with FNfEletronicaLoteCons do
  begin
    if not DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.IsNull then
    begin
      FMNota.MeNota.Text := DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text;
      FMNota.MeNotaExit(Sender);
    end;
    FmFilial.MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
    FmFilial.MeFilialExit(Sender);

    Buscar;
    ShowModal;
  end;
end;

procedure TFNotaAgricolaCad.ImprimirCabecalhoNFProdutor1Click(
  Sender: TObject);
begin
  inherited;
  FNotaImpressao.EmiteCabecalho(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value);  // SOMENTE PARA IMPRIMIR CABECALHO DE NOTA FISCAL DE PRODUTOR
end;

procedure TFNotaAgricolaCad.ExportarNFe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaEntrada do
    if (not QNotaEntradaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaEntradaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfExportar;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaAgricolaCad.RelatrioPreoMdio1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[21].TabVisible:=True;

  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    with DMRomaneioRel do
    begin
      QRPrecoMedioCidade.close;
      if trim(FNotaEntradaParam.Fm21Filial.MeFilial.Text)<>'' then
        QRPrecoMedioCidade.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaEntradaParam.Fm21Filial.MeFilial.Text)))
      else
        QRPrecoMedioCidade.SetVariable('COD_FILIAL',Null);

      if trim(FNotaEntradaParam.Fm21Operacao.MeOperacao.Text)<>'' then
        QRPrecoMedioCidade.SetVariable('COD_OPERACAO',StrToInt(Trim(FNotaEntradaParam.Fm21Operacao.MeOperacao.Text)))
      else
        QRPrecoMedioCidade.SetVariable('COD_OPERACAO',Null);

      if trim(FNotaEntradaParam.Fm21Produto.MeProduto.Text)<>'' then
        QRPrecoMedioCidade.SetVariable('COD_PRODUTO',StrToInt(Trim(FNotaEntradaParam.Fm21Produto.MeProduto.Text)))
      else
        QRPrecoMedioCidade.SetVariable('COD_PRODUTO',Null);

      if trim(FNotaEntradaParam.Fm21Datas.MeDtInicial.Text) <> '' then
        QRPrecoMedioCidade.SetVariable('DT_INICIAL',StrToDate(FNotaEntradaParam.Fm21Datas.MeDtInicial.Text))
      else
      begin
        Raise exception.Create('Data Inicial não pode ficar em branco!');
      end;

      if trim(FNotaEntradaParam.Fm21Datas.MeDtFinal.Text) <> '' then
        QRPrecoMedioCidade.SetVariable('DT_FINAL',StrToDate(FNotaEntradaParam.Fm21Datas.MeDtFinal.Text))
      else
      begin
        Raise exception.Create('Data Final não pode ficar em branco!');
      end;

      QRPrecoMedioCidade.Open;

      if FrNotaPrecoMedio = nil then
        FrNotaPrecoMedio := TFrNotaPrecoMedio.Create(Application);

      FrNotaPrecoMedio.QRLTitulo.Caption := 'Relatório Preço Médio de ' + FNotaEntradaParam.Fm21Produto.EdProduto.Text;
      FrNotaPrecoMedio.QRLPeriodo.Caption := 'Período De '+FNotaEntradaParam.Fm21Datas.MeDtInicial.Text+' à '+FNotaEntradaParam.Fm21Datas.MeDtFinal.Text;

      if FNotaEntradaParam.RGPreview.ItemIndex=0  then
        FrNotaPrecoMedio.QRPrimario.Preview
      else
        FrNotaPrecoMedio.QRPrimario.Print;

      QRPrecoMedioCidade.Close;
    end;
  end;

end;

procedure TFNotaAgricolaCad.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    DMNotaEntrada.QNotaEntradaCOD_SERIE.Value :=
      DMSerie.QSerieConsCOD_SERIE.Value;
    DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value :=
      DMSerie.QSerieConsCOD_SERIE_MODELO.Value;
    DBEdit16Exit(Self);
  end;
end;

procedure TFNotaAgricolaCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFNotaAgricolaCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFNotaAgricolaCad.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit1.Text);
end;

procedure TFNotaAgricolaCad.RelatrioExtratoProdutoAgrcola1Click(
  Sender: TObject);
var
  wOrdem, wFilial, wDepartamento, wCadastro, wTipoNota: string;
begin
  inherited;
  if FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[28].TabVisible:=True;

  if FNotaEntradaParam.ShowModal =  mrOk then
  begin
    with DMNotaEntrada, FNotaEntradaParam do
    begin
        if trim(FmFilial29.MeFilial.Text) <> '' then
        begin
          QRExtratoNotaAgricola.SetVariable(':FILIAL', trim(FmFilial29.MeFilial.Text));
          wFilial := ', Da Filial: ' + trim(FmFilial29.MeFilial.Text);
        end
        else
        begin
          QRExtratoNotaAgricola.SetVariable(':FILIAL', null);
          wFilial := ', De Todas as Filiais';
        end;
        if trim(FmCadastro29.MeCadastro.Text) <> '' then
        begin
          QRExtratoNotaAgricola.SetVariable(':CADASTRO', trim(FmCadastro29.MeCadastro.Text));
          wCadastro := ', Do Cadastro: ' + trim(FmCadastro29.MeCadastro.Text);
        end
        else
        begin
          QRExtratoNotaAgricola.SetVariable(':CADASTRO', null);
          wCadastro := ', De Todos os Cadastros';
        end;
        if trim(FmDepartamento29.MeDepartamento.Text) <> '' then
        begin
          QRExtratoNotaAgricola.SetVariable(':DEPARTAMENTO', trim(FmDepartamento29.MeDepartamento.Text));
          wDepartamento := ', Do Departamento: ' + trim(FmDepartamento29.MeDepartamento.Text);
        end
        else
        begin
          QRExtratoNotaAgricola.SetVariable(':DEPARTAMENTO', null);
          wDepartamento := ', De Todos os Departamentos';
        end;
        if trim(FmDatas29.MeDtInicial.Text) <> '//' then
          QRExtratoNotaAgricola.SetVariable(':DT_EMISSAO_I', FmDatas29.MeDtInicial.Text)
        else
         QRExtratoNotaAgricola.SetVariable(':DT_EMISSAO_I', null);
        if trim(FmDatas29.MeDtFinal.Text) <> '//' then
          QRExtratoNotaAgricola.SetVariable(':DT_EMISSAO_F', FmDatas29.MeDtFinal.Text)
        else
         QRExtratoNotaAgricola.SetVariable(':DT_EMISSAO_F', null);

        Case rgSituacao29.ItemIndex of
          0:
          begin
            QRExtratoNotaAgricola.SetVariable(':IND_SITUACAO',1);
            wTipoNota := ', Situação das notas: Digitadas.';
          end;
          1:
          begin
            QRExtratoNotaAgricola.SetVariable(':IND_SITUACAO',2);
            wTipoNota := ', Situação das notas: Confirmadas.';
          end;
          2:
          begin
            QRExtratoNotaAgricola.SetVariable(':IND_SITUACAO',3);
            wTipoNota := ', Situação das notas: Canceladas.';
          end;
          3:
          begin
            QRExtratoNotaAgricola.SetVariable(':IND_SITUACAO',null);
            wTipoNota := ', Situação das notas: Todas.';
          end;
        end;

        QRExtratoNotaAgricola.SQL[QRExtratoNotaAgricola.SQL.Count-1] := '';
          Case  rgOrdem29.ItemIndex of
             0 :
             begin
               QRExtratoNotaAgricola.SQL.Add('ORDER BY NOME_CADASTRO');
               wOrdem := ' Ordenado por nome de Cadastro';
             end;
             1 :
             begin
              QRExtratoNotaAgricola.SQL.Add('ORDER BY DT_EMISSAO');
              wOrdem := ' Ordenado por Data de Emissão';
             end;
             2 :
             begin
               QRExtratoNotaAgricola.SQL.Add('ORDER BY DT_VENCIMENTO');
               wOrdem := ' Ordenado por Data de Vencimento';
             end;
          End;

        QRExtratoNotaAgricola.Open;

        if FRExtratoNotaAgricola = nil then
          FRExtratoNotaAgricola := TFRExtratoNotaAgricola.Create(Application);

        FRExtratoNotaAgricola.QRLTitulo.Caption := 'Relatório Extrato de Notas ' + 'Período De: ' + FmDatas29.MeDtInicial.Text + ' à '+ FmDatas29.MeDtFinal.Text 
                                                    + wOrdem + wFilial + wCadastro + wDepartamento + wTipoNota;

        if FNotaEntradaParam.RGPreview.ItemIndex = 0  then
          FRExtratoNotaAgricola.QRPrimario.Preview
        else
          FRExtratoNotaAgricola.QRPrimario.Print;

        QRExtratoNotaAgricola.Close;
    end;
  end;
end;

End.

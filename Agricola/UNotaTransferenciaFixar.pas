unit UNotaTransferenciaFixar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, ComObj, UBiblioteca, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFNotaTransferenciaFixar = class(TFTCadSimples)
    Operaes1: TMenuItem;
    ConfirmaNota1: TMenuItem;
    EmitirNotaTransfernciaFixar1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    BtConsLote: TBitBtn;
    DBFilial: TDBDirceu;
    DBProduto: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBEdit20: TDBEdit;
    MeEmbalagem: TMaskEdit;
    MeUnidade: TMaskEdit;
    MeSacas: TMaskEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBCadastroSaida: TDBDirceu;
    DBDirceu5: TDBDirceu;
    Label6: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit16: TDBEdit;
    DBDirceu6: TDBDirceu;
    DBCadastroEntrada: TDBDirceu;
    TabSheet4: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit21: TDBEdit;
    SpeedButton10: TSpeedButton;
    DBDirceu4: TDBDirceu;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    btSerieCons: TBitBtn;
    lblModelo: TLabel;
    CopiaTransferenciaDeSaldo: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfirmaNota1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEdit20Change(Sender: TObject);
    procedure EmitirNotaTransfernciaFixar1Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure CopiaTransferenciaDeSaldoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CopiaTransferenciaSaldo(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FNotaTransferenciaFixar: TFNotaTransferenciaFixar;
  WinWord, Docs, Doc: Variant;

implementation

uses UFilialCons, UProdutoCons, UTipoLoteCons,
  UCadastroCons, UOperacaoCons, UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl,
  UUsuario_cl, UFilial_cl, UProduto_cl, UTipoLote_cl, UCadastro_cl,
  UOperacao_cl, UNotaSaida_Confirma, UNotaEntrada_Confirma,
  URSolicitacaoTransf, URomaneioAgricola_cl, UNotaTransferencia_Cons,
  UNotaTransferenciaFixar_cl, Ucontrato_cl, UContratoVenda_Cons,
  UParamSistema_cl, USerieCons, USerie_cl;

{$R *.DFM}

procedure TFNotaTransferenciaFixar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaTransferenciaFixar.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.Text := DMProduto.QprodutoConsCod_Produto.Text;
end;

procedure TFNotaTransferenciaFixar.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
     DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Lote_Tipo.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
end;

procedure TFNotaTransferenciaFixar.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
   FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrok then
     DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Origem.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;

end;

procedure TFNotaTransferenciaFixar.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons=Nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  if FOperacaoCons.Showmodal = mrok then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Operacao_Saida.Text:=DMOperacao.QOperacaoConsCOD_OPERACAO.text;

end;

procedure TFNotaTransferenciaFixar.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
   FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrok then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;

end;

procedure TFNotaTransferenciaFixar.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex:=0;
  if FOperacaoCons.ShowModal = mrok then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Operacao_Entrada.Text:=DMOperacao.QOperacaoConsCod_Operacao.text;

end;

procedure TFNotaTransferenciaFixar.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Destino.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;
end;

procedure TFNotaTransferenciaFixar.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DsPrimario.State <> DsBrowse Then
    if DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text <> '' then
     begin
       DMNotaTransferenciaFixar.QNotaTransferenciaFixarVal_Preco.Text:=DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
       DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_SAIDA.Text := DMOracle.BuscaNome('SELECT COD_OPERACAO_TRANSFERENCIA FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
       DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_ENTRADA.Text := DMOracle.BuscaNome('SELECT COD_OPER_TRANSF_ENTRADA FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
       MeEmbalagem.Text := DMOracle.BuscaNome('SELECT NUM_CONVERTE_FARDO FROM TB_PRODUTO','COD_PRODUTO='+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
       MeUnidade.Text := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO='+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
     end;
end;

procedure TFNotaTransferenciaFixar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMNotaSaida.pTR := False;
  DMNotaEntrada.pTR := False;
  DMNotaTransferenciaFixar.QNotaTransferenciaFixar.close;
end;

procedure TFNotaTransferenciaFixar.ConfirmaNota1Click(Sender: TObject);
var wMensagem,wTexto,wCidade_Origem,wCidade_Destino : String;
    x, y: array of string;
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'NUTRI')  And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GRASEL') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RAMBO')  Then
   Begin
     wCidade_Origem := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Text);
     wCidade_Destino := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Text);
     If wCidade_Origem <> wCidade_Destino Then
        Raise Exception.Create('Clientes de cidades diferentes - não pode transferir');
     If DMNotaTransferenciaFixar.QNotaTransferenciaFixarNUM_NOTA_PRODUTOR.Text = '' Then
        Raise Exception.Create('Informar nota fiscal de produtor');
   End;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial.Text),'AGRICOLA');
  with DMRomaneioAgricola do
    begin
      QRomConsFixar.Close;
      QRomConsFixar.SetVariable('CADASTRO',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.text);
      QRomConsFixar.SetVariable('PRODUTO',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Produto.text);
      QRomConsFixar.SetVariable('LOTE_TIPO',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Lote_Tipo.text);
      QRomConsFixar.SetVariable('FILIAL',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial.Text);
      If DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.text <> '' Then
         QRomConsFixar.SetVariable('COD_PARCEIRO',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.text)
      Else
         QRomConsFixar.SetVariable('COD_PARCEIRO',Null);
//      QRomConsFixar.SetVariable('DATAI',StrToDate('01/12/1999'));
//      QRomConsFixar.SetVariable('DATAF',DMOracle.DataServ);
      QRomConsFixar.SetVariable('TIPO_FIXAR','EMPRESA');
      DMNotaEntrada.pContabiliza_Extra := 'N';
      QRomConsFixar.Open;
      if trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_Quantidade.text)<>'' then
        if DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_Quantidade.Value<=QRomConsFixarsaldo_fixar.Value then
          begin
            DMOracle.DBCemapa.StartTransaction;
            Try
              with DMNotaSaida do
                begin
                  pTR:=True;
                  QNotaSaida.Open;
                  QItemNF.Open;
                  QNotaSaida.Insert;
                  QNotaSaidaCOD_FILIAL.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial.Value;
                  QNotaSaidaCOD_CADASTRO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Value;
                  QNotaSaidaCOD_OPERACAO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_SAIDA.Value;
                  QNotaSaidaCOD_SERIE.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE.Value;
                  QNotaSaidaCOD_SERIE_MODELO.Value := DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE_MODELO.Value;
                  QNotaSaidaOBS.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarDESC_OBSERVACAO.Value;
                  QNotaSaidaOBS_COMPLEMENTO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarDESC_COMPLEMENTO.Value;
                  If (Trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Text) <> '') And
                     (Trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Text) <> '0') Then
                     QNotaSaidaCOD_CADASTRO_PARCEIRO.Value := DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Value;
                  wMensagem := DMOracle.BuscaNome('SELECT COD_MENSAGEM FROM TB_OPERACAO','COD_OPERACAO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_SAIDA.Text);
                  If wMensagem <> '' Then
                     QNotaSaidaCod_Mensagem.Value :=  StrToInt(wMensagem);
                  QItemNF.insert;
                  QItemNFCOD_PRODUTO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_PRODUTO.Value;
                  QItemNFCOD_LOTE_TIPO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_LOTE_TIPO.Value;
                  QItemNFQT_QUANTIDADE.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Value;
                  QItemNFVAL_UNITARIO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarVAL_PRECO.Value;
                  QItemNF.post;
                  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
                    Raise Exception.Create('Nota Fiscal já confirmada!');
                  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
                    Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
                  If FNotaSaida_Confirma = Nil then
                    FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
//                      ChecaNota; RETIRADO PELO CESAR PORQUE NA TRANSFERENCIA DE SALDO A FIXAR NAO PRECISA
                  FNotaSaida_Confirma.pAtivado := False;
                  pConfirmando := True;
                  DMNotaEntrada.CalculaDesconto(QNotaSaidaCOD_CADASTRO.Value,QNotaSaidaCOD_FILIAL.Value,QNotaSaidaCOD_OPERACAO.Value,QItemNFCOD_NOTA_ITEM.Value,QItemNFCOD_PRODUTO.Value,QItemNFQT_QUANTIDADE.Value,'S',QNotaSaidaCOD_CADASTRO_PARCEIRO.Text);
                  FNotaSaida_Confirma.ShowModal;
                  QSomaItemNota.AutoCalcfields := False;
                  pConfirmando := False;
                  FNotaSaida_Confirma.pAtivado := False;
                end;
              if not(DMNotaSaida.pCF) then
                begin
                  With DMNotaEntrada do
                    begin
                      QNotaEntrada.Open;
                      QItemNF.Open;
                      QNotaEntrada.Insert;
                      QNotaEntradaCOD_FILIAL.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial_Destino.Value;
                      QNotaEntradaCOD_OPERACAO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_ENTRADA.Value;
                      QNotaEntradaCOD_SERIE.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE.Value;
                      QNotaEntradaCOD_SERIE_MODELO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE_MODELO.Value;
                      QNotaEntradaCOD_CADASTRO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Value;
                      QNotaEntradaCOD_NOTA_CONTA_CORRENTE.Value:=DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
                      QNotaEntradaOBS.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarDESC_OBS_ENTRADA.Value;
                      If (Trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Text) <> '') And
                         (Trim(DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Text) <> '0') Then
                         QNotaEntradaCOD_CADASTRO_PARCEIRO.Value := DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Parceiro.Value;
                      wMensagem := DMOracle.BuscaNome('SELECT COD_MENSAGEM FROM TB_OPERACAO','COD_OPERACAO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_OPERACAO_ENTRADA.Text);
                      If wMensagem <> '' Then
                         QNotaEntradaCod_Mensagem.Value :=  StrToInt(wMensagem);
                      QItemNF.Insert;
                      QItemNFCOD_PRODUTO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_PRODUTO.Value;
                      QItemNFCOD_LOTE_TIPO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_LOTE_TIPO.Value;
                      QItemNFQT_QUANTIDADE.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Value;
                      QItemNFVAL_UNITARIO.Value:=DMNotaTransferenciaFixar.QNotaTransferenciaFixarVAL_PRECO.Value;
                      QItemNFVAL_TOTAL.Value:=QItemNFQT_QUANTIDADE.Value*QItemNFVAL_UNITARIO.Value;
                      QItemNFNUM_NOTA_PRODUTOR.Value := DMNotaTransferenciaFixar.QNotaTransferenciaFixarNUM_NOTA_PRODUTOR.Value;
                      QItemNF.post;
                      QNotaEntrada.post;
                      If QNotaEntradaInd_Situacao.Value = '2' Then
                        Raise Exception.Create('Nota Fiscal já confirmada!');
                      If QNotaEntradaInd_Situacao.Value = '3' Then
                        Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
                      pOperacaoInterna := 3;
                      pTR:=True;
                      If FNotaEntrada_Confirma = Nil then
                        FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
                      FNotaEntrada_Confirma.BtCancelar.Enabled := False;
                      FNotaEntrada_Confirma.ShowModal;
                      pOperacaoInterna := 0;
                    end;
                end;
              if (DMNotaSaida.pCF) or (DMNotaEntrada.pCF)then
                begin
                  DMOracle.DBCemapa.RollBack;
                  DMNotaSaida.pCF:=False;
                  DMNotaEntrada.pCF:=False;
                end
              else
                begin
                  DMOracle.DBCemapa.Commit;
                  DMNotaSaida.pCF:=False;
                  DMNotaEntrada.pCF:=False;
                  {
                  if FRSolicitacaoTransf = Nil then
                     FRSolicitacaoTransf := TFRSolicitacaoTransf.Create(Application);

                  setLength(x, 11); //4 sql diferentes
                  setLength(y, 11);

                  x[0] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Text;
                  x[1] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Text;
                  If DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text <> '' Then
                   Begin
                     x[2] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text;
                     x[4] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text;
                   End
                  Else
                   Begin
                     x[2] := 'SELECT * FROM DUAL';
                     x[4] := 'SELECT * FROM DUAL';
                   End;
                  If DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text <> '' Then
                   Begin
                     x[3] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text;
                     x[5] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text;
                   End
                  Else
                   Begin
                     x[3] := 'SELECT * FROM DUAL';
                     x[5] := 'SELECT * FROM DUAL';
                   End;
                  x[6] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Text;
                  x[7] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Text;
                  x[8] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_PRODUTO.Text;
                  x[9] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Text;
                  x[10] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Text;

                  DMOracle.BuscaNomes(x, y);

                  FRSolicitacaoTransf.QRLFilial.Caption:=Y[7];
                  wTexto:='Eu, '+Y[6]+','+' Maior, portador do CPF nr. '+Y[1] + ' Solicito e autorizo a empresa ';
                  wTexto:=wTexto +Y[7]+', a transferir a quantia de '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Text+' Kg. de '+Y[8]+' depositado em meu nome, em favor ao(a) Sr.(a), ';
                  wTexto:=wTexto +Y[9] + ' portador(a) do CPF nr. '+Y[0] + ', me responsabilizando inteiramente pela transfêrencia.';
                  wTexto:=wTexto +chr(13)+'    Declaro também para todos os fins, que o produto transferido não provem de';
                  wTexto:=wTexto +' vínculos de crédito de terceiros, financiamentos, custeio agrícola, cédula de produto';
                  wTexto:=wTexto +' agrícola, e outros, dando ao autorizado(a) total liberdade para faturamento do produto';
                  wTexto:=wTexto +' isentando a empresa '+Y[7]+'. de quaisquer problemas oriundos desta autorização, seja fiscal ou financeira.';
                  FRSolicitacaoTransf.QRlabel7.Caption:= wTexto;
                  FRSolicitacaoTransf.QRLData.Caption:=Y[10]+', '+FormatDateTime('dd "de" mmmm "de" yyyy.',DMOracle.DataServ);
                  FRSolicitacaoTransf.QRLCadastro.Caption:=Y[6] + ' - '+ Y[1];
                  FRSolicitacaoTransf.QRLTestemunha1.Caption := Y[4];
                  FRSolicitacaoTransf.QRLTestemunha2.Caption := Y[5];
                  FRSolicitacaoTransf.QRLCpf1.Caption := Y[2];
                  FRSolicitacaoTransf.QRLcpf2.Caption := Y[3];
                  FRSolicitacaoTransf.QuickRep1.Preview;
                  }
                  CopiaTransferenciaSaldo(Sender);
                  // atualiza a nota transferencia como emitida
                  DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Edit;
                  DMNotaTransferenciaFixar.QNotaTransferenciaFixarInd_Situacao.Value := '2';
                  DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Post;
                  Close;
                end;
            except
              on e : Exception do
               Begin
              DMOracle.DBCemapa.Rollback;
              DMNotaSaida.QNotaSaida.EnableControls;
              DMNotaSaida.QItemNF.EnableControls;
              DMNotaSaida.QItemNF.Cancel;
              DMNotaSaida.QNotaSaida.Cancel;
              DMNotaSaida.pTR:=False;
              DMNotaSaida.pCF:=False;
              DMNotaEntrada.QItemNF.Cancel;
              DMNotaEntrada.QNotaEntrada.Cancel;
                Raise Exception.Create(e.Message + Chr(13) + 'Erro! Não foi possível gerar as notas.');
              end;
            end;
          end
        else
          Showmessage('Atenção! Não existe saldo disponível.');
    end;
end;

procedure TFNotaTransferenciaFixar.FormActivate(Sender: TObject);
begin
//  inherited;
  DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Close;
  DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Open;
end;

procedure TFNotaTransferenciaFixar.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Testemunha1.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;

end;

procedure TFNotaTransferenciaFixar.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Cadastro_Testemunha2.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;

end;

procedure TFNotaTransferenciaFixar.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaTransferencia_Cons = Nil Then
     FNotaTransferencia_Cons := TFNotaTransferencia_Cons.Create(Application);
  If FNotaTransferencia_Cons.ShowModal = MroK Then
   Begin
     DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Close;
     DMNotaTransferenciaFixar.QNotaTransferenciaFixar.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaConsCod_Nota_Transferencia.Value);
     DMNotaTransferenciaFixar.QNotaTransferenciaFixar.Open;
     bib.setModelo(DMNotaTransferenciaFixar.QNotaTransferenciaFixar, lblModelo);
   End;
end;

procedure TFNotaTransferenciaFixar.DBEdit20Change(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := DMNotaTransferenciaFixar.QNotaTransferenciaFixarInd_Situacao.Value = '1';
end;

procedure TFNotaTransferenciaFixar.EmitirNotaTransfernciaFixar1Click(
  Sender: TObject);
var
  wPath, wFilial, wCnpj, wInscEstadual, wEndereco, wNumEndereco : String;
  wComplemento, wCidade, wNomeDestino, wRGDestino, wCPFDestino : String;
  wEnderecoDestino, wBairroDestino, wCidadeDestino, wDtTransferencia : String;
  wNomeOrigem, wNomeTestemunha1, wRGTestemunha1, wCPFTestemunha1, wEstadoOrigem : String;
  wNomeTestemunha2, wRGTestemunha2, wCPFTestemunha2, wProduto, wCPFOrigem, wRGOrigem, wSacasKgExtenso : String;
  wEnderecoOrigem, wBairroOrigem, wCidadeOrigem, wProdutoKG, wProdutokgExtenso, wProdutoSacasExtenso : String;
  wDataTransf : TDateTime;
  wNumEmbalagem : Real;
  wProdutoSacas : Real;
  wAno, wMes, wDia : Word;
begin
  inherited;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Value);
  DMFilial.QFilial.Open;
  wFilial :=  DMFilial.QFilialDESC_FILIAL.Value;
  wCnpj :=  DMFilial.QFilialNUM_CGC.Value;
  wInscEstadual := DMFilial.QFilialDESC_INSCRICAO.Value;
  wEndereco := DMFilial.QFilialDESC_ENDERECO.Value;
  wNumEndereco := DMFilial.QFilialNUM_ENDERECO.Text;
  wComplemento := DMFilial.QFilialDESC_COMPLEMENTO_ENDERECO.Value;
  wCidade := DMFilial.QFilialDESC_CIDADE.Value;
  DMFilial.QFilial.Close;

  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Value);
  DMCadastro.QCadastro.Open;
  wNomeDestino := DMCadastro.QCadastroNOME.Value;
  wRGDestino := DMCadastro.QCadastroNUM_INSCRICAO.Value;
  wCPFDestino := DMCadastro.QCadastroNUM_CGC_CPF.Value;
  wEnderecoDestino := DMCadastro.QCadastroDESC_ENDERECO.Value;
  wBairroDestino := DMCadastro.QCadastroDESC_BAIRRO.Value;
  wCidadeDestino := DMCadastro.QCadastroDESC_CIDADE.Value;

  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Value);
  DMCadastro.QCadastro.Open;
  wNomeOrigem := DMCadastro.QCadastroNOME.Text;
  wEstadoOrigem := DMCadastro.QCadastroCOD_ESTADO.Value;
  wCPFOrigem := DMCadastro.QCadastroNUM_CGC_CPF.Value;
  wRGOrigem := DMCadastro.QCadastroNUM_INSCRICAO.Value;
  wEnderecoOrigem := DMCadastro.QCadastroDESC_ENDERECO.Value;
  wBairroOrigeM := DMCadastro.QCadastroDESC_BAIRRO.Value;
  wCidadeOrigem := DMCadastro.QCadastroDESC_CIDADE.Value;


  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Value);
  DMCadastro.QCadastro.Open;
  wNomeTestemunha1 := DMCadastro.QCadastroNOME.Value;
  wRGTestemunha1 := DMCadastro.QCadastroNUM_INSCRICAO.Value;
  wCPFTestemunha1 := DMCadastro.QCadastroNUM_CGC_CPF.Value;

  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Value);
  DMCadastro.QCadastro.Open;
  wNomeTestemunha2 := DMCadastro.QCadastroNOME.Value;
  wRGTestemunha2 := DMCadastro.QCadastroNUM_INSCRICAO.Value;
  wCPFTestemunha2 := DMCadastro.QCadastroNUM_CGC_CPF.Value;
  DMCadastro.QCadastro.Close;

  DMProduto.QProduto.Close;
  DMProduto.QProduto.SetVariable('Pk',DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_PRODUTO.Value);
  DMProduto.QProduto.Open;
  wProduto := DMProduto.QProdutoDESC_PRODUTO.Value;
  wNumEmbalagem := DMProduto.QProdutoNUM_EMBALAGEM.Value;
  if wNumEmbalagem = 0 then
    wNumEmbalagem := 1;

  wDataTransf := StrToDate(DMNotaTransferenciaFixar.QNotaTransferenciaFixarDT_TRANSFERENCIA.Text);
  DecodeDate(wDataTransf, wAno, wMes, wDia);
  wDtTransferencia := IntToStr(wDia) +' de '+ Bib.NomeMes(wMes)+' de '+ IntToStr(wAno);

  wProdutoKG := DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Text;
  wProdutoSacas := Round(DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Value / wNumEmbalagem * 100) / 100;

  wProdutoSacasExtenso :=  Bib.extenso(wProdutoSacas, 'SACA');
  wProdutoSacasExtenso := StringReplace(wProdutoSacasExtenso,'Centavos','',[rfIgnoreCase]);
  wProdutoSacasExtenso := StringReplace(wProdutoSacasExtenso,'.','',[rfIgnoreCase]);
  wProdutoSacasExtenso := StringReplace(wProdutoSacasExtenso,'Sacas',',',[rfIgnoreCase]) + ' Sacas.';
  wProdutoKgExtenso := Bib.extenso(DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Value, 'KG');
  wSacasKgExtenso := Bib.extenso(wNumEmbalagem, 'KG');

  wPath:=ExtractFilePath(ParamStr(0))+'Contratos\';

  //Cria objeto principal de controle
  WinWord := CreateOleObject('Word.Application');
  // Mostra o Word
  WinWord.Visible := true;
  // Pega uma interface para o objeto que manipula documentos
  Docs := WinWord.Documents;
  // Abre um documento
  Doc := Docs.Open(wPath+'autorizacao_transferencia.Doc');




  with DMNotaTransferenciaFixar do
  Begin
    Doc.Content.Find.Execute(FindText := '%filial%',ReplaceWith := wFilial,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%cnpj%',ReplaceWith := wCnpj,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%inscEstadual%',ReplaceWith := wInscEstadual,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%endereco%',ReplaceWith := wEndereco,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%numEndereco%',ReplaceWith := wNumEndereco,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%complemento%',ReplaceWith := wComplemento,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%cidade%',ReplaceWith := wCidade,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%nomeDestino%',ReplaceWith := wNomeDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%RGDestino%',ReplaceWith := wRGDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%CPFDestino%',ReplaceWith := wCPFDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%enderecoDestino%',ReplaceWith := wEnderecoDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%bairroDestino%',ReplaceWith := wBairroDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%cidadeDestino%',ReplaceWith := wCidadeDestino,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%nomeOrigem%',ReplaceWith := wNomeOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%dtTransferencia%',ReplaceWith := wDtTransferencia,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%nomeTestemunha1%',ReplaceWith := wNomeTestemunha1,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%RGTestemunha1%',ReplaceWith := wRGTestemunha1,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%CPFTestemunha1%',ReplaceWith := wCPFTestemunha1,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%nomeTestemunha2%',ReplaceWith := wNomeTestemunha2,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%RGTestemunha2%',ReplaceWith := wRGTestemunha2,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%CPFTestemunha2%',ReplaceWith := wCPFTestemunha2,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%produto%',ReplaceWith := wProduto,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%CPFOrigem%',ReplaceWith := wCPFOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%RGOrigem%',ReplaceWith := wRGOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%enderecoOrigem%',ReplaceWith := wEnderecoOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%bairroOrigem%',ReplaceWith := wBairroOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%cidadeOrigem%',ReplaceWith := wCidadeOrigem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%produtoKG%',ReplaceWith := wProdutoKG,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%produtoKgExtenso%',ReplaceWith := wProdutoKgExtenso,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%produtoSacas%',ReplaceWith := wProdutoSacas,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%produtoSacasExtenso%',ReplaceWith := wProdutoSacasExtenso,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%numEmbalagem%',ReplaceWith := wNumEmbalagem,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%sacasKgExtenso%',ReplaceWith := wSacasKgExtenso,Replace:=2);
    Doc.Content.Find.Execute(FindText := '%estadoOrigem%',ReplaceWith := wEstadoOrigem,Replace:=2);

    Doc.SaveAs(wPath+'Autorização Transferência.Doc');

  end;
end;

procedure TFNotaTransferenciaFixar.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if (Trim(MeEmbalagem.Text) <> '') And
     (DMNotaTransferenciaFixar.QNotaTransferenciaFixarQt_Quantidade.Value > 0) Then
     MeSacas.Text := FloatToStr(DMNotaTransferenciaFixar.QNotaTransferenciaFixarQt_Quantidade.Value / StrToFloat(MeEmbalagem.Text));
end;

procedure TFNotaTransferenciaFixar.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Serie_Entrada.Value := DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Serie.Value;
end;

procedure TFNotaTransferenciaFixar.FormCreate(Sender: TObject);
begin
  inherited;
  if dsPrimario.dataset = nil then
    DsPrimario.dataset := DMNotaTransferenciaFixar.QNotaTransferenciaFixar;
end;

procedure TFNotaTransferenciaFixar.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     DMNotaTransferenciaFixar.QNotaTransferenciaFixarCod_Filial_Destino.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFNotaTransferenciaFixar.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SpeedButton7.Enabled := (DSPrimario.State <> dsBrowse);
  btSerieCons.Enabled := (DSPrimario.State <> dsBrowse);
end;

procedure TFNotaTransferenciaFixar.DBEdit22Exit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFNotaTransferenciaFixar.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE.Value :=
      DMSerie.QSerieConsCOD_SERIE.Value;
    DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_SERIE_MODELO.Value :=
      DMSerie.QSerieConsCOD_SERIE_MODELO.Value;
    DBEdit11Exit(Self);
  end;
end;

procedure TFNotaTransferenciaFixar.MELocalizaExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaTransferenciaFixar.QNotaTransferenciaFixar, lblModelo);
end;

procedure TFNotaTransferenciaFixar.CopiaTransferenciaSaldo(Sender: TObject);
var wMensagem,wTexto,wCidade_Origem,wCidade_Destino : String;
    x, y: array of string;
begin
  if FRSolicitacaoTransf = Nil then
     FRSolicitacaoTransf := TFRSolicitacaoTransf.Create(Application);

  setLength(x, 11); //4 sql diferentes
  setLength(y, 11);

  x[0] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Text;
  x[1] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Text;
  If DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text <> '' Then
   Begin
     x[2] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text;
     x[4] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1.Text;
   End
  Else
   Begin
     x[2] := 'SELECT * FROM DUAL';
     x[4] := 'SELECT * FROM DUAL';
   End;
  If DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text <> '' Then
   Begin
     x[3] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text;
     x[5] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2.Text;
   End
  Else
   Begin
     x[3] := 'SELECT * FROM DUAL';
     x[5] := 'SELECT * FROM DUAL';
   End;
  x[6] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM.Text;
  x[7] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Text;
  x[8] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_PRODUTO.Text;
  x[9] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_CADASTRO_DESTINO.Text;
  x[10] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIAL.Text;

  DMOracle.BuscaNomes(x, y);

  FRSolicitacaoTransf.QRLFilial.Caption:=Y[7];
  wTexto:='Eu, '+Y[6]+','+' Maior, portador do CPF nr. '+Y[1] + ' Solicito e autorizo a empresa ';
  wTexto:=wTexto +Y[7]+', a transferir a quantia de '+DMNotaTransferenciaFixar.QNotaTransferenciaFixarQT_QUANTIDADE.Text+' Kg. de '+Y[8]+' depositado em meu nome, em favor ao(a) Sr.(a), ';
  wTexto:=wTexto +Y[9] + ' portador(a) do CPF nr. '+Y[0] + ', me responsabilizando inteiramente pela transfêrencia.';
  wTexto:=wTexto +chr(13)+'    Declaro também para todos os fins, que o produto transferido não provem de';
  wTexto:=wTexto +' vínculos de crédito de terceiros, financiamentos, custeio agrícola, cédula de produto';
  wTexto:=wTexto +' agrícola, e outros, dando ao autorizado(a) total liberdade para faturamento do produto';
  wTexto:=wTexto +' isentando a empresa '+Y[7]+'. de quaisquer problemas oriundos desta autorização, seja fiscal ou financeira.';
  FRSolicitacaoTransf.QRlabel7.Caption:= wTexto;
  FRSolicitacaoTransf.QRLData.Caption:=Y[10]+', '+FormatDateTime('dd "de" mmmm "de" yyyy.',DMOracle.DataServ);
  FRSolicitacaoTransf.QRLCadastro.Caption:=Y[6] + ' - '+ Y[1];
  FRSolicitacaoTransf.QRLTestemunha1.Caption := Y[4];
  FRSolicitacaoTransf.QRLTestemunha2.Caption := Y[5];
  FRSolicitacaoTransf.QRLCpf1.Caption := Y[2];
  FRSolicitacaoTransf.QRLcpf2.Caption := Y[3];
  FRSolicitacaoTransf.QuickRep1.Preview;
end;


procedure TFNotaTransferenciaFixar.CopiaTransferenciaDeSaldoClick(
  Sender: TObject);
begin
  inherited;
  CopiaTransferenciaSaldo(Sender);
end;

end.

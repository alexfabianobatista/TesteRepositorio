unit UNotaTransfFilialCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, DBDirceu;

type
  TFNotaTransfFilialCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBECodNota: TDBEdit;
    Label1: TLabel;
    DBECliente: TDBEdit;
    Label9: TLabel;
    BtConsCadastro: TBitBtn;
    DB1: TDBDirceu;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    BtConsOperacao: TBitBtn;
    DB2: TDBDirceu;
    DB3: TDBDirceu;
    Label25: TLabel;
    Label13: TLabel;
    DBEdit25: TDBEdit;
    DBEdit37: TDBEdit;
    Label47: TLabel;
    DBEdit54: TDBEdit;
    BtConsProduto: TBitBtn;
    DBEdit55: TDBEdit;
    DBEdit57: TDBEdit;
    Label45: TLabel;
    BtConsLote: TBitBtn;
    DBEdit50: TDBEdit;
    Label43: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label46: TLabel;
    DBEdit52: TDBEdit;
    BtConsTributacao: TBitBtn;
    DBGrid1: TDBGrid;
    DB4: TDBDirceu;
    DB5: TDBDirceu;
    DBNavigator1: TDBNavigator;
    Menuopcoes: TMenuItem;
    MenuConfirma: TMenuItem;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    BtConsTransportador: TBitBtn;
    DBEdit44: TDBEdit;
    DBEdit43: TDBEdit;
    Label37: TLabel;
    Label8: TLabel;
    DBECodMensagem: TDBEdit;
    BtConsMensagem: TBitBtn;
    BtImpItemNota: TBitBtn;
    EmissoCopiaNota1: TMenuItem;
    MECodBarras: TMaskEdit;
    Label12: TLabel;
    DBEdit36: TDBEdit;
    Label66: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    BtParceiro: TBitBtn;
    CancelarNota1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure MenuConfirmaClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBHelpClick(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure BtImpItemNotaClick(Sender: TObject);
    procedure EmissoCopiaNota1Click(Sender: TObject);
    procedure DBEdit54Exit(Sender: TObject);
    procedure MECodBarrasExit(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
    procedure CancelarNota1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure DBECodMensagemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaTransfFilialCad: TFNotaTransfFilialCad;

implementation

uses UNotaSaida_cl, UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl,
  UOperacaoCons, UOperacao_cl, UProdutoCons, UProduto_cl, UTipoLoteCons,
  UTipoLote_cl, UTributacaoCons, UTributacao_cl, UNotaSaidaCons, UOracle_cl,
  UGeraNFTransEntrada, UMensagemCons, UMensagem_cl, UUsuario_cl,
  UNotaEntradaCons, UNotaEntrada_cl, UNotaImpressao, UParamSistema_cl,
  UNotaSaidaCad;

{$R *.DFM}

procedure TFNotaTransfFilialCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMNotasaida.QNotaSaida.Open;
  DMNotaSaida.QItemNF.Open;
  DMNotaSaida.pTRF2:=True;
end;

procedure TFNotaTransfFilialCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ENCOPEL' then
  begin
    DMNotaSaida.QNotaSaidaCOD_SERIE.Value := 'PE';
    MECodBarras.SetFocus;
  end;

  BtConsCadastroClick(Self);
end;

procedure TFNotaTransfFilialCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaTransfFilialCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrok then
    DMNotaSaida.QNotaSaidaCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFNotaTransfFilialCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value:=DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaTransfFilialCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
   Begin
    If DMNotaSaida.DSItemNF.State = DsBrowse Then
       DMNotaSaida.QItemNF.Insert;
    DMNotaSaida.QItemNFCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;
   End;
end;

procedure TFNotaTransfFilialCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MECodProduto.Text := DMNotaSaida.QItemNFCod_Produto.Text;
  if FTipoLoteCons.ShowModal = mrOk then
    DMNotaSaida.QItemNFCOD_LOTE_TIPO.Value:=DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
end;

procedure TFNotaTransfFilialCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons:=TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
    DMNotaSaida.QItemNfCod_Tributacao.Value:=DMTributacao.QTributacaoConsCod_tributacao.Value;
end;

procedure TFNotaTransfFilialCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons:=TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = mrOk then
    begin
      DMNotaSaida.QNotaSaida.Close;
      DMNotaSaida.QNotaSaida.SetVariable('PK',DMNotaSaida.QNotaSaidaConsCod_Nota_cab.Value);
      DMNotaSaida.QNotaSaida.Open;
    end;
end;

procedure TFNotaTransfFilialCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtConsProduto.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsLote.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsTributacao.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsCadastro.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsMensagem.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsFilial.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsOperacao.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsTransportador.Enabled:=DSPrimario.State<>dsBrowse;
  MenuOpcoes.Enabled := DSPrimario.State=dsBrowse;
  BtParceiro.Enabled:=DSPrimario.State<>dsBrowse;
end;

procedure TFNotaTransfFilialCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  With DMOperacao Do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value);
    QOperacao.Open;
    If QOperacaoInd_Tipo_Operacao.Value <> 'S' Then
       Raise Exception.Create('Operação Não é de Saída!');
  End;
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFNotaTransfFilialCad.SBExcluirClick(Sender: TObject);
begin
  If MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMNotaSaida.ExcluiNota;
end;

procedure TFNotaTransfFilialCad.MenuConfirmaClick(
  Sender: TObject);
var
 x, y: array of string;
begin
  inherited;
  if FGeraNFTransEntrada = Nil then
    FGeraNFTransEntrada := TFGeraNFTransEntrada.Create(Application);
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
    Raise Exception.Create('Nota Fiscal já confirmada!');
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
    Raise Exception.Create('Não é Possível Confirmar uma Nota Fiscal Cancelada!');
  setLength(x, 3); //3 sql diferentes
  setLength(y, 3);

  x[0] := 'SELECT COD_OPERACAO_ENTRADA FROM TB_OPERACAO WHERE COD_OPERACAO = '+DMNotaSaida.QNotaSaidaCod_operacao.text;
  x[1] := 'SELECT COD_FILIAL FROM TB_FILIAL WHERE COD_CADASTRO = '+DMNotaSaida.QNotaSaidaCod_Cadastro.text;
  x[2] := 'SELECT COD_CADASTRO FROM TB_FILIAL WHERE COD_FILIAL = '+DMNotaSaida.QNotaSaidaCod_Filial.text;

  DMOracle.BuscaNomes(x, y);

  FGeraNFTransEntrada.MECodOperacao.text:= Y[0];
  FGeraNFTransEntrada.MECodFilial.text:= Y[1];
  FGeraNFTransEntrada.MECodCadastro.text:= Y[2];
  FGeraNFTransEntrada.MECodOperacaoExit(Self);
  FGeraNFTransEntrada.ShowModal;
end;

procedure TFNotaTransfFilialCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MenuConfirma.Enabled:=DMNotaSaida.QnotaSaidaCod_nota_Cab.value>0;
end;

procedure TFNotaTransfFilialCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMNotasaida.QNotaSaida.Close;
  DMNotaSaida.QItemNF.Close;
  DMNotaSaida.pTRF2:=False;
  Action := CaFree;
  FNotaTransfFilialCad := Nil;
end;

procedure TFNotaTransfFilialCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (19);
end;

procedure TFNotaTransfFilialCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaTransfFilialCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QNotaSaidaCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
    DBECodMensagemExit(Self);
  end;
end;

procedure TFNotaTransfFilialCad.BtImpItemNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  FNotaEntradaCons.MeTexto.Text:= DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  If FNotaEntradaCons.ShowModal = mrOk then
  Begin
    With DMNotaSaida do
    Begin
      QItemNfCons.Close;
      QItemNfCons.SetVariable('COD_NOTA_CAB',DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Value);
      QItemNfCons.Open;
      QItemNfCons.First;
      DMNotaSaida.pTrazPedido := True;
      While not QItemNfCons.Eof do
        With DMNotaSaida do
        Begin
          QItemNF.Insert;
          QItemNFCod_Produto.Value := QItemNfConsCod_Produto.Value;
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
             QItemNFVal_Unitario.Value := QItemNfConsVal_Custo.Value
          Else
            If QNotaSaidaConsVal_Desconto.Value > 0 Then
               QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value - (QItemNfConsVal_Desconto.Value / QItemNfConsQt_Quantidade.Value)
            else
               QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value;
          QItemNFVal_Unitario_Tabela.Value := QItemNFVal_Unitario.Value;
          QItemNFQt_Quantidade.Value := QItemNfConsQt_Quantidade.Value;
//          QItemNFVal_Desconto.Value := QItemNfConsVal_Desconto.Value;
          QItemNFCod_Tributacao.Value := QItemNfConsCod_Tributacao.Value;
          QItemNFPerc_Comissao.Value := QItemNfConsPerc_Comissao.Value;
          // Itens de Ordem de Compra atualizados nos eventos da query
          QItemNfCons.Next;
        End;
        QItemNfCons.Close;
        DMNotaSaida.pTrazPedido := False;
    End;
  End;

end;

procedure TFNotaTransfFilialCad.EmissoCopiaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
end;

procedure TFNotaTransfFilialCad.DBEdit54Exit(Sender: TObject);
Var wCodigo : String;
begin
  inherited;
  wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39)+FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value)+Chr(39));
  If wCodigo <> '' Then
     DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);

end;

procedure TFNotaTransfFilialCad.MECodBarrasExit(Sender: TObject);
var wCodigo : string;
begin
  inherited;

  if DMNotaSaida.QNotaSaida.State in [dsInsert, dsEdit] then
    if trim(MECodBarras.Text) <> '' then
      if not (DMNotaSaida.QItemNf.State in [dsInsert, dsEdit]) then
        DMNotaSaida.QItemNf.Insert;

  if DMNotaSaida.QItemNf.State in [dsInsert, dsEdit] then
  begin
    if MECodBarras.Text <> '' then
    begin
      wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = ' + Chr(39) + trim(MECodBarras.Text) + Chr(39));
      If wCodigo <> '' Then
        DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
      If wCodigo = '' Then
        Raise Exception.Create('Produto Não Cadastrado!');

      DBEdit57.SetFocus;
    end;
  end;
  MECodBarras.Text := '';
end;

procedure TFNotaTransfFilialCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFNotaTransfFilialCad.CancelarNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.CancelarNota1Click(Self);
end;

procedure TFNotaTransfFilialCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaConfirmao1Click(Self);
end;

procedure TFNotaTransfFilialCad.DBECodMensagemExit(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Value:=DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Value;
  if DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Text <> '' then
    DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value:=DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM',
        'COD_MENSAGEM = ' + DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Text);
end;

end.


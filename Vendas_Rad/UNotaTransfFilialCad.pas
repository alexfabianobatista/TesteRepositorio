unit UNotaTransfFilialCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, DBDirceu, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

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
    DBEdit5: TDBEdit;
    BtConsMensagem: TBitBtn;
    Label39: TLabel;
    DBECod_Serie_Modelo: TDBEdit;
    btSerieCons: TBitBtn;
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
    procedure DBEdit11Exit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
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
  UBiblioteca, USerieCons, USerie_cl;

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
    Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
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
    DMNotaSaida.QNotaSaidaCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFNotaTransfFilialCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
   DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := bib.verificaSerieModelo(DMNotaSaida.QNotaSaidaCOD_FILIAL.Value,
                                                                   DMNotaSaida.QNotaSaidaCOD_SERIE.Value);
end;

procedure TFNotaTransfFilialCad.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMNotaSaida.QNotaSaidaCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMNotaSaida, DMSerie do
    begin
      QNotaSaidaCOD_SERIE.Value :=
        QSerieConsCOD_SERIE.Value;
      QNotaSaidaCOD_SERIE_MODELO.Value :=
        QSerieConsCOD_SERIE_MODELO.Value;
    end;
  end;
end;

end.


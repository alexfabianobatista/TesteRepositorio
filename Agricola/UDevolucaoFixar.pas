unit UDevolucaoFixar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, OracleData, OraTeste, variants;

type
  TFDevolucaoFixar = class(TForm)
    Label3: TLabel;
    MeCadastro: TMaskEdit;
    Label4: TLabel;
    MeProduto: TMaskEdit;
    Label5: TLabel;
    MeOperacaoDev: TMaskEdit;
    Label6: TLabel;
    MeOperacaoFixar: TMaskEdit;
    Label7: TLabel;
    MeFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdCadastro: TEdit;
    EdProduto: TEdit;
    EdDevolucao: TEdit;
    EdAFixar: TEdit;
    EdFilial: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QRomConsFixar: TOracleDataSet1;
    QRomConsFixarSQUANTIDADE_FIXADO: TFloatField;
    QRomConsFixarSQUANTIDADE_FIXAR: TFloatField;
    Label8: TLabel;
    MeValDevolucao: TMaskEdit;
    Label9: TLabel;
    MeValAFixar: TMaskEdit;
    Label1: TLabel;
    MeNovoCodigo: TMaskEdit;
    EdNovoCodigo: TEdit;
    BitBtn6: TBitBtn;
    QRomConsFixarCOD_PRODUTO: TFloatField;
    QRomConsFixarCOD_CADASTRO: TFloatField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Exit(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure MeOperacaoDevExit(Sender: TObject);
    procedure MeOperacaoFixarExit(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MeNovoCodigoExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDevolucaoFixar: TFDevolucaoFixar;

implementation

uses UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl, UProdutoCons,
  UProduto_cl, UOperacaoCons, UOracle_cl, UOperacao_cl, UNotaEntrada_cl,
  UUsuario_cl, USerie_cl,UNotaImpressao, UParamSistema_cl;

{$R *.DFM}

procedure TFDevolucaoFixar.BitBtn4Click(Sender: TObject);
begin
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     MeCadastroExit(Self);
  end;
end;

procedure TFDevolucaoFixar.BitBtn3Click(Sender: TObject);
begin
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     MEFilialExit(Self);
  end;

end;

procedure TFDevolucaoFixar.BitBtn5Click(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeProdutoExit(Self);
  end;

end;

procedure TFDevolucaoFixar.SpeedButton1Click(Sender: TObject);
begin
  if FOperacaoCOns = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal =  mrOk then
    begin
      MeOperacaoDev.Text:=DMOperacao.QOperacaoConsCod_Operacao.text;
      MeOperacaoDevExit(Self);
    end;

end;

procedure TFDevolucaoFixar.SpeedButton2Click(Sender: TObject);
begin
  if FOperacaoCOns = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal =  mrOk then
    begin
      MeOperacaoFixar.Text:=DMOperacao.QOperacaoConsCod_Operacao.text;
      MeOperacaoFixarExit(Self);
    end;

end;

procedure TFDevolucaoFixar.BitBtn3Exit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFDevolucaoFixar.MeCadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.text);
//  Else
//    EdCadastro.Text := 'Obridado Informar Código Produtor';

end;

procedure TFDevolucaoFixar.MeProdutoExit(Sender: TObject);
begin
  If Trim(MEProduto.Text) <> '' Then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text)
  Else
    EdProduto.Text := 'Todos';

end;

procedure TFDevolucaoFixar.MeOperacaoDevExit(Sender: TObject);
begin
  if MeOperacaoDev.text<>'' then
    EdDevolucao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MeOperacaoDev.text)
  else
    EdDevolucao.Clear;

end;

procedure TFDevolucaoFixar.MeOperacaoFixarExit(Sender: TObject);
begin
  if MeOperacaoFixar.text<>'' then
    EdAFixar.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MeOperacaoFixar.text)
  else
    EdAFixar.Clear;

end;

procedure TFDevolucaoFixar.MeFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFDevolucaoFixar.BitBtn1Click(Sender: TObject);
Var wSerie : String;
Begin
  wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL','COD_FILIAL = '+Trim(MEFilial.text));
  If wSerie = '' Then
     Raise exception.Create('Série não informada no cadastro de filial');
  QRomConsFixar.Close;
  QRomConsFixar.SetVariable('Filial',MeFilial.Text);
  If Trim(MeCadastro.Text) <> '' Then
     QRomConsFixar.SetVariable('Cadastro',MeCadastro.Text)
  Else
     QRomConsFixar.SetVariable('Cadastro',Null);
  QRomConsFixar.SetVariable('Produto',MeProduto.Text);
  QRomConsFixar.Open;
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',Trim(MEOperacaoDev.text));
  DMOperacao.QOperacao.Open;
  DMNotaEntrada.pTipoNota := 'AGRICOLA';
  DMNotaEntrada.QNotaEntrada.Open;
  DMNotaEntrada.QItemNF.Open;
  While not(QRomConsFixar.Eof) Do
   Begin
     DMOracle.DBCemapa.StartTransaction;
     Try
       With DMNotaEntrada Do
       Begin
         DMOperacao.QOperacao.Close;
         DMOperacao.QOperacao.SetVariable('PK',Trim(MEOperacaoDev.text));
         DMOperacao.QOperacao.Open;
         QNotaEntrada.Insert;
         QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(MEFilial.text));
         QNotaEntradaCOD_OPERACAO.Value:=StrToInt(Trim(MEOperacaoDev.text));
         QNotaEntradaCod_Cadastro.Value:=Trunc(QRomConsFixarCod_Cadastro.Value);
         QNotaEntradaCOD_SERIE.Value:=wSerie;
         If DMOperacao.QOperacaoCod_Mensagem.Value > 0 Then
            QNotaEntradaCOD_MENSAGEM.Value:=DMOperacao.QOperacaoCod_Mensagem.Value;
         QItemNF.Insert;
         QItemNFCOD_PRODUTO.Value:=StrToInt(Trim(MeProduto.text));
         QItemNFCOD_LOTE_TIPO.Value:=1;
         QItemNFQT_QUANTIDADE.Value:=QRomConsFixarSQuantidade_Fixar.Value - QRomConsFixarSQuantidade_Fixado.Value;
         QItemNFVAL_UNITARIO.Value:=StrToFloat(Trim(MEValDevolucao.text));
         QItemNF.Post;
         QNotaEntrada.Edit;
         DMNotaEntrada.QNotaEntradaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Serie.Value,
          DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value);
         DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text);
         QNotaEntradaVal_Desconto.Value := 0;
         QNotaEntradaInd_Condicao_Pagto.Value := '1';
         QNotaEntradaInd_Situacao.Value := '2';
         DMNotaEntrada.QSomaItemNota.Close;
         DMNotaEntrada.QSomaItemNota.Open;
         // Atualiza contabilidade
         DMNotaEntrada.Contabiliza(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value);
         DMNotaEntrada.QNotaEntradaInd_Entrada_Saida.Value := 'S';
         DMNotaEntrada.QNotaEntrada.Post;
         DMOracle.DBCemapa.Commit;
         FNotaImpressao.EmiteNF(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value);
         // até aqui gerou a nota de devolucao do cliente
         // aqui comeca a nota fiscal de a fixar
         DMOperacao.QOperacao.Close;
         DMOperacao.QOperacao.SetVariable('PK',Trim(MEOperacaoFixar.text));
         DMOperacao.QOperacao.Open;
         QNotaEntrada.Insert;
         QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(MEFilial.text));
         QNotaEntradaCOD_OPERACAO.Value:=StrToInt(Trim(MEOperacaoFixar.text));
         QNotaEntradaCod_Cadastro.Value:=Trunc(QRomConsFixarCod_Cadastro.Value);
         QNotaEntradaCOD_SERIE.Value:=DMUsuario.CodSeriePadrao;
         If DMOperacao.QOperacaoCod_Mensagem.Value > 0 Then
            QNotaEntradaCOD_MENSAGEM.Value:=DMOperacao.QOperacaoCod_Mensagem.Value;
         QItemNF.Insert;
         QItemNFCOD_PRODUTO.Value:=StrToInt(Trim(MeNovoCodigo.text));
         QItemNFCOD_LOTE_TIPO.Value:=1;
         QItemNFQT_QUANTIDADE.Value:=QRomConsFixarSQuantidade_Fixar.Value - QRomConsFixarSQuantidade_Fixado.Value;
         QItemNFVAL_UNITARIO.Value:=StrToFloat(Trim(MEValAFixar.text));
         If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
            QItemNFVal_Pis.Value := ((StrToFloat(Trim(MEValAFixar.text)) * (QRomConsFixarSQuantidade_Fixar.Value - QRomConsFixarSQuantidade_Fixado.Value) / 60) *
                     (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) * DMParamSistema.QParamSistemaPerc_Pis.Value ) /100;
         If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
            QItemNFVal_Confins.Value := ((StrToFloat(Trim(MEValAFixar.text)) * (QRomConsFixarSQuantidade_Fixar.Value - QRomConsFixarSQuantidade_Fixado.Value) /60)  *
                       (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) * DMParamSistema.QParamSistemaPerc_Cofins.Value) /100;

         QItemNF.Post;
         QNotaEntrada.Edit;
         DMNotaEntrada.QNotaEntradaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Serie.Value,
          DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value);
         QNotaEntradaInd_Situacao.Value := '2';
         QNotaEntradaInd_Condicao_Pagto.Value := '1';
         DMNotaEntrada.QSomaItemNota.Close;
         DMNotaEntrada.QSomaItemNota.Open;
         // Atualiza contabilidade
         DMNotaEntrada.Contabiliza(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value);
         DMNotaEntrada.QNotaEntrada.Post;
         DMOracle.DBCemapa.Commit;
         FNotaImpressao.EmiteNF(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value);
       End;
     Except
         DMNotaEntrada.QItemNF.Cancel;
         DMNotaEntrada.QNotaEntrada.Cancel;
         DMOracle.DBCemapa.RollBack;
     End;
     QRomConsFixar.Next;
   End;
  Close;
end;

procedure TFDevolucaoFixar.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFDevolucaoFixar.MeNovoCodigoExit(Sender: TObject);
begin
  If Trim(MeNovoCodigo.Text) <> '' Then
    EdNovoCodigo.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MeNovoCodigo.text)
  Else
    EdNovoCodigo.Text := 'Todos';

end;

procedure TFDevolucaoFixar.BitBtn6Click(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeNovoCodigo.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeNovoCodigoExit(Self);
  end;


end;

end.

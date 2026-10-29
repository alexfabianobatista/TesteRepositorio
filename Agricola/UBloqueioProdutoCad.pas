unit UBloqueioProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, ComObj, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFBloqueioProdutoCad = class(TFTCadSimples)
    RelatriodeBloqueios1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsProduto: TBitBtn;
    BtConsMotivo: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit5: TDBEdit;
    BtCadastroParceiro: TBitBtn;
    DBDirceu5: TDBDirceu;
    DBEdit8: TDBEdit;
    BtConsLote: TBitBtn;
    DBDirceu6: TDBDirceu;
    TabSheet2: TTabSheet;
    EmissodeAutorizao1: TMenuItem;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    BtConsCadastroAutorizado: TBitBtn;
    DBDirceu7: TDBDirceu;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure BtCadastroParceiroClick(Sender: TObject);
    procedure RelatriodeBloqueios1Click(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtConsCadastroAutorizadoClick(Sender: TObject);
    procedure EmissodeAutorizao1Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBloqueioProdutoCad: TFBloqueioProdutoCad;
  WinWord, Docs, Doc: Variant;

implementation

uses UBloqueio_Produto_cl, UFilialCons, UCadastroCons, UProdutoCons,
  UMotivoCons, UFilial_cl, UCadastro_cl, UProduto_cl, UMotivo_cl,
  URomaneioAgricola_cl, UBloqueioProdutoCons, UParamSistema_cl, UUsuario_cl,
  UBloqueioProdutoParam, URBloqueioProduto, UTipoLoteCons, UTipoLote_cl,
  USequencia_cl, UOracle_cl,uBiblioteca;

{$R *.DFM}

procedure TFBloqueioProdutoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFBloqueioProdutoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFBloqueioProdutoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFBloqueioProdutoCad.BtConsMotivoClick(Sender: TObject);
Begin
  inherited;
  If FMotivoCons = nil then
     FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Motivo.Value := DMMotivo.QMotivoConsCod_Motivo.Value;
End;

procedure TFBloqueioProdutoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMBloqueio_Produto Do
    QBloqueioProduto_Cad.Open;
end;

procedure TFBloqueioProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMBloqueio_Produto Do
  Begin
    QBloqueioProduto_Cad.Close;
    QBloqueioProduto_Cons.Close;
  End;
  Action := CaFree;
  FBloqueioProdutoCad := Nil;
end;

procedure TFBloqueioProdutoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBloqueioProdutoCons = nil then
     FBloqueioProdutoCons := TFBloqueioProdutoCons.Create(Application);
  If FBloqueioProdutoCons.ShowModal = mrOK then
     with DMBloqueio_Produto do
     begin
        QBloqueioProduto_Cad.Close;
        QBloqueioProduto_Cad.SetVariable('PK',QBloqueioProduto_ConsCod_Produto_Bloqueado.Value);
        QBloqueioProduto_Cad.Open;
     end;
end;

procedure TFBloqueioProdutoCad.SBExcluirClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
     If (DMUsuario.CodUsuarioCorrente <> DMBloqueio_Produto.QBloqueioProduto_CadCod_Usuario.Value) And
        (not DMusuario.Privilegiado)  Then
        raise exception.Create ('Não Permitido Este Usuário Desbloquear - bloqueio Efetuado Por Outro Usuário' );
  inherited;

end;

procedure TFBloqueioProdutoCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMBloqueio_Produto.QBloqueioProduto_CadCOD_FILIAL.Text),'AGRICOLA');
  inherited;
end;

procedure TFBloqueioProdutoCad.SBAlterarClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
     If (DMUsuario.CodUsuarioCorrente <> DMBloqueio_Produto.QBloqueioProduto_CadCod_Usuario.Value) And
        (not DMusuario.Privilegiado)  Then
        raise exception.Create ('Não Permitido Este Usuário Desbloquear - bloqueio Efetuado Por Outro Usuário' );
  inherited;

end;

procedure TFBloqueioProdutoCad.BtCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFBloqueioProdutoCad.RelatriodeBloqueios1Click(Sender: TObject);
begin
  inherited;
  if FBloqueioProdutoParam = nil then
    FBloqueioProdutoParam := TFBloqueioProdutoParam.Create(Application);
  FBloqueioProdutoParam.PGRelatorio.ActivePageIndex := 1;
  if FBloqueioProdutoParam.ShowModal = MrOk then
    with DMBloqueio_Produto do
    begin
    //if Trim(FProdutoAgricolaParam.Fm0Produto.MeProduto.Text) = '' then
//      QRProdutoAgricola.SetVariable('COD_PRODUTO', null)
//    else
//      QRProdutoAgricola.SetVariable('COD_PRODUTO', Trim(FProdutoAgricolaParam.Fm0Produto.MeProduto.Text));
//
//    if Trim(FProdutoAgricolaParam.Fm0Tributacao.MeTributacao.Text) = '' then
//      QRProdutoAgricola.SetVariable('COD_TRIBUTACAO', null)
//    else
//      QRProdutoAgricola.SetVariable('COD_TRIBUTACAO', Trim(FProdutoAgricolaParam.Fm0Tributacao.MeTributacao.Text));
//
//    if FRProdutoAgricola = nil then
//      FRProdutoAgricola := TFRProdutoAgricola.Create(Application);
//    FRProdutoAgricola.QRLProduto.Caption := FProdutoAgricolaParam.Fm0Produto.EdProduto.Text;
//    FRProdutoAgricola.QRLTributacao.Caption := FProdutoAgricolaParam.Fm0Tributacao.EdTributacao.Text;
//
//    QRProdutoAgricola.open;
//    if FProdutoAgricolaParam.RGPreview.ItemIndex = 0 then
//       FRProdutoAgricola.QRPrimario.Preview
//    else
//       FRProdutoAgricola.QRPrimario.Print;
//
//    QRProdutoAgricola.Close;
      try
        StrToDate(FBloqueioProdutoParam.ME0DtBloqueioIni.Text);
        StrToDate(FBloqueioProdutoParam.ME0DtBloqueioFim.Text);
      except
        Raise Exception.Create('Por favor, informe corretamente o intervalo de datas de bloqueio.');
      end;

      QRBloqueioProduto.SetVariable('DT_BLOQUEIO_INI', StrToDate(FBloqueioProdutoParam.ME0DtBloqueioIni.Text));
      QRBloqueioProduto.SetVariable('DT_BLOQUEIO_FIM', StrToDate(FBloqueioProdutoParam.ME0DtBloqueioFim.Text));

      if Trim(FBloqueioProdutoParam.Fm0Produto.MeProduto.Text) = '' then
        QRBloqueioProduto.SetVariable('COD_PRODUTO', null)
      else
        QRBloqueioProduto.SetVariable('COD_PRODUTO', StrToInt(Trim(FBloqueioProdutoParam.Fm0Produto.MeProduto.Text)));

      if Trim(FBloqueioProdutoParam.ME0DtLancamentoIni.Text) = '' then
        QRBloqueioProduto.SetVariable('DT_LANCAMENTO_INI', null)
      else
        QRBloqueioProduto.SetVariable('DT_LANCAMENTO_INI', StrToDate(Trim(FBloqueioProdutoParam.ME0DtLancamentoIni.Text)));

      if Trim(FBloqueioProdutoParam.ME0DtLancamentoFim.Text) = '' then
        QRBloqueioProduto.SetVariable('DT_LANCAMENTO_FIM', null)
      else
        QRBloqueioProduto.SetVariable('DT_LANCAMENTO_FIM', StrToDate(Trim(FBloqueioProdutoParam.ME0DtLancamentoFim.Text)));

      if FRBloqueioProduto = nil then
        FRBloqueioProduto := TFRBloqueioProduto.Create(Application);

      case FBloqueioProdutoParam.RG0TipoProduto.ItemIndex of
      0:
        begin
          QRBloqueioProduto.SetVariable('IND_TIPO_PRODUTO', 'FIXAR');
          FRBloqueioProduto.QRLTipoProduto.Caption := 'Fixar';
        end;
      1:
        begin
          QRBloqueioProduto.SetVariable('IND_TIPO_PRODUTO', 'CONSUMO');
          FRBloqueioProduto.QRLTipoProduto.Caption := 'Consumo';
        end;
      2:
        begin
          QRBloqueioProduto.SetVariable('IND_TIPO_PRODUTO', null);
          FRBloqueioProduto.QRLTipoProduto.Caption := 'Todos';
        end;
      end;
      FRBloqueioProduto.QRLProduto.Caption := FBloqueioProdutoParam.Fm0Produto.EdProduto.Text;
      FRBloqueioProduto.QRLDataBloqueio.Caption := FBloqueioProdutoParam.ME0DtBloqueioIni.Text +
        ' até ' + FBloqueioProdutoParam.ME0DtBloqueioFim.Text;
      FRBloqueioProduto.QRLDataLancamento.Caption := Trim(FBloqueioProdutoParam.ME0DtLancamentoIni.Text);
      if Trim(FBloqueioProdutoParam.ME0DtLancamentoFim.Text) <> '' then
        FRBloqueioProduto.QRLDataLancamento.Caption :=
          FRBloqueioProduto.QRLDataLancamento.Caption + ' até ' +
            Trim(FBloqueioProdutoParam.ME0DtLancamentoFim.Text)
      else
        FRBloqueioProduto.QRLDataLancamento.Caption :=
          FRBloqueioProduto.QRLDataLancamento.Caption + ' até hoje';

      QRBloqueioProduto.open;
      if FBloqueioProdutoParam.RGPreview.ItemIndex = 0 then
        FRBloqueioProduto.QRPrimario.Preview
      else
        FRBloqueioProduto.QRPrimario.Print;
      QRBloqueioProduto.Close;
    end;
end;

procedure TFBloqueioProdutoCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;

end;

procedure TFBloqueioProdutoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtConsFilial.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  BtConsCadastro.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  BtConsProduto.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  BtConsLote.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  BtCadastroParceiro.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  BtConsMotivo.Enabled := DSPrimario.State in [DsInsert,DsEdit];
end;

procedure TFBloqueioProdutoCad.BtConsCadastroAutorizadoClick(
  Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMBloqueio_Produto.QBloqueioProduto_CadCod_Cadastro_Autorizado.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFBloqueioProdutoCad.EmissodeAutorizao1Click(Sender: TObject);
var
   Path,campo : String;
   x, y: array of string;
   wNumero : Integer;
begin
  if DMBloqueio_Produto.QBloqueioProduto_CadCOD_PRODUTO_BLOQUEADO.value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMBloqueio_Produto.QBloqueioProduto_CadCOD_FILIAL.Text),'AGRICOLA');
      If Trim(DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO_AUTORIZADO.Text) = '' Then
         Raise exception.Create('Preencher Cadastro autorizado');

      If DMBloqueio_Produto.QBloqueioProduto_CadNUM_AUTORIZACAO.Text = '' Then
       Begin
         wNumero := DMSequencia.Sequencia(DMBloqueio_Produto.QBloqueioProduto_CadCOD_FILIAL.Value,'AUTORIZACAO VENDA');
         DMBloqueio_Produto.QBloqueioProduto_Cad.Edit;
         DMBloqueio_Produto.QBloqueioProduto_CadNUM_AUTORIZACAO.Value := wNumero;
         DMBloqueio_Produto.QBloqueioProduto_Cad.Post;
       End;
      setLength(x, 6);
      setLength(y, 6);

      x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO.Text;
      x[1] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO.Text;
      x[2] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO_AUTORIZADO.Text;
      x[3] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO_AUTORIZADO.Text;
      x[4] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO WHERE COD_CADASTRO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_CADASTRO_AUTORIZADO.Text;
      x[5] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = '+DMBloqueio_Produto.QBloqueioProduto_CadCOD_PRODUTO.Text;
      DMOracle.BuscaNomes(x, y);

      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'Autorizacao.Doc');
      // Substitui texto via "name parameters"
      campo:=DMBloqueio_Produto.QBloqueioProduto_CadNUM_AUTORIZACAO.Text;
      Doc.Content.Find.Execute(FindText := '%sequencia',ReplaceWith := campo,Replace:=2);
      campo:=Y[2];
      Doc.Content.Find.Execute(FindText := '%nome_autorizado',ReplaceWith := campo,Replace:=2);
      campo:=Y[3];
      Doc.Content.Find.Execute(FindText := '%cpf_autorizado',ReplaceWith := campo,Replace:=2);
      campo := y[4];
      Doc.Content.Find.Execute(FindText := '%rg_autorizado',ReplaceWith := campo,Replace:=2);
      campo := FormatFloat('#,##0',DMBloqueio_Produto.QBloqueioProduto_CadQT_QUANTIDADE.Value);
      Doc.Content.Find.Execute(FindText := '%quant',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMBloqueio_Produto.QBloqueioProduto_CadQT_QUANTIDADE.Value,'KG');
      Doc.Content.Find.Execute(FindText := '%qt_extensao',ReplaceWith := campo,Replace:=2);
      campo := Y[5];
      Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
      campo:=Y[0];
      Doc.Content.Find.Execute(FindText := '%nome_contrato',ReplaceWith := campo,Replace:=2);
      campo:=Y[1];
      Doc.Content.Find.Execute(FindText := '%cpf_contrato',ReplaceWith := campo,Replace:=2);

      // Grava documento
      Doc.SaveAs(Path+'Autorizacao2.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar um contrato a ser emitido.');

end;

procedure TFBloqueioProdutoCad.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit4.Text);
end;

end.

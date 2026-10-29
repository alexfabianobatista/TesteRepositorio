unit UNotaConsumidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, ActnList;

type
  TFNotaConsumidor = class(TFTCadSimples)
    Label10: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBECliente: TDBEdit;
    BtConsCadastro: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtConsOperacao: TBitBtn;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtConsVendedor: TBitBtn;
    DBGrid1: TDBGrid;
    BtConsProduto: TBitBtn;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    DBECod_Nota: TDBEdit;
    SBConfNota: TSpeedButton;
    DBRGCondPagto: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    SBImprimeNFCons: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    LblAutoriza: TLabel;
    LblFormaCompra: TLabel;
    DBEdit53: TDBEdit;
    Label64: TLabel;
    BtConsDepartamento: TBitBtn;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    SBComprovanteEntrega: TSpeedButton;
    DBECod_Serie_Modelo: TDBEdit;
    btSerieCons: TBitBtn;
    Label39: TLabel;
    lblModelo: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure DBECod_NotaChange(Sender: TObject);
    procedure SBConfNotaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBImprimeNFConsClick(Sender: TObject);
    procedure DBRGCondPagtoChange(Sender: TObject);
    procedure DBEClienteExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBComprovanteEntregaClick(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBECod_Serie_ModeloExit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaConsumidor: TFNotaConsumidor;

implementation

uses  UCadastroCons, UOperacaoCons, UCadastro_cl,
  UOperacao_cl, UVendedorCons, UOracle_cl, UVendedor_cl, UNotaSaidaCons,
  UProdutoCons, UProduto_cl, UNotaConsum_Confirma, UNotaImpressao,
  UNotaSaida_cl, UUsuario_cl, UNotaConsumidorNome, USerie_cl,
  UParamSistema_cl, UDepartamentoCons, UDepartamento_cl,
  UNotaComprovanteEntrega, USerieCons, UBiblioteca;

{$R *.DFM}

procedure TFNotaConsumidor.FormActivate(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaida.Open;
    QItemNF.Open;
  End;
end;

procedure TFNotaConsumidor.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEClienteExit(Self);
end;

procedure TFNotaConsumidor.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaConsumidor.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

Procedure TFNotaConsumidor.SBConfirmarClick(Sender: TObject);
Begin
//  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
     Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') Then
    If (DBRGCondPagto.ItemIndex <> 0) Then //condicao de pagamento a vista
     Begin
       DMNotaSaida.TestaCadastro(StrToInt(DBECliente.Text));
       If DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO','COD_CADASTRO = '+DBECliente.Text) = 'A Vista' Then
          Raise Exception.Create('Cliente com Permissão Para Compra Somente a Vista');
     End;
  Inherited;
  DMOracle.DBCemapa.Commit;
  If (DMNotaSaida.QNotaSaidaCod_Cadastro.Value = DMUsuario.CodClientePadrao) And
     ((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '1') And
      (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '4')) then
  Begin
    DMNotaSaida.QNotaSaida.Edit;
    Raise Exception.Create('Condição Pagamento Invalida, Para Este Cliente!');
  End;
  SBConfNotaClick(Self);
End;

procedure TFNotaConsumidor.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',QNotaSaidaConsCod_Nota_Cab.Value);
    QNotaSaida.Open;
    QNotaSaida.Edit;
    If DMUsuario.CodVendedorPadrao > 0 Then
      QNotaSaidaCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
    If DMUsuario.CodOperacaoPadrao > 0 Then
      QNotaSaidaCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
    If DMUsuario.CodSeriePadrao <> '' Then
      QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
    QNotaSaidaNum_Nota.Value := 0;
  End;
end;

procedure TFNotaConsumidor.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
  End;
end;

procedure TFNotaConsumidor.DBECod_NotaChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QSomaItemNota.Close;
    QSomaItemNota.SetVariable('COD_NOTA_CAB',DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
    QSomaItemNota.Open;
  End;
end;

procedure TFNotaConsumidor.SBConfNotaClick(Sender: TObject);
begin
  inherited;
  Try
    If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
       Raise Exception.Create('Nota já confirmada!');
    If FNotaConsum_Confirma = Nil then
       FNotaConsum_Confirma := TFNotaConsum_Confirma.Create(Application);
    DMNotaSaida.ChecaNota;
    DMNotaSaida.pConfirmando := True;
    FNotaConsum_Confirma.ShowModal;
    DMNotaSaida.pConfirmando := False;
  Except
    DMNotaSaida.pConfirmando := False;
    Raise;
  End;
end;

procedure TFNotaConsumidor.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBConfNota.Enabled := DMNotaSaida.QNotaSaida.State = dsBrowse;
  SBImprimeNFCons.Enabled := SBConfNota.Enabled;
end;

procedure TFNotaConsumidor.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  If MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMNotaSaida.ExcluiNota;
end;

procedure TFNotaConsumidor.SBCancelarClick(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    If QItemNF.State in [dsEdit,dsInsert] then
      QItemNF.Cancel;
  End;
  LblFormaCompra.Caption := '';
  LblAutoriza.Caption := '';
  inherited;
end;

procedure TFNotaConsumidor.SBImprimeNFConsClick(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '2' Then
     Raise Exception.Create('Somente Notas Confirmadas Para Emitir Cópia de Nota');
  If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Operacao.Value)) = 'F' Then
     Raise Exception.Create('Somente é Permitido Está Operação Com Nota Fiscal');
  If FNotaConsumidorNome = Nil then
    FNotaConsumidorNome := TFNotaConsumidorNome.Create(Application);
  If FNotaConsumidorNome.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
   pNotaNome := True;  // este campo testa na query QNotaCab // before post // before edit
   If (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') or
      (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') Then
    Begin
      QNotaSaida.Edit;
      If (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') Then
        QNotaSaidaCod_Cadastro.Value := StrToInt(Trim(FNotaConsumidorNome.MeCadastro.Text));
      If (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') Then
        QNotaSaidaCod_Operacao.Value := StrToInt(trim(FNotaConsumidorNome.MeOperacao.Text));
      If (Trim(FNotaConsumidorNome.MeSerie.Text) <> '') Then
         QNotaSaidaCod_Serie.Value := Trim(FNotaConsumidorNome.MeSerie.Text);
      If (Trim(FNotaConsumidorNome.MeNumero.Text) = '') Then
         QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value,
                                                          QNotaSaidaCOD_SERIE_MODELO.Value)
      Else
         QNotaSaidaNum_Nota.Value := StrToInt(Trim(FNotaConsumidorNome.MeNumero.Text));
      QNotaSaida.Post;
      DMOracle.DBCemapa.Commit;
    End;
   pNotaNome := False;  // este campo testa na query QNotaCab // before post // before edit
   If (Trim(FNotaConsumidorNome.EdCadastro.Text) <> '') and
      (Trim(FNotaConsumidorNome.MeCadastro.Text) = '') Then
    Begin
      QNotaNome.Close;
      QNotaNome.SetVariable('PK',QNotaSaidaCod_Nota_Cab.Value);
      QNotaNome.Open;
      If QNotaNome.Eof then
         QNotaNome.Insert
      Else
         QNotaNome.Edit;
      QNotaNomeCod_Nota_Cab.Value := QNotaSaidaCod_Nota_Cab.Value;
      QNotaNomeNome.Value := Trim(FNotaConsumidorNome.EdCadastro.Text);
      QNotaNomeDesc_Endereco.Value := Trim(FNotaConsumidorNome.MeEndereco.Text);
      QNotaNomeDesc_Cgc_Cpf.Value := Trim(FNotaConsumidorNome.MeCgc_Cpf.Text);
      QNotaNomeDesc_Inscricao.Value := Trim(FNotaConsumidorNome.MeInscricao.Text);
      QNotaNome.Post;
    End;
  End;
  If DMOracle.DBCemapa.InTransaction Then
      DMOracle.DBCemapa.Commit;
  FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
end;

procedure TFNotaConsumidor.DBRGCondPagtoChange(Sender: TObject);
begin
  inherited;
  if (DMOracle.DBCemapa.InTransaction) and (DMNotaSaida.QNotaSaida.State in [dsInsert,dsEdit]) then
    begin
      with DMNotaSaida do
        begin
          if DBRGCondPagto.ItemIndex=0 then  // a vista
            if DMUsuario.CodSeriePadrao<>'' then
              QNotaSaidaCod_Serie.Value:=DMUsuario.CodSeriePadrao;
          if DBRGCondPagto.ItemIndex=1 then  // a prazo
            if DMUsuario.CodSeriePrazo<>'' then
              QNotaSaidaCod_Serie.Value:=DMUsuario.CodSeriePrazo;

          if DBRGCondPagto.ItemIndex=2 then // conta corrente
            if DMUsuario.CodSerieCC<>'' then
              QNotaSaidaCod_Serie.Value:=DMUsuario.CodSerieCC;

          if DBRGCondPagto.ItemIndex=3 then   // cartao de credito
            if DMUsuario.CodSerieCartao<>'' then
              QNotaSaidaCod_Serie.Value:=DMUsuario.CodSerieCartao;
        end;
    end;
end;

procedure TFNotaConsumidor.DBEClienteExit(Sender: TObject);
begin
  inherited;
  IF (DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',
          'TB_CADASTRO.COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value))) <> '' Then
     Raise Exception.Create('Cliente com Cadastro Encerrado!');
  If Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text) <> '' Then
   Begin
     LblAutoriza.Caption := 'Autorizado:'+DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+'-'+DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc '+DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value))
   End
  Else
   Begin
     LblAutoriza.Caption := '';
     LblFormaCompra.Caption := '';
   End;
end;

procedure TFNotaConsumidor.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(17);
end;

procedure TFNotaConsumidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QItemNF.Close;
    QSomaItemNota.Close;
    QContaReceber.Close;
    QContaReceberMov.Close;
    QEstoqueBaixa.Close;
    QCaixa.Close;
    QBaixaAux.Close;
    QNotaAux.Close;
    QNotaAuxItNf.Close;
  End;
  Action := CaFree;
  FNotaConsumidor := Nil;
end;

procedure TFNotaConsumidor.DBGrid1ColExit(Sender: TObject);
Var wCodigo : String;
begin
  inherited;
  If DbGrid1.SelectedField.FieldName = 'COD_PRODUTO' then
   Begin
     If DMNotaSaida.QItemNFCod_Produto.Text <> '' Then
     Begin
       wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39)+FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value)+Chr(39));
       If wCodigo <> '' Then
          DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
       wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Chr(39)+FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value)+Chr(39));
       If wCodigo = '' Then
          Raise Exception.Create('Produto Não Cadastrado!');
     End;
   End;
end;

procedure TFNotaConsumidor.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) and (Dbgrid1.Columns.Grid.SelectedIndex = 0) then
     Dbgrid1.Columns.Grid.SelectedIndex := 1;
end;

procedure TFNotaConsumidor.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If (DMNotaSaida.QItemNfCod_Produto.Value = 0) Or (DMNotaSaida.QItemNfCod_Produto.Text = '') Then
     Dbgrid1.Columns.Grid.SelectedIndex := 0;

end;

procedure TFNotaConsumidor.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFNotaConsumidor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaConsumidor.SBComprovanteEntregaClick(Sender: TObject);
begin
  inherited;
if (Trim(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '')  and
   (Trim(DMNotaSaida.QNotaSaidaInd_Situacao.Text) = '2') then
  begin
    if FNotaComprovanteEntrega = nil then
      FNotaComprovanteEntrega := TFNotaComprovanteEntrega.Create(Application);
      FNotaComprovanteEntrega.showModal;
  end
  else
    Raise Exception.Create('Informe uma nota confirmada para gerar o Comprovante de Entrega');

end;
procedure TFNotaConsumidor.btSerieConsClick(Sender: TObject);
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
      DBECod_Serie_ModeloExit(Self);
    end;
  end;
end;

procedure TFNotaConsumidor.DBECod_Serie_ModeloExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaConsumidor.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := bib.verificaSerieModelo(DMNotaSaida.QNotaSaidaCOD_FILIAL.Value,
                                                                   DMNotaSaida.QNotaSaidaCOD_SERIE.Value);
end;

end.

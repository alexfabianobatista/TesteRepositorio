unit UNotaConsumidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, ToolWin, jpeg, ActnList,
  DBPanel;

type
  TFNotaConsumidor = class(TFTCadSimples)
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
    SBConfNota: TSpeedButton;
    SBImprimeNFCons: TSpeedButton;
    SBComprovanteEntrega: TSpeedButton;
    PGNota: TPageControl;
    TSNota: TTabSheet;
    TSItens: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    LblFormaCompra: TLabel;
    Label64: TLabel;
    Label2: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBECliente: TDBEdit;
    BtConsCadastro: TBitBtn;
    DBEdit6: TDBEdit;
    BtConsOperacao: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    BtConsVendedor: TBitBtn;
    DBECod_Nota: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBEDepartamento: TDBEdit;
    BtConsDepartamento: TBitBtn;
    DBEdit5: TDBEdit;
    BtConsCadastroParceiro: TBitBtn;
    DBDirceu2: TDBDirceu;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBRGCondPagto: TDBRadioGroup;
    Panel2: TPanel;
    BtConsProduto: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DBEdit17: TDBEdit;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DataSource2: TDataSource;
    imgProduto: TImage;
    lblImagemNaoDisponivel: TLabel;
    Bevel1: TBevel;
    lblProduto: TLabel;
    lblPreco: TLabel;
    LblAutoriza: TLabel;
    Label1: TLabel;
    lblUsuario: TLabel;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    BtCondicao: TBitBtn;
    Label5: TLabel;
    DBEdit13: TDBEdit;
    DBDirceu3: TDBDirceu;
    lblRamo: TLabel;
    Opes1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    CancelaNota1: TMenuItem;
    LblSituacao: TLabel;
    Label7: TLabel;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit16: TDBEdit;
    DBPanel1: TDBPanel;
    btSerieCons: TBitBtn;
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
    procedure BtConsCadastroParceiroClick(Sender: TObject);
    procedure SBComprovanteEntregaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBEdit17Change(Sender: TObject);
    procedure AtualizarImagemProduto;
    procedure BtCondicaoClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure CancelaNota1Click(Sender: TObject);
    procedure DBEClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PGNotaChange(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBPanel1CodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaConsumidor: TFNotaConsumidor;

implementation

uses  UCadastroCons, UOperacaoCons, UCadastro_cl, UBiblioteca,
  UOperacao_cl, UVendedorCons, UOracle_cl, UVendedor_cl, UNotaSaidaCons,
  UProdutoCons, UProduto_cl, UNotaConsum_Confirma, UNotaImpressao,
  UNotaSaida_cl, UUsuario_cl, UNotaConsumidorNome, USerie_cl,
  UParamSistema_cl, UDepartamentoCons, UDepartamento_cl,
  UNotaComprovanteEntrega, UPrazoVencimentoCons, UPrazoVencimento_cl,
  UNotaSaidaCad, UContasReceberCons, UImpressoraFiscal, USerieCons;

{$R *.DFM}

procedure TFNotaConsumidor.FormActivate(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaida.Open;
    QItemNF.Open;
  End;
  LblUsuario.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
  Begin
     Label2.Visible := False;
     BtConsCadastroParceiro.Visible := False;
     DbEdit5.Visible := False;
     Label64.Visible := False;
     DbeDepartamento.Visible := False;
     BtConsDepartamento.Visible := False;
     DbEdit7.Visible := True;
     Label4.Visible := True;
     BtCondicao.Visible := True;
     DbEdit7.Left := 112;
     Label4.Left := 112;
     BtCondicao.Left := 163;
     DbRgCondPagto.Visible := False;
     Label5.Visible := True;
     DbEdit13.Visible := True;
     DBEdit14.Visible := True;
     Label7.Visible := True;
     DBEdit16.Visible := True;
     Label13.Visible := True;
  End;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' Then
   Begin
     FNotaConsumidor.TSNota.TabVisible := False;
     DbGrid1.Columns[3].ReadOnly := True;
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
  DBECliente.SetFocus;
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
  DBEdit6.SetFocus;  
end;

procedure TFNotaConsumidor.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  DBEdit8.SetFocus;  
end;

Procedure TFNotaConsumidor.SBConfirmarClick(Sender: TObject);
Var wFormaPagto : String;
Begin
//  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
     Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contábil');
  If DBEdit8.Text <> '' Then  // Codigo do vendedor
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+DBEdit8.Text) <> 'ATIVO' Then
        Raise Exception.Create('Vendedor Inativo');
  Inherited;
  
  DMOracle.DBCemapa.Commit;

 // if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CEREAIS' then  comentado por marcos 11/09/08
  //  If (DMNotaSaida.QNotaSaidaCod_Cadastro.Value = DMUsuario.CodClientePadrao) And
       //((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '1') And       //Retirado a pedido do Ederli .. disse que fazem venda a prazo para cliente padrao
 //       (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '4') then
 //   Begin
 //     DMNotaSaida.QNotaSaida.Edit;
 //     Raise Exception.Create('Condição Pagamento Inválida, Para Este Cliente!');
 //   End;

  SBConfNotaClick(Self);
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo); 
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
    if QNotaSaidaNum_Nota.Text = '' then
      QNotaSaidaNum_Nota.Value := 0;
  End;
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo); 
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
Var wEntrada,wDecimal : Real;
   wValDesconto : String; // para utilizar no inputquery
begin
  inherited;
  Try
    If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
       Raise Exception.Create('Nota já confirmada!');
    If FNotaConsum_Confirma = Nil then
       FNotaConsum_Confirma := TFNotaConsum_Confirma.Create(Application);
    DMNotaSaida.ChecaNota;
    FNotaConsum_Confirma.MeEntrada.Text := '0';
    FNotaConsum_Confirma.MeValorDesconto.Text := '0';
    wEntrada := 0;  // para descontar a entrada efetuada no calculo automatico do sistema ARISTIDES
    If DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text <> '' Then
     Begin
       DMPrazoVencimento.QPrazoVencimento.Close;
       DMPrazoVencimento.QPrazoVencimento.SetVariable('Pk',DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value);
       DMPrazoVencimento.QPrazoVencimento.Open;
       If (DMPrazoVencimento.QPrazoVencimentoPERC_DESCONTO.Text <> '') And
          (DMNotaSaida.QNotaSaidaVal_Desconto.Value = 0)  Then
        Begin
          FNotaConsum_Confirma.MeValorDesconto.Text := FloatToStr(Trunc(DMNotaSaida.QSomaItemNotasval_total_nota.Value * DMPrazoVencimento.QPrazoVencimentoPERC_DESCONTO.Value) / 100 );
          If DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value = 1 Then
          Begin
            wValDesconto := FNotaConsum_Confirma.MeValorDesconto.Text;
            If InputQuery('Desconto', 'Valor Desconto', wValDesconto) Then
              FNotaConsum_Confirma.MeValorDesconto.Text := wValDesconto
            Else
              exit;
          End;
        End;
       If (DMPrazoVencimento.QPrazoVencimentoInd_Entrada.Value = 'SIM') Then
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') Then
          Begin    // o valor das casas decimais fica todo na primeira parcela.
            If DMNotaSaida.QNotaSaidaVal_AVista.Value = 0 Then
             Begin
               wEntrada := Trunc((DMNotaSaida.QSomaItemNotasVal_total_nota.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text)) / (DMPrazoVencimento.QPrazoVencimentoNUM_PARCELAS.Value + 1));
               wDecimal := Frac((DMNotaSaida.QSomaItemNotasVal_total_nota.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text)) / (DMPrazoVencimento.QPrazoVencimentoNUM_PARCELAS.Value + 1));
               If DMPrazoVencimento.QPrazoVencimentoNUM_PARCELAS.Value <= 3 Then
                  wEntrada := wEntrada + Frac(DMNotaSaida.QSomaItemNotasVal_total_nota.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text))
               Else
                 If wDecimal < 0.50 Then
                    wEntrada := wEntrada + 1;
               FNotaConsum_Confirma.MeEntrada.Text := FloatToStr(Round(wEntrada*100)/100);
               DMNotaSaida.QNotaSaida.Edit;
               DMNotaSaida.QNotaSaidaVal_AVista.Value := Round(wEntrada*100)/100;
               DMNotaSaida.QNotaSaida.Post;
               DMNotaSaida.QSomaItemNota.Close;
               DMNotaSaida.QSomaItemNota.Open;
             End  
          End
         Else
            FNotaConsum_Confirma.MeEntrada.Text := FloatToStr(Trunc((DMNotaSaida.QSomaItemNotasval_total_nota.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text)) / (DMPrazoVencimento.QPrazoVencimentoNUM_PARCELAS.Value + 1) * 100) / 100);
     End;
    DMNotaSaida.pConfirmando := True;
    FNotaConsum_Confirma.MeVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+DMNotaSaida.QNotaSaidaCod_Vendedor.Text);
//    FNotaConsum_Confirma.MeEntrada.Text := MeEntrada.Text;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
     Begin
      FNotaConsum_Confirma.MeCadastro.Text := FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value);
      FNotaConsum_Confirma.EdTotalNF.Text := FloatToStr(DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text));
      FNotaConsum_Confirma.EdVenda.Text := FloatToStr(DMNotaSaida.QSomaItemNotasval_total_nota.Value - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text));
      If DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
         DMCadastro.ValidaCredito(DmNotaSaida.QNotaSaidaCod_Cadastro.Value,DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value);
      FNotaConsum_Confirma.MeDepartamento.Text := '1';
      FNotaConsum_Confirma.MePrazo.Text := DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text;
      If (Trim(FNotaConsum_Confirma.MePrazo.Text) = '1') or
         (Trim(FNotaConsum_Confirma.MePrazo.Text) = '2') or
         (Trim(FNotaConsum_Confirma.MePrazo.Text) = '3') Then
         FNotaConsum_Confirma.MeFinalidade.Text := '3'
      Else
         FNotaConsum_Confirma.MeFinalidade.Text := '2';
      FNotaConsum_Confirma.LBContaReceber.Clear;
      If DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
       Begin
         FNotaConsum_Confirma.MePrazoExit(Self);
         FNotaConsum_Confirma.PCConfirma.Pages[0].TabVisible := False;
         FNotaConsum_Confirma.PCConfirma.Pages[1].TabVisible := True;
         FNotaConsum_Confirma.ShowModal;
       End
      Else
        FNotaConsum_Confirma.Finaliza;
     End
    Else
      FNotaConsum_Confirma.ShowModal;
    DMNotaSaida.pConfirmando := False;
    SBRefreshClick(Self);  // para atualizar os dados na tela
  Except
    DMNotaSaida.pConfirmando := False;
    Raise;
  End;
end;

procedure TFNotaConsumidor.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBConfNota.Enabled := DMNotaSaida.QNotaSaida.State = dsBrowse;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')  And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES') then
     SBImprimeNFCons.Enabled := SBConfNota.Enabled;
  BtConsCadastro.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsOperacao.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsVendedor.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsDepartamento.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsCadastroParceiro.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '1' Then
     LblSituacao.Caption := 'DIGITADA';
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
     LblSituacao.Caption := 'CONFIRMADA';
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
     LblSituacao.Caption := 'CANCELADA';
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
  lblRamo.Caption := '';
  inherited;
end;

procedure TFNotaConsumidor.SBImprimeNFConsClick(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')  And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES') Then
  Begin
    If (DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '2') And
       (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '4') Then
       Raise Exception.Create('Somente Notas Confirmadas Para Emitir Cópia de Nota');
//    If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Operacao.Value)) = 'F' Then
//       Raise Exception.Create('Somente é Permitido Está Operação Com Nota Fiscal');
  End;
  If FNotaConsumidorNome = Nil then
    FNotaConsumidorNome := TFNotaConsumidorNome.Create(Application);
  If FNotaConsumidorNome.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    If ((DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') And
        (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')) And
        (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES')  And
       (DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2') Then // somente para notas confirmadas que muda
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
            QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value, QNotaSaidaCOD_SERIE_MODELO.Value)
         Else
            QNotaSaidaNum_Nota.Value := StrToInt(Trim(FNotaConsumidorNome.MeNumero.Text));
         QNotaSaida.Post;
         DMOracle.DBCemapa.Commit;
       End;
      pNotaNome := False;  // este campo testa na query QNotaCab // before post // before edit
    End;
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
      QNotaNomeDESC_CIDADE.Value := Trim(FNotaConsumidorNome.edCidade.Text);
      QNotaNomeDESC_ESTADO.Value := Trim(FNotaConsumidorNome.edEstado.Text);
      QNotaNomeDESC_CEP.Value := Trim(FNotaConsumidorNome.edCEP.Text);
      If QNotaSaida.State = DsInsert Then
       Begin
         QNotaSaida.Post;
         QNotaSaida.Edit;
       End;
      QNotaNome.Post;
    End;
  End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')  And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES') Then
  Begin
    If DMOracle.DBCemapa.InTransaction Then
       DMOracle.DBCemapa.Commit;
    If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
       FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
  End;
end;

procedure TFNotaConsumidor.DBRGCondPagtoChange(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BRASIL' Then
   Begin
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
             Begin
               if DMUsuario.CodSerieCartao<>'' then
                 QNotaSaidaCod_Serie.Value:=DMUsuario.CodSerieCartao;
             End;
          end;
      end;
   End;
end;

procedure TFNotaConsumidor.DBEClienteExit(Sender: TObject);
Var wAux : String;
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
     LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     wAux := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB ',
           ' IND_SITUACAO<>'+Chr(39)+'BAIXA TOTAL'+Chr(39)+
           ' AND COD_CADASTRO = '+Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text));
//           + ' AND DT_VENCIMENTO <= '+Chr(39)+DateToStr(Date)+Chr(39));
     If ((wAux <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CEREAIS')) Then
        If MessageDLG('Cliente Possui Titulos R$ '+wAux,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
            If FContasReceberCons = Nil Then
               FContasReceberCons := TFContasReceberCons.Create(Application);
            FContasReceberCons.MecodCliente.Text := DmNotaSaida.QNotaSaidaCod_Cadastro.Text;
            FContasReceberCons.BtProcurarClick(Self);
            FContasReceberCons.ShowModal;
         End;

   End
  Else
   Begin
     lblRamo.Caption := '';
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
Var wCodigo,wDescProduto : String;
    ClickedOK : Boolean;
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
     If DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE' then
        If DMNotaSaida.QItemNFNum_Fabricante.Text <> '' Then
         Begin
          wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39)+DMNotaSaida.QItemNFNum_Fabricante.Text+Chr(39));
          If wCodigo <> '' Then
             DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
         End;
  If (DbGrid1.SelectedField.FieldName = 'COD_PRODUTO') Or
     (DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE') then
   Begin
     If (DMNotaSaida.QItemNFCod_Produto.Text <> '') Then
      Begin
       If(DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ') then
        Begin
          wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39)+FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value)+Chr(39));
          If wCodigo <> '' Then
             DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
        End;     
       wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Chr(39)+FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value)+Chr(39));
       If wCodigo = '' Then
          Raise Exception.Create('Produto Não Cadastrado!');
       If wCodigo = '20000' Then
        Begin
          ClickedOK := InputQuery('Produto', 'Descrição Produto', wDescProduto);
          If ClickedOK then
           Begin
             DMNotaSaida.QNotaProduto.Close;
             DMNotaSaida.QNotaProduto.SetVariable('Pk',DMNotaSaida.QItemNFCod_Nota_Item.Value);
             DMNotaSaida.QNotaProduto.Open;
             If Not DMNotaSaida.QNotaProduto.Eof Then
                DMNotaSaida.QNotaProduto.Edit
             Else
                DMNotaSaida.QNotaProduto.Insert;
             DMNotaSaida.QNotaProdutoCod_Nota_Item.Value := DMNotaSaida.QItemNFCod_Nota_Item.Value;
             DMNotaSaida.QNotaProdutoDesc_Produto.Value := wDescProduto;
             DMNotaSaida.QNotaProduto.Post;
           End;
        End
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
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ' then
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

procedure TFNotaConsumidor.BtConsCadastroParceiroClick(Sender: TObject);
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
procedure TFNotaConsumidor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PGNota.ActivePage := TSItens;
  PGNotaChange(Self);
end;

procedure TFNotaConsumidor.FormCreate(Sender: TObject);
begin
  inherited;
  PGNota.ActivePage := TSNota;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    BtConsCadastro.TabStop := false;
  end;

  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
     DbGrid1.Columns.Items[1].Index := 6
  Else
     DbGrid1.Columns[0].Free; //:= False;

end;

procedure TFNotaConsumidor.SBIncluirClick(Sender: TObject);
begin
  inherited;
  PGNota.ActivePage := TSNota;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' Then
     DMNotaSaida.QNotaSaidaPERC_COMISSAO.Value := 0.01;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'ARISTIDES' Then
     DBECliente.SetFocus;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' Then
     PGNota.ActivePage := TSItens;
end;

procedure TFNotaConsumidor.DBEdit17Change(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QItemNFnome_produto.Value <> '' then
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then //aqui problema do moinho do oracle 10, problema do campo LOB da imagem. quando for resolvido o problema no moinho esse if pode ser removido.
      AtualizarImagemProduto;
end;

procedure TFNotaConsumidor.AtualizarImagemProduto;
var
  b:TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  lblProduto.Caption := DMNotaSaida.QItemNFnome_produto.Value;
  lblPreco.Caption := formatFloat('#,##0.00', DMNotaSaida.QItemNFVAL_UNITARIO.value);

  DMNotaSaida.QImagemProduto.close;
  DMNotaSaida.QImagemProduto.SetVariable('COD_PRODUTO',DMNotaSaida.QItemNFCOD_PRODUTO.AsInteger);
  DMNotaSaida.QImagemProduto.open;

  // transferindo a fotografia para o objeto TStream
  b := DMNotaSaida.QImagemProduto.CreateBlobStream(DMNotaSaida.QImagemProdutoIMG_IMAGEM ,bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      imgProduto.Picture.Assign(Jpg);
      imgProduto.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgProduto.Picture.Assign(nil);
    imgProduto.Visible := false;
  end;

  lblImagemNaoDisponivel.Visible := not imgProduto.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;


procedure TFNotaConsumidor.BtCondicaoClick(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.ShowModal = mrOk then
   Begin
     DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;
     DBEdit7Exit(Self);
   End;
end;

procedure TFNotaConsumidor.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2';
  If Trim(DbEdit7.Text) = '1' Then
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';
  If (Trim(DbEdit7.Text) = '13') Or
     (Trim(DbEdit7.Text) = '14') Then
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';  // foi solicitado pela andressa para colocar a vista
end;

procedure TFNotaConsumidor.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaConfirmao1Click(Self);
end;

procedure TFNotaConsumidor.CancelaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.CancelarNota1Click(Self);
end;

procedure TFNotaConsumidor.DBEClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     BtConsCadastro.Click;
end;

procedure TFNotaConsumidor.PGNotaChange(Sender: TObject);
begin
  inherited;
  If PgNota.ActivePage = TsItens Then
   Begin
     DBGrid1.SelectedIndex := 0;
     DBGrid1.SetFocus;
   End;
end;

procedure TFNotaConsumidor.DBEdit6Exit(Sender: TObject);
var
  wOperacao :String;
begin
  inherited;
  if DBEdit6.Text <> '' then
  With DMNotaSaida Do
  begin
    wOperacao := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO','COD_OPERACAO = '+QNotaSaidaCod_Operacao.Text,True);
    if wOperacao <> '' then
    begin
      QNotaSaidaCOD_SERIE.Text := wOperacao;
    end;
  end;
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
     DBPanel1.OnCodigoExit(self);
    end;
  end;
end;

procedure TFNotaConsumidor.DBPanel1CodigoExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

end.

unit UContratoArroz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, ComObj, DBDirceu, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFContratoArrozCad = class(TFTCadSimples)
    ContratoArroz1: TMenuItem;
    Operaes1: TMenuItem;
    MovimentoNotas1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    BtConsFilial: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit19: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    DBEdit20: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    Confirma1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    DBEdit16: TDBEdit;
    ResFinanceiroContrato: TMenuItem;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    btOperacao: TBitBtn;
    DBDirceu4: TDBDirceu;
    RelatrioSaldoaFixar1: TMenuItem;
    RelatrioSaldoaFixarSinttico1: TMenuItem;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    BtTributacao: TBitBtn;
    DBDirceu5: TDBDirceu;
    DBRadioGroup2: TDBRadioGroup;
    ContratosdeArroz1: TMenuItem;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    TsBaixaSemNota: TTabSheet;
    DsContratoArrozBaixa: TDataSource;
    DBGrid2: TDBGrid;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    Label22: TLabel;
    DBEdit23: TDBEdit;
    Label23: TLabel;
    DBEdit24: TDBEdit;
    Label24: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit26: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ContratoArroz1Click(Sender: TObject);
    procedure MovimentoNotas1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Confirma1Click(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure ResFinanceiroContratoClick(Sender: TObject);
    procedure btOperacaoClick(Sender: TObject);
    procedure RelatrioSaldoaFixar1Click(Sender: TObject);
    procedure RelatrioSaldoaFixarSinttico1Click(Sender: TObject);
    procedure BtTributacaoClick(Sender: TObject);
    procedure ContratosdeArroz1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoArrozCad: TFContratoArrozCad;

implementation

uses UNotaEntrada_cl, UFilialCons, UCadastroCons, UProdutoCons, UFilial_cl,
  UCadastro_cl, UProduto_cl, UContratoArrozCons, UContratoArroz_cl,
  UContratoArrozConf, UOracle_cl, UContratoArrozMov, UContratoArrozParam,
  URContrato_Arroz, URContrato_NF_Saldo, URContratoArrozAberto, UUsuario_cl,
  UContratoSaldoCliente, URContratoContaCorrente, UResFinanceiroContrato,
  UPlanilha_cl, UOperacaoCons, UOperacao_cl, URSaldoFixar,
  URSaldoFixarSintetico, UTributacaoCons, UTributacao_cl, URContratoArroz,
  UFmCadastro, UFmFilial;

{$R *.DFM}

procedure TFContratoArrozCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMContratoArroz.QContrato_ArrozCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFContratoArrozCad.BitBtn1Click(Sender: TObject);
Var wFunrural : String;
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    DMContratoArroz.QContrato_ArrozCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
    If DMContratoArroz.QContrato_Arroz.State = dsInsert then
    Begin
      wFunrural := DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMContratoArroz.QContrato_ArrozCod_Cadastro.Value));
      if wFunrural <> '' then
         DMContratoArroz.QContrato_ArrozPerc_Funrural.Value := StrToFloat(wFunrural);
      DMContratoArroz.QContrato_ArrozDesc_Observacao.Value := DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMContratoArroz.QContrato_ArrozCod_Cadastro.Value));
    End;
  End;
end;

procedure TFContratoArrozCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMContratoArroz.QContrato_ArrozCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);

end;

procedure TFContratoArrozCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    QContrato_Arroz.Open;
    QContrato_Arroz_Item_Cons.Open;
  End;
end;

procedure TFContratoArrozCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FContratoArrozCons = Nil then
    FContratoArrozCons := TFContratoArrozCons.Create(Application);
  If FContratoArrozCons.ShowModal = mrOk then
  With DMContratoArroz do
  Begin
    QContrato_Arroz.Close;
    QContrato_Arroz.SetVariable('PK',QContrato_ArrozConsCod_Contrato_Arroz.Value);
    QContrato_Arroz.Open;
  End;
End;

procedure TFContratoArrozCad.ContratoArroz1Click(Sender: TObject);
Var Path,campo,campo1 : String;
   wTotal,wQtScs,wFunrural,wAPagar : Real;
   WinWord, Docs, Doc: Variant;
begin
  if DMContratoArroz.QContrato_ArrozCOD_CONTRATO_ARROZ.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMContratoArroz.QContrato_ArrozCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMContratoArroz.QContrato_ArrozCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMProduto.QProduto.Close;
      DMProduto.QProduto.SetVariable('PK',DMContratoArroz.QContrato_ArrozCOD_PRODUTO.Value);
      DMProduto.QProduto.Open;

      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      If DMContratoArroz.QContrato_ArrozInd_Tipo_Contrato.Value = 'ARROZ' Then
         Doc := Docs.Open(Path+'ContratoArroz.Doc')
      Else
         Doc := Docs.Open(Path+'ContratoFeijao.Doc');
      // Substitui texto via "name parameters"

      If (DMContratoArroz.QContrato_ArrozCod_Filial.Value = 97) Or
         (DMContratoArroz.QContrato_ArrozCod_Filial.Value = 99) Then
         campo:= ' - PAZ'
      Else
         campo:= '.';
      Doc.Content.Find.Execute(FindText := '%paz',ReplaceWith := campo,Replace:=2);

      wQtScs := DMContratoArroz.QContrato_ArrozQT_QUANTIDADE.value/DMProduto.QProdutoNUM_EMBALAGEM.Value;
      wTotal := DMContratoArroz.QContrato_ArrozQT_QUANTIDADE.value*DMContratoArroz.QContrato_ArrozVL_PRECO_SACA.Value/DMProduto.QProdutoNUM_EMBALAGEM.Value;
      wFunrural := wTotal * DMContratoArroz.QContrato_ArrozPerc_Funrural.value / 100;
      wAPagar := wTotal - wFunrural - DMContratoArroz.QContrato_ArrozVL_ADIANTAMENTO.Value + DMContratoArroz.QContrato_ArrozVL_ARREDONDAMENTO.Value;

      campo:=FloatToStr(DMContratoArroz.QContrato_ArrozNUM_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%numero',ReplaceWith := campo,Replace:=2);

      campo:=DMProduto.QProdutoDESC_PRODUTO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroNOME.Value;
      Doc.Content.Find.Execute(FindText := '%nome',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%desc_cidade',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroCOD_ESTADO.Value;
      Doc.Content.Find.Execute(FindText := '%cod_estado',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
      Doc.Content.Find.Execute(FindText := '%num_cgc_cpf',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%num_inscricao',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0',DMContratoArroz.QContrato_ArrozQT_QUANTIDADE.Value);
      Doc.Content.Find.Execute(FindText := '%qt_quantidade',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',wQtScs);
      Doc.Content.Find.Execute(FindText := '%qt_sacas',ReplaceWith := campo,Replace:=2);

      campo:=DMContratoArroz.QContrato_ArrozDESC_TIPO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_tipo',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozPERC_GRAOS_INTEIROS.Value);
      Doc.Content.Find.Execute(FindText := '%inteiros',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozPERC_GRAOS_QUEBRADOS.Value);
      Doc.Content.Find.Execute(FindText := '%quebrados',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozPERC_GRAOS_INTEIROS.Value+
                                    DMContratoArroz.QContrato_ArrozPERC_GRAOS_QUEBRADOS.Value);
      Doc.Content.Find.Execute(FindText := '%tot_perc',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozVL_PRECO_SACA.Value);
      Doc.Content.Find.Execute(FindText := '%vl_preco_saca',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%total',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',wFunrural);
      Doc.Content.Find.Execute(FindText := '%funrural',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozVL_ARREDONDAMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%vl_arredondamento',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozVL_ADIANTAMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%vl_adiantamento',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMContratoArroz.QContrato_ArrozVL_FRETE.Value);
      Doc.Content.Find.Execute(FindText := '%vl_frete',ReplaceWith := campo,Replace:=2);

      campo:=DMContratoArroz.QContrato_ArrozDESC_OBSERVACAO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_observacao',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',waPagar);
      Doc.Content.Find.Execute(FindText := '%aPagar',ReplaceWith := campo,Replace:=2);

      campo:=DateToStr(DMContratoArroz.QContrato_ArrozDt_Emissao.Value);
      Doc.Content.Find.Execute(FindText := '%Dt_Emissao',ReplaceWith := campo,Replace:=2);

      campo:=FloatToStr(DMCadastro.QCadastroCOD_CADASTRO.Value);
      Doc.Content.Find.Execute(FindText := '%cod_cadastro',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%filial_endereco',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_BAIRRO.Value;
      Doc.Content.Find.Execute(FindText := '%filial_bairro',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_CEP.Value;
      Doc.Content.Find.Execute(FindText := '%filial_cep',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%filial_cidade',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialCOD_ESTADO.Value;
      Doc.Content.Find.Execute(FindText := '%filial_uf',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialNUM_CGC.Value;
      Doc.Content.Find.Execute(FindText := '%filial_cnpj',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%filial_inscricao',ReplaceWith := campo,Replace:=2);

      DMContratoArroz.QContaPagar.Close;
      DMContratoArroz.QContaPagar.Open;
      Campo := '';
      Campo1 := '';
      While not(DMContratoArroz.QContaPagar.Eof) do
      Begin
        campo:=Campo + ' Vencimento:'+DateToStr(DMContratoArroz.QContaPagarDt_Vencimento.Value);
        campo1:=Campo1 + ' Valor.....:'+FormatFloat('#,##0.00',DMContratoArroz.QContaPagarVAL_ORIGINAL.Value);
        DMContratoArroz.QContaPagar.Next;
      End;
      Doc.Content.Find.Execute(FindText := '%dt_vencimento',ReplaceWith := campo,Replace:=2);
      Doc.Content.Find.Execute(FindText := '%val_original',ReplaceWith := campo1,Replace:=2);
      // Grava documento
      Doc.SaveAs(Path+'ContratoArroz1.Doc');
      // Imprime
      // Doc.PrintOut(false);
      // Fecha o Word
      //  WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar um contrato a ser emitido.');
end;

procedure TFContratoArrozCad.MovimentoNotas1Click(Sender: TObject);
begin
  inherited;
  If FContratoArrozMov = Nil then
    FContratoArrozMov := TFContratoArrozMov.Create(Application);
  DMContratoArroz.QContratoSaldo.Close;
  DMContratoArroz.QContrato_Nota_Saldo.Close;
  DMContratoArroz.QContratoSaldo.Open;
  DMContratoArroz.QContrato_Nota_Saldo.Open;
  FContratoArrozMov.ShowModal;

end;

procedure TFContratoArrozCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QContrato_Arroz.Open;
      QContrato_Arroz.Edit;
      QContrato_ArrozQt_Saldo.Value := QContrato_ArrozQt_Saldo.Value + QContrato_Arroz_Item_ConsQt_Quantidade.Value;
      QContrato_Arroz.Post;
      QContrato_Arroz_Item.SetVariable('PK',QContrato_Arroz_Item_ConsCod_Contrato_Arroz_Item.Value);
      QContrato_Arroz_Item.Open;
      QContrato_Arroz_Item.Delete;
      DMOracle.DBCemapa.Commit;
      QContrato_Arroz_Item.Close;
      QContrato_Arroz_Item_Cons.Close;
      QContrato_Arroz_Item_Cons.Open;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
  end;

end;

procedure TFContratoArrozCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DbEdit2.SetFocus;
end;

procedure TFContratoArrozCad.DBEdit2Exit(Sender: TObject);
Var wFunrural:String;
begin
  inherited;
  If DMContratoArroz.QContrato_Arroz.State = dsInsert then
  Begin
    wFunrural := DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMContratoArroz.QContrato_ArrozCod_Cadastro.Value));
    if wFunrural <> '' then
       DMContratoArroz.QContrato_ArrozPerc_Funrural.Value := StrToFloat(wFunrural);
    DMContratoArroz.QContrato_ArrozDesc_Observacao.Value := DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMContratoArroz.QContrato_ArrozCod_Cadastro.Value));
  End;

end;

procedure TFContratoArrozCad.SBHelpClick(Sender: TObject);
begin
    inherited;
    Application.HelpContext(8);

end;

procedure TFContratoArrozCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMContratoArroz do
  Begin
    QContrato_Arroz.Close;
    QContrato_Arroz_Item_Cons.Close;
  End;
  Action := CaFree;
  FContratoArrozCad := Nil;
end;

procedure TFContratoArrozCad.Confirma1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContratoArroz.QContrato_ArrozCOD_FILIAL.Text),'COMPRA');
  if not (DMOracle.DBCemapa.InTransaction) Then
     DMOracle.DBCemapa.StartTransaction;
  If FContratoArrozConf = Nil then
     FContratoArrozConf := TFContratoArrozConf.Create(Application);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMContratoArroz.QContrato_ArrozCod_Cadastro.Value);
  DMCadastro.QCadastro.Open;
  FContratoArrozConf.MeBanco.Text := DMCadastro.QCadastroCod_Banco_Agencia.Text;
  FContratoArrozConf.MeAgencia.Text := DMCadastro.QCadastroDesc_Agencia.Text;
  FContratoArrozConf.MeContaCorrente.Text := DMCadastro.QCadastroDesc_Conta_Corrente.Text;
  FContratoArrozConf.MeCnpjCpf.Text := DMCadastro.QCadastroDESC_COMPLEMENTO.Text;
  FContratoArrozConf.MeNomeTitular.Text := DMCadastro.QCadastroNome_Titular.Text;
//  If DMOracle.BuscaNome('SELECT IND_CONTA_PAGAR FROM TB_OPERACAO',' COD_OPERACAO = '+DMContratoArroz.QContrato_ArrozCOD_OPERACAO.Text,True) = 'S' Then
  If DMContratoArroz.QContrato_ArrozIND_CONTA_PAGAR.Value = 'SIM' Then
   Begin
    FContratoArrozConf.LblGeraCp.Caption := 'SIM';  // PARA VERIFICAR SE VAI OU NAO GERAR CONTAS A PAGAR DO CONTRATO
    FContratoArrozConf.GPContasPagar.Visible := True;
   End
  Else
   Begin
    FContratoArrozConf.LblGeraCp.Caption := 'NAO';
    FContratoArrozConf.GPContasPagar.Visible := False;
   End;

  If FContratoArrozConf.ShowModal = MrCancel Then
     DMOracle.DBCemapa.RollBack;
end;

procedure TFContratoArrozCad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QContaPagar.Close;
      QContaPagar.Open;
      QContaPagarMov.Close;
      QContaPagarMov.Open;
      While not QContaPagar.Eof do
      Begin
        If QContaPagarMovInd_Tipo_Movimento.Value <> '' Then
        Begin
          If (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
            Raise Exception.Create('Conta a Pagar com baixas!')
          Else
            DMPlanilha.Descontabiliza(QContaPagarMovCod_Lancto_Contabil_Cred.Value,'CR_CP_MOV');
            DMPlanilha.Descontabiliza(QContaPagarMovCod_Lancto_Contabil_Deb.Value,'CR_CP_MOV');
            QContaPagarMov.Delete;
        End;
        QContaPagar.Delete;
      End;
      If QContrato_ArrozCod_Nota_Cab.Value <> 0 Then
      Begin
        QNotaSaidaCab.Close;
        QNotaItem.Close;
        QNotaItem.SetVariable('Pk',QContrato_ArrozCod_Nota_Cab.Value);
        QNotaItem.Open;
        If Not(QNotaItem.Eof) Then
           QNotaItem.Delete;
        QNotaItem.Close;
        QNotaSaidaCab.SetVariable('Pk',QContrato_ArrozCod_Nota_Cab.Value);
        QNotaSaidaCab.Open;
        If Not(QNotaSaidaCab.Eof) Then
           QNotaSaidaCab.Delete;
        QNotaSaidaCab.Close;
      End;
      DMPlanilha.DesContabiliza(QContrato_ArrozCod_Contrato_Arroz.Value,'ARROZ');
      DMOracle.DBCemapa.Commit;
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Não foi possivel voltar Contas a Pagar!');
      Raise;
    End;
  End;
  DMContratoArroz.QContrato_Arroz.Edit;
  DMContratoArroz.QContrato_ArrozInd_Situacao.Value := '1';
  DMContratoArroz.QContrato_ArrozCod_Nota_Cab.Clear;
  DMContratoArroz.QContrato_Arroz.Post;
end;

procedure TFContratoArrozCad.DBEdit16Change(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    MMCadSimples.Items[2].Items[1].Enabled := QContrato_ArrozInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QContrato_ArrozInd_Situacao.Value = '2';
  End;
end;

procedure TFContratoArrozCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  Confirma1Click(Self);
end;

procedure TFContratoArrozCad.ResFinanceiroContratoClick(Sender: TObject);
begin
  inherited;
  if FContratoArrozParam = Nil then
    FContratoArrozParam := TFContratoArrozParam.Create(Application);
    FContratoArrozParam.PGRelatorio.Pages[5].TabVisible := True;
    if FContratoArrozParam.ShowModal = MrOk then
    begin
      with DMContratoArroz do
      begin
        QRFinanceiroContrato.Close;
        if Trim(FContratoArrozParam.Me5CodFilial.Text) <> '' then
          QRFinanceiroContrato.SetVariable('FILIAL', Trim(FContratoArrozParam.Me5CodFilial.Text))
        else
          QRFinanceiroContrato.SetVariable('FILIAL', null);
        if Trim(FContratoArrozParam.Me5CodCadastro.Text) <> '' then
          QRFinanceiroContrato.SetVariable('CADASTRO', Trim(FContratoArrozParam.Me5CodCadastro.Text))
        else
          QRFinanceiroContrato.SetVariable('CADASTRO', null);
        if Trim(FContratoArrozParam.Me5CodProduto.Text) <> '' then
          QRFinanceiroContrato.SetVariable('PRODUTO', Trim(FContratoArrozParam.Me5CodProduto.Text))
        else
          QRFinanceiroContrato.SetVariable('PRODUTO', null);
        if Trim(FContratoArrozParam.Me5Contrato.Text) <> '' then
          QRFinanceiroContrato.SetVariable('COD_CONTRATO_ARROZ', Trim(FContratoArrozParam.Me5Contrato.Text))
        else
          QRFinanceiroContrato.SetVariable('COD_CONTRATO_ARROZ', null);

        QRFinanceiroContrato.SetVariable('DATA_I', Trim(FContratoArrozParam.Me5Data_I.Text));
        QRFinanceiroContrato.SetVariable('DATA_F', Trim(FContratoArrozParam.Me5Data_F.Text));
        if Trim(FContratoArrozParam.Me5Beneficiado.Text) <> '' then
          QRFinanceiroContrato.SetVariable('PERCENTUAL', Trim(FContratoArrozParam.Me5Beneficiado.Text))
        else
          Raise Exception.Create('Informe Percentual Beneficiado');
        If FContratoArrozParam.Rg5Funrural.ItemIndex = 0 Then
           QRFinanceiroContrato.SetVariable('IND_FUNRURAL','SIM')
        Else
           QRFinanceiroContrato.SetVariable('IND_FUNRURAL','NAO');
        QRFinanceiroContrato.Open;

        if FResFinanceiroContrato = Nil then
          FResFinanceiroContrato := TFResFinanceiroContrato.Create(Application);
        FResFinanceiroContrato.LbData_I.Caption := FContratoArrozParam.Me5Data_I.Text;
        FResFinanceiroContrato.LbData_F.Caption := FContratoArrozParam.Me5Data_F.Text;
        FResFinanceiroContrato.QRLProduto.Caption := 'Produto:'+Trim(FContratoArrozParam.Me5CodProduto.Text)+' - '+FContratoArrozParam.Ed5DescProduto.Text + '  %Beneficiado:'+FContratoArrozParam.Me5Beneficiado.Text;
        FResFinanceiroContrato.QRLProduto.Caption := FResFinanceiroContrato.QRLProduto.Caption + ' Contrato:' + FContratoArrozParam.Ed5Contrato.Text; 
        if FContratoArrozParam.RGPreview.ItemIndex = 0 then
          FResFinanceiroContrato.QRPrimario.Preview
        else
          FResFinanceiroContrato.Print;
        QRFinanceiroContrato.Close;
      end;
    end;
end;

procedure TFContratoArrozCad.btOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    DMContratoArroz.QContrato_ArrozCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFContratoArrozCad.RelatrioSaldoaFixar1Click(Sender: TObject);
begin
  inherited;
  if FContratoArrozParam = Nil then
    FContratoArrozParam := TFContratoArrozParam.Create(Application);
  FContratoArrozParam.PGRelatorio.Pages[6].TabVisible :=  true;
  if FContratoArrozParam.ShowModal = MrOk then
  begin
    with DMContratoArroz do
    begin
      QRContaCorrente.Close;
      if trim(FContratoArrozParam.FmFilial7.MeFilial.Text) <> '' then
        QRContaCorrente.SetVariable('Filial', trim(FContratoArrozParam.FmFilial7.MeFilial.Text))
      else
        QRContaCorrente.SetVariable('Filial', null);

      if trim(FContratoArrozParam.FmProduto7.MeProduto.Text) <> '' then
        QRContaCorrente.SetVariable('Produto', trim(FContratoArrozParam.FmProduto7.MeProduto.Text))
      else
        QRContaCorrente.SetVariable('Produto', null);

      if trim(FContratoArrozParam.FmCadastro7.MeCadastro.Text) <> '' then
        QRContaCorrente.SetVariable('Cadastro', trim(FContratoArrozParam.FmCadastro7.MeCadastro.Text))
      else
        QRContaCorrente.SetVariable('Cadastro', null);
      if trim(FContratoArrozParam.FmDepartamento7.MeDepartamento.Text) <> '' then
        QRContaCorrente.SetVariable('Departamento', trim(FContratoArrozParam.FmDepartamento7.MeDepartamento.Text))
      else
        QRContaCorrente.SetVariable('Departamento', null);

      QRContaCorrente.SetVariable('Dt_Inicial', trim(FContratoArrozParam.Me7Data_I.Text));

      if trim(FContratoArrozParam.Me7Data_F.Text) <> '' then
        QRContaCorrente.SetVariable('Dt_Final', trim(FContratoArrozParam.Me7Data_F.Text))
      else
      begin
        FContratoArrozParam.Me7Data_F.Text := DateToStr(Date);
        QRContaCorrente.SetVariable('Dt_Final', trim(FContratoArrozParam.Me7Data_F.Text));
      end;
      QRContaCorrente.Open;
    end;
    if FRSaldoFixar = Nil then
      FRSaldoFixar := TFRSaldoFixar.Create(Application);
    FRSaldoFixar.QRLFilial.Caption := FContratoArrozParam.FmFilial7.EdFilial.Text;
    FRSaldoFixar.QRLPeriodo.Caption := 'De ' + FContratoArrozParam.Me7Data_I.Text + ' até ' +
                                       FContratoArrozParam.Me7Data_F.Text;
    if FContratoArrozParam.RGPreview.ItemIndex = 0 then
      FRSaldoFixar.QRPrimario.Preview
    else
      FRSaldoFixar.QRPrimario.Print;
  end;
end;

procedure TFContratoArrozCad.RelatrioSaldoaFixarSinttico1Click(
  Sender: TObject);
begin
  inherited;
 if FContratoArrozParam = Nil then
    FContratoArrozParam := TFContratoArrozParam.Create(Application);
  FContratoArrozParam.PGRelatorio.Pages[7].TabVisible :=  true;
  if FContratoArrozParam.ShowModal = MrOk then
  begin
    with DMContratoArroz do
    begin
      QRSaldoFixarSintetico.Close;
      if trim(FContratoArrozParam.FmFilial8.MeFilial.Text) <> '' then
        QRSaldoFixarSintetico.SetVariable('Filial', trim(FContratoArrozParam.FmFilial8.MeFilial.Text))
      else
        QRSaldoFixarSintetico.SetVariable('Filial', null);

      if trim(FContratoArrozParam.FmProduto8.MeProduto.Text) <> '' then
        QRSaldoFixarSintetico.SetVariable('Produto', trim(FContratoArrozParam.FmProduto8.MeProduto.Text))
      else
        QRSaldoFixarSintetico.SetVariable('Produto', null);

      if trim(FContratoArrozParam.FmCadastro8.MeCadastro.Text) <> '' then
        QRSaldoFixarSintetico.SetVariable('Cadastro', trim(FContratoArrozParam.FmCadastro8.MeCadastro.Text))
      else
        QRSaldoFixarSintetico.SetVariable('Cadastro', null);
      if trim(FContratoArrozParam.FmDepartamento8.MeDepartamento.Text) <> '' then
        QRSaldoFixarSintetico.SetVariable('Departamento', trim(FContratoArrozParam.FmDepartamento8.MeDepartamento.Text))
      else
        QRSaldoFixarSintetico.SetVariable('Departamento', null);

      QRSaldoFixarSintetico.SetVariable('Dt_Inicial', trim(FContratoArrozParam.Me8Data_I.Text));

      if trim(FContratoArrozParam.Me8Data_F.Text) <> '' then
        QRSaldoFixarSintetico.SetVariable('Dt_Final', trim(FContratoArrozParam.Me8Data_F.Text))
      else
      begin
        FContratoArrozParam.Me8Data_F.Text := DateToStr(Date);
        QRSaldoFixarSintetico.SetVariable('Dt_Final', trim(FContratoArrozParam.Me8Data_F.Text));
      end;
      Case FContratoArrozParam.Rg8TipoRelatorio.ItemIndex of
        0 : QRSaldoFixarSintetico.SetVariable('Tipo_De_Relatorio','Qt_Fixar < 0 ');
        1 : QRSaldoFixarSintetico.SetVariable('Tipo_De_Relatorio','Qt_Fixar > 0 ');
        2 : QRSaldoFixarSintetico.SetVariable('Tipo_De_Relatorio','1 = 1 ');
      End;
      QRSaldoFixarSintetico.Open;
    end;
    if FRSaldoFixarSintetico = Nil then
      FRSaldoFixarSintetico := TFRSaldoFixarSintetico.Create(Application);
    FRSaldoFixarSintetico.QRLFilial.Caption := FContratoArrozParam.FmFilial8.EdFilial.Text;
    FRSaldoFixarSintetico.QRLPeriodo.Caption := 'De ' + FContratoArrozParam.Me8Data_I.Text + ' até ' +
                                       FContratoArrozParam.Me8Data_F.Text;
    if FContratoArrozParam.RGPreview.ItemIndex = 0 then
      FRSaldoFixarSintetico.QRPrimario.Preview
    else
      FRSaldoFixarSintetico.QRPrimario.Print;
  end;
end;

procedure TFContratoArrozCad.BtTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
    DMContratoArroz.QContrato_ArrozCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;

end;

procedure TFContratoArrozCad.ContratosdeArroz1Click(Sender: TObject);
var
  wDataI, wDataF: TDate;
  wAux: String;
begin
  inherited;
 if FContratoArrozParam = Nil then
    FContratoArrozParam := TFContratoArrozParam.Create(Application);
  FContratoArrozParam.PGRelatorio.Pages[8].TabVisible :=  true;
  if FContratoArrozParam.ShowModal = MrOk then
  begin
    try
      wDataI := StrToDate(FContratoArrozParam.ME9DtContratoI.Text);
      wDataF := StrToDate(FContratoArrozParam.ME9DtContratoF.Text);
    except
      Raise Exception.Create('Datas informadas incorretamente.');
    end;
    with DMContratoArroz do
    begin
      QRContratoArroz.Close;
      QRContratoArroz.SetVariable('DT_EMISSAO_I', wDataI);
      QRContratoArroz.SetVariable('DT_EMISSAO_F', wDataF);
      wAux := Trim(FContratoArrozParam.FmFilial9.MeFilial.Text);
      if wAux <> '' then
        QRContratoArroz.SetVariable('COD_FILIAL', wAux)
      else
        QRContratoArroz.SetVariable('COD_FILIAL', null);
      wAux := Trim(FContratoArrozParam.FmProduto9.MeProduto.Text);
      if wAux <> '' then
        QRContratoArroz.SetVariable('COD_PRODUTO', wAux)
      else
        QRContratoArroz.SetVariable('COD_PRODUTO', null);
      wAux := Trim(FContratoArrozParam.FmCadastro9.MeCadastro.Text);
      if wAux <> '' then
        QRContratoArroz.SetVariable('COD_CADASTRO', wAux)
      else
        QRContratoArroz.SetVariable('COD_CADASTRO', null);
      case FContratoArrozParam.RGTipoContrato9.ItemIndex of
        0: wAux := 'ARROZ';
        1: wAux := 'FEIJAO';
        2: wAux := '';
      end;
      if wAux <> '' then
        QRContratoArroz.SetVariable('IND_TIPO_CONTRATO', wAux)
      else
        QRContratoArroz.SetVariable('IND_TIPO_CONTRATO', null);
      Case FContratoArrozParam.Rg9Posicao.ItemIndex Of
        0 : QRContratoArroz.SetVariable('SALDO_CONTRATO','TB_CONTRATO_ARROZ.QT_SALDO > 0');
        1 : QRContratoArroz.SetVariable('SALDO_CONTRATO','TB_CONTRATO_ARROZ.QT_SALDO = 0');
        2 : QRContratoArroz.SetVariable('SALDO_CONTRATO','1 = 1');
      End;
      QRContratoArroz.open;

      if FRContratoArroz = nil then
        FRContratoArroz := TFRContratoArroz.Create(Application);
      FRContratoArroz.QRLProduto.Caption := FContratoArrozParam.FmProduto9.EdProduto.Text;
      FRContratoArroz.QRLCadastro.Caption := FContratoArrozParam.FmCadastro9.EdCadastro.Text;
      FRContratoArroz.QRLFilial.Caption := FContratoArrozParam.FmFilial9.EdFilial.Text;
      FRContratoArroz.QRLTipo.Caption := wAux;
      FRContratoArroz.QRLDataI.Caption := FContratoArrozParam.ME9DtContratoI.Text;
      FRContratoArroz.QRLDataF.Caption := FContratoArrozParam.ME9DtContratoF.Text;

      if FContratoArrozParam.RGPreview.ItemIndex = 0 then
        FRContratoArroz.QRPrimario.Preview
      else
        FRContratoArroz.QRPrimario.Print;
      QRContratoArroz.Close;
    end;
  end;
end;

procedure TFContratoArrozCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  If DMContratoArroz.QContrato_ArrozCod_Contrato_Arroz.Text = '' Then
     Raise Exception.Create('Selecionar um Contrato');
  If PageControl1.ActivePage = TsBaixaSemNota Then
   Begin
     DMContratoArroz.QContratoArrozBaixa.Close;
     DMContratoArroz.QContratoArrozBaixa.Open;
   End;
end;

end.

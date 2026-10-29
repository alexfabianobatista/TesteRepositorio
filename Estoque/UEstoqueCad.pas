unit UEstoqueCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, ComCtrls, Menus, Db, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, variants, Grids, DBGrids, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFImplantacaoCad = class(TFTCadSimples)
    PCEstoque: TPageControl;
    TSEstoque: TTabSheet;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Bt0ConsLote: TSpeedButton;
    Bt0ConsFilial: TSpeedButton;
    Bt0ConsProduto: TSpeedButton;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Implantacao1: TMenuItem;
    Estoque1: TMenuItem;
    Inventario1: TMenuItem;
    ZeraInventario1: TMenuItem;
    TSInventario: TTabSheet;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Bt1ConsFilial: TSpeedButton;
    Bt1ConsProduto: TSpeedButton;
    Bt1ConsLote: TSpeedButton;
    TSZeraInventario: TTabSheet;
    Label17: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ME2CodFilial: TMaskEdit;
    ME2Filial: TMaskEdit;
    DiferenadeEstoque1: TMenuItem;
    AtualizaEstoquepeloInventrio1: TMenuItem;
    TSAtualizaEstoque: TTabSheet;
    Label16: TLabel;
    ME3CodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME3Filial: TMaskEdit;
    Label19: TLabel;
    SpeedButton2: TSpeedButton;
    LevantamentodeEstoque1: TMenuItem;
    EstouqueImplantado1: TMenuItem;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    ECodFilial: TEdit;
    EFilial: TEdit;
    ECodProduto: TEdit;
    EProduto: TEdit;
    ECodLote: TEdit;
    ELote: TEdit;
    EQtde: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    ProdutosAbaixodoMnimo1: TMenuItem;
    ProdutosAcimadoMximo1: TMenuItem;
    TSLancaEstoque: TTabSheet;
    MECodFilial: TMaskEdit;
    MECodLote: TMaskEdit;
    MECodProduto: TMaskEdit;
    MEQuantidade: TMaskEdit;
    MEFilial: TMaskEdit;
    MELote: TMaskEdit;
    MEProduto: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BtnConfirma: TBitBtn;
    EtiquetaCodBarrasPequena1: TMenuItem;
    TabSheet1: TTabSheet;
    Label23: TLabel;
    ME4CodFilial: TMaskEdit;
    Bt_FilialCons: TBitBtn;
    ME4Filial: TMaskEdit;
    Label24: TLabel;
    ME4CodLote: TMaskEdit;
    Bt4LoteCons: TBitBtn;
    ME4Lote: TMaskEdit;
    ME4Produto: TMaskEdit;
    Label30: TLabel;
    ME4Quantidade: TMaskEdit;
    BtConfirma: TBitBtn;
    ME4CodProdBarra: TMaskEdit;
    Label26: TLabel;
    ME4CodProduto: TLabel;
    Label31: TLabel;
    DBEdit1: TDBEdit;
    DSProduto: TDataSource;
    Label32: TLabel;
    MENumFabricante: TMaskEdit;
    Label33: TLabel;
    MECustoMedio: TMaskEdit;
    Label34: TLabel;
    EdNumFabricante: TEdit;
    N2: TMenuItem;
    Estoquenoinventariado1: TMenuItem;
    Estoqueinventariado1: TMenuItem;
    Label35: TLabel;
    ECusto: TEdit;
    Label36: TLabel;
    DBEdit5: TDBEdit;
    SpeedButton3: TSpeedButton;
    Label37: TLabel;
    Me2CodClasse: TMaskEdit;
    Ed2Classe: TMaskEdit;
    SpeedButton4: TSpeedButton;
    Label18: TLabel;
    Me3CodClasse: TMaskEdit;
    Ed3Classe: TMaskEdit;
    Label38: TLabel;
    DataSource1: TDataSource;
    BitBtn5: TBitBtn;
    MeMotivo: TMaskEdit;
    GB1EstoqueFilial: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lblQtdF1: TLabel;
    lblQtdF2: TLabel;
    lblCustoF1: TLabel;
    lblCustoF2: TLabel;
    MELocalizacao: TMaskEdit;
    Label43: TLabel;
    DsEstoqueCons: TDataSource;
    DBGrid1: TDBGrid;
    Label44: TLabel;
    MeLocalizacao_Inv: TMaskEdit;
    Label45: TLabel;
    MeEstoqueMinimo: TMaskEdit;
    Label46: TLabel;
    MeEstoqueMaximo: TMaskEdit;
    LblPrecoVarejo: TLabel;
    LblPrecoAtacado: TLabel;
    MePrecoAtacado: TMaskEdit;
    MePrecoVarejo: TMaskEdit;
    EdCodBarra: TEdit;
    Label47: TLabel;
    MECodBarra: TMaskEdit;
    Label48: TLabel;
    LevantamentoEstoqueporFilial1: TMenuItem;
    EstoqueAgrupadoLoteeFilial1: TMenuItem;
    LblComissao: TLabel;
    MeCustoComissao: TMaskEdit;
    Opes1: TMenuItem;
    ContagemEstoqueCdBarra1: TMenuItem;
    MePrecoPromocao: TMaskEdit;
    LblPromocao: TLabel;
    MEPorcentagem: TMaskEdit;
    Label49: TLabel;
    procedure Bt0ConsLoteClick(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Bt0ConsProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PCEstoqueChange(Sender: TObject);
    procedure PCEstoqueChanging(Sender: TObject; var AllowChange: Boolean);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DiferenadeEstoque1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RegistrodeInventrio1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure LevantamentodeEstoque1Click(Sender: TObject);
    procedure EstouqueImplantado1Click(Sender: TObject);
    procedure ConsultaAvanada1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure ECodFilialChange(Sender: TObject);
    procedure ECodProdutoChange(Sender: TObject);
    procedure ECodLoteChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure Bt1ConsProdutoClick(Sender: TObject);
    procedure Bt1ConsLoteClick(Sender: TObject);
    procedure ProdutosAbaixodoMnimo1Click(Sender: TObject);
    procedure ProdutosAcimadoMximo1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure MECodLoteChange(Sender: TObject);
    procedure MECodProdutoChange(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure EtiquetaCodBarrasPequena1Click(Sender: TObject);
    procedure ME4CodFilialChange(Sender: TObject);
    procedure ME4CodLoteChange(Sender: TObject);
    procedure Bt_FilialConsClick(Sender: TObject);
    procedure Bt4LoteConsClick(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure ME4CodProdBarraExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdNumFabricanteChange(Sender: TObject);
    procedure Estoquenoinventariado1Click(Sender: TObject);
    procedure Estoqueinventariado1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ME2CodFilialChange(Sender: TObject);
    procedure Me2CodClasseChange(Sender: TObject);
    procedure ME3CodFilialChange(Sender: TObject);
    procedure Me3CodClasseChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ECodProdutoExit(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure MENumFabricanteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdCodBarraChange(Sender: TObject);
    procedure MECodBarraExit(Sender: TObject);
    procedure LevantamentoEstoqueporFilial1Click(Sender: TObject);
    procedure EstoqueAgrupadoLoteeFilial1Click(Sender: TObject);
    procedure ContagemEstoqueCdBarra1Click(Sender: TObject);
    procedure TSLancaEstoqueEnter(Sender: TObject);
    procedure MECodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MECodFilialExit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure ECodFilialExit(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure ME3CodFilialExit(Sender: TObject);
    procedure MEPorcentagemExit(Sender: TObject);
    procedure MePrecoVarejoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImplantacaoCad: TFImplantacaoCad;
  X:Boolean;

implementation

uses UEstoque_cl, UTipoLoteCons, UTipoLote_cl, UFilialCons, UFilial_cl,
  UProdutoCons, UProduto_cl, UEstoqueParam, UREstoque_Diferenca,
  URRegistro_Inventario, UEstoqueCons, UClasse_cl, UREstoqueLevantamento,
  UOracle_cl, UUsuario_cl, UREstoqueImplantado, UEstoqueACons, UMoeda_cl,
  UREstoqueProd_Min, UREstoqueProd_Max, UProdutoParam, URProdutoCodBarraPeq,
  UREstoqueNaoInventariado, URProdutoInventario, UClasseCons, UMotivoCons,
  UMotivo_cl, UProdutoRelatorio_cl, UParamSistema_cl, UFormula_cl,
  UBiblioteca, UREstoqueLevantamentoFilial, UREstoqueAgrupado,
  UContagemEstoqueCodBarra, UTela_cl;

{$R *.DFM}

procedure TFImplantacaoCad.Bt0ConsLoteClick(Sender: TObject);
begin
  inherited; // Consulta Tipo de Lote
  If FTipoLoteCons=Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  If (FTipoLoteCons.Showmodal=mrok) then
    DMEstoque.QEstoqueCod_Lote_Tipo.Value:=DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value;
end;

procedure TFImplantacaoCad.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;  // Consulta Filial
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.Showmodal=mrok then
    DMEstoque.QEstoqueCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFImplantacaoCad.Bt0ConsProdutoClick(Sender: TObject);
begin
  inherited;     // Consulta Produto
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If (FProdutoCons.Showmodal=mrok) then
    DMEstoque.QEstoqueCod_Produto.value:=DMProduto.QProdutoConsCod_Produto.value;
end;

procedure TFImplantacaoCad.FormActivate(Sender: TObject);
begin
  inherited;     // abre a tabela e ativa/desativa os Tabsets
  DMEstoque.QEstoque.Open;
  DMEstoque.QEstoqueMov.Open;
//  PCEstoque.Pages[0].TabVisible:=MMCadSimples.Items[2].Items[0].Visible;
//  PCEstoque.Pages[1].TabVisible:=MMCadSimples.Items[2].Items[1].Visible;
//  PCEstoque.Pages[2].TabVisible:=MMCadSimples.Items[2].Items[2].Visible;
//  PCEstoque.Pages[3].TabVisible:=MMCadSimples.Items[2].Items[3].Visible;
  MELocaliza.Visible:=False;
  // SBAlterar.Visible:=False;
  ECodFilial.Text:='1';
  ECodLote.Text:='1';
//MECodFilial.Text:='1'; Alterado para puxar a filial do cadastro do usuário. Alex 24/05/2023
  MECodFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
//Adicionado pois a empresa LuciLuci tem estoques controlados pelo lote. Solicitado por Neri. Alex 07/11/2023
  if (DMParamSistema.CodEmpresa <> 'LUCILUCI') then
  begin
    MECodLote.Text:='1';
  end
  else
  begin
    if (DMUsuario.CodFilialUsuario = 1) then
      MECodLote.Text := '1'
    else
      MECodLote.Text := '2'
  end;
  PcEstoque.ActivePage := TSLancaEstoque;
  PCEstoqueChange(self);
  if (((DMParamSistema.CodEmpresa = 'SOLDAR') or (DMParamSistema.CodEmpresa = 'PIXIXE') or (DMParamSistema.CodEmpresa = 'OSARE') or
      (DMParamSistema.CodEmpresa = 'LUCILUCI') or (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') )
      and (DMUsuario.pTipoFuncionario = 'DIRETOR')) then
    ContagemEstoqueCdBarra1.Enabled := True;
end;

procedure TFImplantacaoCad.PCEstoqueChange(Sender: TObject);
begin
  inherited;             // controla os botoes da barra
  If (PCEstoque.ActivePage=TSZeraInventario)  Or
     (PCEstoque.ActivePage=TSAtualizaEstoque) Or
     (PCEstoque.ActivePage=TSInventario)      Or
     (PCEstoque.ActivePage=TSLancaEstoque)    Then
    Begin
      MMCadSimples.Items[0].Enabled:=False;
      SBIncluir.Enabled:=False;
      SBAlterar.Enabled:=False;
      SBExcluir.Enabled:=False;
      SBConfirmar.Enabled:=False;
      SBCancelar.Enabled:=False;
      SBConsulta.Enabled:=False;
      SBRefresh.Enabled:=False;
    End
 Else
   Begin
      MMCadSimples.Items[0].Enabled:=True;
      SBIncluir.Enabled:=True;
      SBAlterar.Enabled:=True;
      SBExcluir.Enabled:=True;
      SBConfirmar.Enabled:=False;
      SBCancelar.Enabled:=False;
      SBConsulta.Enabled:=True;
      SBRefresh.Enabled:=True;
    End
end;

procedure TFImplantacaoCad.PCEstoqueChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;        // não permite mudar de página caso a tabela esteja em estado de inclusão ou edicao
  If DSPrimario.DataSet.State in [DsInsert,DSEdit] then
    begin
      AllowChange:=False;
      ShowMessage('Não é possível sair desta página sem antes cancelar ou confirmar os dados');
    end;
  end;

procedure TFImplantacaoCad.SpeedButton7Click(Sender: TObject);
begin
  inherited;           // consulta Filial
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.Showmodal=mrok then
    Begin
      ME2CodFilial.text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
      //ME2Filial.Text:=DMFilial.QFilialConsDesc_Filial.value;
    End;
end;

procedure TFImplantacaoCad.SpeedButton8Click(Sender: TObject);
begin
  inherited;        // Método para Zerar o Inventário
  DMOracle.ValidaFilial(ME2CodFilial.Text);
  DmUsuario.Checar_Filial_Usuario( Trim(ME2CodFilial.Text),'ESTOQUE');
  Try
    If Not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    If Trim(ME2CodFilial.Text) <> '' then
      Begin
        If MessageDlg('Este procedimento irá zerar todo o inventário desta filial. Confirma ?', mtConfirmation, [mbYes, mbNo], 0)=MrYes then
          Begin
            If Trim(Me2CodClasse.Text) <> '' Then
              DMEstoque.QZeraInventario.SetVariable('COD_CLASSE', StrToInt(Trim(Me2CodClasse.Text)))
            Else
              DMEstoque.QZeraInventario.SetVariable('COD_CLASSE', Null);
            DMEstoque.QZeraInventario.SetVariable('COD_FILIAL', StrToInt(Trim(Me2CodFilial.Text)));
            DMEstoque.QZeraInventario.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
            DMEstoque.QZeraInventario.ExecSQL;
          End;
      End
    Else
        ShowMessage ('Deve Ser Informado Um Código de Filial');
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  Except
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    Raise;
  End;
end;

procedure TFImplantacaoCad.DiferenadeEstoque1Click(Sender: TObject);
begin
  inherited;        // Chamada ao Form de Parametros de estoque
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[0].TabVisible:=true;

  If FEstoqueParam.ShowModal=mrOk then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME0CodFilial.Text),'ESTOQUE');
     If FREstoque_Diferenca = Nil then // Chamada ao relatorio de diferença em estoque
       FREstoque_Diferenca:=TFREstoque_Diferenca.Create(Application);
       With DMEstoque do
        Begin  // Begin With
          QREstoque_Diferenca.Close;
          If Trim(FEstoqueParam.Me0Classe.Text) <> '' Then
             QREstoque_Diferenca.SetVariable('Num_Classe',StrToInt(Trim(FEstoqueParam.Me0Classe.Text)))
          Else
             QREstoque_Diferenca.SetVariable('Num_Classe',Null);
          If Trim(FEstoqueParam.Me0Fornecedor.Text) <> '' Then
             QREstoque_Diferenca.SetVariable('Cod_Cadastro',StrToInt(Trim(FEstoqueParam.Me0Fornecedor.Text)))
          Else
             QREstoque_Diferenca.SetVariable('Cod_Cadastro',Null);
          If FEstoqueParam.Cb0TipoProduto.ItemIndex = 0 Then
             QREstoque_Diferenca.SetVariable('Ind_Tipo_Produto',Null)
          Else
             QREstoque_Diferenca.SetVariable('Ind_Tipo_Produto',Trim(FEstoqueParam.Cb0TipoProduto.Text));
          If FEstoqueParam.Cb0Situacao.ItemIndex = 0 Then
             QREstoque_Diferenca.SetVariable('Ind_Situacao',Null)
          Else
             QREstoque_Diferenca.SetVariable('Ind_Situacao',Trim(FEstoqueParam.Cb0Situacao.Text));
          If FEstoqueParam.CB0Todos.Checked=False then
             QREstoque_Diferenca.SetVariable('COD_FILIAL',FEstoqueParam.Me0CodFilial.Text)
          Else
             QREstoque_Diferenca.SetVariable('COD_FILIAL',Null);
          case FEstoqueParam.CB0Ordem.ItemIndex of
             0: QREstoque_Diferenca.SetVariable('ORDER_BY','DESC_PRODUTO');
             1: QREstoque_Diferenca.SetVariable('ORDER_BY','COD_PRODUTO');
             2: QREstoque_Diferenca.SetVariable('ORDER_BY','DESC_CLASSE,DESC_PRODUTO');
             3: QREstoque_Diferenca.SetVariable('ORDER_BY','Substr(NUM_FABRICANTE,4,3)||Substr(NUM_FABRICANTE,9,2)||Substr(NUM_FABRICANTE,1,3)||Substr(NUM_FABRICANTE,7,2)')
          End;
          QREstoque_Diferenca.Open;
        End; //End With
        If FEstoqueParam.RGPreview.ItemIndex=0 then
          FREstoque_Diferenca.QRPrimario.Preview
        Else
          FREstoque_Diferenca.QRPrimario.Print;
        DMEstoque.QREstoque_Diferenca.Close;
   End;
End;

procedure TFImplantacaoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;              // Consulta a Filial
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.Showmodal=mrok then
     ME3CodFilial.text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFImplantacaoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;    // Atualiza Estoque pelo inventário
  DMOracle.ValidaFilial(ME3CodFilial.Text);
  DmUsuario.Checar_Filial_Usuario( Trim(Me3CodFilial.Text),'ESTOQUE');
  Try
    If Not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    If Trim(ME3CodFilial.Text)<>'' then
    Begin
      If MessageDlg('Este procedimento irá atualizar o estoque conforme o último inventário digitado,'+#13+'desta filial. Confirma ?', mtConfirmation, [mbYes, mbNo], 0)=MrYes then
      Begin
        If Me3CodClasse.Text <> '' Then
          DMEstoque.QAtualizaEstoque.SetVariable('COD_CLASSE',StrToInt(TRIM(Me3CodClasse.Text)))
        else
          DMEstoque.QAtualizaEstoque.SetVariable('COD_CLASSE',NULL);
        DMEstoque.QAtualizaEstoque.SetVariable('COD_FILIAL', StrToInt(Trim(Me3CodFilial.Text)));
        DMEstoque.QAtualizaEstoque.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
        DMEstoque.QAtualizaEstoque.ExecSQL;
      End;
    End
    Else
    Begin
      If MessageDlg('Este procedimento irá atualizar o estoque conforme o último inventário digitado,'+#13+'de TODAS as filiais. Confirma ?', mtConfirmation, [mbYes, mbNo], 0)=MrYes then
      Begin
        If Me3CodClasse.Text <> '' Then
          DMEstoque.QAtualizaEstoque.SetVariable('COD_CLASSE',StrToInt(TRIM(Me3CodClasse.Text)))
        else
          DMEstoque.QAtualizaEstoque.SetVariable('COD_CLASSE',NULL);

        DMEstoque.QAtualizaEstoque.SetVariable('COD_FILIAL', Null);
        DMEstoque.QAtualizaEstoque.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
        DMEstoque.QAtualizaEstoque.ExecSQL;
      End;
    End;

    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  Except
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;

    raise;
  End;
End;

procedure TFImplantacaoCad.RegistrodeInventrio1Click(Sender: TObject);
begin
  inherited;           // Chamada ao Relatório de Registro de Inventário
end;

procedure TFImplantacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEstoqueCons=Nil then
    FEstoqueCons:=TFEstoqueCons.Create(Application);
  If FEstoqueCons.ShowModal=mrOk then
  with DMEstoque do
  begin
    QEstoque.Close;
    QEstoque.SetVariable('COD_FILIAL',QEstoqueConsCod_Filial.Value);
    QEstoque.SetVariable('COD_PRODUTO',QEstoqueConsCod_Produto.Value);
    QEstoque.SetVariable('COD_LOTE_TIPO',QEstoqueConsCod_Lote_Tipo.Value);
    QEstoque.Open;
  end;
end;

procedure TFImplantacaoCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo_Filial,wCodigo_Tipo_Lote,wCodigo_Produto:real;
  wFormula, wMaximo, wMinimo : string;

begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMEstoque.QEstoqueCod_Filial.Text),'ESTOQUE');
  wCodigo_Filial:=DMEstoque.QEstoqueCod_Filial.Value;
  wCodigo_Tipo_Lote:=DMEstoque.QEstoqueCod_Lote_Tipo.Value;
  wCodigo_Produto:=DMEstoque.QEstoqueCod_Produto.Value;
  if (wold_qtd_estoque<>DMEstoque.Qestoqueqt_quantidade.value) then
  begin  // Grava o Movimento  do Estoque
    with DMEstoque do
    begin
      QEstoqueMov.Open;
      QEstoqueMov.insert;
      QEstoqueMovCod_Produto.Value:=QEstoqueCod_Produto.Value;
      QEstoqueMovCod_Lote_Tipo.Value:=QEstoqueCod_Lote_Tipo.Value;
      QEstoqueMovQt_Movimento.Value:=(QEstoqueQt_Quantidade.Value)-wold_qtd_estoque;
      QEstoqueMovDt_Movimento.Value:=DMOracle.DataHoraServ;
      QEstoqueMovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
      QEstoqueMovCod_Filial.Value:=QEstoqueCod_Filial.Value;
      QEstoqueMov.Post;
    end;
  end;
  {inherited;}
  Try
    DMEstoque.QEstoque.Post;
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise exception.create('Erro ao inserir movimento de estoque.' + #13 + #10 +
          'Erro: ' + e.Message);
    end;
  end;

  with DMEstoque do
  begin
    QEstoque.Close;
    QEstoque.SetVariable('COD_FILIAL',wCodigo_Filial);
    QEstoque.SetVariable('COD_LOTE_TIPO',wCodigo_Tipo_Lote);
    QEstoque.SetVariable('COD_PRODUTO',wCodigo_Produto);
    QEstoque.Open;
    wMaximo := DMEstoque.QEstoqueQT_MAXIMO.Text;
    wMinimo := DMEstoque.QEstoqueQT_MINIMO.Text;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
  Begin
    wFormula := DMOracle.BuscaNome('SELECT COD_FORMULA FROM TB_FORMULA',' COD_PRODUTO = '+ FloatToStr(wCodigo_Produto));
    DMFormula.QRFormula.Close;
    DMFormula.QRFormula.SetVariable('FORMULA',wFormula);
    DMFormula.QRFormula.Open;
    DMFormula.QRFormula.First;
    try
      DMOracle.DBCemapa.StartTransaction;
      while not DMFormula.QRFormula.Eof do
      Begin
        DMEstoque.QEstoque.close;
        DMEstoque.QEstoque.SetVariable('COD_PRODUTO', DMFormula.QRFormulaCOD_PRODUTO_ITEM.Value);
        DMEstoque.QEstoque.SetVariable('COD_FILIAL', 1);
        DMEstoque.QEstoque.SetVariable('COD_LOTE_TIPO', 310);
        DMEstoque.QEstoque.Open;
        DMEstoque.QEstoque.Edit;
        DMEstoque.QEstoqueQT_MAXIMO.Value := StrToFloat(wMaximo)*DMFormula.QRFormulaQT_ITEM.Value;
        DMEstoque.QEstoque.Post;
        DMFormula.QRFormula.next;
      end;
      DMOracle.DBCemapa.Commit;

    except
      DMOracle.DBCemapa.Rollback;
      raise exception.create('Erro! Transação não efetuada');
    end;  
    with DMEstoque do
    begin
      QEstoque.Close;
      QEstoque.SetVariable('COD_FILIAL',wCodigo_Filial);
      QEstoque.SetVariable('COD_LOTE_TIPO',wCodigo_Tipo_Lote);
      QEstoque.SetVariable('COD_PRODUTO',wCodigo_Produto);
      QEstoque.Open;
    end;
  end; 
end;

procedure TFImplantacaoCad.SBCancelarClick(Sender: TObject);
Var
  wCodigo_Filial,wCodigo_Tipo_Lote,wCodigo_Produto:real;
begin
  wCodigo_Filial:=DMEstoque.QEstoqueCod_Filial.Value;
  wCodigo_Tipo_Lote:=DMEstoque.QEstoqueCod_Lote_Tipo.Value;
  wCodigo_Produto:=DMEstoque.QEstoqueCod_Produto.Value;
  inherited;
  DMOracle.DBCemapa.RollBack;
  With DMEstoque do
    Begin
      QEstoque.Locate('Cod_Filial;Cod_Lote_Tipo;Cod_Produto;',VarArrayOf([wCodigo_Filial,wCodigo_Tipo_Lote,wCodigo_Produto]),[]);
    End;
end;

procedure TFImplantacaoCad.LevantamentodeEstoque1Click(Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[2].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    Begin
     DMProdutoRelatorio.QREstoqueLevantamento.Close;
     If Trim(FEstoqueParam.Me1Classe.Text) <> '' Then
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Num_Classe',StrToInt(Trim(FEstoqueParam.Me1Classe.Text)))
     Else
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Num_Classe',Null);
     If Trim(FEstoqueParam.Me1Fornecedor.Text) <> '' Then
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Cod_Cadastro',StrToInt(Trim(FEstoqueParam.Me1Fornecedor.Text)))
     Else
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Cod_Cadastro',Null);
     If FEstoqueParam.CbTipoProduto.ItemIndex <= 0 Then
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Ind_Tipo_Produto',Null)
     Else
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Ind_Tipo_Produto',Trim(FEstoqueParam.CbTipoProduto.Text));
     If FEstoqueParam.Cb2Situacao.ItemIndex <= 0 Then
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Ind_Situacao',Null)
     Else
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('Ind_Situacao',Trim(FEstoqueParam.Cb2Situacao.Text));
     If Trim(FEstoqueParam.Me1SubClasse.Text) <> '' Then
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('SubClasse',StrToInt(Trim(FEstoqueParam.Me1SubClasse.Text)))
     Else
        DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('SubClasse',Null);
     case FEstoqueParam.Me1Ordem.ItemIndex of
       0: DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('ORDER_BY','DESC_PRODUTO');
       1: DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('ORDER_BY','COD_PRODUTO');
       2: DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('ORDER_BY','DESC_CLASSE,DESC_PRODUTO');
       3: DMPRodutoRelatorio.QREstoqueLevantamento.SetVariable('ORDER_BY','Substr(NUM_FABRICANTE,4,3)||Substr(NUM_FABRICANTE,9,2)||Substr(NUM_FABRICANTE,1,3)||Substr(NUM_FABRICANTE,7,2)')
     End;

     DMProdutoRelatorio.QREstoqueLevantamento.Open;
     If FRLevantamentoEstoque = Nil then // Chamada ao relatorio de diferença em estoque
        FRLevantamentoEstoque := TFRLevantamentoEstoque.Create(Application);

     If FEstoqueParam.RGPreview.ItemIndex = 0 then
       FRLevantamentoEstoque.QRPrimario.Preview
     Else
       FRLevantamentoEstoque.QRPrimario.Print;
    End;
end;

procedure TFImplantacaoCad.EstouqueImplantado1Click(Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[3].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.FmFilial4.MeFilial.Text),'ESTOQUE');
      If FREstoqueImplantado = Nil then // Chamada ao relatorio de diferença em estoque
        FREstoqueImplantado:=TFREstoqueImplantado.Create(Application);
      FREstoqueImplantado.QrlTitulo.Caption := 'Estoque Implantado de :' + FEstoqueParam.ME2DataInicial.Text + ' Ate ' + FEstoqueParam.ME2DataFinal.Text;
      With DMEstoque do
       Begin
         QREstoqueImplantado.Close;
         If Trim(FEstoqueParam.ME2DataInicial.Text)<>'' then
            QREstoqueImplantado.SetVariable('DATA_INICIAL',FEstoqueParam.ME2DataInicial.Text)
         Else
            QREstoqueImplantado.SetVariable('DATA_INICIAL',Null);

         If Trim(FEstoqueParam.ME2DataFinal.Text)<>'' then
            QREstoqueImplantado.SetVariable('DATA_FINAL',FEstoqueParam.ME2DataFinal.Text)
         Else
            QREstoqueImplantado.SetVariable('DATA_FINAL',Null);

         If Trim(FEstoqueParam.FmProduto4.MeProduto.Text)<>'' then
            QREstoqueImplantado.SetVariable('PRODUTO', StrToInt(Trim(FEstoqueParam.FmProduto4.MeProduto.Text)))
         Else
            QREstoqueImplantado.SetVariable('PRODUTO',Null);

         If Trim(FEstoqueParam.FmFilial4.MeFilial.Text)<>'' then
            QREstoqueImplantado.SetVariable('FILIAL', StrToInt(Trim(FEstoqueParam.FmFilial4.MeFilial.Text)))
         Else
            QREstoqueImplantado.SetVariable('FILIAL',Null);

         If Trim(FEstoqueParam.FmClasse4.MeClasse.Text) <> '' then
            QREstoqueImplantado.SetVariable('CLASSE', StrToInt(Trim(FEstoqueParam.FmClasse4.MeClasse.Text)))
         Else
            QREstoqueImplantado.SetVariable('CLASSE',Null);
         
         If FEstoqueParam.CB2TipoProduto.Text='TODOS' then
            QREstoqueImplantado.SetVariable('TIPO_PRODUTO',Null)
         Else
            QREstoqueImplantado.SetVariable('TIPO_PRODUTO',FEstoqueParam.CB2TipoProduto.Text);

         If trim(FEstoqueParam.FmMarca4.MeMarca.Text) = '' then
            QREstoqueImplantado.SetVariable('COD_MARCA',Null)
         Else
            QREstoqueImplantado.SetVariable('COD_MARCA',FEstoqueParam.FmMarca4.MeMarca.Text);
            
            QREstoqueImplantado.SQL[QREstoqueImplantado.SQL.Count-1]:='';
              case FEstoqueParam.CB2Ordem.ItemIndex of
              0: QREstoqueImplantado.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO');
              1: QREstoqueImplantado.SQL.Add('ORDER BY TB_PRODUTO.COD_PRODUTO');
             // 2: QREstoqueImplantado.SQL.Add(' ,TB_CLASSE.DESC_CLASSE,TB_PRODUTO.DESC_PRODUTO');
             end;

         QREstoqueImplantado.Open;
       End;
     if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEIFAGRIL' then
        FREstoqueImplantado.QRDBText1.DataField := 'NUM_FABRICANTE';

     If FEstoqueParam.RGPreview.ItemIndex=0 then
        FREstoqueImplantado.QRPrimario.Preview
     Else
        FREstoqueImplantado.QRPrimario.Print;
     DMEstoque.QREstoqueImplantado.Close;
    End;
end;

procedure TFImplantacaoCad.ConsultaAvanada1Click(Sender: TObject);
begin
  inherited;
  if FEstoqueACons = Nil then
    FEstoqueACons:=TFEstoqueACons.Create(Application);
  If FEstoqueACons.ShowModal=mrOk then
    Begin
      With DMEstoque do
        Begin
          QEstoque.Close;
          QEstoque.SetVariable('COD_FILIAL',QEstoqueAConsCod_Filial.Value);
          QEstoque.SetVariable('COD_PRODUTO',QEstoqueAConsCod_Produto.Value);
          QEstoque.SetVariable('COD_LOTE_TIPO',QEstoqueAConsCod_Lote_Tipo.Value);
          QEstoque.Open;
        End;
    End;
end;

procedure TFImplantacaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.state in [DSEdit, DSInsert] then
    begin
      Bt0ConsFilial.Enabled:=True;
      Bt0ConsProduto.Enabled:=True;
      Bt0ConsLote.Enabled:=True;
    end
  else
    begin
      Bt0ConsFilial.Enabled:=False;
      Bt0ConsProduto.Enabled:=False;
      Bt0ConsLote.Enabled:=False;
    end;
end;

procedure TFImplantacaoCad.ECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ECodFilial.Text)<>'' then
    begin
      EFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ECodFilial.text);
    end
  else
    begin
      EFilial.Clear;
    end;
  
end;

procedure TFImplantacaoCad.ECodProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ECodProduto.Text)<>'' then
    begin
      EProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ECodProduto.text);
    end
  else
    begin
      EProduto.Clear;
    end;
end;

procedure TFImplantacaoCad.ECodLoteChange(Sender: TObject);
begin
  inherited;
  if Trim(ECodLote.Text)<>'' then
    begin
      ELote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+ECodLote.text);
    end
  else
    begin
      ELote.Clear;
    end;
end;

procedure TFImplantacaoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(ECodFilial.Text);
  DmUsuario.Checar_Filial_Usuario( Trim(ECodFilial.Text),'ESTOQUE');
  if (Trim(EFilial.text)<>'') and (Trim(EProduto.text)<>'') and (Trim(ELote.Text)<>'') then
    begin
      Try
        with DMEstoque do
          begin
            QEstoque.Close;
            QEstoque.SetVariable('COD_FILIAL',ECodFilial.Text);
            QEstoque.SetVariable('COD_PRODUTO',ECodProduto.Text);
            QEstoque.SetVariable('COD_LOTE_TIPO',ECodLote.Text);
            QEstoque.Open;
            if QEstoque.Eof then
              begin
                QEstoque.Insert;
                QEstoqueCod_Filial.Value:=StrToInt(ECodFilial.Text);
                QEstoqueCod_Lote_Tipo.Value:=StrToInt(ECodLote.Text);
                QEstoqueCod_Produto.Value:=StrToInt(ECodProduto.Text);
                If EQtde.Text <> '' Then
                   QEstoqueQt_Inventario.Value:=StrToFloat(EQtde.Text);
                If ECusto.Text <> '' Then
                   QEstoqueVl_Custo_Inventario.Value:=StrToFloat(ECusto.Text);
                QEstoque.Post;
              end
            else
              begin
                QEstoque.Edit;
                QEstoqueQt_Inventario.Value:=QEstoqueQt_Inventario.Value+StrToFloat(EQtde.Text);
                If ECusto.Text <> '' Then
                   QEstoqueVl_Custo_Inventario.Value:=StrToFloat(ECusto.Text);
                QEstoque.Post;
              end;
            If Trim(MeLocalizacao_Inv.Text) <> '' Then
             Begin
               DMProduto.QProduto.close;
               DMProduto.QProduto.SetVariable('PK',StrToInt(Trim(ECodProduto.Text)));
               DMProduto.QProduto.Open;
               DMProduto.QProduto.Edit;
               DMProduto.QProdutoDESC_LOCALIZACAO.Value := Trim(MeLocalizacao_Inv.Text);
               DMProduto.QProduto.Post;
               MeLocalizacao_Inv.Clear;
             End;
            ECodProduto.Clear;
            EdNumFabricante.Text;
            EQtde.Clear;
            ECodProduto.SetFocus;
            ECusto.Clear;
            DMOracle.DBCemapa.Commit;
          end;
      except
        begin
          DMEstoque.QEstoque.Cancel;
          DMOracle.DBCemapa.RollBack;
        end;
      end;
    end
    else
      showMessage('Erro nos dados lançados, campos em branco ou inconsistentes');
  MMCadSimples.Items[0].Enabled:=False;
  SBIncluir.Enabled:=False;
  SBAlterar.Enabled:=False;
  SBExcluir.Enabled:=False;
  SBConfirmar.Enabled:=False;
  SBCancelar.Enabled:=False;
  SBConsulta.Enabled:=False;
  SBRefresh.Enabled:=False;
end;

procedure TFImplantacaoCad.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.Showmodal=mrok then
    begin
      Try
        ECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
      except
        ECodFilial.Clear;
      end;
    end;
end;

procedure TFImplantacaoCad.Bt1ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If (FProdutoCons.Showmodal=mrok) then
    begin
      Try
        ECodProduto.text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
      except
        ECodProduto.Clear;
      end;
    end;
end;

procedure TFImplantacaoCad.Bt1ConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons=Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  If (FTipoLoteCons.Showmodal=mrok) then
    begin
      Try
        ECodLote.text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
      except
        ECodLote.Clear;
      end;
    end;
end;

procedure TFImplantacaoCad.ProdutosAbaixodoMnimo1Click(Sender: TObject);
begin
  inherited;
  if FEstoqueParam=nil then
     FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[4].TabVisible:=true;
  if FEstoqueParam.ShowModal=mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME4CodFilial.Text),'ESTOQUE');
    with DMEstoque do
    begin
      QREstoqueProd_Min.Close;
      if Trim(FEstoqueParam.ME4CodFilial.Text)<>'' then
         QREstoqueProd_Min.SetVariable('COD_FILIAL',FEstoqueParam.ME4CodFilial.Text)
      else
         QREstoqueProd_Min.SetVariable('COD_FILIAL',Null);

      if Trim(FEstoqueParam.ME4NrClasse.Text)<>'' then
         QREstoqueProd_Min.SetVariable('NUM_CLASSE',FEstoqueParam.ME4NrClasse.Text)
      else
         QREstoqueProd_Min.SetVariable('NUM_CLASSE',Null);
      if Trim(FEstoqueParam.ME4NrSubClasse.Text)<>'' then
         QREstoqueProd_Min.SetVariable('NUM_SUBCLASSE',FEstoqueParam.ME4NrSubClasse.Text)
      else
         QREstoqueProd_Min.SetVariable('NUM_SUBCLASSE',Null);

      if Trim(FEstoqueParam.ME4CodCadastro.Text)<>'' then
         QREstoqueProd_Min.SetVariable('COD_CADASTRO',FEstoqueParam.ME4CodCadastro.Text)
      else
         QREstoqueProd_Min.SetVariable('COD_CADASTRO',Null);

         QREstoqueProd_Min.SQL[QREstoqueProd_Min.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FEstoqueParam.Rg_Order.ItemIndex of
        0: DMEstoque.QREstoqueProd_Min.SQL.Add('ORDER BY TB_PRODUTO.COD_PRODUTO');
        1: DMEstoque.QREstoqueProd_Min.SQL.Add ('ORDER BY TB_PRODUTO.DESC_PRODUTO');
      end;
      QREstoqueProd_Min.Open;
    end;

    if FREstoqueProd_Min = nil then
       FREstoqueProd_Min := TFREstoqueProd_Min.Create(Application);

    if Trim(FEstoqueParam.ME4CodCadastro.Text) <> '' then
       FREstoqueProd_Min.QRL_Cadastro.Caption := FEstoqueParam.ME4CodCadastro.Text+'-'+FEstoqueParam.ME4CadastroNome.Text;

    if FEstoqueParam.RGPreview.ItemIndex=0 then
       FREstoqueProd_Min.QRPrimario.Preview
    else
       FREstoqueProd_Min.QRPrimario.Print;

       DMEstoque.QREstoqueProd_Min.Close;

  end;
end;

procedure TFImplantacaoCad.ProdutosAcimadoMximo1Click(Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[5].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME5CodFilial.Text),'ESTOQUE');
      with DMEstoque do
      begin
        QREstoqueProd_Max.Close;
        if Trim(FEstoqueParam.ME5CodFilial.Text)<>'' then
           QREstoqueProd_Max.SetVariable('COD_FILIAL',FEstoqueParam.ME5CodFilial.Text)
        else
           QREstoqueProd_Max.SetVariable('COD_FILIAL',Null);

        if Trim(FEstoqueParam.ME5NrClasse.Text)<>'' then
           QREstoqueProd_Max.SetVariable('NUM_CLASSE',FEstoqueParam.ME5NrClasse.Text)
        else
           QREstoqueProd_Max.SetVariable('NUM_CLASSE',Null);
        if Trim(FEstoqueParam.ME5NrSubClasse.Text)<>'' then
           QREstoqueProd_Max.SetVariable('NUM_SUBCLASSE',FEstoqueParam.ME5NrSubClasse.Text)
        else
           QREstoqueProd_Max.SetVariable('NUM_SUBCLASSE',Null);

        if Trim(FEstoqueParam.ME5CodCadastro.Text)<>'' then
           QREstoqueProd_Max.SetVariable('COD_CADASTRO',FEstoqueParam.ME5CodCadastro.Text)
        else
           QREstoqueProd_Max.SetVariable('COD_CADASTRO',Null);

           QREstoqueProd_Max.SQL[QREstoqueProd_Max.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FEstoqueParam.Rg_Order2.ItemIndex of
        0: DMEstoque.QREstoqueProd_Max.SQL.Add('ORDER BY TB_PRODUTO.COD_PRODUTO');
        1: DMEstoque.QREstoqueProd_Max.SQL.Add ('ORDER BY TB_PRODUTO.DESC_PRODUTO');
      end;

        QREstoqueProd_Max.Open;

      end;

      if FREstoqueProd_Max = nil then
         FREstoqueProd_Max := TFREstoqueProd_Max.Create(Application);

      if Trim(FEstoqueParam.ME5CodCadastro.Text) <> '' then
         FREstoqueProd_Max.QRL_Cadastro.Caption := FEstoqueParam.ME5CodCadastro.Text+'-'+FEstoqueParam.ME5CadastroNome.Text;

      if FEstoqueParam.RGPreview.ItemIndex=0 then
        FREstoqueProd_Max.QRPrimario.Preview
      else
        FREstoqueProd_Max.QRPrimario.Print;

        DMEstoque.QREstoqueProd_Max.Close;
    end;
end;

procedure TFImplantacaoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
 If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.Showmodal=mrok then
    begin
      Try
        MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
      except
        MECodFilial.Clear;
      end;
    end;
end;

procedure TFImplantacaoCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons=Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  If (FTipoLoteCons.Showmodal=mrok) then
    begin
      Try
        MECodLote.text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
      except
        MECodLote.Clear;
      end;
    end;
end;

procedure TFImplantacaoCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If (FProdutoCons.Showmodal = MrOk) then
  begin
    Try
      MECodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
      MENumFabricante.Text:= DMProduto.QProdutoConsNum_Fabricante.Value;
      MECodProdutoExit(Self);
    except
      MECodProduto.Clear;
    end;
  end;
end;

procedure TFImplantacaoCad.MECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
  begin
    MEFilial.Clear;
    MeCustoComissao.Clear;
  end;
end;

procedure TFImplantacaoCad.MECodLoteChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodLote.Text) <> '' then
  begin
    MELote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MECodLote.text);
    if (Trim(MECodProduto.Text) <> '') and (Trim(MECodLote.Text) <> '') then
      MeCustoComissao.Text := DMOracle.BuscaNome('SELECT VL_CUSTO_COMISSAO FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text + 'AND COD_LOTE_TIPO = '+ MECodLote.Text);
  end
  else
  begin
    MELote.Clear;
    MeCustoComissao.Text := '';
  end;
end;

procedure TFImplantacaoCad.MECodProdutoChange(Sender: TObject);
begin
  inherited;
  MEQuantidade.Clear;
  MECustoMEdio.Clear;
  MeMotivo.Clear;
  MeCustoComissao.Clear;
  if Trim(MECodProduto.Text) <> '' then
    begin
      MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text);
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
        MENumFabricante.Text := DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO', 'COD_PRODUTO = ' + MECodProduto.Text)
      else
        MENumFabricante.Clear;
    end
  else
    MEProduto.Clear;
end;

procedure TFImplantacaoCad.BtnConfirmaClick(Sender: TObject);
var wHashMD5: String;
begin
  DMOracle.ValidaFilial(MECodFilial.Text);
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'ESTOQUE');
  // Incluido por Robson em 20/03/2001 para atualização preço varejo/atacado.
  if (Trim(MeLocalizacao.Text) <> '') And (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INSIDE') then
  Begin
    with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_PRODUTO SET DESC_LOCALIZACAO = ' + chr(39) + MeLocalizacao.Text + chr(39));
          QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + chr(39) + TRIM(MeCodProduto.Text) + chr(39));
          QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Não atualizou localização do produto');
        end;
      end;
  End;
  if (Trim(MEPrecoVarejo.Text) <> '') or
     (Trim(MEPrecoAtacado.Text) <> '') or
     (trim(MePrecoPromocao.Text) <> '') then
  with DMProduto do
  begin
    if Trim(MECodProduto.Text) <> '' then
    begin
      QProduto.Close;
      QProduto.SetVariable('PK',MECodProduto.Text);
      QProduto.Open;
      If QProduto.RecordCount > 0 then
      begin
        Try
          QProduto.Edit;
          if Trim(MEPrecoVarejo.Text) <> '' then
             QProdutoVAL_VAREJO.Value  := StrToFloat(MEPrecoVarejo.Text);
          if Trim(MEPrecoAtacado.Text) <> '' then
             QProdutoVAL_ATACADO.Value := StrToFloat(MEPrecoAtacado.Text);
          if Trim(MePrecoPromocao.Text) <> '' then
             QProdutoPRECO_PROMOCAO.Value := StrToFloat(MePrecoPromocao.Text);
          if Trim(MEPorcentagem.Text) <> '' then
             QProdutoPERC_MARGEM_VAREJO.Value := StrToFloat(MEPorcentagem.Text);
          QProduto.Post;
          DMOracle.DBCemapa.Commit;
        except
           QProduto.Cancel;
           raise;
        end;
      end;
      QProduto.Close;
    end
    else
       MessageDlg('Preço varejo/atacado não foi atualizado-Produto não encontrado!',mtInformation,[mbOk],0);
  end;

  inherited;
  with DMEstoque do
  begin
    if ((Trim(MEQuantidade.Text) <> '') and (Trim(MECodProduto.Text) <> '')  and
       (Trim(MECodLote.Text)    <> '')  and (Trim(MECodFilial.Text)  <> '')) Or
       (Trim(MECustoMedio.Text) <> '')  then
    begin
      Try
        DMoracle.DBCemapa.StartTransaction;
        QEstoqueMov.Close;
        QEstoqueMov.Open;
        QEstoqueMov.insert;
        QEstoqueMovCod_Produto.Value  :=StrToInt(MECodProduto.Text);
        QEstoqueMovCod_Lote_Tipo.Value:=StrToInt(MECodLote.Text);
        If Trim(MEQuantidade.Text) <> '' Then
           QEstoqueMovQt_Movimento.Value :=StrToFloat(MEQuantidade.Text);
        QEstoqueMovDt_Movimento.Value :=DMOracle.DataServ;

        QEstoqueMovCod_Usuario.Value  :=DMUsuario.CodUsuarioCorrente;
        QEstoqueMovCod_Filial.Value   :=StrToInt(MECodFilial.Text);
        If Trim(MeMotivo.Text) <> '' Then
           QEstoqueMovCod_Motivo.Value   :=StrToInt(MEMotivo.Text);
        If Trim(MECustoMedio.Text) <> '' then
           QEstoqueMovVl_Custo_Medio.Value   :=StrToFloat(Trim(MECustoMedio.Text));
        QEstoqueMov.Post;
        if (Trim(MEQuantidade.Text) <> '') Then  // somente altera estoque quando quantidade estiver preenchido
        begin
          DMEstoque.AtualizaEstoque(-2,StrToInt(MECodFilial.Text),StrToInt(MECodProduto.Text),
            StrToInt(MECodLote.Text),StrToFloat(MEQuantidade.Text),0,0,0);
          wHashMD5 := bib.GetHashStringMD5(DMOracle.FastSelect('QT_QUANTIDADE',
            'TB_ESTOQUE', 'COD_FILIAL = ' + Trim(MECodFilial.Text) + ' AND COD_PRODUTO = ' +
            Trim(MECodProduto.Text) + ' AND COD_LOTE_TIPO = '+ Trim(MECodLote.Text)));
          DMOracle.ExecutaSql('UPDATE TB_ESTOQUE SET DESC_HASH_MD5 = ' + QuotedStr(wHashMD5) +
            ' WHERE COD_FILIAL = ' + Trim(MECodFilial.Text) + ' AND COD_PRODUTO = ' +
            Trim(MECodProduto.Text) + ' AND COD_LOTE_TIPO = ' + Trim(MECodLote.Text));
        end;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise;
      end;
    end;
  end;

  if (Trim(MeCustoMedio.Text)    <> '') Or
     (Trim(MeEstoqueMinimo.Text) <> '') Or
     (Trim(MeLocalizacao.Text)   <> '') Or
     (Trim(MeEstoqueMaximo.Text) <> '') Or
     (Trim(MECustoComissao.Text) <> '') Then
     // Atualiza custo do produto by Robson 20/03/2001
     with DMEstoque do
     begin
       QEstoque.Close;
       QEstoque.SetVariable('COD_FILIAL',MECodFilial.Text);
       QEstoque.SetVariable('COD_LOTE_TIPO',MECodLote.Text);
       QEstoque.SetVariable('COD_PRODUTO',MECodProduto.Text);
       QEstoque.Open;   

      if not DMOracle.DBCemapa.InTransaction = False then
        DMOracle.DBCemapa.StartTransaction;
      Try
        if QEstoque.RecordCount > 0 then
          QEstoque.Edit
        else
        begin
          QEstoque.Insert;
          QEstoqueCOD_FILIAL.Text := Trim(MECodFilial.Text);
          QEstoqueCOD_LOTE_TIPO.Text := Trim(MECodLote.Text);
          QEstoqueCOD_PRODUTO.Text := Trim(MECodProduto.Text);
          QEstoqueQT_QUANTIDADE.Value := 0;
        end;
        If Trim(MeCustoMedio.Text) <> '' Then
        Begin
          QEstoqueVL_CUSTO_MEDIO.Value:= StrToFloat(MECustoMedio.Text);
          QEstoqueVL_ULTIMO_CUSTO.Value:= StrToFloat(MECustoMedio.Text);
        End;
        If Trim(MeEstoqueMinimo.Text) <> '' Then
          QEstoqueQt_Minimo.Value := StrToFloat(Trim(MeEstoqueMinimo.Text));
        If Trim(MeEstoqueMaximo.Text) <> '' Then
          QEstoqueQt_Maximo.Value := StrToFloat(Trim(MeEstoqueMaximo.Text));
        If Trim(MeLocalizacao.Text) <> '' Then
          QEstoqueDesc_Localizacao.Value := Trim(MeLocalizacao.Text);
        If Trim(MECustoComissao.Text) <> '' Then
          QEstoqueVl_Custo_Comissao.Value := StrToFloat(Trim(MECustoComissao.Text));
        QEstoque.Post;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;

  MECodProduto.Clear;
  MEQuantidade.Clear;
  if DMParamSistema.CodEmpresa = 'PIXIXE' then
    MECodLote.SetFocus
  else
    MECodProduto.SetFocus;
  MENumFabricante.Clear;
  MECustoMedio.Clear;
  MeEstoqueMinimo.Clear;
  MeEstoqueMaximo.Clear;
  MEPrecoVarejo.Clear;
  MEPrecoAtacado.Clear;
  MECustoComissao.Clear;
  MEPorcentagem.Clear;
end;

procedure TFImplantacaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(7);
end;

procedure TFImplantacaoCad.EtiquetaCodBarrasPequena1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if FEstoqueParam=nil then
     FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[10].TabVisible:=true;

  if FEstoqueParam.ShowModal=mrOk then
  begin
    if ( Trim(FEstoqueParam.ME10CodProdutoI.Text) = '' ) or
       ( Trim(FEstoqueParam.ME10CodProdutoF.Text) = '' )then
    begin
       raise Exception.Create('Código produto inicio e final devem ser informados!');
    end;
    if Trim(FEstoqueParam.ME10NrCopias.Text) = '' then
    begin
       raise Exception.Create('Número de cópias deve ser informado!');
    end;

    with DMProdutoRelatorio do
    begin
      QRProdutoCodBarraPeq.Close;
      QRProdutoCodBarraPeq.SetVariable('COD_PRODUTOI',FEstoqueParam.ME10CodProdutoI.Text);
      QRProdutoCodBarraPeq.SetVariable('COD_PRODUTOF',FEstoqueParam.ME10CodProdutoF.Text);

      QRProdutoCodBarraPeq.open;

      if FREtiquetaCodBarraPeq = nil then
         FREtiquetaCodBarraPeq := TFREtiquetaCodBarraPeq.Create(Application);
      i := StrToInt(Trim(FEstoqueParam.ME10NrCopias.Text));
      FREtiquetaCodBarraPeq.QRPrimario.PrinterSettings.Copies := i;
      if FEstoqueParam.RGPreview.ItemIndex = 0 then
         FREtiquetaCodBarraPeq.QRPrimario.Preview
      else
         FREtiquetaCodBarraPeq.QRPrimario.Print;

      QRProdutoCodBarraPeq.Close;

    end;

  end;
end;

procedure TFImplantacaoCad.ME4CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.Text)<>'' then
     ME4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.text)
  else
     ME4Filial.Clear;
end;

procedure TFImplantacaoCad.ME4CodLoteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodLote.Text)<>'' then
     ME4Lote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+ME4CodLote.text)
  else
     ME4Lote.Clear;
end;

procedure TFImplantacaoCad.Bt_FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
  begin
    Try
     ME4CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    except
     ME4CodFilial.Clear;
    end;
  end;
end;

procedure TFImplantacaoCad.Bt4LoteConsClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons=Nil then
     FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if (FTipoLoteCons.Showmodal=mrok) then
  begin
    Try
     ME4CodLote.text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
    except
     ME4CodLote.Clear;
    end;
  end;
end;

procedure TFImplantacaoCad.BtConfirmaClick(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(ME4CodFilial.Text);
  DmUsuario.Checar_Filial_Usuario( Trim(ME4CodFilial.Text),'ESTOQUE');
  Try
    DMoracle.DBCemapa.StartTransaction;
    DMEstoque.QEstoque.DisableControls;
    DMEstoque.AtualizaEstoque(-1,StrToInt(ME4CodFilial.Text),StrToInt(ME4CodProduto.Caption),
                             StrToInt(ME4CodLote.Text),StrToFloat(ME4Quantidade.Text),0,0,0);
    with DMEstoque do
    begin
      QEstoqueMov.Open;
      QEstoqueMov.insert;
      QEstoqueMovCod_Produto.Value:=QEstoqueCod_Produto.Value;
      QEstoqueMovCod_Lote_Tipo.Value:=QEstoqueCod_Lote_Tipo.Value;
      QEstoqueMovQt_Movimento.Value:=(QEstoqueQt_Quantidade.Value)-wold_qtd_estoque;
      QEstoqueMovDt_Movimento.Value:=DMOracle.DataServ;
      QEstoqueMovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
      QEstoqueMovCod_Filial.Value:=QEstoqueCod_Filial.Value;
      QEstoqueMov.Post;
    end;
    DMOracle.DBCemapa.Commit;
  except
   DMOracle.DBCemapa.Rollback;
   Raise Exception.Create('Erro ao Lançar este Movimento no Estoque !');
  end;
  ME4CodProdBarra.Clear;
  ME4CodProduto.Caption := '';
  ME4Produto.Clear;
//  MECodLote.Clear;
//  MECodFilial.Clear;
  ME4Quantidade.Clear;
  ME4CodProdBarra.SetFocus;
  DMEstoque.QEstoque.EnableControls;
  BtConfirma.Enabled := False;
end;

procedure TFImplantacaoCad.ME4CodProdBarraExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodProdBarra.Text)<>'' then
    begin
      ME4Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','DESC_COD_BARRA = '+CHR(39)+trim(ME4CodProdBarra.text)+CHR(39));
      ME4CodProduto.Caption:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','DESC_COD_BARRA = '+CHR(39)+trim(ME4CodProdBarra.text)+CHR(39));
      if Trim(ME4Produto.Text) = '' then
      begin
         ShowMessage('Produto não encontrado!');
         ME4CodProdBarra.SetFocus;
      end
      else
         BtConfirma.Enabled := True;   
    end
  else
     ME4CodProdBarra.Clear;
end;

procedure TFImplantacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMEstoque.QEstoque.Close;
  DMEstoque.QEstoqueMov.Close;
  Action := CaFree;
  FImplantacaoCad := Nil;
end;

procedure TFImplantacaoCad.EdNumFabricanteChange(Sender: TObject);
begin
  inherited;
  if Trim(EdNumFabricante.Text) <> '' then
     ECodProduto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+CHR(39)+EdNumFabricante.Text+CHR(39))
  else
     ECodProduto.Text := '';
end;

procedure TFImplantacaoCad.Estoquenoinventariado1Click(Sender: TObject);
begin
  inherited;
  with DMEstoque do
  begin
    QREstoque_nao_inventariado.Close;
    QREstoque_nao_inventariado.Open;
  end;
  if FRProdutoNaoInventariado = nil then
     FRProdutoNaoInventariado := TFRProdutoNaoInventariado.Create(Application);
  FRProdutoNaoInventariado.QRPrimario.Preview;
end;

procedure TFImplantacaoCad.Estoqueinventariado1Click(Sender: TObject);
begin
  inherited;
  with DMEstoque do
  begin
    QREstoqueInventariado.Close;
    if(DMParamSistema.CodEmpresa = 'MEDIBENS') then
      QREstoqueInventariado.SetVariable('ORDEM', 'MERCEDES');
    QREstoqueInventariado.Open;
  end;
  if FRProdutoInventariado = nil then
     FRProdutoInventariado := TFRProdutoInventariado.Create(Application);

  FRProdutoInventariado.QRLTitulo.Caption := 'Somente produtos inventariados';
  FRProdutoInventariado.QRPrimario.Preview;
end;

procedure TFImplantacaoCad.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      Me2CodCLasse.Text:=FloatToStr(DMClasse.QClasseConsCOD_CLASSE.Value);
      Ed2Classe.Text := DMClasse.QClasseConsDESC_CLASSE.Value;
    End;
end;

procedure TFImplantacaoCad.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      Me3CodCLasse.Text:=FloatToStr(DMClasse.QClasseConsCOD_CLASSE.Value);
      Ed3Classe.Text := DMClasse.QClasseConsDESC_CLASSE.Value;
    End;
end;

procedure TFImplantacaoCad.ME2CodFilialChange(Sender: TObject);
begin
  inherited;
  If ME2CodFilial.Text <> '' Then
    ME2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL' , 'COD_FILIAL = ' + TRIM(ME2CodFilial.Text) );
end;

procedure TFImplantacaoCad.Me2CodClasseChange(Sender: TObject);
begin
  inherited;
  If Trim(Me2CodClasse.Text) <> '' Then
     Ed2Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(Me2CodClasse.Text));
end;

procedure TFImplantacaoCad.ME3CodFilialChange(Sender: TObject);
begin
  inherited;
  If ME3CodFilial.Text <> '' Then
    ME3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL' , 'COD_FILIAL = ' + TRIM(ME3CodFilial.Text) );
end;

procedure TFImplantacaoCad.Me3CodClasseChange(Sender: TObject);
begin
  inherited;
  If Trim(Me3CodClasse.Text) <> '' Then
     Ed3Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(Me3CodClasse.Text));
end;

procedure TFImplantacaoCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FMotivoCons=Nil then
    FMotivoCons:=TFMotivoCons.Create(Application);
  If (FMotivoCons.Showmodal=mrok) then
     MeMotivo.text:=FloatToStr(DMMotivo.QMotivoConsCod_Motivo.value)
  Else
     MeMotivo.Clear;
end;

procedure TFImplantacaoCad.ECodProdutoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS' then
  begin
    if Trim(ECodProduto.Text) <> '' then
    begin
      GB1EstoqueFilial.Visible := true;
      lblQtdF1.Caption := formatFloat('00', strtofloat('0' + DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE', 'COD_FILIAL = 1 AND COD_PRODUTO = ' + Trim(ECodProduto.Text))));
      lblQtdF2.Caption := formatFloat('00', strtofloat('0' + DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE', 'COD_FILIAL = 2 AND COD_PRODUTO = ' + Trim(ECodProduto.Text))));

      lblCustoF1.Caption := formatFloat('#,##0.00', strtofloat('0' + DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE', 'COD_FILIAL = 1 AND COD_PRODUTO = ' + Trim(ECodProduto.Text))));
      lblCustoF2.Caption := formatFloat('#,##0.00', strtofloat('0' + DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE', 'COD_FILIAL = 2 AND COD_PRODUTO = ' + Trim(ECodProduto.Text))));
    end
    else
      GB1EstoqueFilial.Visible := false;
  end
  else
    GB1EstoqueFilial.Visible := false;
    
end;

procedure TFImplantacaoCad.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MINIMART') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'GOLDEN') Then
  begin
    if Trim(MeCodProduto.Text) <> '' then
    begin
      MEQuantidade.Text    := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text+ 'AND COD_LOTE_TIPO = '+ MECodLote.Text + 'AND COD_FILIAL = ' + MECodFilial.Text);
      MECustoMedio.Text    := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text+ 'AND COD_LOTE_TIPO = '+ MECodLote.Text + 'AND COD_FILIAL = ' + MECodFilial.Text);

      if (Trim(MECodProduto.Text) <> '') and (Trim(MECodLote.Text) <> '') then
        MeCustoComissao.Text := DMOracle.BuscaNome('SELECT VL_CUSTO_COMISSAO FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text + 'AND COD_LOTE_TIPO = '+ MECodLote.Text + 'AND COD_FILIAL = ' + MECodFilial.Text)
      else
        MeCustoComissao.Text := '';

      if Trim(MECustoMedio.Text) <> '' then
        MECustoMedio.Text  :=FormatFloat('#,##0.00',StrToFloat(MECustoMedio.Text));
    end
    else
    Begin
      MEQuantidade.Text := '';
      MECustoMEdio.Text:= '';
      MeCustoComissao.Text := '';
    End;
  end;
  If Trim(MECodProduto.Text) <> '' Then
  Begin
    DMEstoque.QEstoqueCons.Close;
    DMEstoque.QEstoqueCons.SetVariable('Filial',Null);
    DMEstoque.QEstoqueCons.SetVariable('Produto',Null);
    DMEstoque.QEstoqueCons.SetVariable('Tipo_Lote',Null);
    DMEstoque.QEstoqueCons.SetVariable('Cod_Produto',StrToInt(Trim(MECodProduto.Text)));
    DMEstoque.QEstoqueCons.SetVariable('Num_Fabricante',Null);
    DMEstoque.QEstoqueCons.Open;
  End;
  if (DMParamSistema.CodEmpresa = 'PIXIXE') then
  Begin
    MEQuantidade.Text := '1';
    if Trim(MECodProduto.Text) <> '' then
      MECustoMedio.Text := DMOracle.FastSelect('VL_ULTIMO_CUSTO','TB_ESTOQUE','COD_PRODUTO ='+MECodProduto.Text+
                                             ' AND COD_LOTE_TIPO = 1');
  end;
  if (DMParamSistema.CodEmpresa = 'FINESTRA') then
  begin
    if Trim(MECodProduto.Text) <> '' then
    begin
        MECustoMedio.Text := DMOracle.FastSelect('VL_ULTIMO_CUSTO','TB_ESTOQUE','COD_PRODUTO = ' + MECodProduto.Text + ' AND COD_LOTE_TIPO = 1');
        MEPorcentagem.Text := DMOracle.FastSelect('PERC_MARGEM_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + MECodProduto.Text);
    end;
  end;
end;
procedure TFImplantacaoCad.MENumFabricanteExit(Sender: TObject);
begin
  inherited;
  if (Trim(MENumFabricante.text) <> '') Then
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    begin
      MECodProduto.Text:=DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO',
          'NUM_FABRICANTE = ' + QuotedStr(MENumFabricante.Text));
      If MECodProduto.Text = '' then
        MECodProduto.Text:=DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO',
            'NUM_FABRICANTE LIKE ' + QuotedStr(MENumFabricante.Text + '%'));
    End
    Else
      MECodProduto.Text:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+chr(39)+MENumFabricante.text+chr(39));
    If (Trim(MENumFabricante.Text) <> '') and (Trim(MECodProduto.Text) <> '') then
     Begin
       MEQuantidade.Text :=DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text);

       MECustoMEdio.Text:=DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text);
       if Trim(MECustoMedio.Text) <> '' then
          MECustoMedio.Text  :=FormatFloat('#,##0.00',StrToFloat(MECustoMedio.Text));
     End
    else
     Begin
       MEQuantidade.Text := '';
       MECustoMEdio.Text:= '';
       MeCustoComissao.Text := '';
     End;
  end;

  //Por Gian 15/07/2020. Solicitado por Rubenz.
  //Quando informado o Nr.Fabricante ele seta as configurações do código do produto
  //mas não atualiza as informações no grid.
  
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONKRETA') then
    MECodProdutoExit(Sender);

end;

procedure TFImplantacaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'INSIDE' then
   Begin
     LblPrecoVarejo.Visible  := False;
     LblPrecoAtacado.Visible := False;
     MEPrecoVarejo.Visible  := False;
     MEPrecoAtacado.Visible := False;
   End;
  if DMParamSistema.CodEmpresa = 'GOLDEN' then
   Begin
     LblComissao.Visible := True;
     MeCustoComissao.Visible := True;
   End;

  if (DMParamSistema.CodEmpresa = 'BORGES') or (DMParamSistema.CodEmpresa = 'BORGES2') then
   Begin
     LblPromocao.Left := LblComissao.Left;
     MePrecoPromocao.Left := MeCustoComissao.Left;
     LblPromocao.Visible := True;
     MePrecoPromocao.Visible := True;
   End;

   if (DMParamSistema.CodEmpresa <> 'FINESTRA') then
   begin
    MEPorcentagem.Visible := false;
    Label49.Visible := false;
   end;
end;

procedure TFImplantacaoCad.EdCodBarraChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCodBarra.Text) <> '' then
     ECodProduto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','DESC_COD_BARRA = '+CHR(39)+ trim(EdCodBarra.Text)+CHR(39))
  else
     ECodProduto.Text := '';
end;

procedure TFImplantacaoCad.MECodBarraExit(Sender: TObject);
begin
  inherited;
  If (Trim(MECodBarra.Text) <> '') then
  begin
    MECodProduto.Text:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','DESC_COD_BARRA = '+chr(39)+trim(MECodBarra.text)+chr(39));
    If (Trim(MECodProduto.Text) <> '') then
    Begin
      MEQuantidade.Text :=DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text);
      MECustoMEdio.Text:=DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+MECodProduto.Text);
      if Trim(MECustoMedio.Text) <> '' then
        MECustoMedio.Text  :=FormatFloat('#,##0.00',StrToFloat(MECustoMedio.Text));
    End
    else
    Begin
      MessageDlg('O código de barras informado não corresponde a nenhum produto cadastrado', mtInformation, [mbOK], 0);
      MEQuantidade.Text := '';
      MECustoMEdio.Text:= '';
      MeCustoComissao.Text := '';
    End;
  end;
end;

procedure TFImplantacaoCad.LevantamentoEstoqueporFilial1Click(
  Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[16].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.Fm16Filial.MeFilial.Text),'ESTOQUE');
    with DMProdutoRelatorio do
    begin
      QREstoqueLevantamentoFilial.Close;
      if Trim(FEstoqueParam.Fm16Filial.MeFilial.Text) <> '' then
        QREstoqueLevantamentoFilial.SetVariable('COD_FILIAL',Trim(FEstoqueParam.Fm16Filial.MeFilial.Text))
      else
        QREstoqueLevantamentoFilial.SetVariable('COD_FILIAL', Null);
      If Trim(FEstoqueParam.Me16Fornecedor.Text) <> '' Then
        QREstoqueLevantamentoFilial.SetVariable('COD_CADASTRO',StrToInt(Trim(FEstoqueParam.Me16Fornecedor.Text)))
      Else
        QREstoqueLevantamentoFilial.SetVariable('COD_CADASTRO',Null);
      If Trim(FEstoqueParam.Me16Classe.Text) <> '' Then
        QREstoqueLevantamentoFilial.SetVariable('NUM_CLASSE',StrToInt(Trim(FEstoqueParam.Me16Classe.Text)))
      Else
        QREstoqueLevantamentoFilial.SetVariable('NUM_CLASSE',Null);
      If Trim(FEstoqueParam.Me16SubClasse.Text) <> '' Then
        QREstoqueLevantamentoFilial.SetVariable('SUBCLASSE',StrToInt(Trim(FEstoqueParam.Me16SubClasse.Text)))
      Else
        QREstoqueLevantamentoFilial.SetVariable('SUBCLASSE',Null);
      If Trim(FEstoqueParam.Fm16Marca.MeMarca.Text) <> '' Then
        QREstoqueLevantamentoFilial.SetVariable('COD_MARCA', Trim(FEstoqueParam.Fm16Marca.MeMarca.Text))
      Else
        QREstoqueLevantamentoFilial.SetVariable('COD_MARCA', Null);
      If FEstoqueParam.Cb16TipoProduto.ItemIndex <= 0 Then
        QREstoqueLevantamentoFilial.SetVariable('IND_TIPO_PRODUTO',Null)
      Else
        QREstoqueLevantamentoFilial.SetVariable('IND_TIPO_PRODUTO',Trim(FEstoqueParam.Cb16TipoProduto.Text));
      If FEstoqueParam.Cb16Situacao.ItemIndex <= 0 Then
        QREstoqueLevantamentoFilial.SetVariable('IND_SITUACAO',Null)
      Else
        QREstoqueLevantamentoFilial.SetVariable('IND_SITUACAO',Trim(FEstoqueParam.Cb16Situacao.Text));
      if (FEstoqueParam.me16Localizacao.Text) <> '' then
        QREstoqueLevantamentoFilial.SetVariable('DESC_LOCALIZACAO', '%'+Trim(FEstoqueParam.Me16Localizacao.Text)+'%')
      else
        QREstoqueLevantamentoFilial.SetVariable('DESC_LOCALIZACAO',Null);
      If FEstoqueParam.RG16EstoqueZero.ItemIndex = 0 Then
        QREstoqueLevantamentoFilial.SetVariable('ESTOQUE_ZERO','1=1')
      Else
        QREstoqueLevantamentoFilial.SetVariable('ESTOQUE_ZERO','TB_ESTOQUE.QT_QUANTIDADE > 0');

      QREstoqueLevantamentoFilial.SQL[QREstoqueLevantamentoFilial.SQL.Count-1]:=''; // Elimina a última linha da sql da Query.
      case FEstoqueParam.Cb16Ordem.ItemIndex of
        0: QREstoqueLevantamentoFilial.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO');
        1: QREstoqueLevantamentoFilial.SQL.Add('ORDER BY TB_PRODUTO.COD_PRODUTO');
        2: QREstoqueLevantamentoFilial.SQL.Add('ORDER BY TB_PRODUTO.DESC_CLASSE,TB_PRODUTO.DESC_PRODUTO');
        3: QREstoqueLevantamentoFilial.SQL.Add('ORDER BY TB_PRODUTO.NUM_FABRICANTE');
      End;
      QREstoqueLevantamentoFilial.Open;
     End; //with

    if FRestoqueLevantamentoFilial = Nil Then
      FRestoqueLevantamentoFilial := TFRestoqueLevantamentoFilial.Create(Application);
    If FEstoqueParam.RGPreview.ItemIndex = 0 then
      FRestoqueLevantamentoFilial.QRPrimario.Preview
    Else
      FRestoqueLevantamentoFilial.QRPrimario.Print;
  End;
end;

procedure TFImplantacaoCad.EstoqueAgrupadoLoteeFilial1Click(
  Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[17].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
  begin
    with DMEstoque do
    begin
      QREstoqueAgFilial.Close;
      if Trim(FEstoqueParam.FmFilial17.MeFilial.Text) <> '' then
       QREstoqueAgFilial.SetVariable('COD_FILIAL', FEstoqueParam.FmFilial17.MeFilial.Text)
      else
        QREstoqueAgFilial.SetVariable('COD_FILIAL', Null);
      if Trim(FEstoqueParam.FmProduto17.MeProduto.Text) <> '' then
        QREstoqueAgFilial.SetVariable('COD_PRODUTO', FEstoqueParam.FmProduto17.MeProduto.Text)
      else
        QREstoqueAgFilial.SetVariable('COD_PRODUTO', Null);

      if Trim(FEstoqueParam.FmSubClasse17.MeClasse.Text) <> '' Then
        QREstoqueAgFilial.SetVariable('NUM_CLASSE',Trim(FEstoqueParam.FmSubClasse17.MeClasse.Text))
      else
        QREstoqueAgFilial.SetVariable('NUM_CLASSE',Null);

      if Trim(FEstoqueParam.FmSubClasse17.MeSubClasse.Text) <> '' Then
        QREstoqueAgFilial.SetVariable('SUBCLASSE',Trim(FEstoqueParam.FmSubClasse17.MeSubClasse.Text))
      else
        QREstoqueAgFilial.SetVariable('SUBCLASSE',Null);

      If FEstoqueParam.Cb17Situacao.ItemIndex <= 0 Then
        QREstoqueAgFilial.SetVariable('IND_SITUACAO',Null)
      Else
        QREstoqueAgFilial.SetVariable('IND_SITUACAO',Trim(FEstoqueParam.Cb17Situacao.Text));

      QREstoqueAgFilial.SQL[QREstoqueAgFilial.SQL.Count-1]:=''; // Elimina a última linha da sql da Query.
      case FEstoqueParam.RGOrdem17.ItemIndex of
        0: QREstoqueAgFilial.SQL.Add('ORDER BY TB_ESTOQUE.COD_PRODUTO');
        1: QREstoqueAgFilial.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO');
      End;
      QREstoqueAgFilial.Open;
    end;

    if FREstoqueAgrupado = nil then
      FREstoqueAgrupado := TFREstoqueAgrupado.Create(Application);
    If FEstoqueParam.RGPreview.ItemIndex = 0 then
      FREstoqueAgrupado.QRPrimario.Preview
    Else
      FREstoqueAgrupado.QRPrimario.Print;
  end;

end;

procedure TFImplantacaoCad.ContagemEstoqueCdBarra1Click(Sender: TObject);
var pModulo : string;
begin
  inherited;
  pModulo := 'ESTOQUE';
    if FContagemEstoqueCodBarra = nil then
    FContagemEstoqueCodBarra := TFContagemEstoqueCodBarra.Create(Application);
  DMTela.VerificaTela(pModulo, FContagemEstoqueCodBarra.Caption, FContagemEstoqueCodBarra.Name);
  FContagemEstoqueCodBarra.ShowModal;
end;

procedure TFImplantacaoCad.TSLancaEstoqueEnter(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'PIXIXE' Then
  Begin
    MENumFabricante.TabStop := False;
    MELocalizacao.TabStop := False;
    MeMotivo.TabStop := False;
    MeEstoqueMinimo.TabStop := False;
    MeEstoqueMaximo.TabStop := False;
    MECodBarra.TabStop := False;
    MePrecoAtacado.TabStop := False;
    MePrecoVarejo.TabStop := False;
    MeCustoComissao.TabStop := False;
  end;
end;

procedure TFImplantacaoCad.MECodProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12 - Junior 10/04/2017. Solicitado por Gustavo (Agroferragens JG).
    BitBtn4.Click;
end;

procedure TFImplantacaoCad.MECodFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(MECodFilial.Text);
end;

procedure TFImplantacaoCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit3.Text);
end;

procedure TFImplantacaoCad.ECodFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(ECodFilial.Text);
end;

procedure TFImplantacaoCad.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(ME2CodFilial.Text);
end;

procedure TFImplantacaoCad.ME3CodFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(ME3CodFilial.Text);
end;

procedure TFImplantacaoCad.MEPorcentagemExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FINESTRA') then
    MePrecoVarejo.Text := formatfloat('#,##00.00', strtofloat(MECustoMedio.Text) +(strtofloat(MECustoMedio.Text) * strtofloat(MEPorcentagem.Text) ) / 100);
end;

procedure TFImplantacaoCad.MePrecoVarejoExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FINESTRA') then
    MePorcentagem.Text := formatfloat('#,##00.00', (strtofloat(MePrecoVarejo.Text) * 100) / (strtofloat(MECustoMedio.Text))  - 100 );
end;

end.

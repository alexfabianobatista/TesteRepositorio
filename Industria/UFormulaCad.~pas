unit UFormulaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  DBPanel;

type
  TFFormulaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsLote: TBitBtn;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    BtConsProdutoIt: TBitBtn;
    BtConsLoteIt: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBGrid1: TDBGrid;
    Relacao: TMenuItem;
    Label5: TLabel;
    DBEdit14: TDBEdit;
    Label11: TLabel;
    DBEdit15: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    RelaoCustodeFrmulas1: TMenuItem;
    Label12: TLabel;
    DBEdit16: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit17: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    Label13: TLabel;
    DBEdit18: TDBEdit;
    TabSheet3: TTabSheet;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBGrid2: TDBGrid;
    OracleNavigator2: TOracleNavigator;
    DBRadioGroup2: TDBRadioGroup;
    PosioEstoqueProduo1: TMenuItem;
    Opes1: TMenuItem;
    ConsultarOrdemProduo1: TMenuItem;
    FrmulacPedidoAberto1: TMenuItem;
    RelaoFrmulas1: TMenuItem;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    OracleNavigator3: TOracleNavigator;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBMemo1: TDBMemo;
    Label21: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    DBGrid3: TDBGrid;
    DBPanel6: TDBPanel;
    Label22: TLabel;
    DBMemo2: TDBMemo;
    RelaoFrmulaporMatPrima1: TMenuItem;
    DBComboBox1: TDBComboBox;
    Label23: TLabel;
    EdNumFabricante: TEdit;
    Label24: TLabel;
    procedure BtConsLoteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsProdutoItClick(Sender: TObject);
    procedure BtConsLoteItClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure RelacaoClick(Sender: TObject);
    procedure RelaoCustodeFrmulas1Click(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure PosioEstoqueProduo1Click(Sender: TObject);
    procedure ConsultarOrdemProduo1Click(Sender: TObject);
    procedure FrmulacPedidoAberto1Click(Sender: TObject);
    procedure RelaoFrmulas1Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure RelaoFrmulaporMatPrima1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure SBIncluirClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure EdNumFabricanteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormulaCad: TFFormulaCad;

implementation

uses UFormula_cl, UProdutoCons, UProduto_cl, UTipoLoteCons, UTipoLote_cl,
  UOracle_cl, UFormulaCons, UFormulaParam, URFormula_Relacao,
  URFormula_Custo, UFilialCons, UFilial_cl, URPosicaoEstoqueProducao,
  UOrdemProducao_cl, UConfirmaOrdemProducao, UUsuario_cl, UOrdemProducaoCad,
  UParamSistema_cl, URFormula_PedidoAberto, URRelacaoFormulas, URFormulaMatPrima,
  UFmFilial, DateUtils;

{$R *.DFM}

procedure TFFormulaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    DMFormula.QFormulaCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
end;

procedure TFFormulaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMFormula do
  Begin
    QFormula.Open;
    QFormulaItem.Open;
    QFormulaCusto.open;
    QFormulaInsumo.Open;
    QSomaItemFormula.Open;
  End;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    MELocaliza.SetFocus;
end;

procedure TFFormulaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMFormula.QFormulaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  DMOracle.DBCemapa.Commit;
end;

procedure TFFormulaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  With DMFormula do
  Begin
    QFormula.Close;
    QFormula.SetVariable('PK',QFormulaConsCod_Formula.Value);
    QFormula.Open;
  End;
end;

procedure TFFormulaCad.BtConsProdutoItClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMFormula.QFormulaItem.Edit;
    DMFormula.QFormulaItemCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
    DBEdit9Exit(Self);
  End;
end;

procedure TFFormulaCad.BtConsLoteItClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    DMFormula.QFormulaItem.Edit;
    DMFormula.QFormulaItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  End;  
end;

procedure TFFormulaCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  if SBExcluir.Visible then
  begin
    if MessageDlg('Apagar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DMFormula.ExcluiFormula;
      SBRefreshClick(self);
    end;
  end;
end;

procedure TFFormulaCad.RelacaoClick(Sender: TObject);
var
 wSituacao: string;
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[1].TabVisible := True;
  If FFormulaParam.ShowModal = mrOk then
  With DMFormula do
  Begin
    QRFormula.Close;
    If Trim(FFormulaParam.ME1Formula.Text) = '' Then
      QRFormula.SetVariable('FORMULA',Null)
    Else
      QRFormula.SetVariable('FORMULA',FFormulaParam.ME1Formula.Text);

    If FFormulaParam.CbSituacao1.ItemIndex = 0 then
    begin
      QRFormula.SetVariable('IND_SITUACAO','ATIVA');
      wSituacao := 'ATIVAS';
    end;
    If FFormulaParam.CbSituacao1.ItemIndex = 1 then
    begin
      QRFormula.SetVariable('IND_SITUACAO','DESATIVADA');
      wSituacao := 'DESATIVADAS';
    end;
    If FFormulaParam.CbSituacao1.ItemIndex = 2 then
    begin
      QRFormula.SetVariable('IND_SITUACAO', null);
      wSituacao := 'TODAS';
    end;

    QRFormula.Open;
    If FRFormula_Relacao = Nil then
      FRFormula_Relacao := TFRFormula_Relacao.Create(Application);
    FRFormula_Relacao.QRLTitulo.Caption := 'Relação de Fórmulas: ' + wSituacao;
    if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
      FRFormula_Relacao.QRDBText6.DataField := 'NUM_FABRICANTE';
    If FFormulaParam.RGPreview.ItemIndex = 0 then
      FRFormula_Relacao.QRPrimario.Preview
    Else
      FRFormula_Relacao.QRPrimario.Print;
    QRFormula.Close;
  End;
end;

procedure TFFormulaCad.RelaoCustodeFrmulas1Click(Sender: TObject);
Var wTotal : Real;
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FFormulaParam.ShowModal = mrOk then
  With DMFormula do
  Begin
  if trim(FFormulaParam.ME2Formula.Text) = '' then
    raise Exception.Create('Informe uma fórmula.');
    QRFormula_Custo.Close;
    If Trim(FFormulaParam.ME2Formula.Text) = '' Then
      QRFormula_Custo.SetVariable('FORMULA',Null)
    Else
      QRFormula_Custo.SetVariable('FORMULA',FFormulaParam.ME2Formula.Text);
    If Trim(FFormulaParam.ME2Filial.Text) = '' Then
      QRFormula_Custo.SetVariable('FILIAL',Null)
    Else
      QRFormula_Custo.SetVariable('FILIAL',FFormulaParam.ME2Filial.Text);
    If Trim(FFormulaParam.Me2LoteTipo.Text) = '' Then
      QRFormula_Custo.SetVariable('COD_LOTE_TIPO',Null)
    Else
      QRFormula_Custo.SetVariable('COD_LOTE_TIPO',FFormulaParam.Me2LoteTipo.Text);
    QRFormula_Custo.Open;
    wTotal := 0;
    While Not QRFormula_Custo.Eof Do
     Begin
       wTotal := wTotal + QRFormula_CustoQT_ITEM.Value * QRFormula_CustoVL_CUSTO_MEDIO.Value;
       QRFormula_Custo.Next;
     End;
    QRFormula_Custo.First;
    If FRFormula_Custo = Nil then
      FRFormula_Custo := TFRFormula_Custo.Create(Application);
    FRFormula_Custo.wTotal := wTotal;
    FRFormula_Custo.wTotal_Inicial := wTotal;
    if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
      FRFormula_Custo.QRDBText3.DataField := 'NUM_FABRICANTE';
    If FFormulaParam.RGPreview.ItemIndex = 0 then
      FRFormula_Custo.QRPrimario.Preview
    Else
      FRFormula_Custo.QRPrimario.Print;
    QRFormula_Custo.Close;
  End;

end;

procedure TFFormulaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMFormula do
  Begin
    QFormulaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  End;
end;

procedure TFFormulaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(8);
end;

procedure TFFormulaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
   Begin
     DMFormula.QFormulaCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
     DBEdit2Exit(Self);
   End;  
end;

procedure TFFormulaCad.PosioEstoqueProduo1Click(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') Then
  Begin
    If FFormulaParam = Nil then
      FFormulaParam := TFFormulaParam.Create(Application);
    FFormulaParam.PGRelatorio.Pages[3].TabVisible := True;
    If FFormulaParam.ShowModal = mrOk then
    With DMOrdemProducao do
    Begin
      QREstoque_Producao.close;
      IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
        QREstoque_Producao.SetVariable('COD_LOTE',310);
      IF Trim(FFormulaParam.FMClasse1.MEClasse.Text) = '' then
        QREstoque_Producao.SetVariable('CLASSE', NULL)
      else
        QREstoque_Producao.SetVariable('CLASSE',FFormulaParam.FMClasse1.MEClasse.Text);
      QREstoque_Producao.Open;
      If FRPosicaoEstoqueProducao = Nil then
        FRPosicaoEstoqueProducao := TFRPosicaoEstoqueProducao.Create(Application);
        FRPosicaoEstoqueProducao.QRPrimario.Preview;
      If FConfirmaOrdemProducao = Nil then
        FConfirmaOrdemProducao := TFConfirmaOrdemProducao.Create(Application);
        FConfirmaOrdemProducao.showmodal;
    end;
  end;
end;

procedure TFFormulaCad.ConsultarOrdemProduo1Click(Sender: TObject);
begin
  inherited;
  If ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') OR
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUNASA')) then
  Begin
    If FOrdemProducaoCad = Nil then
      FOrdemProducaoCad := TFOrdemProducaoCad.Create(Application);
      FOrdemProducaoCad.showmodal;  
  end;
end;

procedure TFFormulaCad.FrmulacPedidoAberto1Click(Sender: TObject);
begin
  inherited; //marcos 22/06/06
  If ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') OR
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUNASA')) then
  Begin
    If FFormulaParam = Nil then
      FFormulaParam := TFFormulaParam.Create(Application);
    FFormulaParam.PGRelatorio.Pages[3].TabVisible := True;
    If FFormulaParam.ShowModal = mrOk then
    With DMOrdemProducao do
    Begin
      QRFormula_Pedido.close;

      if (FFormulaParam.ME3DtInicial.Text = '') or (FFormulaParam.ME3DtFinal.Text = '') then
        Raise Exception.Create('Informe o Período');
      QRFormula_Pedido.SetVariable('DT_INICIAL',FFormulaParam.ME3DtInicial.Text);
      QRFormula_Pedido.SetVariable('DT_FINAL',FFormulaParam.ME3DtFinal.Text);

      IF Trim(FFormulaParam.FmClasse1.MeClasse.Text) = '' then
        QRFormula_Pedido.SetVariable('CLASSE', NULL)
      else
        QRFormula_Pedido.SetVariable('CLASSE',FFormulaParam.FmClasse1.MeClasse.Text);

      QRFormula_Pedido.Open;
      If FRFormula_PedidoAberto = Nil then
        FRFormula_PedidoAberto := TFRFormula_PedidoAberto.Create(Application);
        FRFormula_PedidoAberto.QRLPeriodo.Caption := 'Período: '+ FFormulaParam.ME3DtInicial.Text+ ' até ' + FFormulaParam.ME3DtFinal.Text;
      FRFormula_PedidoAberto.QRPrimario.Preview;
      If FConfirmaOrdemProducao = Nil then
        FConfirmaOrdemProducao := TFConfirmaOrdemProducao.Create(Application);
        FConfirmaOrdemProducao.showmodal;
    end;
  end;

end;

procedure TFFormulaCad.RelaoFrmulas1Click(Sender: TObject);
var
 wSituacao: string;
begin
  inherited;
  With DMformula do
  Begin
    If FFormulaParam = Nil then
      FFormulaParam := TFFormulaParam.Create(Application);
    FFormulaParam.PGRelatorio.Pages[5].TabVisible := True;
    If FFormulaParam.ShowModal = mrOk then  
    QRRelacaoformula.close;
    if Trim(FFormulaParam.fmfilial5.MeFilial.Text) = '' then
      //raise Exception.Create('Obrigatório informar a Filial')
      QRRelacaoFormula.SetVariable('COD_FILIAL',Null)
    else
      QRRelacaoFormula.SetVariable('COD_FILIAL',FFormulaParam.fmfilial5.MeFilial.Text);

    If Trim(FFormulaParam.FMProduto5.MEProduto.Text) = '' Then
      QRRelacaoFormula.SetVariable('PRODUTO',Null)
    Else
      QRRelacaoFormula.SetVariable('PRODUTO',FFormulaParam.FMProduto5.MEProduto.Text);

    If FFormulaParam.CbSituacao5.ItemIndex = 0 then
    begin
      QRRelacaoFormula.SetVariable('IND_SITUACAO','ATIVA');
      wSituacao := 'ATIVAS';
    end;
    If FFormulaParam.CbSituacao5.ItemIndex = 1 then
    begin
      QRRelacaoFormula.SetVariable('IND_SITUACAO','DESATIVADA');
      wSituacao := 'DESATIVADAS';
    end;
    If FFormulaParam.CbSituacao5.ItemIndex = 2 then
    begin
      QRRelacaoFormula.SetVariable('IND_SITUACAO', null);
      wSituacao := 'TODAS';
    end;

    QRRelacaoformula.Open;
    If FRRelacaoFormulas = Nil then
      FRRelacaoFormulas := TFRRelacaoFormulas.Create(Application);
    FRRelacaoFormulas.QRLTitulo.Caption := 'Relação de Fórmulas: ' + wSituacao;
    if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
      FRRelacaoFormulas.QRDBText4.DataField := 'NUM_FABRICANTE';
    FRRelacaoFormulas.QRPrimario.Preview;
  end;
end;

procedure TFFormulaCad.DBMemo1KeyPress(Sender: TObject; var Key: Char);
var
  caracter : string; // variável q vai receber a letra em maiúsculo
begin
  caracter := UpperCase(key); // passa a letra para maiúsculo
  key := caracter[1]; // passa a letra pra ser escrita no memo
end;

procedure TFFormulaCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  if DMParamSistema.CodEmpresa = 'PERTUTTI' then
  Begin
    TabSheet3.TabVisible := False;
    TabSheet4.TabVisible := False;
  end;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    DBEdit3.Text := '1';
end;

procedure TFFormulaCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFFormulaCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

procedure TFFormulaCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  If Trim(DMFormula.QFormulaCod_Produto.Text) <> '' Then
   Begin
     DMProduto.QProduto.close;
     DMProduto.QProduto.SetVariable('Pk',DMFormula.QFormulaCod_Produto.Value);
     DMProduto.QProduto.Open;
     If DMProduto.QProduto.Eof Then
      Begin
        DBEdit2.SetFocus;
        Raise Exception.Create('Produto não cadastrado');
      End;
     If DMProduto.QProdutoIND_SITUACAO.Value <> 'ATIVO' Then
      Begin
        DBEdit2.SetFocus;
        Raise Exception.Create('Produto não esta ativo');
      End;
   End;
end;

procedure TFFormulaCad.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  If Trim(DMFormula.QFormulaItemCod_Produto.Text) <> '' Then
   Begin
     DMProduto.QProduto.close;
     DMProduto.QProduto.SetVariable('Pk',DMFormula.QFormulaItemCod_Produto.Value);
     DMProduto.QProduto.Open;
     If DMProduto.QProduto.Eof Then
      Begin
        DBEdit9.SetFocus;
        Raise Exception.Create('Produto não cadastrado');
      End;
     If DMProduto.QProdutoIND_SITUACAO.Value <> 'ATIVO' Then
      Begin
        DBEdit9.SetFocus;
        Raise Exception.Create('Produto não esta ativo');
      End;
   End;

end;

procedure TFFormulaCad.BtCopiaClick(Sender: TObject);
var j: integer;
begin
 // Faz uma cópia dos dados do dataset para o clientdataset os dois devem ter exatamente os mesmos campos caso contrário dará erro
  with DMFormula do
  begin
    CdsDuplicaFormula.EmptyDataSet;
    while not QFormulaItem.Eof do
    begin
      CdsDuplicaFormula.Insert;
      for j := 0 to QFormulaItem.Fields.Count - 1 do
      begin
        if CdsDuplicaFormula.FieldByName(QFormulaItem.Fields[j].FieldName).ReadOnly then
        begin
          CdsDuplicaFormula.FieldByName(QFormulaItem.Fields[j].FieldName).ReadOnly := false;
          CdsDuplicaFormula.FieldByName(QFormulaItem.Fields[j].FieldName).Value := QFormulaItem.Fields[j].Value;
          CdsDuplicaFormula.FieldByName(QFormulaItem.Fields[j].FieldName).ReadOnly := true;
        end
        else
        begin
          CdsDuplicaFormula.FieldByName(QFormulaItem.Fields[j].FieldName).Value := QFormulaItem.Fields[j].Value;
        end;
      end;
      CdsDuplicaFormula.Post;
      QFormulaItem.Next;
    end;

    inherited;
    CdsDuplicaFormula.First;
    while not CdsDuplicaFormula.Eof do
    begin
       QFormulaItem.Insert;
       QFormulaItemCOD_PRODUTO.Value := CdsDuplicaFormulacod_produto.Value;
       QFormulaItemCOD_LOTE_TIPO.Value := CdsDuplicaFormulacod_lote_tipo.Value;
       QFormulaItemQT_ITEM.Value := CdsDuplicaFormulaqt_item.Value;
       QFormulaItemIND_REAPROVEITAMENTO.Value := CdsDuplicaFormulaind_reaproveitamento.Value;
       QFormulaItemnome_produto.Value := CdsDuplicaFormulanome_produto.Value;
       QFormulaItemnome_lote.Value := CdsDuplicaFormulanome_lote.Value;
       QFormulaItemIND_BAIXA_ESTOQUE.Value := CdsDuplicaFormulaind_baixa_estoque.Value;
       QFormulaItem.Post;
       CdsDuplicaFormula.Next;
    end;
  end;
end;

procedure TFFormulaCad.RelaoFrmulaporMatPrima1Click(Sender: TObject);
begin
  inherited;
  With DMformula do
  Begin
    If FFormulaParam = Nil then
      FFormulaParam := TFFormulaParam.Create(Application);
    FFormulaParam.PGRelatorio.Pages[6].TabVisible := True;
    If FFormulaParam.ShowModal = mrOk then
    begin
      QRProdAcaboMatPrima.close;
      if Trim(FFormulaParam.fmfilial6.MeFilial.Text) = '' then
        QRProdAcaboMatPrima.SetVariable('COD_FILIAL',Null)
      else
        QRProdAcaboMatPrima.SetVariable('COD_FILIAL',FFormulaParam.fmfilial6.MeFilial.Text);

      If Trim(FFormulaParam.FMProduto6.MEProduto.Text) <> '' Then
        QRProdAcaboMatPrima.SetVariable('COD_PRODUTO',FFormulaParam.FMProduto6.MEProduto.Text)
      else
        raise Exception.Create('Necessário informar o produto da matéria prima.');

      QRProdAcaboMatPrima.Open;
      If FRFormulaMatPrima = Nil then
        FRFormulaMatPrima := TFRFormulaMatPrima.Create(Application);
      FRFormulaMatPrima.QRLFilial.Caption := 'Filial: ' + FFormulaParam.FmFilial6.EdFilial.Text;
      FRFormulaMatPrima.QRPrimario.Preview;
    end;
  end;

end;

procedure TFFormulaCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
    DBEdit10.Text := '1';
end;

procedure TFFormulaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    DBEdit3.Text := '1';
end;

procedure TFFormulaCad.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    EdNumFabricante.SetFocus;
end;

procedure TFFormulaCad.EdNumFabricanteExit(Sender: TObject);
var
  wNumFabricante: String;
begin
  inherited;
  if trim(EdNumFabricante.Text) <> '' then
  begin
    with DMProduto do
    begin
      wNumFabricante := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','NUM_FABRICANTE = ' + QuotedStr(Trim(EdNumFabricante.Text)) );
      if wNumFabricante <> '' then
      begin
        QProduto.Close;
        QProduto.SetVariable('Pk',wNumFabricante);
        QProduto.Open;
        if QProdutoIND_SITUACAO.Value = 'ATIVO' then
        begin
          DBEdit9.Text := QProdutoCOD_PRODUTO.Text;
          DBEdit7.Text := QProdutoDESC_PRODUTO.Text;
        end
        else
          Raise Exception.Create('O produto código: ' + QProdutoConsCOD_PRODUTO.Text + '; Código de fabricante: ' + QProdutoNUM_FABRICANTE.Value
                                  + ' - Não esta ativo. Favor verificar!');
      end
      else
      begin
        EdNumFabricante.SetFocus;
        Raise Exception.Create('Produto não cadastrado');
      end;
    end;
  end;
end;

end.

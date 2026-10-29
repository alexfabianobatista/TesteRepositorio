unit UBoletimCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, ActnList, DBDirceu,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  DBPanel;

type
  TFBoletimCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsFilial: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ProjeodeGastos1: TMenuItem;
    GastosdeMatPrima1: TMenuItem;
    Producao1: TMenuItem;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Relao1: TMenuItem;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    BtDepartamentoCons: TBitBtn;
    DBDirceu1: TDBDirceu;
    Custodetalhado1: TMenuItem;
    GroupBox1: TGroupBox;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    Label12: TLabel;
    RelatrioCompoisiodeEstoque1: TMenuItem;
    ProjeodeCompra1: TMenuItem;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ProjeodeGastos1Click(Sender: TObject);
    procedure GastosdeMatPrima1Click(Sender: TObject);
    procedure Producao1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure Relao1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtDepartamentoConsClick(Sender: TObject);
    procedure Custodetalhado1Click(Sender: TObject);
    procedure RelatrioCompoisiodeEstoque1Click(Sender: TObject);
    procedure ProjeodeCompra1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBoletimCad: TFBoletimCad;

implementation

uses UBoletim_cl, UFormulaCons, UFormula_cl, UTurno_cl, UFilialCons,
  UFilial_cl, UBoletimCons, UFormulaParam, URFormula_Projecao,
  UBoletimParam, URBoletim_ConsMatPrima, URBoletim_ConsMatPrima2,
  URBoletim_Producao2, URBoletim_Producao, UOracle_cl, URBoletim_Relacao,
  UDepartamentoCons, UDepartamento_cl, URBoletimCusto, URFormulaProjecaoCompras,
  UrComposicaoEstoque, UFmDatas, UFmDepartamento, UFmSubClasse, UBiblioteca, UUsuario_cl;

{$R *.DFM}

procedure TFBoletimCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
 { With DMBoletim do
    QBoletimCod_Formula.Value := DMFormula.QFormulaConsCod_Formula.Value;}
  With DMBoletim,DMFormula do
  begin
    if QFormulaConsIND_SITUACAO.Value = 'DESATIVADA' then
      Raise Exception.Create('Fórmula está desativada. Operação não permitida!');
    QBoletimCod_Formula.Value := QFormulaConsCod_Formula.Value;
    DBEdit7.Text := QFormulaConsCod_Formula.Text;
    DBEdit7Exit(Sender);
  end;
end;

procedure TFBoletimCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMBoletim do
  Begin
    QBoletim.Open;
    QBoletimItem.Open;
  End;
  DMTurno.QTurnoAll.Open;
end;

procedure TFBoletimCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMBoletim do
    QBoletimCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFBoletimCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBoletimCons = Nil then
    FBoletimCons := TFBoletimCons.Create(Application);
  If FBoletimCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QBoletim.Close;
    QBoletim.SetVariable('PK',QBoletimConsCod_Boletim.Value);
    QBoletim.Open;
  End;
end;

procedure TFBoletimCad.ProjeodeGastos1Click(Sender: TObject);
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FFormulaParam.ShowModal = mrOk then
  with DMFormula do
  begin
    QRProjecao.Close;
    QRProjecao.SetVariable('PROJECAO',FFormulaParam.ME0Projecao.Text);
    if Trim(FFormulaParam.ME0Filial.Text) = '' then
      raise Exception.Create('Filial não informada');
    QRProjecao.SetVariable('FILIAL',FFormulaParam.ME0Filial.Text);
    if Trim(FFormulaParam.ME0Formula.Text) = '' then
      QRProjecao.SetVariable('FORMULA',Null)
    else
      QRProjecao.SetVariable('FORMULA',FFormulaParam.ME0Formula.Text);
    {Classe/SubClasse}
    if Trim(FFormulaParam.Fm0SubClasse.MeClasse.Text) = '' then
      QRProjecao.SetVariable('NUM_CLASSE', Null)
    else
      QRProjecao.SetVariable('NUM_CLASSE', FFormulaParam.Fm0SubClasse.MeClasse.Text);
    if (Trim(FFormulaParam.Fm0SubClasse.MeSubClasse.Text) = '') or
        (Trim(FFormulaParam.Fm0SubClasse.MeSubClasse.Text) = '0') then
      QRProjecao.SetVariable('SUBCLASSE', Null)
    else
      QRProjecao.SetVariable('SUBCLASSE', FFormulaParam.Fm0SubClasse.MeSubClasse.Text);

    QRProjecao.Open;

    if FRFormula_Projecao = Nil then
      FRFormula_Projecao := TFRFormula_Projecao.Create(Application);

    if FFormulaParam.RGTipoRelatorio.ItemIndex = 0 then
      FRFormula_Projecao.QRBand3.Enabled := True
    else
      FRFormula_Projecao.QRBand3.Enabled := False;
    if Trim(FFormulaParam.ME0Filial.Text) = '' then
      FRFormula_Projecao.QRLEmpresa.Caption := 'Todas'
    else
      FRFormula_Projecao.QRLEmpresa.Caption := FFormulaParam.Ed0Filial.Text;
    FRFormula_Projecao.QRLProjecao.Caption := 'Qt. Projetada: '+FormatFloat('###,###,##0.00',StrTofloat(FFormulaParam.ME0Projecao.Text));
    FRFormula_Projecao.QRLFilial.Caption :=
      'Filial ' + Trim(FFormulaParam.ME0Filial.Text);

    if FFormulaParam.RGPreview.ItemIndex = 0 then
      FRFormula_Projecao.QRPrimario.Preview
    Else
      FRFormula_Projecao.QRPrimario.Print;
    QRProjecao.Close;
  End;
end;

procedure TFBoletimCad.GastosdeMatPrima1Click(Sender: TObject);
var
 wMateriaPrima: string;
begin
  inherited;
  wMateriaPrima := '';
  If FBoletimParam = Nil then
    FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[0].TabVisible := True;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRConsMatPrima.Close;
    QRConsMatPrima.SetVariable('FILIAL',FBoletimParam.ME0Filial.Text);
    QRConsMatPrima.SetVariable('DATA_I',StrToDate(FBoletimParam.ME0DataI.Text));
    QRConsMatPrima.SetVariable('DATA_F',StrToDate(FBoletimParam.ME0DataF.Text));
    if Trim(FBoletimParam.FM0Departamento.MeDepartamento.Text) = '' then
       QRConsMatPrima.SetVariable('COD_DEPARTAMENTO',Null)
    else
       QRConsMatPrima.SetVariable('COD_DEPARTAMENTO',FBoletimParam.FM0Departamento.MeDepartamento.Text);
//Adicionado os filtros de produto e lote. Junior 02/02/2016. Solicitado pelo César.
    if Trim(FBoletimParam.Fm0Produto.MeProduto.Text) <> '' Then
      QRConsMatPrima.SetVariable('COD_PRODUTO',FBoletimParam.Fm0Produto.MeProduto.Text)
    else
      QRConsMatPrima.SetVariable('COD_PRODUTO', null);
    if Trim(FBoletimParam.Fm0Lote.MeLote.Text) <> '' Then
      QRConsMatPrima.SetVariable('COD_LOTE_TIPO', trim(FBoletimParam.Fm0Lote.MeLote.Text))
    else
      QRConsMatPrima.SetVariable('COD_LOTE_TIPO', null);
    if FBoletimParam.cbMatPrima.Checked = True then
      QRConsMatPrima.SetVariable('TIPO_PRODUTO', 'MAT. PRIMA')
    else
      QRConsMatPrima.SetVariable('TIPO_PRODUTO', null);

    if Trim(FBoletimParam.Fm0SubClasseInicial.MeClasse.Text) <> '' Then
      QRConsMatPrima.SetVariable('NUM_CLASSE', FBoletimParam.Fm0SubClasseInicial.MeClasse.Text)
    else
      QRConsMatPrima.SetVariable('NUM_CLASSE', Null);
    if Trim(FBoletimParam.Fm0SubClasseInicial.MeSubClasse.Text) <> '' Then
      QRConsMatPrima.SetVariable('NUM_SUBCLASSE', FBoletimParam.Fm0SubClasseInicial.MeSubClasse.Text)
    else
      QRConsMatPrima.SetVariable('NUM_SUBCLASSE', Null);

    if Trim(FBoletimParam.Fm0SubClasseFinal.MeClasse.Text) <> '' Then
      QRConsMatPrima.SetVariable('NUM_CLASSE1', FBoletimParam.Fm0SubClasseFinal.MeClasse.Text)
    else
      QRConsMatPrima.SetVariable('NUM_CLASSE1', Null);
    if Trim(FBoletimParam.Fm0SubClasseFinal.MeSubClasse.Text) <> '' Then
      QRConsMatPrima.SetVariable('NUM_SUBCLASSE1', FBoletimParam.Fm0SubClasseFinal.MeSubClasse.Text)
    else
      QRConsMatPrima.SetVariable('NUM_SUBCLASSE1', Null);

    if FBoletimParam.cbBoletimItem.Checked = False then
      QRConsMatPrima.Open;
    QRConsMatPrima2.Close;
    QRConsMatPrima2.SetVariable('FILIAL',FBoletimParam.ME0Filial.Text);
    QRConsMatPrima2.SetVariable('DATA_I',StrToDate(FBoletimParam.ME0DataI.Text));
    QRConsMatPrima2.SetVariable('DATA_F',StrToDate(FBoletimParam.ME0DataF.Text));
    if Trim(FBoletimParam.FM0Departamento.MeDepartamento.Text) = '' then
       QRConsMatPrima2.SetVariable('COD_DEPARTAMENTO',Null)
    else
       QRConsMatPrima2.SetVariable('COD_DEPARTAMENTO',FBoletimParam.Fm0Departamento.MeDepartamento.Text);
//Adicionado para trazer os itens do boletim. Alex 30/01/2023
    if Trim(FBoletimParam.Fm0ProdutoBI.MeProduto.Text) <> ''  then
      QRConsMatPrima2.SetVariable('COD_PRODUTO_MAT_PRIMA', Trim(FBoletimParam.Fm0ProdutoBI.MeProduto.Text))
    else
      QRConsMatPrima2.SetVariable('COD_PRODUTO_MAT_PRIMA', null);
//Adicionado os filtros de produto e lote. Junior 02/02/2016. Solicitado pelo César.
   if Trim(FBoletimParam.Fm0Produto.MeProduto.Text) <> '' Then
     QRConsMatPrima2.SetVariable('COD_PRODUTO',FBoletimParam.Fm0Produto.MeProduto.Text)
   else
     QRConsMatPrima2.SetVariable('COD_PRODUTO', null);

    if Trim(FBoletimParam.Fm0Lote.MeLote.Text) <> '' Then
      QRConsMatPrima2.SetVariable('COD_LOTE_TIPO', FBoletimParam.Fm0Lote.MeLote.Text)
    else
      QRConsMatPrima2.SetVariable('COD_LOTE_TIPO', null);
    if FBoletimParam.cbMatPrima.Checked = True then
      QRConsMatPrima2.SetVariable('TIPO_PRODUTO', 'MAT. PRIMA')
    else
      QRConsMatPrima2.SetVariable('TIPO_PRODUTO', null);
//Adicionado para filtrar os itens do boletim por classe. Alex 16/03/2023. Solicitado por Kely - Deion
   if Trim(FBoletimParam.Fm0SubClasseInicial.MeClasse.Text) <> '' Then
      QRConsMatPrima2.SetVariable('NUM_CLASSE', FBoletimParam.Fm0SubClasseInicial.MeClasse.Text)
    else
      QRConsMatPrima2.SetVariable('NUM_CLASSE', Null);
    if Trim(FBoletimParam.Fm0SubClasseInicial.MeSubClasse.Text) <> '' Then
      QRConsMatPrima2.SetVariable('NUM_SUBCLASSE', FBoletimParam.Fm0SubClasseInicial.MeSubClasse.Text)
    else
      QRConsMatPrima2.SetVariable('NUM_SUBCLASSE', Null);

    if Trim(FBoletimParam.Fm0SubClasseFinal.MeClasse.Text) <> '' Then
      QRConsMatPrima2.SetVariable('NUM_CLASSE1', FBoletimParam.Fm0SubClasseFinal.MeClasse.Text)
    else
      QRConsMatPrima2.SetVariable('NUM_CLASSE1', Null);
    if Trim(FBoletimParam.Fm0SubClasseFinal.MeSubClasse.Text) <> '' Then
      QRConsMatPrima2.SetVariable('NUM_SUBCLASSE1', FBoletimParam.Fm0SubClasseFinal.MeSubClasse.Text)
    else
      QRConsMatPrima2.SetVariable('NUM_SUBCLASSE1', Null);


    QRConsMatPrima2.Open;

    if (FBoletimParam.cbMatPrima.State = cbChecked) then
      wMateriaPrima := ' Somente matéria prima.';

    If FRBoletim_ConsMatPrima = Nil then
      FRBoletim_ConsMatPrima := TFRBoletim_ConsMatPrima.Create(Application);
    //FRBoletim_ConsMatPrima.QRLEmpresa.Caption :=
    FRBoletim_ConsMatPrima.QRLTitulo.Caption := ' Gastos de Mat. Prima de '+FBoletimParam.ME0DataI.Text + ' até ' + FBoletimParam.ME0DataF.Text + wMateriaPrima
                                                + ' Dep.: ' + FBoletimParam.Fm0Departamento.EdDepartamento.Text + ' Produto: ' + FBoletimParam.Fm0Produto.EdProduto.Text
                                                + ' Lote: ' + FBoletimParam.Fm0Lote.EdLote.Text + ' Ordem: ' + FBoletimParam.Cb0Ordem.Text + ' Classe: ' +
                                                 FBoletimParam.Fm0SubClasseInicial.EdClasse.Text + 'SubClasse: ' + FBoletimParam.Fm0SubClasseInicial.EdClasse.Text;
    If FRBoletim_ConsMatPrima2 = Nil then
      FRBoletim_ConsMatPrima2 := TFRBoletim_ConsMatPrima2.Create(Application);
    FRBoletim_ConsMatPrima2.QRLTitulo.Caption := ' Gastos de Mat. Prima de '+FBoletimParam.ME0DataI.Text + ' até ' + FBoletimParam.ME0DataF.Text + wMateriaPrima
                                                + ' Dep.: ' + FBoletimParam.Fm0Departamento.EdDepartamento.Text + ' Produto: ' + FBoletimParam.Fm0Produto.EdProduto.Text
                                                + ' Lote: ' + FBoletimParam.Fm0Lote.EdLote.Text + ' Ordem: ' + FBoletimParam.Cb0Ordem.Text;

    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_ConsMatPrima.QRCompositeReport1.Preview
    Else
      FRBoletim_ConsMatPrima.QRCompositeReport1.Print;
    QRConsMatPrima.Close;
  End;
end;

procedure TFBoletimCad.Producao1Click(Sender: TObject);
begin
  inherited;
  If FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[1].TabVisible := True;
  FBoletimParam.Rg1TipoBoletim.Visible := False;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRProducao.Close;
    QRProducao2.Close;
    QRProducao.SetVariable('FILIAL',FBoletimParam.ME1Filial.Text);
    QRProducao.SetVariable('DATA_I',StrToDate(FBoletimParam.ME1DataI.Text));
    QRProducao.SetVariable('DATA_F',StrToDate(FBoletimParam.ME1DataF.Text));
    QRProducao.SetVariable('TIPO_BOLETIM',Null);
    If Trim(FBoletimParam.ME1Turno.Text) = '' Then
    Begin
      QRProducao.SetVariable('TURNO',Null);
      QRProducao2.SetVariable('TURNO',Null);
    end
    Else
    Begin
      QRProducao.SetVariable('TURNO',FBoletimParam.ME1Turno.Text);
      QRProducao2.SetVariable('TURNO',FBoletimParam.ME1Turno.Text);
    End;
    QRProducao.Open;
    QRProducao2.SetVariable('FILIAL',FBoletimParam.ME1Filial.Text);
    QRProducao2.SetVariable('DATA_I',StrToDate(FBoletimParam.ME1DataI.Text));
    QRProducao2.SetVariable('DATA_F',StrToDate(FBoletimParam.ME1DataF.Text));
    QRProducao2.SetVariable('TIPO_BOLETIM',Null);
    QRProducao2.Open;

    If FRBoletim_Producao = Nil then
       FRBoletim_Producao := TFRBoletim_Producao.Create(Application);
    FRBoletim_Producao.QRLTitulo.Caption := 'Rel. da Producao de '+FBoletimParam.ME1DataI.Text + ' até '+FBoletimParam.ME1DataF.Text;
    If FRBoletim_Producao2 = Nil then
       FRBoletim_Producao2 := TFRBoletim_Producao2.Create(Application);
    FRBoletim_Producao2.QRLTitulo.Caption := 'Rel. da Producao de  '+FBoletimParam.ME1DataF.Text + ' até '+FBoletimParam.ME1DataF.Text;

    If FBoletimParam.RGPreview.ItemIndex = 0 then
       FRBoletim_Producao.QRCompositeReport1.Preview
    Else
       FRBoletim_Producao.QRCompositeReport1.Print;
    QRProducao.Close;
    QRProducao2.Close;
  End;
  FBoletimParam.Rg1TipoBoletim.Visible := True;
end;

procedure TFBoletimCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  with DMBoletim do
  begin
    pGerando := True;
    QBoletim.Edit;
    QBoletimInd_Tipo_Boletim.Value := 'P';
    QBoletimCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
    QBoletim.Post;
    DMOracle.DBCemapa.Commit;
  end;
end;

Procedure TFBoletimCad.Relao1Click(Sender: TObject);
var wtitulo : String;
begin
  inherited;
  if FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[2].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRRelacao.Close;
    QRRelacao.SetVariable('DATA_I',StrToDate(FBoletimParam.ME2DataI.Text));
    QRRelacao.SetVariable('DATA_F',StrToDate(FBoletimParam.ME2DataF.Text));
    if Trim(FBoletimParam.ME2Filial.Text) = '' then
      QRRelacao.SetVariable('FILIAL',Null)
    else
      QRRelacao.SetVariable('FILIAL',FBoletimParam.ME2Filial.Text);
    if Trim(FBoletimParam.ME2Turno.Text) = '' then
       QRRelacao.SetVariable('TURNO',Null)
    else
       QRRelacao.SetVariable('TURNO',FBoletimParam.ME2Turno.Text);
    if Trim(FBoletimParam.FM2Departamento.MeDepartamento.Text) = '' then
       QRRelacao.SetVariable('COD_DEPARTAMENTO',Null)
    else
       QRRelacao.SetVariable('COD_DEPARTAMENTO',FBoletimParam.FM2Departamento.MeDepartamento.Text);
    if trim(FBoletimParam.fmProduto1.MeProduto.Text) = '' then
      QRRelacao.SetVariable('PRODUTO', null)
    else
      QRRelacao.SetVariable('PRODUTO', trim(FBoletimParam.fmProduto1.MeProduto.Text));
    if trim(FBoletimParam.meFormula.Text) = '' then
      QRRelacao.SetVariable('FORMULA', null)
    else
      QRRelacao.SetVariable('FORMULA', trim(FBoletimParam.meFormula.Text));

    // Materia prima
    if FBoletimParam.Rg2TipoBoletim.ItemIndex = 0 Then
    begin
      QRRelacao.SetVariable('TIPO_BOLETIM','M');
//      QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
//      QRRelacao.SQL.Add(' AND TB_BOLETIM.QT_FABRICADO < 0 ORDER BY TB_BOLETIM.DT_BOLETIM, TB_BOLETIM.COD_BOLETIM');
      wTitulo := 'Boletim de Industrialização Materia Prima de '
    end
    else  // Produto acabado
    begin
      QRRelacao.SetVariable('TIPO_BOLETIM','P');
//      QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
//      QRRelacao.SQL.Add(' AND TB_BOLETIM.QT_FABRICADO >= 0 ORDER BY TB_BOLETIM.DT_BOLETIM, TB_BOLETIM.COD_BOLETIM');
      wTitulo := 'Boletim de Industrialização Produto Acabado de '
    end;

    if FBoletimParam.CB2Ordem.Text = 'Controle' then
      QRRelacao.SetVariable('ORDEM', 'ORDER BY NUM_CONTROLE ASC')
    else
      if FBoletimParam.CB2Ordem.Text = 'Boletim' then
        QRRelacao.SetVariable('ORDEM', 'ORDER BY COD_BOLETIM ASC')
      else
        if FBoletimParam.CB2Ordem.Text = 'Data' then
          QRRelacao.SetVariable('ORDEM', 'ORDER BY DT_BOLETIM ASC');

    QRRelacao.Open;
    if FRBoletim_Relacao = nil then
      FRBoletim_Relacao := TFRBoletim_Relacao.Create(Application);
    FRBoletim_Relacao.QRLTitulo.Caption := wTitulo +FBoletimParam.ME2DataI.Text
                                           +' até '+FBoletimParam.ME2DataF.Text;
    FRBoletim_Relacao.QRLDepartamento.Caption := 'Departamento:'+FBoletimParam.FM2Departamento.EdDepartamento.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_Relacao.QRPrimario.Preview
    else
      FRBoletim_Relacao.QRPrimario.Print;
    QRRelacao.Close;
//    QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';
  end;
end;

procedure TFBoletimCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(11);
end;

procedure TFBoletimCad.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = MrOk then
     DMBoletim.QBoletimCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFBoletimCad.Custodetalhado1Click(Sender: TObject);
var
 wTitulo : string;
begin
  inherited;
  if FBoletimParam = nil then
    FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[5].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  begin
    with DMBoletim do
    begin
      QRBoletim_Custo.Close;
      if((Trim(FBoletimParam.ME5Formula.Text) = '')) then
        QRBoletim_Custo.SetVariable('FORMULA', null)
      else
        QRBoletim_Custo.SetVariable('FORMULA', StrToInt(Trim(FBoletimParam.ME5Formula.Text)));
      if((Trim(FBoletimParam.Fm5Datas.MeDtInicial.Text) = '')) then
        QRBoletim_Custo.SetVariable('DT_INICIAL', null)
      else
        QRBoletim_Custo.SetVariable('DT_INICIAL', StrToDate(FBoletimParam.Fm5Datas.MeDtInicial.Text));
      if(Trim(FBoletimParam.Fm5Datas.MeDtFinal.Text) = '') then
        QRBoletim_Custo.SetVariable('DT_FINAL', null)
      else
        QRBoletim_Custo.SetVariable('DT_FINAL', StrToDate(FBoletimParam.Fm5Datas.MeDtFinal.Text));
      QRBoletim_Custo.Open;
    end;
    wTitulo := 'Relatório de Custo Detalhado. Fórmula: ';
    if FRBoletimCusto = nil then
       FRBoletimCusto := TFRBoletimCusto.Create(Application);
    FRBoletimCusto.QRLTitulo.Caption := wTitulo + FBoletimParam.ME5Formula.Text + chr(13) + ' De: '+FBoletimParam.Fm5Datas.MeDtInicial.Text + ' até '
                                         + FBoletimParam.Fm5Datas.MeDtFinal.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
       FRBoletimCusto.QRPrimario.Preview
    Else
       FRBoletimCusto.QRPrimario.Print;
    DMBoletim.QRBoletim_Custo.Close;
  end;
end;

procedure TFBoletimCad.RelatrioCompoisiodeEstoque1Click(Sender: TObject);
begin
  inherited;
  if FBoletimParam = nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[6].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  begin
    with DMBoletim do
    begin
      QRComposicaoEstoque.Close;
      if Trim(FBoletimParam.Fm6Filial.MeFilial.Text) = '' then
         QRComposicaoEstoque.SetVariable('FILIAL', null)
      else
        QRComposicaoEstoque.SetVariable('FILIAL', StrToInt(Trim(FBoletimParam.Fm6Filial.MeFilial.Text)));

      if Trim(FBoletimParam.Fm6Produto.MeProduto.Text) = '' then
         QRComposicaoEstoque.SetVariable('PRODUTO', null)
      else
        QRComposicaoEstoque.SetVariable('PRODUTO', StrToInt(Trim(FBoletimParam.Fm6Produto.MeProduto.Text)));

      if Trim(FBoletimParam.Fm6Lote.MeLote.Text) = '' then
         QRComposicaoEstoque.SetVariable('LOTE', null)
      else
        QRComposicaoEstoque.SetVariable('LOTE', StrToInt(Trim(FBoletimParam.Fm6Lote.MeLote.Text)));
      QRComposicaoEstoque.SetVariable('DATA_I', StrToDate(FBoletimParam.Fm6Datas.MeDtInicial.Text));
      QRComposicaoEstoque.SetVariable('DATA_F', StrToDate(FBoletimParam.Fm6Datas.MeDtFinal.Text));
      QRComposicaoEstoque.Open;
    end;
    if FrComposicaoEstoque = nil then
       FrComposicaoEstoque := tFrComposicaoEstoque.Create(Application);
    FrComposicaoEstoque.QRLTitulo.Caption := 'Relatório composição de estoque de ' + FBoletimParam.Fm6Datas.MeDtInicial.Text +
       ' Ate ' + FBoletimParam.Fm6Datas.MeDtFinal.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
       FrComposicaoEstoque.QRPrimario.Preview
    Else
       FrComposicaoEstoque.QRPrimario.Print;
    DMBoletim.QRComposicaoEstoque.Close;
  end;

end;

procedure TFBoletimCad.ProjeodeCompra1Click(Sender: TObject);
var
 qProjecao1,qProjecao2,qProjecao3,qProjecao4: double;
 qProjecao5,qProjecao6,qProjecao7,qProjecao8: double;
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[7].TabVisible := True;
  if FFormulaParam.ShowModal = mrOk then
  with DMFormula do
  begin
    QRProjecaoCompras.Close;
    if trim(FFormulaParam.Me7Projecao1.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO1',StrToFloat(FFormulaParam.Me7Projecao1.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO1',null);
    if trim(FFormulaParam.Me7Projecao2.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO2',StrToFloat(FFormulaParam.Me7Projecao2.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO2',null);
    if trim(FFormulaParam.Me7Projecao3.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO3',StrToFloat(FFormulaParam.Me7Projecao3.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO3',null);
    if trim(FFormulaParam.Me7Projecao4.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO4',StrToFloat(FFormulaParam.Me7Projecao4.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO4',null);
    if trim(FFormulaParam.Me7Projecao5.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO5',StrToFloat(FFormulaParam.Me7Projecao5.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO5',null);
    if trim(FFormulaParam.Me7Projecao6.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO6',StrToFloat(FFormulaParam.Me7Projecao6.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO6',null);
    if trim(FFormulaParam.Me7Projecao7.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO7',StrToFloat(FFormulaParam.Me7Projecao7.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO7',null);
    if trim(FFormulaParam.Me7Projecao8.Text) <> '' then
      QRProjecaoCompras.SetVariable(':PROJECAO8',StrToFloat(FFormulaParam.Me7Projecao8.Text) )
    else
      QRProjecaoCompras.SetVariable(':PROJECAO8',null);

    QRProjecaoCompras.SetVariable(':COD_FILIAL',StrToInt(trim(FFormulaParam.Fm7Filial.MeFilial.Text) ) );

    if trim(FFormulaParam.Me7Formula1.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA1', trim(FFormulaParam.Me7Formula1.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA1',null);
    if trim(FFormulaParam.Me7Formula2.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA2', trim(FFormulaParam.Me7Formula2.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA2',null);
    if trim(FFormulaParam.Me7Formula3.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA3', trim(FFormulaParam.Me7Formula3.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA3',null);
    if trim(FFormulaParam.Me7Formula4.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA4', trim(FFormulaParam.Me7Formula4.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA4',null);
    if trim(FFormulaParam.Me7Formula5.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA5', trim(FFormulaParam.Me7Formula5.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA5',null);
    if trim(FFormulaParam.Me7Formula6.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA6', trim(FFormulaParam.Me7Formula6.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA6',null);
    if trim(FFormulaParam.Me7Formula7.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA7', trim(FFormulaParam.Me7Formula7.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA7',null);
    if trim(FFormulaParam.Me7Formula8.Text) <> '' then
      QRProjecaoCompras.SetVariable(':COD_FORMULA8', trim(FFormulaParam.Me7Formula8.Text))
    else
      QRProjecaoCompras.SetVariable(':COD_FORMULA8',null);

    QRProjecaoCompras.Open;

    if FRFormulaProjecaoCompra = Nil then
      FRFormulaProjecaoCompra := TFRFormulaProjecaoCompra.Create(Application);
    FRFormulaProjecaoCompra.QRLEmpresa.Caption := FFormulaParam.Fm7Filial.EdFilial.Text;
    FRFormulaProjecaoCompra.QRLFilial.Caption := 'Filial '+Trim(FFormulaParam.Fm7Filial.MeFilial.Text)+' - Fórmula(s): '+ trim(FFormulaParam.Me7Formula1.Text)+
            ', '+trim(FFormulaParam.Me7Formula2.Text)+', '+trim(FFormulaParam.Me7Formula3.Text)+', '+trim(FFormulaParam.Me7Formula4.Text)+', '+trim(FFormulaParam.Me7Formula5.Text)+
            ', '+trim(FFormulaParam.Me7Formula6.Text)+', '+trim(FFormulaParam.Me7Formula7.Text)+', '+trim(FFormulaParam.Me7Formula8.Text);
    if FFormulaParam.RGPreview.ItemIndex = 0 then
      FRFormulaProjecaoCompra.QRPrimario.Preview
    Else
      FRFormulaProjecaoCompra.QRPrimario.Print;

    QRProjecaoCompras.Close;
  end;
end;

procedure TFBoletimCad.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  With DMBoletim,DMFormula do
  begin
    if DBEdit7.Text <> '' then
    begin
      QFormulaCons.Close;
      QFormulaCons.SetVariable('COD_FORMULA',StrToInt(Trim(DBEdit7.Text)));
      QFormulaCons.Open;
      if QFormulaConsIND_SITUACAO.Value = 'DESATIVADA' then
      begin
        DBEdit7.SetFocus;
        Raise Exception.Create('Fórmula está desativada. Operação não permitida!');
      end;
      QBoletimProducaoCOD_FORMULA.Value := QFormulaConsCod_Formula.Value;
    end;
  end;
end;

end.

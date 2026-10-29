unit UTConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Grids, DBGrids, Db, OraTeste, Graphics, Menus,
  QuickRpt, QRCtrls;

type
  TFTConsulta = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    BtProcurar: TBitBtn;
    METexto: TMaskEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
    PopupMenu1: TPopupMenu;
    BtnImpressaoPerson: TMenuItem;
    BtnRelatorios: TMenuItem;
    a1: TMenuItem;
    LblNumRegistros: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtnImpressaoPersonClick(Sender: TObject);
    procedure a1Click(Sender: TObject);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
  private
    procedure ImprimirGrid;
    procedure ImprimirGridPersonalizada;
    procedure acaoBotaoEditar(Sender: TObject);
    procedure acaoBotaoImprimir(Sender: TObject);
    { Private declarations }
  protected
    procedure RefreshCharCase;
    procedure ordenaQuery(query: TOracleDataSet1; field: String; close: boolean = false; open: boolean = false);
  public
    { Public declarations }
  end;

var
  FTConsulta: TFTConsulta;

implementation

uses UParamSistema_cl, UOracle_cl, UBiblioteca, URConsulta,
  UPersonalizaRelatorio, UUsuario_cl, URelatorioConsulta_cl;

{$R *.DFM}

procedure TFTConsulta.DBGrid1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TFTConsulta.FormActivate(Sender: TObject);
begin
  //DSConsulta.DataSet.Close;
  //DSConsulta.DataSet.Open;
  If (METexto.Enabled) and (METexto.Visible) Then
    METexto.SetFocus;
  RefreshCharCase;
end;

procedure TFTConsulta.ordenaQuery(query: TOracleDataSet1; field: String; close: boolean = false; open: boolean = false);
Var
  wSQL, wSQLnova : String;
begin
  wSQL := UpperCase(query.SQL.Text);
  if Pos('ORDER BY', wSQL) > 0 then
  begin
    wSQLnova := Copy(wSQL,1, Pos('ORDER BY',wSQL)+7 );
    wSQLnova := wSQLNova + ' ' + field;
    if close then
      DSConsulta.DataSet.Close;
    query.SQL.Clear;
    query.SQL.Add(wSQLNova);
    if open then
      DSConsulta.DataSet.Open;
  end;
end;

procedure TFTConsulta.DBGrid1TitleClick(Column: TColumn);
//Var
//  wSQL, wSQLnova : String;
//  wQtemp : TOracleDataset1;
begin
  // Se for OraTeste
  If (Column.Grid.DataSource.DataSet is TOracleDataset1) and
    (not Column.Grid.DataSource.DataSet.IsEmpty) then
  Begin
    ordenaQuery(Column.Grid.DataSource.DataSet as TOracleDataSet1, Column.FieldName, true, true);
//    wQtemp := Column.Grid.DataSource.DataSet as TOracleDataSet1;
//    wSQL := UpperCase(wQTemp.SQL.Text);
//    wT := wQTemp.SQL;
//    if Pos('ORDER BY', wSQL) > 0 then
//    begin
//      wSQLnova := Copy(wSQL,1, Pos('ORDER BY',wSQL)+7 );
//      wSQLnova := wSQLNova + ' ' + Column.FieldName;
//      DSConsulta.DataSet.Close;
//      TOracleDataset1(DSConsulta.DataSet).SQL.Clear;
//      TOracleDataset1(DSConsulta.DataSet).SQL.Add(wSQLNova);
//      DSConsulta.DataSet.Open;
//    end;
  End
end;

procedure TFTConsulta.FormCreate(Sender: TObject);
begin
  Self.Constraints.MinHeight := Self.Height;
  Self.Constraints.MinWidth := Self.Width;
//  BtOk.Left := ClientWidth - BtOk.Width - 13;
//  BtCancela.Left := BtOk.Left - BtCancela.Width - 3;
//  BtnImprimir.Left := BtCancela.Left - BtnImprimir.Width - 3;
//
//  BtOk.Top := DBGrid1.Top + DBGrid1.Height + 15;
//
//  if ((BtOk.Top + BtOk.Height) > ClientHeight) then
//    BtOk.Top := ClientHeight - BtOk.Height;
//
//  BtCancela.Top := BtOk.Top;
//  BtnImprimir.Top := BtOk.Top;
end;

procedure TFTConsulta.RefreshCharCase;
begin
  if DMParamSistema.QParamSistemaIND_MAIUSCULO_CONSULTA.Value = 'S' then
    Bib.charCaseComps(Bib.componentsAsArray(self), ecUpperCase, Self.Name)
  else
    Bib.charCaseComps(Bib.componentsAsArray(self), ecNormal, Self.Name);
end;

procedure TFTConsulta.ImprimirGrid;
var i, wTamGrid, wTamAtual, wTopAtual, wUltimoTopParametro: Integer;
    t: TQRDBText;
    l: TQRLabel;
    grid: TDBGrid;
    query: TDataSet;
    texto: String;
    shape: TQRShape;
    s: TQRSysData;
begin
  grid := DBGrid1;
  query := grid.DataSource.DataSet;

  wTamGrid := grid.Width;
  wTamAtual := 0;
  wTopAtual := 0;

  if FRConsulta = nil then
    FRConsulta := TFRConsulta.Create(Application);

  FRConsulta.qRelatorio.DataSet := query;

  l := TQRLabel.Create(Self);
  l.Caption := Caption;
  l.ParentReport := FRConsulta.qRelatorio;
  l.Parent := FRConsulta.bTitulo;
  l.AutoSize := True;
  l.Left := 0;
  l.Top := wTopAtual;
  l.Height := 15;
  l.Enabled := True;
  l.WordWrap := False;

  s := TQRSysData.Create(Self);
  s.ParentReport := FRConsulta.qRelatorio;
  s.Parent := FRConsulta.bTitulo;
  s.AutoSize := False;
  s.Top := wTopAtual;
  s.Height := 15;
  s.Width := 80;
  s.Left := FRConsulta.bTitulo.Width - s.Width;
  s.Enabled := True;
  s.Alignment := taRightJustify;
  s.Data := qrsPageNumber;
  s.Text := 'Página ';

  s := TQRSysData.Create(Self);
  s.ParentReport := FRConsulta.qRelatorio;
  s.Parent := FRConsulta.bTitulo;
  s.AutoSize := True;
  s.Top := wTopAtual;
  s.Height := 15;
  s.Left := FRConsulta.bTitulo.Width - s.Width - 100;
  s.Enabled := True;
  s.Alignment := taRightJustify;
  s.Data := qrsDateTime;

  wTopAtual := wTopAtual + 20;

  shape := TQRShape.Create(Self);
  shape.Pen.Style := psDot;
  shape.Shape := qrsHorLine;
  shape.ParentReport := FRConsulta.qRelatorio;
  shape.Parent := FRConsulta.bTitulo;
  shape.Width := FRConsulta.bTitulo.Width;
  shape.Left := 0;
  shape.Top := wTopAtual;
  shape.Enabled := True;
  shape.Height := 1;

  l := TQRLabel.Create(Self);
  l.Caption := ' Parâmetros ';
  l.ParentReport := FRConsulta.qRelatorio;
  l.Parent := FRConsulta.bTitulo;
  l.AutoSize := True;
  l.Left := 40;
  l.Width := 40;
  l.Top := wTopAtual - 5;
  l.Height := 10;
  l.Enabled := True;
  l.WordWrap := False;
  l.Font.Size := 6;

  wTopAtual := wTopAtual + 10;
  wUltimoTopParametro := 0;

  for i := 0 to ComponentCount -1 do
  begin
    if TControl(Components[i]).Top >= grid.Top then
      Continue;
    if (not (TControl(Components[i]).Visible)) then
      Continue;

    texto := '<INVALIDO>';

    if Components[i].ClassType.ClassName = 'TMaskEdit' then
      texto := TMaskEdit(Components[i]).Text;
    if Components[i].ClassType.ClassName = 'TLabel' then
      texto := TLabel(Components[i]).Caption;
    if Components[i].ClassType.ClassName = 'TComboBox' then
      texto := TComboBox(Components[i]).Text;
    if Trim(texto) = '' then
      texto := '-----';

    if texto = '<INVALIDO>' then
      Continue;

    l := TQRLabel.Create(Self);
    l.Caption := texto;
    l.ParentReport := FRConsulta.qRelatorio;
    l.Parent := FRConsulta.bTitulo;
    l.AutoSize := False;
    l.Left := TLabel(Components[i]).Left;
    l.Width := TLabel(Components[i]).Width;
    l.Top := wTopAtual + Trunc((TLabel(Components[i]).Top / 3) * 2);
    l.Height := Trunc((TLabel(Components[i]).Height / 3) * 2);
    l.Enabled := True;
    l.WordWrap := False;
    l.Font.Size := 6;
    if Components[i].ClassType.ClassName = 'TLabel' then
      l.Font.Style := [fsBold];

    if l.Top > wUltimoTopParametro then
      wUltimoTopParametro := l.Top;
  end;

  wTopAtual := wUltimoTopParametro + 10;

  shape := TQRShape.Create(Self);
  shape.Pen.Style := psDot;
  shape.Shape := qrsHorLine;
  shape.ParentReport := FRConsulta.qRelatorio;
  shape.Parent := FRConsulta.bTitulo;
  shape.Width := FRConsulta.bTitulo.Width;
  shape.Left := 0;
  shape.Top := wTopAtual;
  shape.Enabled := True;
  shape.Height := 1;

  wTopAtual := wTopAtual + 8;

  for i := 0 to grid.Columns.Count -1 do
  begin
    if wTamAtual > wTamGrid then
      Break;

    l := TQRLabel.Create(Self);
    l.Caption := grid.Columns[i].Title.Caption;
    l.ParentReport := FRConsulta.qRelatorio;
    l.Parent := FRConsulta.bTitulo;
    l.AutoSize := False;
    l.Left := wTamAtual + 3;
    l.Width := grid.Columns[i].Width;
    l.Top := wTopAtual;
    l.Height := 15;
    l.Enabled := True;
    l.Alignment := grid.Columns[i].Alignment;

    t := TQRDBText.Create(Self);
    t.DataSet := FRConsulta.qRelatorio.DataSet;
    t.DataField := grid.Columns[i].FieldName;
    t.ParentReport := FRConsulta.qRelatorio;
    t.Parent := FRConsulta.bDetalhe;
    t.AutoSize := False;
    t.Left := wTamAtual + 3;
    t.Width := grid.Columns[i].Width;
    t.Top := 1;
    t.Height := 15;
    t.Enabled := True;
    t.Alignment := grid.Columns[i].Alignment;

    wTamAtual := wTamAtual + grid.Columns[i].Width + 3;
  end;

  FRConsulta.bDetalhe.Height := 16;

  wTopAtual := wTopAtual + 15;
  FRConsulta.bTitulo.Height := wTopAtual;

  FRConsulta.qRelatorio.PreviewInitialState := wsMaximized;
  FRConsulta.qRelatorio.Preview;
  FRConsulta := nil;
end;

procedure TFTConsulta.ImprimirGridPersonalizada;
var i, wTamGrid, wTamAtual, codigo, wTamanhoColuna: Integer;
    grid: TDBGrid;
    query: TDataSet;
    alinhamento: String;
begin
  grid := DBGrid1;
  query := grid.DataSource.DataSet;

  wTamGrid := grid.Width;
  wTamAtual := 0;

  codigo := StrToInt(DMOracle.BuscaNome('SELECT SQRELATORIO_CONSULTA.NEXTVAL FROM DUAL', '1=1'));

  DMOracle.ExecutaSql('INSERT INTO TB_RELATORIO_CONSULTA (' +
                      'COD_RELATORIO_CONSULTA, DESC_TELA, DESC_TITULO, COD_USUARIO, IND_DATA_HORA, IND_NUMERO_PAGINA, IND_PUBLICO, IND_TITULO' +
                      ') VALUES (' +
                      inttostr(codigo) + ', ' + QuotedStr(Name) + ', ' + QuotedStr(Caption) + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ', ' + QuotedStr('S') + ', ' + QuotedStr('S') + ', ' + QuotedStr('N') + ', ' + QuotedStr('S') +
                      ')');

  for i := 0 to grid.Columns.Count -1 do
  begin
    if wTamAtual > wTamGrid then
      Break;

    if grid.Columns[i].Width > 0 then
    begin
      if grid.Columns[i].Alignment = taRightJustify then
        alinhamento := 'DIREITA'
      else
        if grid.Columns[i].Alignment = taCenter then
          alinhamento := 'CENTRO'
        else
          alinhamento := 'ESQUERDA';
      DMOracle.ExecutaSql('INSERT INTO TB_RELATORIO_CONSULTA_CAMPO (' +
                          'COD_RELATORIO_CONSULTA_CAMPO, COD_RELATORIO_CONSULTA, DESC_CAMPO, DESC_TITULO, NUM_ORDEM, NUM_LARGURA, DESC_ALINHAMENTO' +
                          ') VALUES (' +
                          'SQRELATORIO_CONSULTA_CAMPO.NEXTVAL, SQRELATORIO_CONSULTA.CURRVAL, ' + QuotedStr(grid.Columns[i].FieldName) + ', ' + QuotedStr(grid.Columns[i].Title.Caption) + ', ' + IntToStr(i) + ', ' + IntToStr(grid.Columns[i].Width) + ', ' + QuotedStr(alinhamento) +
                          ')');

      wTamAtual := wTamAtual + grid.Columns[i].Width + 3;
    end;
  end;

  if FPersonalizaRelatorio = nil then
    FPersonalizaRelatorio := TFPersonalizaRelatorio.Create(Application);
  FPersonalizaRelatorio.deletaAoSair := True;
  FPersonalizaRelatorio.carrega(codigo, Self);
  FPersonalizaRelatorio.ShowModal;
end;

procedure TFTConsulta.PopupMenu1Popup(Sender: TObject);
var item, subItem: TMenuItem;
begin
  while BtnRelatorios.Count > 0 do
    BtnRelatorios.Delete(0);

  DmRelatorioConsulta.QRelTelaPublico.Close;
  DmRelatorioConsulta.QRelTelaPublico.SetVariable('DESC_TELA', Name);
  DmRelatorioConsulta.QRelTelaPublico.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
  DmRelatorioConsulta.QRelTelaPublico.Open;

  if DmRelatorioConsulta.QRelTelaPublico.IsEmpty then
    BtnRelatorios.Enabled := False
  else
    BtnRelatorios.Enabled := True;

  DmRelatorioConsulta.QRelTelaPublico.First;
  while not DmRelatorioConsulta.QRelTelaPublico.Eof do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := DmRelatorioConsulta.QRelTelaPublicoDESC_TITULO.Value + ' (por ' + DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DmRelatorioConsulta.QRelTelaPublicoCOD_USUARIO.value)) + ')';
    item.Tag := DmRelatorioConsulta.QRelTelaPublicoCOD_RELATORIO_CONSULTA.Value;

    if DmRelatorioConsulta.QRelTelaPublicoCOD_USUARIO.Value = DMUsuario.CodUsuarioCorrente then
    begin
      subItem := TMenuItem.Create(Self);
      subItem.Caption := 'Editar';
      subItem.Tag := DmRelatorioConsulta.QRelTelaPublicoCOD_RELATORIO_CONSULTA.Value;
      subItem.OnClick := acaoBotaoEditar;
      item.Add(subItem);

      subItem := TMenuItem.Create(Self);
      subItem.Caption := 'Imprimir';
      subItem.Tag := DmRelatorioConsulta.QRelTelaPublicoCOD_RELATORIO_CONSULTA.Value;
      subItem.OnClick := acaoBotaoImprimir;
      item.Add(subItem);
    end
    else
      item.OnClick := acaoBotaoImprimir;

    BtnRelatorios.Add(item);

    DmRelatorioConsulta.QRelTelaPublico.Next;
  end;
end;

procedure TFTConsulta.acaoBotaoEditar(Sender: TObject);
begin
  if FPersonalizaRelatorio = nil then
    FPersonalizaRelatorio := TFPersonalizaRelatorio.Create(Application);
  FPersonalizaRelatorio.carrega(TControl(Sender).Tag, Self);
  FPersonalizaRelatorio.ShowModal;
end;

procedure TFTConsulta.acaoBotaoImprimir(Sender: TObject);
begin
  if FPersonalizaRelatorio = nil then
    FPersonalizaRelatorio := TFPersonalizaRelatorio.Create(Application);
  FPersonalizaRelatorio.carrega(TControl(Sender).Tag, Self);
  FPersonalizaRelatorio.imprimir;
end;

procedure TFTConsulta.BtnImpressaoPersonClick(Sender: TObject);
begin
  ImprimirGridPersonalizada;
end;

procedure TFTConsulta.a1Click(Sender: TObject);
//var i, wTamGrid, wTamAtual, codigo: Integer;
//    grid: TDBGrid;
//    query: TDataSet;
//    alinhamento: String;
begin
  ImprimirGrid;
//  DmRelatorioConsulta.QRelTela.Close;
//  DmRelatorioConsulta.QRelTela.SetVariable('DESC_TELA', Name);
//  DmRelatorioConsulta.QRelTela.SetVariable('IND_PADRAO', 'S');
//  DmRelatorioConsulta.QRelTela.Open;
//
//  if DmRelatorioConsulta.QRelTela.IsEmpty then
//  begin
//
//    grid := DBGrid1;
//    query := grid.DataSource.DataSet;
//
//    wTamGrid := grid.Width;
//    wTamAtual := 0;
//
//    codigo := StrToInt(DMOracle.BuscaNome('SELECT SQRELATORIO_CONSULTA.NEXTVAL FROM DUAL', '1=1'));
//
//    DMOracle.ExecutaSql('INSERT INTO TB_RELATORIO_CONSULTA (' +
//                        'COD_RELATORIO_CONSULTA, DESC_TELA, DESC_TITULO, COD_USUARIO, IND_DATA_HORA, IND_NUMERO_PAGINA, IND_PUBLICO, IND_TITULO, IND_PADRAO' +
//                        ') VALUES (' +
//                        inttostr(codigo) + ', ' + QuotedStr(Name) + ', ' + QuotedStr(Caption) + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ', ' + QuotedStr('S') + ', ' + QuotedStr('S') + ', ' + QuotedStr('N') + ', ' + QuotedStr('S') + ', ' + QuotedStr('S') +
//                        ')');
//
//    for i := 0 to grid.Columns.Count -1 do
//    begin
//      if wTamAtual > wTamGrid then
//        Break;
//
//      if grid.Columns[i].Alignment = taRightJustify then
//        alinhamento := 'DIREITA'
//      else
//        if grid.Columns[i].Alignment = taCenter then
//          alinhamento := 'CENTRO'
//        else
//          alinhamento := 'ESQUERDA';
//
//      DMOracle.ExecutaSql('INSERT INTO TB_RELATORIO_CONSULTA_CAMPO (' +
//                          'COD_RELATORIO_CONSULTA_CAMPO, COD_RELATORIO_CONSULTA, DESC_CAMPO, DESC_TITULO, NUM_ORDEM, NUM_LARGURA, DESC_ALINHAMENTO' +
//                          ') VALUES (' +
//                          'SQRELATORIO_CONSULTA_CAMPO.NEXTVAL, SQRELATORIO_CONSULTA.CURRVAL, ' + QuotedStr(grid.Columns[i].FieldName) + ', ' + QuotedStr(grid.Columns[i].Title.Caption) + ', ' + IntToStr(i) + ', ' + IntToStr(grid.Columns[i].Width) + ', ' + QuotedStr(alinhamento) +
//                          ')');
//
//      wTamAtual := wTamAtual + grid.Columns[i].Width + 3;
//    end;
//  end
//  else
//    codigo := DmRelatorioConsulta.QRelTelaCOD_RELATORIO_CONSULTA.Value;
//
//  if FPersonalizaRelatorio = nil then
//    FPersonalizaRelatorio := TFPersonalizaRelatorio.Create(Application);
//  FPersonalizaRelatorio.carrega(codigo, Self);
//  FPersonalizaRelatorio.BtnOk.Click;
end;

procedure TFTConsulta.DSConsultaDataChange(Sender: TObject; Field: TField);
begin
  LblNumRegistros.Caption := IntToStr(DSConsulta.DataSet.RecordCount) + ' Registros';
end;

end.

unit UPersonalizaRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  QuickRpt, QRCtrls, Printers, UTConsulta, Mask;

type
  TFPersonalizaRelatorio = class(TForm)
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    PcRelatorio: TPageControl;
    TsCampos: TTabSheet;
    TsOutras: TTabSheet;
    GbCamposSelecionados: TGroupBox;
    LCamposSelecionados: TListBox;
    GbOutrosCampos: TGroupBox;
    LOutrosCampos: TListBox;
    CbData: TCheckBox;
    CbNumPagina: TCheckBox;
    GbTitulo: TGroupBox;
    CbTitulo: TCheckBox;
    ETitulo: TEdit;
    BtnAdiciona: TBitBtn;
    BtnTira: TBitBtn;
    BtnAdicionaTudo: TBitBtn;
    BtnTiraTudo: TBitBtn;
    CbPublico: TCheckBox;
    LConsulta: TLabel;
    EConsulta: TEdit;
    Label1: TLabel;
    ETituloCampo: TEdit;
    ELarguraCampo: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    RgAlinCampo: TRadioGroup;
    RGOrientacao: TRadioGroup;
    Label3: TLabel;
    procedure BtnAdicionaClick(Sender: TObject);
    procedure BtnTiraClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure BtnTiraTudoClick(Sender: TObject);
    procedure LCamposSelecionadosClick(Sender: TObject);
    procedure LCamposSelecionadosKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
    camposIn, camposOut, larguras, titulos, alinhamentos: TStringList;
    grid: TDBGrid;
    codigo: Integer;
    telaConsulta: TFTConsulta;
    procedure atualizaListas;
    function procuraColuna(nome: String): TColumn;
  public
    { Public declarations }
    deletaAoSair: Boolean;
    procedure carrega(codigo: Integer; telaConsulta: TFTConsulta);
    procedure imprimir;
  end;

var
  FPersonalizaRelatorio: TFPersonalizaRelatorio;

implementation

uses URelatorioConsulta_cl, DB, UOracle_cl, UBiblioteca, URConsulta;

{$R *.dfm}

procedure TFPersonalizaRelatorio.carrega(codigo: Integer; telaConsulta: TFTConsulta);
var
  i, j: Integer;
  achou: Boolean;
begin
  self.grid := telaConsulta.DBGrid1;
  self.codigo := codigo;
  self.telaConsulta := telaConsulta;

  titulos := TStringList.Create;
  larguras := TStringList.Create;
  camposIn := TStringList.Create;
  camposOut := TStringList.Create;
  alinhamentos := TStringList.Create;

  DmRelatorioConsulta.QRelCod.Close;
  DmRelatorioConsulta.QRelCod.SetVariable('COD_RELATORIO_CONSULTA', codigo);
  DmRelatorioConsulta.QRelCod.Open;

  if DmRelatorioConsulta.QRelCod.IsEmpty then
    raise Exception.Create('Código inválido.');

  DmRelatorioConsulta.QCamposCod.Close;
  DmRelatorioConsulta.QCamposCod.SetVariable('COD_RELATORIO_CONSULTA', codigo);
  DmRelatorioConsulta.QCamposCod.Open;

  CbData.Checked := DmRelatorioConsulta.QRelCodIND_DATA_HORA.Value = 'S';
  CbNumPagina.Checked := DmRelatorioConsulta.QRelCodIND_NUMERO_PAGINA.Value = 'S';
  CbPublico.Checked := DmRelatorioConsulta.QRelCodIND_PUBLICO.Value = 'S';
  CbTitulo.Checked := DmRelatorioConsulta.QRelCodIND_TITULO.Value = 'S';

  EConsulta.Text := DmRelatorioConsulta.QRelCodDESC_TELA.Value;
  ETitulo.Text := DmRelatorioConsulta.QRelCodDESC_TITULO.Value;

  DmRelatorioConsulta.QCamposCod.First;

  while not DmRelatorioConsulta.QCamposCod.Eof do
  begin
    camposIn.Add(DmRelatorioConsulta.QCamposCodDESC_CAMPO.Value);
    titulos.Add(DmRelatorioConsulta.QCamposCodDESC_TITULO.Value);
    alinhamentos.Add(DmRelatorioConsulta.QCamposCodDESC_ALINHAMENTO.Value);
    larguras.Add(DmRelatorioConsulta.QCamposCodNUM_LARGURA.Text);

    DmRelatorioConsulta.QCamposCod.Next;
  end;

  for i := 0 to grid.Columns.Count - 1 do
  begin
    achou := False;
    for j := 0 to camposIn.Count - 1 do
      if grid.Columns[i].FieldName = camposIn[j] then
      begin
        achou := True;
        Break;
      end;
    if (not (achou)) then
      camposOut.Add(grid.Columns[i].FieldName);
  end;

  atualizaListas;
end;

procedure TFPersonalizaRelatorio.BtnAdicionaClick(Sender: TObject);
var alin: String;
begin
  if procuraColuna(camposOut[LOutrosCampos.ItemIndex]).Alignment = taRightJustify then
    alin := 'DIREITA'
  else
    if procuraColuna(camposOut[LOutrosCampos.ItemIndex]).Alignment = taCenter then
      alin := 'CENTRO'
    else
      alin := 'ESQUERDA';

  camposIn.Add(camposOut[LOutrosCampos.ItemIndex]);
  larguras.Add(IntToStr(procuraColuna(camposOut[LOutrosCampos.ItemIndex]).Width));
  titulos.Add(procuraColuna(camposOut[LOutrosCampos.ItemIndex]).Title.Caption);
  alinhamentos.Add(alin);

  camposOut.Delete(LOutrosCampos.ItemIndex);

  atualizaListas;
end;

procedure TFPersonalizaRelatorio.BtnTiraClick(Sender: TObject);
begin
  camposOut.Add(camposIn[LCamposSelecionados.ItemIndex]);
  
  camposIn.Delete(LCamposSelecionados.ItemIndex);
  larguras.Delete(LCamposSelecionados.ItemIndex);
  titulos.Delete(LCamposSelecionados.ItemIndex);
  alinhamentos.Delete(LCamposSelecionados.ItemIndex);

  atualizaListas;
end;

procedure TFPersonalizaRelatorio.BtnAdicionaTudoClick(Sender: TObject);
begin
  while camposOut.Count > 0 do
  begin
    LOutrosCampos.ItemIndex := 0;
    BtnAdiciona.Click;
  end;
end;

procedure TFPersonalizaRelatorio.BtnTiraTudoClick(Sender: TObject);
begin
  while camposIn.Count > 0 do
  begin
    LCamposSelecionados.ItemIndex := 0;
    BtnTira.Click;
  end;
end;

procedure TFPersonalizaRelatorio.atualizaListas;
begin
  LCamposSelecionados.Items := camposIn;
  LOutrosCampos.Items := camposOut;
end;

function TFPersonalizaRelatorio.procuraColuna(nome: String): TColumn;
var i: Integer;
begin
  for i := 0 to grid.Columns.Count - 1 do
    if grid.Columns[i].FieldName = nome then
    begin
      Result := grid.Columns[i];
      Exit;
    end;
  Result := nil;
end;

procedure TFPersonalizaRelatorio.LCamposSelecionadosClick(Sender: TObject);
begin
  ETituloCampo.Text := titulos[LCamposSelecionados.ItemIndex];
  ELarguraCampo.Text := larguras[LCamposSelecionados.ItemIndex];
  if alinhamentos[LCamposSelecionados.ItemIndex] = 'ESQUERDA' then
    RgAlinCampo.ItemIndex := 0
  else
    if alinhamentos[LCamposSelecionados.ItemIndex] = 'CENTRO' then
      RgAlinCampo.ItemIndex := 1
    else
      if alinhamentos[LCamposSelecionados.ItemIndex] = 'DIREITA' then
        RgAlinCampo.ItemIndex := 2
      else
        RgAlinCampo.ItemIndex := 0;
end;

procedure TFPersonalizaRelatorio.LCamposSelecionadosKeyPress(
  Sender: TObject; var Key: Char);
begin
  ETituloCampo.Text := titulos[LCamposSelecionados.ItemIndex];
  ELarguraCampo.Text := larguras[LCamposSelecionados.ItemIndex];
  if alinhamentos[LCamposSelecionados.ItemIndex] = 'ESQUERDA' then
    RgAlinCampo.ItemIndex := 0
  else
    if alinhamentos[LCamposSelecionados.ItemIndex] = 'CENTRO' then
      RgAlinCampo.ItemIndex := 1
    else
      if alinhamentos[LCamposSelecionados.ItemIndex] = 'DIREITA' then
        RgAlinCampo.ItemIndex := 2
      else
        RgAlinCampo.ItemIndex := 0;
end;

procedure TFPersonalizaRelatorio.BitBtn1Click(Sender: TObject);
var alin: String;
begin
  if RgAlinCampo.ItemIndex = 2 then
    alin := 'DIREITA'
  else
    if RgAlinCampo.ItemIndex = 1 then
      alin := 'CENTRO'
    else
      alin := 'ESQUERDA';

  titulos[LCamposSelecionados.ItemIndex] := ETituloCampo.Text;
  larguras[LCamposSelecionados.ItemIndex] := ELarguraCampo.Text;
  alinhamentos[LCamposSelecionados.ItemIndex] := alin;
end;

procedure TFPersonalizaRelatorio.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFPersonalizaRelatorio.BtnOkClick(Sender: TObject);
var i: Integer;
wOrientacao: String;
begin
  wOrientacao :=
    Bib.ift(RGOrientacao.ItemIndex = 0, 'RETRATO', 'PAISAGEM');
  DMOracle.ExecutaSql('DELETE FROM TB_RELATORIO_CONSULTA_CAMPO WHERE COD_RELATORIO_CONSULTA = ' + IntToStr(codigo));
  for i := 0 to camposIn.Count -1 do
  begin
    DMOracle.ExecutaSql('INSERT INTO TB_RELATORIO_CONSULTA_CAMPO (' +
                        'COD_RELATORIO_CONSULTA_CAMPO, COD_RELATORIO_CONSULTA, DESC_CAMPO, DESC_TITULO, NUM_ORDEM, NUM_LARGURA, DESC_ALINHAMENTO' +
                        ') VALUES (' +
                        'SQRELATORIO_CONSULTA_CAMPO.NEXTVAL, ' + IntToStr(codigo) + ', ' + QuotedStr(camposIn[i]) + ', ' + QuotedStr(titulos[i]) + ', ' + IntToStr(i) + ', ' + larguras[i] + ', ' + QuotedStr(alinhamentos[i]) +
                        ')');
  end;

  DMOracle.ExecutaSql('UPDATE TB_RELATORIO_CONSULTA SET '
                     + 'DESC_TITULO = ' + QuotedStr(ETitulo.Text)
                     + ', IND_DATA_HORA = ' + QuotedStr(Bib.ift(CbData.Checked, 'S', 'N'))
                     + ', IND_NUMERO_PAGINA = ' + QuotedStr(Bib.ift(CbNumPagina.Checked, 'S', 'N'))
                     + ', IND_PUBLICO = ' + QuotedStr(Bib.ift(CbPublico.Checked, 'S', 'N'))
                     + ', IND_TITULO = ' + QuotedStr(Bib.ift(CbTitulo.Checked, 'S', 'N'))
                     + ', IND_ORIENTACAO = ' + QuotedStr(wOrientacao)
                     + ' WHERE COD_RELATORIO_CONSULTA = ' + IntToStr(codigo)
                     );

  imprimir;
  deletaAoSair := False;
  BtnCancelar.Click;
end;

procedure TFPersonalizaRelatorio.imprimir;
var i, wTamGrid, wTamAtual, wTopAtual, wUltimoTopParametro: Integer;
    t: TQRDBText;
    l: TQRLabel;
    s: TQRSysData;
    query: TDataSet;
    texto: String;
    shape: TQRShape;
begin
  DmRelatorioConsulta.QRelCod.Close;
  DmRelatorioConsulta.QRelCod.SetVariable('COD_RELATORIO_CONSULTA', codigo);
  DmRelatorioConsulta.QRelCod.Open;

  if DmRelatorioConsulta.QRelCod.IsEmpty then
    raise Exception.Create('Código inválido.');

  DmRelatorioConsulta.QCamposCod.Close;
  DmRelatorioConsulta.QCamposCod.SetVariable('COD_RELATORIO_CONSULTA', codigo);
  DmRelatorioConsulta.QCamposCod.Open;

  query := grid.DataSource.DataSet;

  wTamGrid := grid.Width;
  wTamAtual := 0;
  wTopAtual := 0;

  if FRConsulta = nil then
    FRConsulta := TFRConsulta.Create(Application);
  if DMRelatorioConsulta.QRelCodIND_ORIENTACAO.Value = 'RETRATO' then
    FRConsulta.qRelatorio.Page.Orientation := poPortrait
  else
    FRConsulta.qRelatorio.Page.Orientation := poLandscape;
  FRConsulta.qRelatorio.DataSet := query;

  if DmRelatorioConsulta.QRelCodIND_TITULO.Value = 'S' then
  begin
    l := TQRLabel.Create(Self);
    l.ParentReport := FRConsulta.qRelatorio;
    l.Parent := FRConsulta.bTitulo;
    l.Caption := DmRelatorioConsulta.QRelCodDESC_TITULO.Value;
    l.AutoSize := True;
    l.Left := 0;
    l.Top := wTopAtual;
    l.Height := 15;
    l.Enabled := True;
    l.WordWrap := False;
  end;

  if DmRelatorioConsulta.QRelCodIND_NUMERO_PAGINA.Value = 'S' then
  begin
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
  end;

  if DmRelatorioConsulta.QRelCodIND_DATA_HORA.Value = 'S' then
  begin
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
  end;

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

  for i := 0 to telaConsulta.ComponentCount -1 do
  begin
    if TControl(telaConsulta.Components[i]).Top >= grid.Top then
      Continue;
    if (not (TControl(telaConsulta.Components[i]).Visible)) then
      Continue;

    texto := '<INVALIDO>';

    if telaConsulta.Components[i].ClassType.ClassName = 'TMaskEdit' then
      texto := TMaskEdit(telaConsulta.Components[i]).Text;
    if telaConsulta.Components[i].ClassType.ClassName = 'TLabel' then
      texto := TLabel(telaConsulta.Components[i]).Caption;
    if telaConsulta.Components[i].ClassType.ClassName = 'TComboBox' then
      texto := TComboBox(telaConsulta.Components[i]).Text;
    if Trim(texto) = '' then
      texto := '-----';

    if texto = '<INVALIDO>' then
      Continue;

    l := TQRLabel.Create(Self);
    l.Caption := texto;
    l.ParentReport := FRConsulta.qRelatorio;
    l.Parent := FRConsulta.bTitulo;
    l.AutoSize := False;
    l.Left := TLabel(telaConsulta.Components[i]).Left;
    l.Width := TLabel(telaConsulta.Components[i]).Width;
    l.Top := wTopAtual + Trunc((TLabel(telaConsulta.Components[i]).Top / 3) * 2);
    l.Height := Trunc((TLabel(telaConsulta.Components[i]).Height / 3) * 2);
    l.Enabled := True;
    l.WordWrap := False;
    l.Font.Size := 6;
    if telaConsulta.Components[i].ClassType.ClassName = 'TLabel' then
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

  DmRelatorioConsulta.QCamposCod.First;
  while not DmRelatorioConsulta.QCamposCod.Eof do
  begin
    l := TQRLabel.Create(Self);
    l.Caption := DmRelatorioConsulta.QCamposCodDESC_TITULO.Value;
    l.ParentReport := FRConsulta.qRelatorio;
    l.Parent := FRConsulta.bTitulo;
    l.AutoSize := False;
    l.Left := wTamAtual + 3;
    l.Width := DmRelatorioConsulta.QCamposCodNUM_LARGURA.Value;
    l.Top := wTopAtual;
    l.Height := 15;
    l.Enabled := True;
    if DmRelatorioConsulta.QCamposCodDESC_ALINHAMENTO.Value = 'DIREITA' then
      l.Alignment := taRightJustify
    else
      if DmRelatorioConsulta.QCamposCodDESC_ALINHAMENTO.Value = 'CENTRO' then
        l.Alignment := taCenter
      else
        l.Alignment := taLeftJustify;

    t := TQRDBText.Create(Self);
    t.DataSet := FRConsulta.qRelatorio.DataSet;
    t.DataField := DmRelatorioConsulta.QCamposCodDESC_CAMPO.Value;
    t.ParentReport := FRConsulta.qRelatorio;
    t.Parent := FRConsulta.bDetalhe;
    t.AutoSize := False;
    t.Left := wTamAtual + 3;
    t.Width := DmRelatorioConsulta.QCamposCodNUM_LARGURA.Value;
    t.Top := 1;
    t.Height := 15;
    t.Enabled := True;
    if DmRelatorioConsulta.QCamposCodDESC_ALINHAMENTO.Value = 'DIREITA' then
      t.Alignment := taRightJustify
    else
      if DmRelatorioConsulta.QCamposCodDESC_ALINHAMENTO.Value = 'CENTRO' then
        t.Alignment := taCenter
      else
        t.Alignment := taLeftJustify;

    wTamAtual := wTamAtual + DmRelatorioConsulta.QCamposCodNUM_LARGURA.Value + 3;

    DmRelatorioConsulta.QCamposCod.Next;
  end;

  FRConsulta.bDetalhe.Height := 16;

  wTopAtual := wTopAtual + 15;
  FRConsulta.bTitulo.Height := wTopAtual;

  FRConsulta.qRelatorio.PreviewInitialState := wsMaximized;
  FRConsulta.qRelatorio.Preview;
  FRConsulta := nil;
end;

procedure TFPersonalizaRelatorio.FormCreate(Sender: TObject);
begin
  deletaAoSair := False;
end;

procedure TFPersonalizaRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if deletaAoSair then
  begin
    DMOracle.ExecutaSql('DELETE FROM TB_RELATORIO_CONSULTA_CAMPO WHERE COD_RELATORIO_CONSULTA = ' + IntToStr(codigo));
    DMOracle.ExecutaSql('DELETE FROM TB_RELATORIO_CONSULTA WHERE COD_RELATORIO_CONSULTA = ' + IntToStr(codigo));
  end;
end;

procedure TFPersonalizaRelatorio.Label3Click(Sender: TObject);
begin
  deletaAoSair := (MessageDlg('Tem certeza que deseja excluir esta personalização?', mtConfirmation,
    [mbOk,mbCancel],1) = mrOk);
  if deletaAoSair then
    Close;
end;

end.

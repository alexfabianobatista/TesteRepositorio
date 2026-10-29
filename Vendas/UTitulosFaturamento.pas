unit UTitulosFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OracleData, UFmDatas, UFmCadastro, UFmFilial, DB, Grids, DBGrids,
  StdCtrls, UFmSerie;

type
  THackGrid = class(TCustomDBGrid);  

type
  TFTitulosFaturamento = class(TForm)
    PnlPrincipal: TPanel;
    FmFilial: TFmFilial;
    FmCadastro: TFmCadastro;
    FmDatasRef: TFmDatas;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DSTitulosFaturamento: TDataSource;
    FmSerie: TFmSerie;
    Button2: TButton;
    DBGrid2: TDBGrid;
    DSItens: TDataSource;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FmFilialBtFilialClick(Sender: TObject);
    procedure FmCadastroBtCadastroClick(Sender: TObject);
    procedure FmSerieBtSerieClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTitulosFaturamento: TFTitulosFaturamento;

implementation

{$R *.dfm}

uses UNotaSaida_cl, Math;

procedure TFTitulosFaturamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vCheck: Integer;
  vRect: TRect;  
begin

  inherited; 
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  if Column.FieldName = 'X' then
  begin
    // Limpa a célula
    TDBGrid(Sender).Canvas.FillRect(Rect);

    // Define o estado do checkbox (verificando se o valor é 'S' ou True)
    if ((Sender as TDBGrid).DataSource.DataSet.FieldByName('X').Value = 'S') then
      vCheck := DFCS_CHECKED
    else
      vCheck := 0;

    // Calcula a posição centralizada para desenhar o checkbox
    vRect.Left   := Rect.Left + ((Rect.Right - Rect.Left - 13) div 2);
    vRect.Top    := Rect.Top + ((Rect.Bottom - Rect.Top - 13) div 2);
    vRect.Right  := vRect.Left + 13;
    vRect.Bottom := vRect.Top + 13;

    DrawFrameControl(DBGrid1.Canvas.Handle, vRect, DFC_BUTTON, vCheck);
  end;
end;

procedure TFTitulosFaturamento.DBGrid1CellClick(Column: TColumn);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
    Exit;
    
  if Column.FieldName = 'X' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('X').Value = 'S' then
      DBGrid1.DataSource.DataSet.FieldByName('X').Value := 'N'
    else
      DBGrid1.DataSource.DataSet.FieldByName('X').Value := 'S';
  end;
end;

procedure TFTitulosFaturamento.Button1Click(Sender: TObject);
var
  isDataVazia: boolean;
begin

  isDataVazia := False;
  with DMNotaSaida do
  begin
    QTituloFaturamento.Close;
    if Trim(FmDatasRef.MeDtInicial.Text) <> '' then
      QTituloFaturamento.SetVariable('DT_INICIO', StrToDate(FmDatasRef.MeDtInicial.Text))
    else
      isDataVazia := True;

    if Trim(FmDatasRef.MeDtFinal.Text) <> '' then
      QTituloFaturamento.SetVariable('DT_FINAL', StrToDate(FmDatasRef.MeDtFinal.Text))
    else
      isDataVazia := True;

    if isDataVazia then
      Raise Exception.Create('As datas de referência devem ser corretamente preenchidas!');

    if Trim(FmFilial.MeFilial.Text) <> '' then
      QTituloFaturamento.SetVariable('COD_FILIAL', StrToInt(Trim(FmFilial.MeFilial.Text)));

    if Trim(FmCadastro.MeCadastro.Text) <> '' then
      QTituloFaturamento.SetVariable('COD_CADASTRO', StrToInt(Trim(FmCadastro.MeCadastro.Text)));

    if Trim(FmSerie.MeSerie.Text) <> '' then
      QTituloFaturamento.SetVariable('COD_SERIE', Trim(FmSerie.MeSerie.Text));

    QTituloFaturamento.Open;
  end;
end;

procedure TFTitulosFaturamento.FmFilialBtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial.BtFilialClick(Sender);           
end;

procedure TFTitulosFaturamento.FmCadastroBtCadastroClick(Sender: TObject);
begin
  inherited;
  FmCadastro.BtCadastroClick(Sender);
end;

procedure TFTitulosFaturamento.FmSerieBtSerieClick(Sender: TObject);
begin
  inherited;
  FmSerie.BtSerieClick(Sender);
end;

procedure TFTitulosFaturamento.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  RowIndex, OrigActiveRecord: Integer;
begin
  
  // Descobre a coordenada da célula onde o mouse está
  Cell := DBGrid1.MouseCoord(X, Y);
  RowIndex := Cell.Y;
  DBGrid2.DataSource.DataSet.Close;
  // Ajusta o índice se houver títulos ou indicadores visíveis
  if dgTitles in DBGrid1.Options then
    Dec(RowIndex);
  if dgIndicator in DBGrid1.Options then
    Dec(Cell.X);

  // Verifica se o mouse está sobre uma linha válida
  if THackGrid(DBGrid1).DataLink.Active and (RowIndex >= 0) then
  begin
    OrigActiveRecord := THackGrid(DBGrid1).DataLink.ActiveRecord;
    try
      // Sincroniza temporariamente o cursor do DataSet com a linha do mouse
      THackGrid(DBGrid1).DataLink.ActiveRecord := RowIndex;

      // Pega o valor da chave (ex: ID) para filtrar o Grid flutuante
      // Exemplo: dmPrincipal.QryDetalhes.ParamByName('ID').AsInteger := DataSetPrincipalID.Value;

      // Exibe o Grid flutuante exatamente onde o mouse está
      DBGrid2.Left := Mouse.CursorPos.X - Self.Left + 15;
      DBGrid2.Top := Mouse.CursorPos.Y - Self.Top + 15;
      TOracleDataSet(DBGrid2.DataSource.DataSet).SetVariable('COD_NOTA_CAB', DBGrid1.DataSource.DataSet.FieldByName('COD_NOTA_CAB').Value);
      DBGrid2.DataSource.DataSet.Open;
      Sleep(20);
      DBGrid2.Height := 25 + (DBGrid2.DataSource.DataSet.RecordCount * 20);
      DBGrid2.Visible := True;
    finally
      THackGrid(DBGrid1).DataLink.ActiveRecord := OrigActiveRecord;
    end;                              
  end
  else
  begin
    // Esconde o grid se o mouse sair da área de dados
    DBGrid2.Visible := False;
  end;

end;

end.



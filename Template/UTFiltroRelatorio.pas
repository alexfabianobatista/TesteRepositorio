unit UTFiltroRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, StdCtrls, Buttons, Grids, DBGrids, Provider, DBClient,
  OracleData, OraTeste, ImgList, DBCtrls;

type
  TFTFiltroRelatorio = class(TForm)
    LblNumRegistros: TLabel;
    DBGFiltro: TDBGrid;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
    Label1: TLabel;
    CbSelectAll: TCheckBox;
    ILChecks: TImageList;
    DSPFiltroRelatorio: TDataSetProvider;
    DsFiltroRelatorio: TDataSource;
    CDSFiltroRelatorio: TClientDataSet;
    CDSFiltroRelatorioIND_SELECIONADO: TStringField;
    Label2: TLabel;
    DBTValorTotal: TDBText;
    CDSFiltroRelatoriosoma_valor_total: TAggregateField;
    CDSFiltroRelatorioVAL_SELECIONADO: TFloatField;
    procedure DBGFiltroCellClick(Column: TColumn);
    procedure DBGFiltroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CDSFiltroRelatorioAfterOpen(DataSet: TDataSet);
    procedure CDSFiltroRelatorioIND_SELECIONADOChange(Sender: TField);
    procedure CbSelectAllClick(Sender: TObject);
    procedure CDSFiltroRelatorioBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    countSelecionados: Integer;
    procedure SetSelecaoItem(Sel: String = 'S');
    procedure InverteSelecaoItem;

  public
    { Public declarations }
    function ListarSelecionados: String;
  end;

var
  FTFiltroRelatorio: TFTFiltroRelatorio;

implementation

uses UOracle_cl, UBiblioteca, StrUtils;

{$R *.dfm}

procedure TFTFiltroRelatorio.DBGFiltroCellClick(Column: TColumn);
begin
  if (Column.FieldName = 'IND_SELECIONADO') then
  begin
    if (not CDSFiltroRelatorio.IsEmpty) then
      InverteSelecaoItem;
    try
      DBGFiltro.SelectedIndex := DBGFiltro.SelectedIndex + 1;
    except
    end;
  end;
end;

procedure TFTFiltroRelatorio.DBGFiltroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DBGFiltro.Canvas.FillRect(Rect);
    if CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
      ILChecks.Draw(DBGFiltro.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBGFiltro.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFTFiltroRelatorio.InverteSelecaoItem;
begin
    if CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
      SetSelecaoItem('N')
    else
      SetSelecaoItem('S');
end;

procedure TFTFiltroRelatorio.SetSelecaoItem(Sel: String);
begin
  try
    if (CDSFiltroRelatorioIND_SELECIONADO.Value <> Sel) then
    begin
      if not (CDSFiltroRelatorio.State in [DsEdit, DsInsert]) then
        CDSFiltroRelatorio.Edit;
      CDSFiltroRelatorioIND_SELECIONADO.Value := Sel;
      if CDSFiltroRelatorio.State in [DsEdit, DsInsert] then
        CDSFiltroRelatorio.Post;
    end;
  except
    Raise;
  end;
end;

procedure TFTFiltroRelatorio.CDSFiltroRelatorioAfterOpen(
  DataSet: TDataSet);
begin
  countSelecionados := CDSFiltroRelatorio.RecordCount;
  LblNumRegistros.Caption := IntToStr(countSelecionados) + ' Registros';
end;

procedure TFTFiltroRelatorio.CDSFiltroRelatorioIND_SELECIONADOChange(
  Sender: TField);
begin
  countSelecionados := countSelecionados + bib.ift(CDSFiltroRelatorioIND_SELECIONADO.Value = 'S', 1, -1);
  LblNumRegistros.Caption := IntToStr(countSelecionados) + ' Registros';
end;

procedure TFTFiltroRelatorio.CbSelectAllClick(Sender: TObject);
var recNo: Integer;
begin

  if (not CDSFiltroRelatorio.IsEmpty) then
  begin
    recNo := CDSFiltroRelatorio.RecNo;
    CDSFiltroRelatorio.DisableControls;
    CDSFiltroRelatorio.First;
    while not CDSFiltroRelatorio.Eof do
    begin
      if not (CDSFiltroRelatorio.State in [DsEdit, DsInsert]) then
        CDSFiltroRelatorio.Edit;
      if CbSelectAll.Checked then
      begin
        if CDSFiltroRelatorioIND_SELECIONADO.Value = 'N' then
          CDSFiltroRelatorioIND_SELECIONADO.Value := 'S'
      end
      else
      begin
        if CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
          CDSFiltroRelatorioIND_SELECIONADO.Value := 'N';
      end;
      if CDSFiltroRelatorio.State in [DsEdit, DsInsert] then
        CDSFiltroRelatorio.Post;
      try
        CDSFiltroRelatorio.Next;
      except
      end;
    end;
    CDSFiltroRelatorio.RecNo := recNo;
    CDSFiltroRelatorio.EnableControls;
 end;
end;

procedure TFTFiltroRelatorio.CDSFiltroRelatorioBeforeOpen(
  DataSet: TDataSet);
begin
  CbSelectAll.Checked := True;
end;

function TFTFiltroRelatorio.ListarSelecionados: String;
var recNo: Integer;
begin
  Result := '';
  if (not CDSFiltroRelatorio.IsEmpty) then
  begin
    recNo := CDSFiltroRelatorio.RecNo;
    CDSFiltroRelatorio.DisableControls;
    CDSFiltroRelatorio.First;
    while not CDSFiltroRelatorio.Eof do
    begin
      if CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
        Result := Result + CDSFiltroRelatorio.Fields[2].AsString + ',';
      CDSFiltroRelatorio.Next;
    end;
    Result := LeftStr(Result, Length(Result) -1);
    CDSFiltroRelatorio.RecNo := recNo;
    CDSFiltroRelatorio.EnableControls;
  end;
end;

end.

unit UImporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, OracleData, OraTeste, Oracle, OraS, ComOBJ,
  DBClient, Grids, DBGrids, ExtCtrls, Provider;

type
  TFImporta = class(TForm)
    OraS1: TOraS;
    QMarca: TOracleDataSet1;
    DataSource1: TDataSource;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    CdArquivo: TClientDataSet;
    CdArquivoMARCA: TStringField;
    CdArquivoCLASSE: TStringField;
    CdArquivoDESCRICAO: TStringField;
    CdArquivoCODBARRA: TStringField;
    CdArquivoEMBALAGEM: TStringField;
    CdArquivoNCM: TStringField;
    CdArquivoPESO_BRUTO: TStringField;
    CdArquivoPESO_LIQUIDO: TStringField;
    CdMarca: TClientDataSet;
    DsMarca: TDataSource;
    DspMarca: TDataSetProvider;
    DBGrid2: TDBGrid;
    QMarcaCOD_MARCA: TIntegerField;
    QMarcaDESC_MARCA: TStringField;
    CdMarcaCOD_MARCA: TIntegerField;
    CdMarcaDESC_MARCA: TStringField;
    QClasse: TOracleDataSet1;
    QClasseCOD_CLASSE: TIntegerField;
    QClasseDESC_CLASSE: TStringField;
    QClasseNUM_CLASSE: TIntegerField;
    QClasseNUM_SUBCLASSE: TIntegerField;
    DspClasse: TDataSetProvider;
    CdClasse: TClientDataSet;
    DsClasse: TDataSource;
    QProduto: TOracleDataSet1;
    QProdutoCOD_PRODUTO: TFloatField;
    QProdutoDESC_PRODUTO: TStringField;
    QProdutoCOD_CLASSE: TIntegerField;
    QProdutoCOD_MARCA: TIntegerField;
    QProdutoCOD_TRIBUTACAO: TIntegerField;
    QProdutoIND_TIPO_PRODUTO: TStringField;
    QProdutoPERC_ISS: TFloatField;
    QProdutoPERC_INSS: TFloatField;
    QProdutoDESC_UNIDADE: TStringField;
    QProdutoNUM_EMBALAGEM: TFloatField;
    QProdutoNUM_FABRICANTE: TStringField;
    QProdutoNUM_GENERO_NCM: TStringField;
    QProdutoNUM_PESO_BRUTO: TFloatField;
    QProdutoNUM_PESO_LIQUIDO: TFloatField;
    DspProduto: TDataSetProvider;
    CdProduto: TClientDataSet;
    DsProduto: TDataSource;
    CdClasseCOD_CLASSE: TIntegerField;
    CdClasseDESC_CLASSE: TStringField;
    CdClasseNUM_CLASSE: TIntegerField;
    CdClasseNUM_SUBCLASSE: TIntegerField;
    QSeq: TOracleDataSet1;
    QSeqVALOR: TFloatField;
    CdProdutoCOD_PRODUTO: TFloatField;
    CdProdutoDESC_PRODUTO: TStringField;
    CdProdutoCOD_CLASSE: TIntegerField;
    CdProdutoCOD_MARCA: TIntegerField;
    CdProdutoCOD_TRIBUTACAO: TIntegerField;
    CdProdutoIND_TIPO_PRODUTO: TStringField;
    CdProdutoPERC_ISS: TFloatField;
    CdProdutoPERC_INSS: TFloatField;
    CdProdutoDESC_UNIDADE: TStringField;
    CdProdutoNUM_EMBALAGEM: TFloatField;
    CdProdutoNUM_FABRICANTE: TStringField;
    CdProdutoNUM_GENERO_NCM: TStringField;
    CdProdutoNUM_PESO_BRUTO: TFloatField;
    CdProdutoNUM_PESO_LIQUIDO: TFloatField;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure gerar;
    function sequencia(seq: string): Integer;
    function localizaMarca(descricao: string): Integer;
    function localizaClasse(descricao: string): Integer;
    function localizaProduto(descricao: string): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImporta: TFImporta;

implementation

{$R *.dfm}

procedure TFImporta.gerar;
const
  xlCellTypeLastCell = $0000000B;
var
  Excel, Sheet: Variant;
  i, j, linhas, colunas: Integer;
begin
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := False;
    Excel.Workbooks.Open('c:\Arquivo.xls');
    Sheet := Excel.Workbooks[1].WorkSheets['Dados'];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    linhas := Excel.ActiveCell.Row;
//    colunas := Excel.ActiveCell.Column;
    colunas := 8;

    CdArquivo.Close;
    CdArquivo.Open;

    for i := 2 to linhas do
    begin
      CdArquivo.Append;
      CdArquivoMARCA.Value := Sheet.Cells[i, 1];
      CdArquivoCLASSE.Value := Sheet.Cells[i, 2];
      CdArquivoDESCRICAO.Value := Sheet.Cells[i, 3];
      CdArquivoCODBARRA.Value := Sheet.Cells[i, 4];
      CdArquivoEMBALAGEM.Value := Sheet.Cells[i, 5];
      CdArquivoNCM.Value := Sheet.Cells[i, 6];
      CdArquivoPESO_BRUTO.Value := Sheet.Cells[i, 7];
      CdArquivoPESO_LIQUIDO.Value := Sheet.Cells[i, 8];
      CdArquivo.Post;
    end;

  finally
    if not VarIsEmpty(Excel) then
    begin
      Excel.Quit;
      Excel := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

procedure TFImporta.BitBtn1Click(Sender: TObject);
begin
  gerar;
end;

procedure TFImporta.BitBtn2Click(Sender: TObject);
var marca, classe: string;
  codMarca, codClasse, codProduto, numClasse: Integer;
begin
  CdProduto.Close;
  CdProduto.Open;
  CdProduto.First;
  while not CdProduto.IsEmpty do
    CdProduto.Delete;

  CdMarca.Close;
  CdMarca.Open;
  CdMarca.First;
  while not CdMarca.IsEmpty do
    CdMarca.Delete;

  CdClasse.Close;
  CdClasse.Open;
  CdClasse.First;
  while not CdClasse.IsEmpty do
    CdClasse.Delete;

  CdClasse.Append;
  CdClasseCOD_CLASSE.Value := sequencia('SQCLASSE');
  CdClasseDESC_CLASSE.Value := 'TINTA';
  CdClasseNUM_CLASSE.Value := 1;
  CdClasseNUM_SUBCLASSE.Value := 0;
  CdClasse.Post;
  numClasse := 1;

  CdArquivo.First;
  while not CdArquivo.Eof do
  begin
    marca := Copy(CdArquivoMARCA.Value, Pos(' - ', CdArquivoMARCA.Value) + length(' - '), CdArquivoMARCA.Size);
    codMarca := localizaMarca(marca);
    if codMarca = -1 then
    begin
      codMarca := sequencia('SQMARCA');
      CdMarca.Append;
      CdMarcaCOD_MARCA.Value := codMarca;
      CdMarcaDESC_MARCA.Value := marca;
      CdMarca.Post;
    end;

    classe := Copy(CdArquivoCLASSE.Value, Pos(' - ', CdArquivoCLASSE.Value) + length(' - '), CdArquivoCLASSE.Size);
    codClasse := localizaClasse(classe);
    if codClasse = -1 then
    begin
      codClasse := sequencia('SQCLASSE');
      CdClasse.Append;
      CdClasseCOD_CLASSE.Value := codClasse;
      CdClasseDESC_CLASSE.Value := classe;
      CdClasseNUM_CLASSE.Value := 1;
      CdClasseNUM_SUBCLASSE.Value := numClasse;
      Inc(numClasse);
      CdClasse.Post;
    end;

    CdProduto.Append;
    CdProdutoCOD_PRODUTO.Value := sequencia('SQPRODUTO');
    CdProdutoDESC_PRODUTO.Value := CdArquivoDESCRICAO.Value;
    CdProdutoCOD_CLASSE.Value := codClasse;
    CdProdutoCOD_MARCA.Value := codMarca;
    CdProdutoCOD_TRIBUTACAO.Value := 1;
    CdProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
    CdProdutoPERC_ISS.Value := 0;
    CdProdutoPERC_INSS.Value := 0;
    CdProdutoDESC_UNIDADE.Value := 'LT';
    CdProdutoNUM_EMBALAGEM.Value := StrToFloat(CdArquivoEMBALAGEM.Value);
    CdProdutoNUM_FABRICANTE.Value := CdArquivoCODBARRA.Value;
    CdProdutoNUM_GENERO_NCM.Value := CdArquivoNCM.Value;
    if Trim(CdArquivoPESO_BRUTO.Value) = '' then
      CdProdutoNUM_PESO_BRUTO.Value := 0
    else
      CdProdutoNUM_PESO_BRUTO.Value := StrToFloat(CdArquivoPESO_BRUTO.Value);
    if Trim(CdArquivoPESO_LIQUIDO.Value) = '' then
      CdProdutoNUM_PESO_LIQUIDO.Value := 0
    else
      CdProdutoNUM_PESO_LIQUIDO.Value := StrToFloat(CdArquivoPESO_LIQUIDO.Value);
    CdProduto.Post;

    CdArquivo.Next;
  end;
end;

procedure TFImporta.BitBtn3Click(Sender: TObject);
begin
  try
  CdMarca.ApplyUpdates(0);
  CdClasse.ApplyUpdates(0);
  CdProduto.ApplyUpdates(0);
  except
    OraS1.Rollback;
  end;
end;

function TFImporta.sequencia(seq: string): Integer;
begin
  QSeq.Close;
  QSeq.SetVariable('SEQ', seq);
  QSeq.Open;
  Result := QSeqVALOR.AsInteger;
end;

function TFImporta.localizaMarca(descricao: string): Integer;
begin
  CdMarca.First;
  if CdMarca.Locate('DESC_MARCA', descricao, []) then
    Result := CdMarcaCOD_MARCA.AsInteger
  else
    Result := -1;
end;

function TFImporta.localizaClasse(descricao: string): Integer;
begin
  CdClasse.First;
  if CdClasse.Locate('DESC_CLASSE', descricao, []) then
    Result := CdClasseCOD_CLASSE.AsInteger
  else
    Result := -1;
end;

function TFImporta.localizaProduto(descricao: string): Integer;
begin
  CdProduto.First;
  if CdProduto.Locate('DESC_PRODUTO', descricao, []) then
    Result := CdProdutoCOD_CLASSE.AsInteger
  else
    Result := -1;
end;

end.


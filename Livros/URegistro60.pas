unit URegistro60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, OracleData, OraTeste, ComCtrls,
  Mask;

type
  TFRegistro60 = class(TForm)
    PnFundo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    QImportado: TOracleDataSet1;
    QDelMestre: TOracleDataSet1;
    QDelAnalitico: TOracleDataSet1;
    QImportadoDT_EMISSAO: TDateTimeField;
    QImportadoCOD_REGISTRO_MESTRE: TIntegerField;
    QInsMestre: TOracleDataSet1;
    QInsAnalitico: TOracleDataSet1;
    QMaxMestre: TOracleDataSet1;
    QMaxAnalitico: TOracleDataSet1;
    BitBtn6: TBitBtn;
    QExpMestre: TOracleDataSet1;
    QExpAnalitico: TOracleDataSet1;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    QExpMestreCOD_REGISTRO_MESTRE: TIntegerField;
    QExpMestreDT_EMISSAO: TDateTimeField;
    QExpMestreDESC_SERIE: TStringField;
    QExpMestreNUM_SEQUENCIAL: TIntegerField;
    QExpMestreDESC_MODELO: TStringField;
    QExpMestreNUM_COO_INI: TIntegerField;
    QExpMestreNUM_COO_FIN: TIntegerField;
    QExpMestreNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QExpMestreNUM_REINICIO_OPRERACAO: TIntegerField;
    QExpMestreVAL_VENDA_BRUTA: TFloatField;
    QExpMestreVAL_TOTAL_GERAL: TFloatField;
    QExpAnaliticoCOD_REGISTRO_ANALITICO: TIntegerField;
    QExpAnaliticoDT_EMISSAO: TDateTimeField;
    QExpAnaliticoDESC_SERIE: TStringField;
    QExpAnaliticoIND_SITUACAO_TRIBUTARIA: TStringField;
    QExpAnaliticoVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QMaxMestreCODIGO: TFloatField;
    QMaxAnaliticoCODIGO: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure QInsMestrePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QInsAnaliticoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BitBtn6Click(Sender: TObject);
  private
    retorno: Integer;
    procedure LeArquivoTexto(Arquivo: string);
    function AjustaStr(str: string; tam: Integer): string;
    procedure GravaArquivoTexto(Arquivo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

function Bematech_FI_RelatorioTipo60Analitico: Integer; StdCall; External
'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Analitico';
function Bematech_FI_RelatorioTipo60Mestre: Integer; StdCall; External
'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Mestre';
function Bematech_FI_RegistrosTipo60: Integer; StdCall; External 'BEMAFI32.DLL'
Name 'Bematech_FI_RegistrosTipo60';
function Bematech_FI_VerificaImpressoraLigada: Integer; StdCall; External
'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';

var
  FRegistro60: TFRegistro60;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFRegistro60.BitBtn1Click(Sender: TObject);
var
  retorno: Integer;
begin
  //  retorno := Bematech_FI_VerificaImpressoraLigada;
  //  if retorno = 1 then
  //  Begin
  //    Bematech_FI_RegistrosTipo60;
  //    Sleep(2000);
  LeArquivoTexto('C:\Retorno.txt');
  //  End
  //  else
  //    MessageDlg('Impressora desligada ou com problema de comunicação.'+#13+#10+'Erro: ' + IntToStr(retorno), mtWarning, [mbOK], 0);

  MessageDlg('Importação concluída.', mtInformation, [mbOK], 0);
end;

procedure TFRegistro60.LeArquivoTexto(Arquivo: string);
var
  arq: TextFile;
  linha: string;
  numLinha: Integer;
begin
  AssignFile(arq, Arquivo);
  Reset(arq);
  ReadLn(arq, linha);

  DMOracle.DBCemapa.StartTransaction;

  QImportado.Close;
  QImportado.SetVariable('dt_emissao', StrToDate(Copy(linha, 10, 2) + '/' +
    Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4)));
  QImportado.Open;

  if (not QImportado.IsEmpty) then
  begin
    MessageDlg('Este dia já foi importado.', mtWarning, [mbOK], 0);
    Exit;

    //    QDelAnalitico.Close;
    //    QDelAnalitico.SetVariable('dt_emissao', StrToDate(Copy(linha, 10, 2) + '/' + Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4)));
    //    QDelAnalitico.ExecSQL;
    //
    //    QDelMestre.Close;
    //    QDelMestre.SetVariable('dt_emissao', StrToDate(Copy(linha, 10, 2) + '/' + Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4)));
    //    QDelMestre.ExecSQL;
  end;

  CloseFile(arq);
  AssignFile(arq, Arquivo);
  Reset(arq);

  while not Eof(arq) do
  begin
    ReadLn(arq, linha);

    if (copy(linha, 3, 1) = 'M') then
    begin
      QMaxMestre.Close;
      QMaxMestre.open;

      QInsMestre.Close;
      QInsMestre.SetVariable('COD_REGISTRO_MESTRE', QMaxMestreCODIGO.Value);
      QInsMestre.SetVariable('DT_EMISSAO', StrToDate(Copy(linha, 10, 2) + '/' +
        Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4)));
      QInsMestre.SetVariable('DESC_SERIE', Copy(linha, 12, 20));
      QInsMestre.SetVariable('NUM_SEQUENCIAL', StrToInt(Copy(linha, 32, 3)));
      QInsMestre.SetVariable('DESC_MODELO', Copy(linha, 35, 2));
      QInsMestre.SetVariable('NUM_COO_INI', StrToInt(Trim(Copy(linha, 37, 6))));
      QInsMestre.SetVariable('NUM_COO_FIN', StrToInt(Trim(Copy(linha, 43, 6))));
      QInsMestre.SetVariable('NUM_CONTADOR_REDUCAOZ', StrToInt(Trim(Copy(linha,
        49, 6))));
      QInsMestre.SetVariable('NUM_REINICIO_OPRERACAO', StrToInt(Trim(Copy(linha,
        55, 3))));
      QInsMestre.SetVariable('VAL_VENDA_BRUTA', StrToFloat(Trim(Copy(linha, 58,
        16))) / 100);
      QInsMestre.SetVariable('VAL_TOTAL_GERAL', StrToFloat(Trim(Copy(linha, 74,
        16))) / 100);
      QInsMestre.ExecSQL;
    end;
    if (copy(linha, 3, 1) = 'A') then
    begin
      QMaxAnalitico.Close;
      QMaxAnalitico.open;

      QInsAnalitico.Close;
      QInsAnalitico.SetVariable('COD_REGISTRO_ANALITICO',
        QMaxAnaliticoCODIGO.Value);
      QInsAnalitico.SetVariable('DT_EMISSAO', StrToDate(Copy(linha, 10, 2) + '/'
        + Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4)));
      QInsAnalitico.SetVariable('DESC_SERIE', Copy(linha, 12, 20));
      QInsAnalitico.SetVariable('IND_SITUACAO_TRIBUTARIA', Trim(Copy(linha, 32,
        4)));
      QInsAnalitico.SetVariable('VLR_ACUMULADO_TOTAL_PARCIAL',
        StrToFloat(Trim(Copy(linha, 36, 12))) / 100);
      QInsAnalitico.ExecSQL;
    end;
  end;

  DMOracle.DBCemapa.Commit;

  CloseFile(arq);
end;

procedure TFRegistro60.BitBtn2Click(Sender: TObject);
begin
  retorno := Bematech_FI_RelatorioTipo60Mestre;
  if retorno = 1 then
    MessageDlg('Arquivo gerado com sucesso.' + #13 + #10 + 'C:\RETORNO.TXT',
      mtWarning, [mbOK], 0)
  else
    MessageDlg('Erro: ' + IntToStr(retorno), mtWarning, [mbOK], 0);
end;

procedure TFRegistro60.BitBtn3Click(Sender: TObject);
begin
  retorno := Bematech_FI_RelatorioTipo60Analitico;

  if retorno = 1 then
    MessageDlg('Arquivo gerado com sucesso.' + #13 + #10 + 'C:\RETORNO.TXT',
      mtWarning, [mbOK], 0)
  else
    MessageDlg('Erro: ' + IntToStr(retorno), mtWarning, [mbOK], 0);
end;

procedure TFRegistro60.BitBtn4Click(Sender: TObject);
begin
  retorno := Bematech_FI_RegistrosTipo60;

  if retorno = 1 then
    MessageDlg('Arquivo gerado com sucesso.' + #13 + #10 + 'C:\RETORNO.TXT',
      mtWarning, [mbOK], 0)
  else
    MessageDlg('Erro: ' + IntToStr(retorno), mtWarning, [mbOK], 0);
end;

procedure TFRegistro60.BitBtn5Click(Sender: TObject);
begin
  retorno := Bematech_FI_VerificaImpressoraLigada;
  if retorno = 1 then
    MessageDlg('Impressora corretamente LIGADA.', mtWarning, [mbOK], 0)
  else
    MessageDlg('Impressora DESLIGADA ou com problema de conexão. Erro: ' +
      IntToStr(retorno), mtWarning, [mbOK], 0);
end;

procedure TFRegistro60.QInsMestrePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TFRegistro60.QInsAnaliticoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DMOracle.DBCemapa.Rollback;
end;

function TFRegistro60.AjustaStr(str: string; tam: Integer): string;
begin
  while Length(str) < tam do
    str := str + ' ';
  if Length(str) > tam then
    str := Copy(str, 1, tam);
  Result := str;
end;

procedure TFRegistro60.GravaArquivoTexto(Arquivo: string);
var
  arq: TextFile;
  dia, mes, ano: Word;
begin
  AssignFile(arq, Arquivo);
  Rewrite(arq);

  QExpMestre.Close;
  QExpMestre.SetVariable('dt_emissao_ini', StrToDate(MeDataIni.Text));
  QExpMestre.SetVariable('dt_emissao_fin', StrToDate(MeDataFin.Text));
  QExpMestre.Open;
  QExpMestre.First;

  while not QExpMestre.Eof do
  begin
    DecodeDate(QExpMestreDT_EMISSAO.Value, ano, mes, dia);

    Write(arq, '60');
    Write(arq, 'M');

    Write(arq, FormatFloat('0000', ano));
    Write(arq, FormatFloat('00', mes));
    Write(arq, FormatFloat('00', dia));
    Write(arq, AjustaStr(QExpMestreDESC_SERIE.Value, 20));
    Write(arq, FormatFloat('000', QExpMestreNUM_SEQUENCIAL.Value));
    Write(arq, AjustaStr(QExpMestreDESC_MODELO.Value, 2));
    Write(arq, FormatFloat('000000', QExpMestreNUM_COO_INI.Value));
    Write(arq, FormatFloat('000000', QExpMestreNUM_COO_FIN.Value));
    Write(arq, FormatFloat('000000', QExpMestreNUM_CONTADOR_REDUCAOZ.Value));
    Write(arq, FormatFloat('000', QExpMestreNUM_REINICIO_OPRERACAO.Value));
    Write(arq, FormatFloat('0000000000000000', QExpMestreVAL_VENDA_BRUTA.Value *
      100));
    Write(arq, FormatFloat('0000000000000000', QExpMestreVAL_TOTAL_GERAL.Value *
      100));
    Write(arq, AjustaStr('', 37));

    WriteLn(arq);

    QExpAnalitico.Close;
    QExpAnalitico.SetVariable('dt_emissao', QExpMestreDT_EMISSAO.Value);
    QExpAnalitico.Open;
    QExpAnalitico.First;

    while not QExpAnalitico.Eof do
    begin
      Write(arq, '60');
      Write(arq, 'A');
      Write(arq, FormatFloat('0000', ano));
      Write(arq, FormatFloat('00', mes));
      Write(arq, FormatFloat('00', dia));
      Write(arq, AjustaStr(QExpAnaliticoDESC_SERIE.Value, 20));
      Write(arq, AjustaStr(QExpAnaliticoIND_SITUACAO_TRIBUTARIA.Value, 4));
      Write(arq, FormatFloat('000000000000',
        QExpAnaliticoVLR_ACUMULADO_TOTAL_PARCIAL.Value * 100));
      Write(arq, AjustaStr('', 79));

      WriteLn(arq);
      QExpAnalitico.Next;
    end;

    QExpMestre.Next;
  end;
  CloseFile(arq);
  QExpMestre.Close;
  QExpAnalitico.Close;
end;

procedure TFRegistro60.BitBtn6Click(Sender: TObject);
begin
  GravaArquivoTexto('C:\Tipo60Exp.txt');
end;

end.


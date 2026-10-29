unit UArquivoFCI;

interface

uses
  SysUtils, Mask, Controls, StdCtrls, Classes, DBCtrls, IniFiles, Variants,
  DBPanel, ComCtrls, Graphics, OraTeste, DBClient, SvcMgr,
  IdHashMessageDigest, idHash, DB, Oracle, Dialogs, Forms;

type
  TArquivoFCI = class
  private
    procedure Executa;
    procedure GeraArquivo(pQuery: TOracleDataSet1);
    procedure Finaliza;
  public
    wCaminhoArquivo: String;
    wArquivo: TextFile;
    procedure Inicializa(pCodNotaCab: Integer);
  end;

var
  ArquivoFCI: TArquivoFCI;

implementation

uses UFCI_cl, UOracle_cl;


{ TArquivoFCI }

procedure TArquivoFCI.Executa;
var
  i: Integer;
  j: Integer;
begin
  with DMFCI do
  begin
    //Ordena as querys através da propriedade Tag para que sejam
    //enviadas em ordem para a procedure GeraArquivo
    for i := 0 to ComponentCount-1 do
    begin
      for j:= 0 to ComponentCount-1 do
      begin
        if Components[j].ClassType = TOracleDataSet1 then
          if Components[j].Tag = i then
          begin
            //chamar GeraArquivo passando query
            GeraArquivo(TOracleDataSet1(Components[j]));
          end;
      end;
    end;
  end;
  Finaliza;
end;

procedure TArquivoFCI.Finaliza;
begin
  CloseFile(wArquivo);
end;

procedure TArquivoFCI.GeraArquivo(pQuery: TOracleDataSet1);
var
  i: Integer;
begin
  pQuery.First;
  while not pQuery.Eof do
  begin
    for i:=0 to pQuery.FieldCount-1 do
    begin
      try
        if pQuery.Fields[i].FieldName = 'TIPO_REGISTRO' then
          if pQuery.Fields[i].Value = '0000' then
            Write(wArquivo, AnsiToUtf8(pQuery.Fields[i].Value))
          else
            Write(wArquivo, #13#10+ AnsiToUtf8(pQuery.Fields[i].Value))
        else
          Write(wArquivo, AnsiToUtf8('|'+pQuery.Fields[i].Text));
      Except
        Finaliza;
      end;
    end;
    pQuery.Next;
  end;

end;

procedure TArquivoFCI.Inicializa(pCodNotaCab: Integer);
var
  wNumNota: String;
begin

  wNumNota := DMOracle.FastSelect('NUM_NOTA','TB_NOTA_CAB',
    'COD_NOTA_CAB = ' + IntToStr(pCodNotaCab));
  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'FCI\') then
    CreateDir(ExtractFilePath(Application.ExeName)+'FCI\');

  DateSeparator := Char('.');

  wCaminhoArquivo := ExtractFilePath(Application.ExeName)+'FCI\'+
    wNumNota+'_' + DateToStr(DMOracle.DataServ) +'.txt';

  with DMFCI do
  begin
    QReg0000.Close;
    QReg0000.SetVariable('COD_NOTA_CAB',pCodNotaCab);
    QReg0000.Open;
    if QReg0000.RecordCount > 0 then
    begin
      QReg0001.Close;
      QReg0001.Open;

      QReg0010.Close;
      QReg0010.SetVariable('COD_NOTA_CAB',pCodNotaCab);
      QReg0010.Open;

      QReg0990.Close;
      QReg0990.Open;

      QReg5001.Close;
      QReg5001.Open;

      QReg5020.Close;
      QReg5020.SetVariable('COD_NOTA_CAB',pCodNotaCab);
      QReg5020.Open;

      QReg5990.Close;
      QReg5990.SetVariable('COD_NOTA_CAB',pCodNotaCab);
      QReg5990.Open;

      QReg9001.Close;
      QReg9001.Open;

      QReg9900.Close;
      QReg9900.SetVariable('COD_NOTA_CAB',pCodNotaCab);
      QReg9900.Open;

      QReg9990.Close;
      QReg9990.Open;

      QReg9999.Close;
      QReg9999.SetVariable('COD_NOTA_CAB',pCodNotaCab);
      QReg9999.Open;

      AssignFile(wArquivo,wCaminhoArquivo);
      Rewrite(wArquivo);
      //Força o arquivo para o padrão UTF-8
      Write(wArquivo, #239+#187+#191);
      Executa;
    end;

  end;
end;

end.

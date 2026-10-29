unit UImportaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFImportaDados = class(TForm)
    BtnExportarSyngenta: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    procedure BtnExportarSyngentaClick(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function LimpaString(wString, wRetirar: String): String;
    function CortaStr(str: String; tam: Integer): String;
    function AjustaStr(str: String; tam: Integer): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaDados: TFImportaDados;

implementation

uses UImportaDados_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFImportaDados.BtnExportarSyngentaClick(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaSKU.Close;
    QExpSyngentaSKU.SetVariable('DT_RECEBIMENTO_INI', Date);
    QExpSyngentaSKU.SetVariable('DT_RECEBIMENTO_FIN', Date);
    QExpSyngentaSKU.SetVariable('NUM_CLASSE', Null);
    QExpSyngentaSKU.SetVariable('NUM_SUBCLASSE', Null);
    QExpSyngentaSKU.SetVariable('COD_CADASTRO', 106);
    QExpSyngentaSKU.SetVariable('COD_FILIAL', Null);
    QExpSyngentaSKU.open;
    QExpSyngentaSKU.First;

    AssignFile(arq, 'C:\Integrator\Upload\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-' + FormatDateTime('yyyymmdd', Date) + '_MOVIM_SKU.txt');
    Rewrite(arq);

    while not QExpSyngentaSKU.Eof do
    Begin
      Write(arq, QExpSyngentaSKUNUM_FABRICANTE.Value + ';');
      Write(arq, LimpaString(LimpaString(LimpaString(QExpSyngentaSKUFILIAL_ESTOQUE.Value, '-'), '/'), '.') + ';');
      Write(arq, FormatDateTime('yyyymmdd', QExpSyngentaSKUDT_RECEBIMENTO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_VENDA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_VENDA_ESTORNO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVAL_PRECO_UNITARIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVAL_MARGEM_UNITARIA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_TRANFERENCIA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_TRANFERENCIA_ESTORNO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVL_CUSTO_MEDIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_ESTOQUE.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUFALTA_ESTOQUE.Value));
      Writeln(arq);

      QExpSyngentaSKU.Next;
    End;

    CloseFile(arq);
  End;
end;

procedure TFImportaDados.BitBtn18Click(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaDFU.Close;
    QExpSyngentaDFU.SetVariable('DT_RECEBIMENTO_INI', Date);
    QExpSyngentaDFU.SetVariable('DT_RECEBIMENTO_FIN', Date);
    QExpSyngentaDFU.SetVariable('NUM_CLASSE', Null);
    QExpSyngentaDFU.SetVariable('NUM_SUBCLASSE', Null);
    QExpSyngentaDFU.SetVariable('COD_CADASTRO', 106);
    QExpSyngentaDFU.SetVariable('COD_FILIAL', Null);
    QExpSyngentaDFU.open;
    QExpSyngentaDFU.First;

    AssignFile(arq, 'C:\Integrator\Upload\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-' + FormatDateTime('yyyymmdd', Date) + '_MOVIM_DFU.txt');
    Rewrite(arq);

    while not QExpSyngentaDFU.Eof do
    Begin
      Write(arq, QExpSyngentaDFUNUM_FABRICANTE.Value + ';');
      Write(arq, CortaStr(LimpaString(LimpaString(LimpaString(QExpSyngentaDFUFILIAL_ESTOQUE.Value, '-'), '/'), '.'), 20) + ';');
      Write(arq, CortaStr(UpperCase(LimpaString(LimpaString(QExpSyngentaDFUDESC_CIDADE.Value, ';'), ' ')), 20) + ';');
      Write(arq, FormatDateTime('yyyymmdd', QExpSyngentaDFUDT_RECEBIMENTO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUQT_VENDA.Value) + ';');
      Write(arq, FormatFloat('#0.00', 0) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUVAL_PRECO_UNITARIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUVAL_MARGEM_UNITARIA.Value) + ';');
      Write(arq, LimpaString(LimpaString(LimpaString(QExpSyngentaDFUFILIAL_ESTOQUE.Value, '-'), '/'), '.'));
      Writeln(arq);

      QExpSyngentaDFU.Next;
    End;

    CloseFile(arq);
  End;
end;

procedure TFImportaDados.BitBtn19Click(Sender: TObject);
var arq: TextFile;
seq, anterior: Integer;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaNF.Close;
    QExpSyngentaNF.SetVariable('DT_RECEBIMENTO_INI', Date);
    QExpSyngentaNF.SetVariable('DT_RECEBIMENTO_FIN', Date);
    QExpSyngentaNF.SetVariable('NUM_CLASSE', Null);
    QExpSyngentaNF.SetVariable('NUM_SUBCLASSE', Null);
    QExpSyngentaNF.SetVariable('COD_CADASTRO', 106);
    QExpSyngentaNF.SetVariable('COD_FILIAL', Null);
    QExpSyngentaNF.open;
    QExpSyngentaNF.First;

    AssignFile(arq, 'C:\Integrator\Upload\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-EXCLUSAONF-' + FormatDateTime('yyyymmdd', Date) + '_LIN_PED_COLOCADO.txt');
    Rewrite(arq);

    seq := 1;
    anterior := 0;

    while not QExpSyngentaNF.Eof do
    Begin
      if QExpSyngentaNFNUM_NOTA.Value = anterior then
        Inc(seq)
      else
        seq := 1;

      Write(arq, 'E;');
      Write(arq, FormatFloat('000000000000', QExpSyngentaNFNUM_NOTA.Value));
      Write(arq, FormatFloat('00000000', seq) + ';');
      Write(arq, ';');
      Write(arq, '29991231;');
      Write(arq, ';');
      Write(arq, '1;');
      Write(arq, QExpSyngentaNFNUM_FABRICANTE.Value + ';');
      Write(arq, CortaStr(LimpaString(LimpaString(LimpaString(QExpSyngentaNFFILIAL_ESTOQUE.Value, '-'), '/'), '.'), 20) + ';');
      Write(arq, '29991231;');
      Write(arq, '0,000;');
      Write(arq, '0,000;');
      Write(arq, ';');
      Write(arq, ';');
      Write(arq, ';');
      Write(arq, '29991231;');
      Write(arq, '0,000;');
      Write(arq, '0,000;');
      Write(arq, 'SYNGENTA');
      Writeln(arq);

      anterior := QExpSyngentaNFNUM_NOTA.Value;
      QExpSyngentaNF.Next;
    End;

    CloseFile(arq);
  End;
end;

procedure TFImportaDados.FormCreate(Sender: TObject);
begin
  if not DirectoryExists('C:\Integrator\') then
    CreateDir('C:\Integrator\');
  if not DirectoryExists('C:\Integrator\Upload\') then
    CreateDir('C:\Integrator\Upload\');

  BtnExportarSyngenta.Click;
  BitBtn18.Click;
  BitBtn19.Click;

  Application.Terminate;
end;

Function TFImportaDados.LimpaString(wString, wRetirar:String):String;
Var wCont, wCont2 : Integer;
    wRetorno  : String;
    wOk : Boolean;
Begin
  wRetorno := '';
  For wCont := 1 to Length(wString) do
  Begin
    wOk := True;
    For wCont2 := 1 to Length(wRetirar) do
    Begin
      If wString[wCont] = wRetirar[wCont2] then
        wOk := False;
    End;
    If wOk = True then
      wRetorno := wRetorno + wString[wCont];
  End;
  Result := wRetorno;
End;

function TFImportaDados.CortaStr(str: String; tam: Integer): String;
begin
  Result := Trim(AjustaStr(str, tam));
end;

function TFImportaDados.AjustaStr ( str: String; tam: Integer ): String;
begin
  while Length ( str ) < tam do
    str := str + ' ';
  if Length ( str ) > tam then
    str := Copy ( str, 1, tam );
  Result := str;
end;

end.

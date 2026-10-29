unit UProdutoRelatorio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMProdutoRelatorio = class(TDataModule)
    procedure ImprimeEtiquetaZebra(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra2(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebraOsare(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebraDisam(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra3x6(DataSet: TClientDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoRelatorio: TDMProdutoRelatorio;

implementation

{$R *.DFM}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';
function A_Feed_Label():integer;stdcall;external 'WINPPLA.DLL';
function A_GetUSBDeviceInfo(nPort:integer; pDeviceName:PAnsiChar; pDeviceNameLen:PInteger;
              pDevicePath:PAnsiChar; pDevicePathLen:PInteger):integer;stdcall;external 'WINPPLA.DLL';
function  A_EnumUSB(buf:PAnsiChar):integer;stdcall;external 'WINPPLA.DLL';
function  A_GetUSBBufferLen():integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Backfeed(back:integer):integer;stdcall;external 'WINPPLA.DLL';


procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra(DataSet: TClientDataSet);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
Begin
  wImprimir := True;  // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wControla_Ultima_Linha := False;
  wDuasColunas := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  A_Set_Darkness(12);
  wEmpresa := 'N A P O L I';
  DataSet.First;
  wColuna := 1;
  while ( not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin        //030
        A_Prn_Text(020, 070, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
//        A_Prn_Text(013, 048, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        A_Prn_Text(010, 051, 1, 1, 0, 1, 3, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,24)));
        if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 24 then
          A_Prn_Text(010, 035, 1, 1, 0, 1, 3, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,25,24)));
        If DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
//          A_Prn_Text(007, 035, 1, 1, 0, 1, 2, 'n', 2,pchar('Cod. '+ DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Text(010, 022, 1, 1, 0, 1, 2, 'n', 2,pchar('Qtd. '+ DataSet.FieldByName('COD_PRODUTO').AsString));
        If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
           A_Prn_Text(010, 004, 1, 1, 0, 2, 3, 'n', 2,pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat) +
                                              ' ' + DataSet.FieldByName('DESC_UNIDADE').AsString));
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin
        A_Prn_Text(160, 070, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
//        A_Prn_Text(155, 048, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        A_Prn_Text(155, 051, 1, 1, 0, 1, 3, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,24)));
        if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          A_Prn_Text(155, 035, 1, 1, 0, 1, 3, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,25,24)));
        If DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
           A_Prn_Text(155, 022, 1, 1, 0, 1, 2, 'n', 2,pchar('Qtd. '+ DataSet.FieldByName('COD_PRODUTO').AsString));
        If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
           A_Prn_Text(155, 004, 1, 1, 0, 2, 3, 'n', 2,pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat) +
                                               ' ' + DataSet.FieldByName('DESC_UNIDADE').AsString));
      end;
      if wColuna = 3 then
      begin
        if not wDuasColunas then
        begin
          A_Prn_Text(305, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
//          A_Prn_Text(298, 048, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
          A_Prn_Text(296, 051, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,24)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
            A_Prn_Text(296, 035, 1, 1, 0, 1, 3, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,25,24)));
          If DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
             A_Prn_Text(296, 022, 1, 1, 0, 1, 2, 'n', 2, pchar('Qtd. '+ DataSet.FieldByName('COD_PRODUTO').AsString));
          If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
             A_Prn_Text(296, 004, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat) +
                                              ' '+ DataSet.FieldByName('DESC_UNIDADE').AsString));
//        A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
        end;
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      end;

      Inc(wColuna);

      if wColuna > 3 then
       Begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
       End;
    end
    else
    begin

      AssignFile(ArqTeste, 'c:\etiquetas.txt');
      if DataSet.RecNo = 1 then
        Rewrite(ArqTeste)
      else
        Append(ArqTeste);
      Writeln(ArqTeste, IntToStr(DataSet.RecNo) + ' '+wEmpresa);
      Writeln(ArqTeste, DataSet.FieldByName('DESC_PRODUTO').AsString);
      Writeln(ArqTeste, 'Cod. '+ DataSet.FieldByName('COD_PRODUTO').AsString);
      Writeln(ArqTeste, 'R$ ' + DataSet.FieldByName('VAL_PRODUTO').AsString);
      Writeln(ArqTeste, '                                            ');
      CloseFile(ArqTeste);
    end;
    if ((wColuna <> 3) and (wDuasColunas)) or (not wDuasColunas) then
      DataSet.Next;
  end;
  If wImprimir Then
    If wControla_Ultima_Linha Then
      if wDuasColunas then
      begin
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
      begin
       A_Set_Backfeed(320);
       A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      end;
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra2(DataSet: TClientDataSet);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg, wEmpresa : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
Begin
  wEmpresa := '';
  wImprimir := True;  // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        //A_Prn_Text(030, 070, 1, 1, 0, 1, 2, 'n', 2,pchar('coluna1'));
        A_Prn_Text(013, 055, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        if DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
          A_Prn_Barcode(013, 006, 1, 'E', 0, 1, 22, 'N', 0, pchar(DataSet.FieldByName('COD_PRODUTO').asstring));  //30
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin
        //A_Prn_Text(185, 070, 1, 1, 0, 1, 2, 'n', 2,pchar('coluna2'));
        A_Prn_Text(152, 055, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        If DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
          A_Prn_Barcode(152, 006, 1, 'E', 0, 1, 22, 'N', 0, pchar(DataSet.FieldByName('COD_PRODUTO').asstring)); //177
      end;
      if wColuna = 3 then
      begin
        //A_Prn_Text(313, 070, 1, 1, 0, 1, 2, 'n', 2, pchar('coluna3'));
        A_Prn_Text(296, 055, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        If DataSet.FieldByName('COD_PRODUTO').AsString <> '' Then
          A_Prn_Barcode(296, 006, 1, 'E', 0, 1, 22, 'N', 0, pchar(DataSet.FieldByName('COD_PRODUTO').asstring));  //320
        //A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      end;

      Inc(wColuna);

      if wColuna > 3 then
       Begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
         A_Print_Out(1, 1, 1, 1);
       End;
    end;
    if (wColuna <> 3) then
      DataSet.Next;
  end;
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebraOsare(DataSet: TClientDataSet);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
Begin
  wImprimir := True;  // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wControla_Ultima_Linha := False;
  wDuasColunas := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  wEmpresa := 'PROMOCAO';
  DataSet.First;
  wColuna := 1;
  while ( not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
        begin
          if dataset.FieldByName('TIPO_VALOR').AsString = '0' then
          begin
            A_Prn_Text(030, 070, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
            A_Prn_Text(030, 022, 1, 1, 0, 2, 8, 'n', 2,pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat)));
            A_Prn_Text(030, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'));
          end
          else
          begin
            A_Prn_Text(025, 060, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
            A_Prn_Text(035, 012, 1, 1, 0, 2, 8, 'n', 2,pchar(DataSet.FieldByName('VAL_PRODUTO').AsString + '% av'));
            //A_Prn_Text(040, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'));
          end;
        end;
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin

        If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
        begin
          if dataset.FieldByName('TIPO_VALOR').AsString = '0' then
          begin
            A_Prn_Text(170, 070, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
            A_Prn_Text(165, 022, 1, 1, 0, 2, 8, 'n', 2,pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat)));
            A_Prn_Text(165, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'));
          end
          else
          begin
            A_Prn_Text(170, 060, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
            A_Prn_Text(180, 012, 1, 1, 0, 2, 8, 'n', 2,pchar(DataSet.FieldByName('VAL_PRODUTO').AsString + '% av'));
            //A_Prn_Text(165, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'));
          end;
        end;
      end;
      if wColuna = 3 then
      begin
        if not wDuasColunas then
        begin

          If DataSet.FieldByName('VAL_PRODUTO').AsString <> '' Then
          begin
            if dataset.FieldByName('TIPO_VALOR').AsString = '0' then
            begin
              A_Prn_Text(313, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
              A_Prn_Text(305, 022, 1, 1, 0, 2, 8, 'n', 2, pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_PRODUTO').AsFloat)));
              A_Prn_Text(305, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'))
            end
            else
            begin
              A_Prn_Text(313, 060, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
              A_Prn_Text(323, 012, 1, 1, 0, 2, 8, 'n', 2, pchar(DataSet.FieldByName('VAL_PRODUTO').AsString + '% av'));
              //A_Prn_Text(305, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('A VISTA'));
            end;
          end;
          A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
        end;
      end;

      Inc(wColuna);

      if wColuna > 3 then
       Begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
       End;
    end
    else
    begin

      AssignFile(ArqTeste, 'c:\etiquetas.txt');
      if DataSet.RecNo = 1 then
        Rewrite(ArqTeste)
      else
        Append(ArqTeste);
      Writeln(ArqTeste, IntToStr(DataSet.RecNo) + ' '+wEmpresa);
      Writeln(ArqTeste, DataSet.FieldByName('DESC_PRODUTO').AsString);
      Writeln(ArqTeste, 'Cod. '+ DataSet.FieldByName('COD_PRODUTO').AsString);
      Writeln(ArqTeste, 'R$ ' + DataSet.FieldByName('VAL_PRODUTO').AsString);
      Writeln(ArqTeste, '                                            ');
      CloseFile(ArqTeste);
    end;
    if ((wColuna <> 3) and (wDuasColunas)) or (not wDuasColunas) then
      DataSet.Next;
  end;
  If wImprimir Then
    If wControla_Ultima_Linha Then
      if wDuasColunas then
      begin
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
       A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebraDisam(DataSet: TClientDataSet);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
   ArqTeste: TextFile;
Begin
  wEmpresa := 'DISAM MAQUINAS';
  wImprimir := True;  // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wControla_Ultima_Linha := False;
  wDuasColunas := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  A_Set_Darkness(13);
  DataSet.First;
  wColuna := 1;
  while ( not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        A_Prn_Text(012, 068, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
        A_Prn_Text(014, 050, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));//005
        If DataSet.FieldByName('COD_ORIGINAL').AsString <> '' Then
          A_Prn_Text(014, 025, 1, 2, 0, 1, 2, 'n', 2,pchar(DataSet.FieldByName('COD_ORIGINAL').AsString));
        If DataSet.FieldByName('DESC_LOCALIZACAO').AsString <> '' Then
          A_Prn_Text(014, 009, 1, 1, 0, 1, 2, 'n', 2,pchar('Loc:' + Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,28)));
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin
        A_Prn_Text(153, 068, 1, 1, 0, 2, 2, 'n', 2,pchar(wEmpresa));
        A_Prn_Text(155, 050, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
        If DataSet.FieldByName('COD_ORIGINAL').AsString <> '' Then
          A_Prn_Text(155, 025, 1, 2, 0, 1, 2, 'n', 2,pchar(DataSet.FieldByName('COD_ORIGINAL').AsString));
        If DataSet.FieldByName('DESC_LOCALIZACAO').AsString <> '' Then
          A_Prn_Text(155, 009, 1, 1, 0, 1, 2, 'n', 2,pchar('Loc:' + Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,28)));
      end;
      if wColuna = 3 then
      begin
        if not wDuasColunas then
        begin
          A_Prn_Text(294, 068, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(297, 050, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,28)));
          If DataSet.FieldByName('COD_ORIGINAL').AsString <> '' Then
            A_Prn_Text(297, 025, 1, 2, 0, 1, 2, 'n', 2, pchar(DataSet.FieldByName('COD_ORIGINAL').AsString));
          If DataSet.FieldByName('DESC_LOCALIZACAO').AsString <> '' Then
            A_Prn_Text(297, 009, 1, 1, 0, 1, 2, 'n', 2,pchar('Loc:' + Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,28)));
        end;
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      end;

      Inc(wColuna);

      if wColuna > 3 then
       Begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
       End;
    end
    else
     begin

      AssignFile(ArqTeste, 'c:\etiquetas.txt');
      if DataSet.RecNo = 1 then
        Rewrite(ArqTeste)
      else
        Append(ArqTeste);
      Writeln(ArqTeste, IntToStr(DataSet.RecNo) + ' '+wEmpresa);
      Writeln(ArqTeste, DataSet.FieldByName('DESC_PRODUTO').AsString);
      Writeln(ArqTeste, 'Cod. '+ DataSet.FieldByName('COD_PRODUTO').AsString);
      Writeln(ArqTeste, 'R$ ' + DataSet.FieldByName('VAL_PRODUTO').AsString);
      Writeln(ArqTeste, '                                            ');
      CloseFile(ArqTeste);
    end;
    if ((wColuna <> 3) and (wDuasColunas)) or (not wDuasColunas) then
      DataSet.Next;
  end;
  If wImprimir Then
    If wControla_Ultima_Linha Then
      if wDuasColunas then
      begin
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
      begin
       A_Set_Backfeed(320);
       A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      end;
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra3x6(DataSet: TClientDataSet);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
Begin
  wImprimir := True;  // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wControla_Ultima_Linha := False;
  wDuasColunas := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  A_Set_Darkness(13);
  DataSet.First;
//  wColuna := 1;
  while ( not Dataset.Eof) do
  begin
      A_Prn_Text(20, 145, 1, 1, 0, 3, 2, 'n', 2,'Saboaria');
      A_Prn_Text(60, 123, 1, 1, 0, 3, 2, 'n', 2,'EspumArte');
      A_Prn_Text(08, 090, 1, 1, 0, 2, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESCRICAO1').AsString,1,50)));
      A_Prn_Text(08, 065, 1, 1, 0, 2, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESCRICAO2').AsString,1,50)));
      A_Prn_Text(08, 035, 1, 1, 0, 2, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESCRICAO3').AsString,1,50)));
      A_Set_Backfeed(320);
      A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
      DataSet.Next;
  end;
  A_ClosePrn;
end;


end.

unit UEtiquetaCodCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TFEtiquetaCodCartao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MeInicial: TMaskEdit;
    MeFinal: TMaskEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEtiquetaCodCartao: TFEtiquetaCodCartao;

implementation

uses StrUtils;

{$R *.dfm}

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

procedure TFEtiquetaCodCartao.BitBtn1Click(Sender: TObject);
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
  wInicial, wFinal, wCount: Integer;
Begin
  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);
  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.
  A_Set_Darkness(8); 
  if (Trim(MeInicial.Text) = '') or (Trim(MeFinal.Text) = '') then
  begin                        //A - aparecer o número abaixo do cod barras - a - nao aparecer o numero abaixo do cod barras
    A_Prn_Barcode(003, 020, 1, 'a', 0, 0, 40, 'N', 0, pchar(Trim(MaskEdit1.Text)));//altura 006
    A_Prn_Barcode(145, 020, 1, 'a', 0, 0, 40, 'N', 0, pchar(Trim(MaskEdit2.Text)));//162
    A_Prn_Barcode(290, 020, 1, 'a', 0, 0, 40, 'N', 0, pchar(Trim(MaskEdit3.Text)));//305
    A_Print_Out(1, 1, 1, 1);  // aqui manda para a impressora
  end
  else
  begin
    wColuna := 1;
    wInicial := StrToInt('0' + MeInicial.Text);
    wFinal := StrToInt('0' + MeFinal.Text);
    wCount := wInicial;
    while wCount <= wFinal do
    begin
      if wColuna = 1 then
      begin
          A_Prn_Barcode(020, 006, 1, 'A', 0, 0, 50, 'N', 0, pchar(LeftStr('P000',4 - Length(IntToStr(wCount))) + IntToStr(wCount)));

        wControla_Ultima_Linha := True;
      end;

      if (wColuna = 2) then
          A_Prn_Barcode(162, 006, 1, 'A', 0, 0, 50, 'N', 0, pchar(LeftStr('P000',4 - Length(IntToStr(wCount))) + IntToStr(wCount)));

      if (wColuna = 3) then
          A_Prn_Barcode(305, 006, 1, 'A', 0, 0, 50, 'N', 0, pchar(LeftStr('P000',4 - Length(IntToStr(wCount))) + IntToStr(wCount)));
          
      wCount := wCount + 1;
      Inc(wColuna);

      if wColuna > 3 then
       Begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
         A_Print_Out(1, 1, 1, 1);
       End;
    end;
  end;
  A_ClosePrn;
end;

end.

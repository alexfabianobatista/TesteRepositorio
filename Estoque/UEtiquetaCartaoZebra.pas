unit UEtiquetaCartaoZebra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ShellApi;

type
  TFEtiquetaCartaoZebra = class(TForm)
    Label1: TLabel;
    MeInicial: TMaskEdit;
    Label2: TLabel;
    MeFinal: TMaskEdit;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEtiquetaCartaoZebra: TFEtiquetaCartaoZebra;

implementation

uses UParamSistema_cl, UUsuario_cl, StrUtils;

{$R *.dfm}

procedure TFEtiquetaCartaoZebra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFEtiquetaCartaoZebra.BitBtn1Click(Sender: TObject);
var
  wContEtiquetas, i, wQtdEtiquetas: integer;
  wString : TStringList;
const
  arquivo = 'C:\Temp\etiqueta.prn';
begin
  inherited;
  DMUsuario.QUsuario.Open;
  wString := TStringList.create;
  wString.clear;

    if (Trim(DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text) = '') then
    raise exception.Create('Configure a sua impressora Zebra no Cadastro de Usúario. Ex.:\\localhost\nomeimpressora');

   if (Trim(MeInicial.Text) <> '') or (Trim(MeFinal.Text) <> '') then
   begin
     i := strToInt(Trim(MeInicial.Text));
     while I <= (StrToInt(MeFinal.Text)) do
     begin
          wString.Add('I8,A,001');
          wString.Add('');
          wString.Add('');
          wString.Add('Q176,024');
          wString.Add('q831');
          wString.Add('rN');
          wString.Add('S3');
          wString.Add('D8');
          wString.Add('ZT');
          wString.Add('JF');
          wString.Add('O');
          wString.Add('R0,0');
          wString.Add('f100');
          wString.Add('N');

          //1 coluna
          if i <= strToInt(Trim(MeFinal.Text)) then
          begin
            wString.Add('B215,110,2,1,2,6,34,B,"'+(LeftStr('P000',4 - Length(IntToStr(i))) + IntToStr(i))+'"');//depois B809
          end;


          //2 coluna
          if (i+1) <= strToInt(Trim(MeFinal.Text)) then
          begin
            wString.Add('B510,110,2,1,2,6,34,B,"'+(LeftStr('P000',4 - Length(IntToStr(i+1))) + IntToStr(i+1))+'"');
          end;

          //3 coluna
          if (i+2) <= strToInt(Trim(MeFinal.Text)) then
          begin
            wString.Add('B794,110,2,1,2,6,34,B,"'+(LeftStr('P000',4 - Length(IntToStr(i+2))) + IntToStr(i+2))+'"');//B235
          end;

          i := i + 3;

          wString.Add('P1');
        end;
    end;

    try
      wString.SaveToFile(arquivo);
      ShellExecute(Handle, 'open', PChar('cmd.exe'), PChar('/c type '+ arquivo +' > '+ DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text), nil, SW_HIDE);
    finally
      Sleep(1000); //estava 500
      wString.Clear;
    if FileExists(arquivo) then
      DeleteFile(arquivo);
    end;
  DMUsuario.QUsuario.Close;
end;

end.

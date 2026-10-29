unit UTesteImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uCharPrinter;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ContadorX, ContadorY, i, aux: integer;
  Extenso1, Extenso2, Mascara, wPorta: string;
  Ano, Mes: string;
  MyFile: TextFile;
begin

    ContadorX := 1;
    wPorta := 'LPT1';
    AssignFile(MyFile, '\' + wPorta);
{$I-}

    Reset(MyFile);
{$I+}

    if IOResult <> 0 then
      ShowMessage('Erro ! Impressora não localizada na porta ' + wPorta)
    else
    begin
      Rewrite(MyFile);
      Extenso1 := '';
      Extenso2 := '';
      Write(MyFile, #27#71);
      for i := 1 to 24 do
      begin
//              Writeln(MyFile,#27#15+' ');
        Writeln(MyFile, '11111111111111111111111111111111111111111111111111111 ');
      end;
//        Write(MyFile, #27#18);
      CloseFile(MyFile);
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
  prn: TAdvancedPrinter;
  dlgPrinter: TPrintDialog;
begin

  dlgPrinter:=TPrintDialog.Create(nil);

  if dlgPrinter.Execute then
  begin

    prn := TAdvancedPrinter.Create;
    prn.OpenDoc('docnotempodoslpool');

    for i := 0 to 9 do
    begin
      prn.SendData('Seu Texto ' + IntToStr(i));
      prn.CR;
      prn.LF;
    end;
    prn.Free;
  end;
  dlgPrinter.Free;


end;

end.

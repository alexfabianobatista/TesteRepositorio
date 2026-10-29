unit UBalanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,dbCtrls,Grids,StdCtrls,Mask, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EdPeso: TEdit;
    BitBtn1: TBitBtn;
    EdLiquido: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Function ConfiguraRs(Porta:String):Integer; StdCall; External 'c:\geraexe\peso32.dll';
  Function LePeso(Parametro:String):Integer; StdCall; External 'c:\geraexe\peso32.dll';
var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
Var Porta, ConfigRs, Velocidade, Paridade, BitsdeDados,BitsdeParada:String;
    Str : String;
    i : Integer;
begin
  Porta := 'COM2';
  Velocidade := '9600';
  Paridade := 'N';
  BitsdeDados := '8';
  BitsdeParada := '2';
  ConfigRs := Porta + ':' + Velocidade + ',' + Paridade + ',' + BitsdeDados + ',' + BitsdeParada;
  ConfiguraRs(ConfigRs);
  //Captura Do peso
  Str := '';
  For I:=1 to 50 do
     Str := Str + chr(32);
  If LePeso(Str) <> 0 Then
     EdPeso.Text := Copy(Str,1,7)
  Else
    Begin
      EdPeso.Text := 'Instável';
      EdLiquido.Text := Copy(Str,1,6);
    End;
end;
end.

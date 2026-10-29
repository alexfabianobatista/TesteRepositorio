unit UColetorDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFColetorDados = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    EdCaminho: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FColetorDados: TFColetorDados;

implementation

{$R *.dfm}

procedure TFColetorDados.BitBtn2Click(Sender: TObject);
begin
  Showmessage('Você não está Autorizado a usar essa Opção! Não Mexa no que não Sabe!');
end;

procedure TFColetorDados.BitBtn3Click(Sender: TObject);
begin
  Showmessage('Você não está Autorizado a usar essa Opção! Não Mexa no que não Sabe!');
end;

procedure TFColetorDados.BitBtn4Click(Sender: TObject);
begin
  Showmessage('Você não está Autorizado a usar essa Opção! Não Mexa no que não Sabe!');
end;

procedure TFColetorDados.BitBtn5Click(Sender: TObject);
begin
  Showmessage('Você não está Autorizado a usar essa Opção! Não Mexa no que não Sabe!');
end;

procedure TFColetorDados.BitBtn1Click(Sender: TObject);
var arq: TextFile;
  linha: string;

begin
  if OpenDialog1.Execute then
  begin
    EdCaminho.Text := OpenDialog1.FileName;
    AssignFile(arq, OpenDialog1.FileName);

    Reset(arq);
    while not Eof(arq) do
    begin
      ReadLn(arq, linha);

      //if Trim(linha) = '' then
     //   Continue;
     // if Trim(linha) = '* * * * *' then
     //   Exit;

     { if ((Pos('/', linha) <> 0) and (Pos('x', linha) <> 0)) then
      begin
        CdChapa.Append;
        CdChapaDESC_CHAPA.Value := Trim(linha);
        CdChapaCOD_CHAPA.Value := StrToInt(Trim(Copy(linha, 0, Pos('/', linha) - 1)));
        CdChapa.Post;

        wUltimaChapa := CdChapaCOD_CHAPA.Value;
      end
      else
        if Bib.isInteger(Trim(linha)) then
        begin
          CdPeca.Append;
          CdPecaCOD_CHAPA.Value := wUltimaChapa;
          CdPecaCOD_PECA.Value := StrToInt(Trim(linha));
          CdPeca.Post;
        end; }
    end;
    CloseFile(arq);
  end;
end;
end.

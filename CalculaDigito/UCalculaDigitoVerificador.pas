unit UCalculaDigitoVerificador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, Grids, DBGrids;

type
  TFCalculaDigito = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    DSConsulta: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  function CalculaIE(inscricao: string):String;
  public
    { Public declarations }
  end;

var
  FCalculaDigito: TFCalculaDigito;
  wDigito, wDigito1: string;

implementation

uses
 UCalculaDigito_cl;

{$R *.dfm}

procedure TFCalculaDigito.FormActivate(Sender: TObject);
begin
  inherited;
//  DMCalculaDigito.QCalculaDigito.Open;
  SBHelp.Visible := false;
end;

procedure TFCalculaDigito.BitBtn1Click(Sender: TObject);
var
 wAux : string;
 i, wNumero: integer;
begin
  inherited;
  for i := 1 to 10 do
  begin
    CalculaIE(Edit1.Text);
    wDigito1 := wDigito;
    wAux := Edit1.Text + wDigito;
    CalculaIE(wAux);
    Edit3.Text := Edit1.Text + wDigito1 + wDigito;
    BitBtn3Click(Sender);
    wNumero := StrToInt(Edit1.Text);
    wNumero := wNumero + 1;
    Edit1.Text := IntToStr(wNumero);
  end;
  ShowMessage('Inscrições geradas!');
  BitBtn2Click(Sender);
end;

function TFCalculaDigito.CalculaIE(inscricao: string): string;
var
  soma, peso, digito, i: Integer;
begin
  soma := 0;
  peso := 2;

  // Percorre os dígitos da inscrição invertida, da direita para a esquerda
  for i := Length(inscricao) downto 1 do
  begin
    soma := soma + (StrToInt(inscricao[i]) * peso);
    Inc(peso);
    if peso > 7 then
      peso := 2;
  end;

  digito := 11 - (soma mod 11);
  if digito >= 10 then
    digito := 0;

  Result := IntToStr(digito);
  wDigito := Result;
end;

procedure TFCalculaDigito.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Edit3.Clear;
  Edit2.Clear;
  Edit1.Clear;
  MaskEdit1.Clear;
  DMCalculaDigito.QCalculaDigitoCons.Close;
end;

procedure TFCalculaDigito.BitBtn3Click(Sender: TObject);
begin
  inherited;
  with DMCalculaDigito do
  begin
    try
      QCalculaDigito.Open;
      QCalculaDigito.Insert;
      QCalculaDigitoNUMERO.Text := Edit3.text;
      QCalculaDigitoEMAIL.Text := Edit2.Text;
      QCalculaDigitoTELEFONE.Text := MaskEdit1.Text;
    Except
      raise Exception.Create('Não foi possível salvar, confira os dados informados!');
    end;
    QCalculaDigito.Post;
  end;
end;

procedure TFCalculaDigito.BitBtn2Click(Sender: TObject);
begin
  inherited;
  DMCalculaDigito.QCalculaDigitoCons.Open;
end;

end.

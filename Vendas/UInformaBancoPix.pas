unit UInformaBancoPix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmBanco, ComCtrls, StdCtrls, Buttons, UFmContaCorrente;

type
  TFInformaBancoPix = class(TForm)
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BtCancelar: TBitBtn;
    FmContaCorrente1: TFmContaCorrente;
    procedure BtCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FmContaCorrente1BtContaCorrenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInformaBancoPix: TFInformaBancoPix;

implementation

uses UNotaSaida_cl, Mask;

{$R *.dfm}

procedure TFInformaBancoPix.BtCancelarClick(Sender: TObject);
begin
   ShowMessage('É necessário selecionar uma conta corrente quando o tipo de pagamento for PIX!');
   FInformaBancoPix.Close;
end;

procedure TFInformaBancoPix.BitBtn1Click(Sender: TObject);
begin
  DMNotasaida.LancaPagtoBancoPIX(TrimRight(FInformaBancoPix.FmContaCorrente1.MeContaCorrente.Text));
end;

procedure TFInformaBancoPix.FmContaCorrente1BtContaCorrenteClick(
  Sender: TObject);
begin
  FmContaCorrente1.BtContaCorrenteClick(Sender);
end;

end.

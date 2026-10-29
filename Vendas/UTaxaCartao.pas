unit UTaxaCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Math;

type
  TFTaxaCartao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    METaxa: TMaskEdit;
    Label2: TLabel;
    MEParcelas: TMaskEdit;
    Label3: TLabel;
    MEValor: TMaskEdit;
    Label4: TLabel;
    lbPorParcela: TLabel;
    Label5: TLabel;
    METaxaParcela: TMaskEdit;
    Label7: TLabel;
    lbTotal: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MEParcelasExit(Sender: TObject);
    procedure MEValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTaxaCartao: TFTaxaCartao;

implementation

uses UParamSistema_cl;

{$R *.dfm}

procedure TFTaxaCartao.FormActivate(Sender: TObject);
begin
  with DMParamSistema do
  begin
    if QParamSistemaVAL_TAXA_CARTAO.Text = '' then
      FTaxaCartao.METaxa.Text := '0'
    else
      FTaxaCartao.METaxa.Text := QParamSistemaVAL_TAXA_CARTAO.Text;
    if QParamSistemaVAL_TAXA_CARTAO.Text = '' then
      FTaxaCartao.METaxaParcela.Text := '0'
    else
      FTaxaCartao.METaxaParcela.Text := QParamSistemaVAL_TAXA_CARTAO_JUROS.Text;
    MEParcelas.SetFocus;
  end;
end;

procedure TFTaxaCartao.MEParcelasExit(Sender: TObject);
var
  wTaxa, wValor, wTaxaparcela, wParceladoTotal : Double;
  wParcelas, wCont : Integer;
begin
  if METaxa.Text = '' then raise Exception.Create('Informe a taxa.');
  if METaxaParcela.Text = '' then raise Exception.Create('Informe taxa das parcelas.');
  if MEParcelas.Text = '' then raise Exception.Create('Informe quantidade de parcelas.');
  if MEValor.Text = '' then raise Exception.Create('Informe valor total.');
  
  try
    wTaxa :=            StrToFloat(METaxa.Text);
    wTaxaparcela :=     StrToFloat(METaxaParcela.Text);
    wValor :=           StrToFloat(MEValor.Text);
    wParcelas :=        StrToInt(MEParcelas.Text);
    wParceladoTotal :=  wValor;

    for wCont := 1 to wParcelas do
      wParceladoTotal := wParceladoTotal+(wParceladoTotal*(wTaxaparcela*0.01));

    wParceladoTotal := (wValor*(0.01*wTaxa)) + wParceladoTotal;
    if wParcelas = 0 then
      lbPorParcela.Caption := 'A Vista'
    else
      lbPorParcela.Caption := IntToStr(wParcelas) +'x de R$' + FormatFloat('#,##0.00', wParceladoTotal/wParcelas);
    lbTotal.Caption := 'R$' + FormatFloat('#,##0.00', wParceladoTotal);

  except On E : Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TFTaxaCartao.MEValorExit(Sender: TObject);
begin
  MEParcelasExit(Sender);
end;

end.

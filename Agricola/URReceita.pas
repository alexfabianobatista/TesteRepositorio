unit URReceita;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFRReceita = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand2: TQRBand;
    QRBandaCultura: TQRMemo;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRBandaProdutos: TQRMemo;
    QRBandaAplicacao: TQRMemo;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  FRReceita: TFRReceita;

implementation

uses UReceita_cl;

{$R *.DFM}

procedure TFRReceita.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DmReceita do
  Begin
    QrReceitaPraga.Close;
    QrReceitaPraga.SetVariable('Numero_Receita',QrReceitaNum_Receita.Value);
    QrReceitaPraga.SetVariable('Codigo_Cultura',QrReceitaCod_Cultura.Value);
    QrReceitaPraga.Open;
    FrReceita.QrBandaCultura.Lines.Text := QrReceitaDesc_Cultura.Value;
    While not QrReceitaPraga.eof do
    Begin
       FrReceita.QrBandaCultura.Lines.Text := QrReceitaPragaDesc_Praga.Value;

    end;
    QrReceitaProdutos.Close;
    QrReceitaProdutos.SetVariable('Numero_Receita',QrReceitaNum_Receita.Value);
    QrReceitaProdutos.SetVariable('Codigo_Cultura',QrReceitaCod_Cultura.Value);
    QrReceitaProdutos.Open;
    While not QrReceitaProdutos.eof do
    begin
       FrReceita.QrBandaAplicacao.Lines.Text := QrReceitaProdutosDesc_Produto.Value;

    end;
  end;
end;

end.

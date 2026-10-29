unit UDescontoAgricolaDuplica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UFmFilial, UFmProduto;

type
  TFDescontoAgricolaDuplica = class(TForm)
    FmProduto1: TFmProduto;
    FmProduto2: TFmProduto;
    FmFilial: TFmFilial;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoAgricolaDuplica: TFDescontoAgricolaDuplica;

implementation

uses UDescontoAgricola_cl;

{$R *.dfm}

procedure TFDescontoAgricolaDuplica.BitBtn1Click(Sender: TObject);
begin
  With DMDescontoAgricola Do
  Begin
    QRDescAgr.Close;
    QRDescAgr.SetVariable('Cod_Filial',FmFilial.MeFilial.Text);
    QRDescAgr.SetVariable('Produto',FmProduto1.MeProduto.Text);
    QRDescAgr.Open;
    QDescAgr.Close;
    QDescAgr.Open;
    While Not(QRDescAgr.Eof) do
    Begin
      QDescAgr.Insert;
      QDescAgrCod_Produto.Value := StrtoInt(Trim(FmProduto2.MeProduto.Text));
      QDescAgrCod_Filial.Value := QrDescAgrCod_Filial.Value;
      QDescAgrPerc_Umidade.Value := QrDescAgrPerc_Umidade.Value;
      QDescAgrPerc_Desconto.Value := QRDescAgrPerc_Desconto.Value;
      QDescAgr.Post;
      QRDescAgr.Next;
    End;
    QDescAgr.Close;
    QRDescAgr.Close;
  End;
end;

end.

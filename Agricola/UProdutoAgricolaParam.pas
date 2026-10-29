unit UProdutoAgricolaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmProduto,
  UFmTributacao;

type
  TFProdutoAgricolaParam = class(TFTParametro)
    Fm0Produto: TFmProduto;
    Fm0Tributacao: TFmTributacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoAgricolaParam: TFProdutoAgricolaParam;

implementation

{$R *.dfm}

end.

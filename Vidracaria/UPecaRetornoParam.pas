unit UPecaRetornoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  UFmProduto, UFmRegiao, UFmCadastro;

type
  TFPecaRetornoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm0Data: TFmDatas;
    Fm0Produto: TFmProduto;
    Fm0Cadastro: TFmCadastro;
    Fm0Regiao: TFmRegiao;
    RGSituacaoPeca: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecaRetornoParam: TFPecaRetornoParam;

implementation

{$R *.dfm}

end.

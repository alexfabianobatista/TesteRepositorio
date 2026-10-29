unit UGrupoProdutoMetaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmProduto,
  UFmGrupoProdutoMeta;

type
  TFGrupoProdutoMetaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm0Produto: TFmProduto;
    Fm0GrupoProdutoMeta: TFmGrupoProdutoMeta;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoProdutoMetaParam: TFGrupoProdutoMetaParam;

implementation

{$R *.dfm}

end.

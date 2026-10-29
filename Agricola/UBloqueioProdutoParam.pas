unit UBloqueioProdutoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmProduto;

type
  TFBloqueioProdutoParam = class(TFTParametro)
    Fm0Produto: TFmProduto;
    GroupBox8: TGroupBox;
    Label146: TLabel;
    Label147: TLabel;
    ME0DtBloqueioIni: TMaskEdit;
    ME0DtBloqueioFim: TMaskEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ME0DtLancamentoIni: TMaskEdit;
    ME0DtLancamentoFim: TMaskEdit;
    RG0TipoProduto: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBloqueioProdutoParam: TFBloqueioProdutoParam;

implementation

{$R *.dfm}

end.

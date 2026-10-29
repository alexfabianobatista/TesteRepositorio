unit UControleEntregaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask,
  UFmCadastro, UFmFilial;

type
  TFControleEntregaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    GBDtEmissao1: TGroupBox;
    Label114: TLabel;
    Label115: TLabel;
    Me1DtEmissaoFinal: TMaskEdit;
    Me1DtEmissaoInicial: TMaskEdit;
    GBDtFaturamento1: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    Me1DtEntregaFinal: TMaskEdit;
    Me1DtEntregaInicial: TMaskEdit;
    RG1Situacao: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleEntregaParam: TFControleEntregaParam;

implementation

{$R *.dfm}

end.

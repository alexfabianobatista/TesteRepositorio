unit UTributacaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmEstado, UFmProduto,
  UFmNcm, UFmFilial, Mask, DBPanel, UFmTributacao;

type
  TFTributacaoParam = class(TFTParametro)
    TS0Tributacao: TTabSheet;
    TabSheet1: TTabSheet;
    FmProduto1: TFmProduto;
    FmEstado1: TFmEstado;
    TabSheet2: TTabSheet;
    FmNcm2: TFmNcm;
    Label1: TLabel;
    FmFilial2: TFmFilial;
    Label2: TLabel;
    Label3: TLabel;
    MeMVASimples: TMaskEdit;
    MeMVANormal: TMaskEdit;
    FmEstado2: TFmEstado;
    TabSheet3: TTabSheet;
    FmFilial3: TFmFilial;
    FmNcm3: TFmNcm;
    FmEstado3: TFmEstado;
    Label4: TLabel;
    MEMvaSTSimples3: TMaskEdit;
    MEMvaSTNormal3: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MEAliquotaST3: TMaskEdit;
    MEAliquotaDif3: TMaskEdit;
    Label7: TLabel;
    FMTributacao3: TFmTributacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTributacaoParam: TFTributacaoParam;

implementation

{$R *.DFM}

end.

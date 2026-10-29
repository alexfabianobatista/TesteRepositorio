unit UPecasParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmFilial,
  UFmClasse, UFmOperacao;

type
  TFPecasParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ME0Data_I: TMaskEdit;
    ME0Data_F: TMaskEdit;
    Rg0Ordem: TRadioGroup;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    ME1DtInicial: TMaskEdit;
    ME1DtFinal: TMaskEdit;
    RG1Ordem: TRadioGroup;
    FmFilial1: TFmFilial;
    FmClasse1: TFmClasse;
    FmFilial2: TFmFilial;
    Fm1Classe2: TFmClasse;
    Fm2Classe2: TFmClasse;
    Fm3Classe2: TFmClasse;
    Fm1Operacao2: TFmOperacao;
    Fm2Operacao2: TFmOperacao;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecasParam: TFPecasParam;

implementation

uses UPecas_cl, UFilialCons, UFilial_cl, UProduto_cl, UProdutoCons,
  UClasse_cl, UClasseCons, UOracle_cl, UOperacao_cl, UOperacaoCons;

{$R *.DFM}

end.





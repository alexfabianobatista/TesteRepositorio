unit UPrecoCidadeClasseParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmClasse,
  UFmCidade, Mask;

type
  TFPrecoCidadeClasseParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmCidade1: TFmCidade;
    FmClasse1: TFmClasse;
    GroupBox14: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    Me1DtInicial: TMaskEdit;
    Me1DtFinal: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoCidadeClasseParam: TFPrecoCidadeClasseParam;

implementation

{$R *.dfm}

end.

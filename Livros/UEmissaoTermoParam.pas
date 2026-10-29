unit UEmissaoTermoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask,
  UFmFilial;

type
  TFEmissaoTermoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Fm1Filial: TFmFilial;
    ME1Orgao: TMaskEdit;
    ME1NumInscricao: TMaskEdit;
    ME1PagFinal: TMaskEdit;
    ME1PagInicial: TMaskEdit;
    ME1DataAbertura: TMaskEdit;
    ME1DataFechamento: TMaskEdit;
    RG1Termo: TRadioGroup;
    MEDtOrgao: TMaskEdit;
    Label8: TLabel;
    Me1Numero: TMaskEdit;
    MEDtInicioTermo: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    MEDtFinalTermo: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmissaoTermoParam: TFEmissaoTermoParam;

implementation

{$R *.dfm}

end.

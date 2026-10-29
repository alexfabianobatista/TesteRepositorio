unit UContratoVendCustosParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmProduto, UFmFilial;

type
  TFContratoVendCustosParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmFilial1: TFmFilial;
    FmProduto1: TFmProduto;
    Label2: TLabel;
    Me1Data_I: TMaskEdit;
    Me1Data_F: TMaskEdit;
    Label3: TLabel;
    Rg1Opcao: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoVendCustosParam: TFContratoVendCustosParam;

implementation

{$R *.dfm}

end.

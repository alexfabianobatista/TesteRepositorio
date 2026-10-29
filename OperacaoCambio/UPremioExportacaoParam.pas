unit UPremioExportacaoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmCadastro,
  Mask;

type
  TFPremioExportacaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Me1Contrato: TMaskEdit;
    FmCadastro1: TFmCadastro;
    Label2: TLabel;
    Me1Fatura: TMaskEdit;
    GroupBox1: TGroupBox;
    Me1Data_I: TMaskEdit;
    Label3: TLabel;
    Me1Data_F: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPremioExportacaoParam: TFPremioExportacaoParam;

implementation

{$R *.dfm}

end.

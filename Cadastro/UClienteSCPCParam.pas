unit UClienteSCPCParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmCadastro;

type
  TFClienteSCPCParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmCadastro1: TFmCadastro;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Me1Data_I: TMaskEdit;
    Me1Data_F: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteSCPCParam: TFClienteSCPCParam;

implementation

{$R *.dfm}

end.

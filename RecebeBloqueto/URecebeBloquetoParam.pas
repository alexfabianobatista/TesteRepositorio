unit URecebeBloquetoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFRecebeBloquetoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label109: TLabel;
    MENumConta: TMaskEdit;
    Label102: TLabel;
    MeNossoNumero: TMaskEdit;
    GroupBox12: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    MeDtRecInicial: TMaskEdit;
    MeDtRecFinal: TMaskEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MeDtVencInicial: TMaskEdit;
    MeDtVencFinal: TMaskEdit;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Me1DtRecInicial: TMaskEdit;
    Me1DtRecFinal: TMaskEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Me1DtVencInicial: TMaskEdit;
    Me1DtVencFinal: TMaskEdit;
    SDlg_Remessa: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecebeBloquetoParam: TFRecebeBloquetoParam;

implementation

{$R *.DFM}

end.

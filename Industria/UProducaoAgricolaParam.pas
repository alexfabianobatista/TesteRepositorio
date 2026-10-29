unit UProducaoAgricolaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmProduto, UFmTurno, UFmFilial;

type
  TFProducaoAgricolaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmFilial1: TFmFilial;
    FmTurno1: TFmTurno;
    FmProduto1: TFmProduto;
    GroupBox1: TGroupBox;
    MeData_I: TMaskEdit;
    Label1: TLabel;
    MeData_F: TMaskEdit;
    TabSheet2: TTabSheet;
    FmFilial2: TFmFilial;
    FmTurno2: TFmTurno;
    FmProduto2: TFmProduto;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Me2Dt_I: TMaskEdit;
    Me2Dt_F: TMaskEdit;
    TabSheet3: TTabSheet;
    FmFilial3: TFmFilial;
    FmTurno3: TFmTurno;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Me3Data_I: TMaskEdit;
    Me3Data_F: TMaskEdit;
    CBXTurno3: TCheckBox;
    procedure FmTurno1BtTurnoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoAgricolaParam: TFProducaoAgricolaParam;

implementation

{$R *.dfm}

procedure TFProducaoAgricolaParam.FmTurno1BtTurnoClick(Sender: TObject);
begin
  inherited;
  FmTurno1.BtTurnoClick(Sender);

end;

end.

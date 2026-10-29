unit ULimpeza_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFLimpeza_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label21: TLabel;
    Me0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Me0DataI: TMaskEdit;
    Me0DataF: TMaskEdit;
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpeza_Param: TFLimpeza_Param;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFLimpeza_Param.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFLimpeza_Param.Me0FilialExit(Sender: TObject);
begin
  inherited;
 If Trim(Me0Filial.Text) <> '' Then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(Me0Filial.Text))
  Else
    Ed0Filial.Text := 'Todos';

end;

end.

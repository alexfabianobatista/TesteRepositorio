unit UBorderoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas;

type
  TFBorderoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmDatas1: TFmDatas;
    cbSituacao: TComboBox;
    Label1: TLabel;
    procedure TabSheet1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBorderoParam: TFBorderoParam;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFBorderoParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  if Trim(FmDatas1.MeDtInicial.Text) = '' then
    FmDatas1.MeDtInicial.Text :=
      DateToStr(DMOracle.DataServ);
  if Trim(FmDatas1.MeDtFinal.Text) = '' then
    FmDatas1.MeDtFinal.Text :=
      DateToStr(DMOracle.DataServ);
end;

end.

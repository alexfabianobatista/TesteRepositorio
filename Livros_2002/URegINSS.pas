unit URegINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFRegINSSParam = class(TFTParametro)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ME0DT_EMISSAO_I: TMaskEdit;
    ME0DT_EMISSAO_F: TMaskEdit;
    ME0Filial: TMaskEdit;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    ED0Filial: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegINSSParam: TFRegINSSParam;

implementation

uses UFilial_cl, UOracle_cl, UFilialCons;

{$R *.DFM}

procedure TFRegINSSParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFRegINSSParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Filial.Text) <> '' then
    ED0Filial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME0Filial.Text))
  else
    ED0Filial.Text:='Todas';

end;

end.

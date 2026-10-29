unit UBloquetoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFBloquetoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME0CodBancoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBloquetoParam: TFBloquetoParam;

implementation

uses UBancosCons, UContasReceber_cl, UBancoAgencia_cl, UOracle_cl;

{$R *.DFM}

procedure TFBloquetoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    With DMContasReceber do
      Begin
        ME0CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      End;
end;

procedure TFBloquetoParam.ME0CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodBanco.Text)<>'' then
    Begin
      ME0Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME0CodBanco.Text);
    End
  else
    Begin
      ME0Banco.Clear;
    End;
end;

end.

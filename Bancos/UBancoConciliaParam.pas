unit UBancoConciliaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFBancoConciliaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    ME0CodBanco: TMaskEdit;
    ME0CodContaCorrente: TMaskEdit;
    SpeedButton8: TSpeedButton;
    ME0ContaCorrente: TMaskEdit;
    ME0Banco: TMaskEdit;
    SpeedButton9: TSpeedButton;
    Label21: TLabel;
    procedure ME0CodBancoChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ME0CodContaCorrenteChange(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoConciliaParam: TFBancoConciliaParam;

implementation

uses UOracle_cl, UBancosCons, UBancoAgencia_cl, UContaCorrenteCons;

{$R *.DFM}

procedure TFBancoConciliaParam.ME0CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodBanco.Text)<>'' then
    begin
      ME0Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME0CodBanco.Text);
      ME0CodContaCorrente.Clear;
    end
  else
    ME0Banco.Text:='Todos';

end;

procedure TFBancoConciliaParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME0CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;

end;

procedure TFBancoConciliaParam.ME0CodContaCorrenteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodContaCorrente.Text)<>'' then
    begin
      ME0ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME0CodContaCorrente.Text);
      ME0CodBanco.clear;
    end
  else
    ME0ContaCorrente.Text:='Todos';

end;

procedure TFBancoConciliaParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME0CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;

end;

procedure TFBancoConciliaParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FBancoConciliaParam.helpcontext:=13;
end;

end.

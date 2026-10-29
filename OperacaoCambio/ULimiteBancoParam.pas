unit ULimiteBancoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFLimiteBancoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Banco: TMaskEdit;
    SB0Banco: TSpeedButton;
    edt0Banco: TEdit;
    RG0Tipo: TRadioGroup;
    RG0Situacao: TRadioGroup;
    TabSheet2: TTabSheet;
    RG1Situacao: TRadioGroup;
    Label2: TLabel;
    ME1Banco: TMaskEdit;
    SB1Banco: TSpeedButton;
    edt1Banco: TEdit;
    procedure SB0BancoClick(Sender: TObject);
    procedure ME0BancoExit(Sender: TObject);
    procedure ME1BancoExit(Sender: TObject);
    procedure SB1BancoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimiteBancoParam: TFLimiteBancoParam;

implementation

uses UOracle_cl, UBancosCons, UBancoAgencia_cl;

{$R *.DFM}

procedure TFLimiteBancoParam.SB0BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    ME0Banco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME0BancoExit(sender);
  end;
end;

procedure TFLimiteBancoParam.ME0BancoExit(Sender: TObject);
begin
  inherited;
  if trim(ME0Banco.Text) <> '' then
    edt0Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA='+Trim(ME0Banco.Text))
  else
    edt0Banco.Text := 'Todos'; 
end;

procedure TFLimiteBancoParam.ME1BancoExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Banco.Text) <> '' then
    edt1Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA='+Trim(ME1Banco.Text))
  else
    edt1Banco.Text := 'Todos';
end;

procedure TFLimiteBancoParam.SB1BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    ME1Banco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME1BancoExit(sender);
  end;
end;

end.

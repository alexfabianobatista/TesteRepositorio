unit UClienteCons_VeiculosVendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, StdCtrls, Mask, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, ComCtrls, Buttons, ExtCtrls;

type
  TFClienteCons_VeiculosVendidos = class(TFPadraoConsulta)
    Label7: TLabel;
    Label1: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaDSCENDERECO: TIBStringField;
    QConsultaNUMERO: TIntegerField;
    QConsultaDSCBAIRRO: TIBStringField;
    QConsultaDSCCIDADE: TIBStringField;
    QConsultaDSCESTADO: TIBStringField;
    QConsultaCODVEICULO: TIntegerField;
    QConsultaDSCVEICULO: TIBStringField;
    QConsultaPLACA: TIBStringField;
    Label2: TLabel;
    MeValorMinimo: TMaskEdit;
    QConsultaVALORVENDA: TFloatField;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCons_VeiculosVendidos: TFClienteCons_VeiculosVendidos;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFClienteCons_VeiculosVendidos.BtnPesquisarClick(Sender: TObject);
begin
  if (not DataValida(MeDataIni.Text)) then
  Begin
    MessageDlg('Data Inicial inválida.', mtWarning, [mbOK], 0);
    MeDataIni.SetFocus;
    Exit;
  End;

  if (not DataValida(MeDataFin.Text)) then
  Begin
    MessageDlg('Data Final inválida.', mtWarning, [mbOK], 0);
    MeDataFin.SetFocus;
    Exit;
  End;

  if MeValorMinimo.Text = '' then
    MeValorMinimo.Text := '0';

  QConsulta.Close;
  QConsulta.ParamByName('DATAINI').AsDate := StrToDate(MeDataIni.Text);
  QConsulta.ParamByName('DATAFIN').AsDate := StrToDate(MeDataFin.Text);
  QConsulta.ParamByName('VALORVENDA').AsCurrency := StrToCurr(MeValorMinimo.Text);
  QConsulta.Open;

  inherited;

end;

procedure TFClienteCons_VeiculosVendidos.FormShow(Sender: TObject);
begin
  inherited;
  MeDataIni.Text := FormatDateTime('dd/MM/yyyy', InicioMes);
  MeDataFin.Text := FormatDateTime('dd/MM/yyyy', FimMes);
end;

end.

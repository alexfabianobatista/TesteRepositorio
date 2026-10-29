unit UClienteCons_CompraVendaMesmoMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFClienteCons_CompraVendaMesmoMes = class(TFPadraoConsulta)
    Label7: TLabel;
    Label1: TLabel;
    MeMesIni: TMaskEdit;
    MeAnoIni: TMaskEdit;
    QConsultaCODVEICULO: TIntegerField;
    QConsultaDSCVEICULO: TIBStringField;
    QConsultaPLACA: TIBStringField;
    QConsultaDTVENDA: TDateTimeField;
    QConsultaDTCOMPRA: TDateTimeField;
    Label2: TLabel;
    Label3: TLabel;
    MeMesFin: TMaskEdit;
    MeAnoFin: TMaskEdit;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCons_CompraVendaMesmoMes: TFClienteCons_CompraVendaMesmoMes;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFClienteCons_CompraVendaMesmoMes.BtnPesquisarClick(
  Sender: TObject);
begin
  if (not DataValida('01/' + MeMesIni.Text + '/' + MeAnoIni.Text)) then
  Begin
    MessageDlg('Data Inicial inválida.', mtWarning, [mbOK], 0);
    MeMesIni.SetFocus;
    Exit;
  End;

  if (not DataValida('01/' + MeMesFin.Text + '/' + MeAnoFin.Text)) then
  Begin
    MessageDlg('Data Final inválida.', mtWarning, [mbOK], 0);
    MeMesFin.SetFocus;
    Exit;
  End;

  QConsulta.Close;
  QConsulta.ParamByName('DATAINI').AsDate := InicioMes(StrToDate('01/' + MeMesIni.Text + '/' + MeAnoIni.Text));
  QConsulta.ParamByName('DATAFIN').AsDate := FimMes(StrToDate('01/' + MeMesFin.Text + '/' + MeAnoFin.Text));
  QConsulta.Open;

  inherited;

end;

procedure TFClienteCons_CompraVendaMesmoMes.FormShow(Sender: TObject);
var dia, mes, ano: Word;
begin
  inherited;
  DecodeDate(Date, ano, mes, dia);
  MeMesIni.Text := '01';
  MeAnoIni.Text := IntToStr(ano);
  MeMesFin.Text := '12';
  MeAnoFin.Text := IntToStr(ano);
end;

end.

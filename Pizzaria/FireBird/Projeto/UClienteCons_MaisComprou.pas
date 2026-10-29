unit UClienteCons_MaisComprou;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFClienteCons_MaisComprou = class(TFPadraoConsulta)
    Label7: TLabel;
    MeDataIni: TMaskEdit;
    Label1: TLabel;
    MeDataFin: TMaskEdit;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaVEICULOS_COMPRADOS: TIntegerField;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCons_MaisComprou: TFClienteCons_MaisComprou;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFClienteCons_MaisComprou.BtnPesquisarClick(Sender: TObject);
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

  QConsulta.Close;
  QConsulta.ParamByName('DATAINI').AsDate := StrToDate(MeDataIni.Text);
  QConsulta.ParamByName('DATAFIN').AsDate := StrToDate(MeDataFin.Text);
  QConsulta.Open;

  inherited;

end;

procedure TFClienteCons_MaisComprou.FormShow(Sender: TObject);
begin
  inherited;
  MeDataIni.Text := FormatDateTime('dd/MM/yyyy', InicioMes);
  MeDataFin.Text := FormatDateTime('dd/MM/yyyy', FimMes);
end;

end.

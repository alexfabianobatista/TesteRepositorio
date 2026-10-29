unit UClienteCons_CompraVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFClienteCons_CompraVenda = class(TFPadraoConsulta)
    Label7: TLabel;
    Label1: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaQTD_VENDAS: TIntegerField;
    QConsultaQTD_COMPRAS: TIntegerField;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCons_CompraVenda: TFClienteCons_CompraVenda;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFClienteCons_CompraVenda.BtnPesquisarClick(Sender: TObject);
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

procedure TFClienteCons_CompraVenda.FormShow(Sender: TObject);
begin
  inherited;
  MeDataIni.Text := FormatDateTime('dd/MM/yyyy', InicioMes);
  MeDataFin.Text := FormatDateTime('dd/MM/yyyy', FimMes);
end;

end.

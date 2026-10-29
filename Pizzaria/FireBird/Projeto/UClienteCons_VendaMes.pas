unit UClienteCons_VendaMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, StdCtrls, Mask, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, ComCtrls, Buttons, ExtCtrls;

type
  TFClienteCons_VendaMes = class(TFPadraoConsulta)
    Label7: TLabel;
    MeMes: TMaskEdit;
    Label1: TLabel;
    MeAno: TMaskEdit;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaNUM_VENDAS: TIntegerField;
    QConsultaVALOR_VENDIDO: TFloatField;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCons_VendaMes: TFClienteCons_VendaMes;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFClienteCons_VendaMes.BtnPesquisarClick(Sender: TObject);
begin
  if (not DataValida('01/' + MeMes.Text + '/' + MeAno.Text)) then
  Begin
    MessageDlg('Data inválida.', mtWarning, [mbOK], 0);
    MeMes.SetFocus;
    Exit;
  End;

  QConsulta.Close;
  QConsulta.ParamByName('DATAINI').AsDate := InicioMes(StrToDate('01/' + MeMes.Text + '/' + MeAno.Text));
  QConsulta.ParamByName('DATAFIN').AsDate := FimMes(StrToDate('01/' + MeMes.Text + '/' + MeAno.Text));
  QConsulta.Open;

  inherited;

end;

procedure TFClienteCons_VendaMes.FormShow(Sender: TObject);
var dia, mes, ano: Word;
begin
  inherited;
  DecodeDate(Date, ano, mes, dia);
  MeMes.Text := IntToStr(mes);
  MeAno.Text := IntToStr(ano);
end;

end.

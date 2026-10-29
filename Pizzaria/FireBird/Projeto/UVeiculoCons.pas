unit UVeiculoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFVeiculoCons = class(TFPadraoConsulta)
    RgTipo: TRadioGroup;
    Label1: TLabel;
    MePesquisa: TMaskEdit;
    QConsultaCODVEICULO: TIntegerField;
    QConsultaDSCVEICULO: TIBStringField;
    QConsultaCODMARCA: TIntegerField;
    QConsultaANOFAB: TIntegerField;
    QConsultaANOMODELO: TIntegerField;
    QConsultaPLACA: TIBStringField;
    QConsultaCODCOR: TIntegerField;
    QConsultaVALORCOMPRA: TFloatField;
    QConsultaVALORVENDA: TFloatField;
    QConsultaDSCCOR: TIBStringField;
    QConsultaDSCMARCA: TIBStringField;
    QConsultaCHASSI: TIBStringField;
    procedure RgTipoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sqlInicial: String;
  public
    { Public declarations }
  end;

var
  FVeiculoCons: TFVeiculoCons;

implementation

{$R *.dfm}

procedure TFVeiculoCons.RgTipoClick(Sender: TObject);
begin
  inherited;
  MePesquisa.Clear;
  if RgTipo.ItemIndex = 0 then
    MePesquisa.EditMask := '!AAA-9999;1;_';
  if RgTipo.ItemIndex = 1 then
    MePesquisa.EditMask := '';
  if RgTipo.ItemIndex = 2 then
    MePesquisa.EditMask := '!9999;0;_';
  if RgTipo.ItemIndex = 3 then
    MePesquisa.EditMask := '';
  if RgTipo.ItemIndex = 4 then
    MePesquisa.EditMask := '!999999999;0;_';
  if RgTipo.ItemIndex = 5 then
    MePesquisa.EditMask := '';

  MePesquisa.SetFocus;
end;

procedure TFVeiculoCons.BtnPesquisarClick(Sender: TObject);
begin
  QConsulta.Close;
  QConsulta.SQL.Clear;
  QConsulta.SQL.Add(sqlInicial);
  if RgTipo.ItemIndex = 0 then
    QConsulta.SQL.Add('Where v.placa >= ' + QuotedStr(MePesquisa.Text) + ' order by v.placa');
  if RgTipo.ItemIndex = 1 then
    QConsulta.SQL.Add('Where c.dsccor >= ' + QuotedStr(MePesquisa.Text) + ' order by c.dsccor');
  if RgTipo.ItemIndex = 2 then
  Begin
    if trim(MePesquisa.Text) = '' then
      QConsulta.SQL.Add('Where v.anomodelo >= 0' + ' order by v.anomodelo')
    else
      QConsulta.SQL.Add('Where v.anomodelo >= ' + MePesquisa.Text + ' order by v.anomodelo');
  End;
  if RgTipo.ItemIndex = 3 then
    QConsulta.SQL.Add('Where m.dscmarca >= ' + QuotedStr(MePesquisa.Text) + ' order by m.dscmarca');
  if RgTipo.ItemIndex = 4 then
  Begin
    if trim(MePesquisa.Text) = '' then
      QConsulta.SQL.Add('Where v.codveiculo >= 0' + ' order by v.codveiculo')
    else
      QConsulta.SQL.Add('Where v.codveiculo >= ' + MePesquisa.Text + ' order by v.codveiculo');
  End;
  if RgTipo.ItemIndex = 5 then
    QConsulta.SQL.Add('Where v.chassi >= ' + QuotedStr(MePesquisa.Text) + ' order by v.chassi');

  QConsulta.Open;

  inherited;
end;

procedure TFVeiculoCons.FormShow(Sender: TObject);
begin
  inherited;
  sqlInicial := QConsulta.SQL.Text;
  MePesquisa.EditMask := '!AAA-9999;1;_';
end;

end.

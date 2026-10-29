unit UVendaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFVendaCons = class(TFPadraoConsulta)
    QConsultaCODVENDA: TIntegerField;
    QConsultaCODVENDEDOR: TIntegerField;
    QConsultaCODVEICULO: TIntegerField;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaDTVENDA: TDateTimeField;
    QConsultaNOMECLIENTE: TIBStringField;
    QConsultaDSCVEICULO: TIBStringField;
    QConsultaPLACA: TIBStringField;
    QConsultaNOMEVENDEDOR: TIBStringField;
    RgTipo: TRadioGroup;
    Label1: TLabel;
    MePesquisa: TMaskEdit;
    Label2: TLabel;
    MePesquisa2: TMaskEdit;
    procedure RgTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    sqlInicial: String;
  public
    { Public declarations }
  end;

var
  FVendaCons: TFVendaCons;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFVendaCons.RgTipoClick(Sender: TObject);
begin
  inherited;
  MePesquisa.Clear;
  if RgTipo.ItemIndex = 3 then
  Begin
    Label1.Caption := 'Data Inicial';
    MePesquisa.Width := 90;
    Label2.Visible := True;
    MePesquisa2.Visible := True;
    Label2.Caption := 'Data Final';
    MePesquisa2.Width := 90;
    MePesquisa.EditMask := '!99/99/9999;1;_';
    MePesquisa2.EditMask := '!99/99/9999;1;_';

    MePesquisa.Text := FormatDateTime('dd/MM/yyyy', InicioMes);
    MePesquisa2.Text := FormatDateTime('dd/MM/yyyy', FimMes);
  End
  else
  Begin
    Label1.Caption := 'Parâmetro';
    MePesquisa.Width := 273;
    Label2.Visible := False;
    MePesquisa2.Visible := False;

    if RgTipo.ItemIndex = 0 then
      MePesquisa.EditMask := '';
    if RgTipo.ItemIndex = 1 then
      MePesquisa.EditMask := '';
    if RgTipo.ItemIndex = 2 then
      MePesquisa.EditMask := '';
  End;

  MePesquisa.SetFocus;
end;

procedure TFVendaCons.FormShow(Sender: TObject);
begin
  inherited;
  sqlInicial := QConsulta.SQL.Text;
  MePesquisa.EditMask := '';
end;

procedure TFVendaCons.BtnPesquisarClick(Sender: TObject);
begin
  if (RgTipo.ItemIndex = 3) then
  Begin
    if (not DataValida(MePesquisa.Text)) then
    Begin
      MessageDlg('Data Inicial inválida.', mtError, [mbOK], 0);
      MePesquisa.SetFocus;
      Exit;
    End;

    if (not DataValida(MePesquisa2.Text)) then
    Begin
      MessageDlg('Data Final inválida.', mtError, [mbOK], 0);
      MePesquisa2.SetFocus;
      Exit;
    End;
  End;

  QConsulta.Close;
  QConsulta.SQL.Clear;
  QConsulta.SQL.Add(sqlInicial);
  if RgTipo.ItemIndex = 0 then
    QConsulta.SQL.Add('Where c.nome >= ' + QuotedStr(MePesquisa.Text) + ' order by c.nome');
  if RgTipo.ItemIndex = 1 then
    QConsulta.SQL.Add('Where e.dscveiculo >= ' + QuotedStr(MePesquisa.Text) + ' order by e.dscveiculo');
  if RgTipo.ItemIndex = 2 then
    QConsulta.SQL.Add('Where d.nome >= ' + QuotedStr(MePesquisa.Text) + ' order by d.nome');
  if RgTipo.ItemIndex = 3 then
  Begin
    QConsulta.SQL.Add('Where v.dtvenda between :DATAINI and :DATAFIN order by v.dtvenda');
    QConsulta.ParamByName('DATAINI').AsDate := StrToDate(FormatDateTime('dd/MM/yyyy', StrToDate(MePesquisa.Text)));
    QConsulta.ParamByName('DATAFIN').AsDate := StrToDate(FormatDateTime('dd/MM/yyyy', StrToDate(MePesquisa2.Text)));
  End;

  QConsulta.Open;

  inherited;

end;

end.

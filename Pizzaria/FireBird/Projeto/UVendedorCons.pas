unit UVendedorCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFVendedorCons = class(TFPadraoConsulta)
    RgTipo: TRadioGroup;
    Label1: TLabel;
    MePesquisa: TMaskEdit;
    QConsultaQTD_VENDAS: TIntegerField;
    QConsultaVALOR_VENDAS: TFloatField;
    QConsultaCODVENDEDOR: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaCOMISSAO: TFloatField;
    QConsultaDATA_ADMISSAO: TDateTimeField;
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
  FVendedorCons: TFVendedorCons;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TFVendedorCons.RgTipoClick(Sender: TObject);
begin
  inherited;
  MePesquisa.Clear;
  if RgTipo.ItemIndex = 0 then
    MePesquisa.EditMask := '';
  if RgTipo.ItemIndex = 1 then
    MePesquisa.EditMask := '!99/99/9999;1;_';
  if RgTipo.ItemIndex = 2 then
    MePesquisa.EditMask := '!999999999;0;_';
  if RgTipo.ItemIndex = 3 then
    MePesquisa.EditMask := '!999999999;0;_';

  MePesquisa.SetFocus;
end;

procedure TFVendedorCons.FormShow(Sender: TObject);
begin
  inherited;
  sqlInicial := QConsulta.SQL.Text;
  MePesquisa.EditMask := '';
end;

procedure TFVendedorCons.BtnPesquisarClick(Sender: TObject);
begin
  if (RgTipo.ItemIndex = 1) then
    if (MePesquisa.Text <> '  /  /    ') and (not DataValida(MePesquisa.Text)) then
    Begin
      MessageDlg('Data inválida.', mtError, [mbOK], 0);
      MePesquisa.SetFocus;
      Exit;
    End;

  QConsulta.Close;
  QConsulta.SQL.Clear;
  QConsulta.SQL.Add(sqlInicial);
  if RgTipo.ItemIndex = 0 then
    QConsulta.SQL.Add('Where nome >= ' + QuotedStr(MePesquisa.Text) + ' order by nome');
  if RgTipo.ItemIndex = 1 then
    if MePesquisa.Text = '  /  /    ' then
      QConsulta.SQL.Add('Where data_admissao >= ' + QuotedStr(FormatDateTime('dd/MM/yyyy', StrToDate('01/01/1900'))) + ' order by data_admissao')
    else
    Begin
      QConsulta.SQL.Add('Where data_admissao >= :data_admissao' + ' order by data_admissao');
      QConsulta.ParamByName('data_admissao').AsDate := StrToDate(FormatDateTime('dd/MM/yyyy', StrToDate(MePesquisa.Text)));
    End;
  if RgTipo.ItemIndex = 2 then
  Begin
    if trim(MePesquisa.Text) = '' then
      QConsulta.SQL.Add('Where (select count(*) from tb_venda v where v.codvendedor = f.codvendedor) >= 0' + ' order by 1')
    else
      QConsulta.SQL.Add('Where (select count(*) from tb_venda v where v.codvendedor = f.codvendedor) >= ' + MePesquisa.Text + ' order by 1');
  End;
  if RgTipo.ItemIndex = 3 then
  Begin
    if trim(MePesquisa.Text) = '' then
      QConsulta.SQL.Add('Where ((select sum(z.valorvenda) from tb_venda v inner join tb_veiculo z on z.codveiculo = v.codveiculo where v.codvendedor = f.codvendedor) >= 0) ' + ' or ((select sum(z.valorvenda) from tb_venda v inner join tb_veiculo z on z.codveiculo = v.codveiculo where v.codvendedor = f.codvendedor) is null)' + ' order by 2')
    else
      QConsulta.SQL.Add('Where ((select sum(z.valorvenda) from tb_venda v inner join tb_veiculo z on z.codveiculo = v.codveiculo where v.codvendedor = f.codvendedor) >= ' + MePesquisa.Text + ') or ((select sum(z.valorvenda) from tb_venda v inner join tb_veiculo z on z.codveiculo = v.codveiculo where v.codvendedor = f.codvendedor) is null)' + ' order by 2');
  End;

  QConsulta.Open;

  inherited;
end;

end.

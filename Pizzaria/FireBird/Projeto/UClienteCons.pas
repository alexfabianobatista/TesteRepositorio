unit UClienteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, StdCtrls, ExtCtrls, DB, Grids, DBGrids,
  ComCtrls, Buttons, Mask, IBCustomDataSet, IBQuery;

type
  TFClienteCons = class(TFPadraoConsulta)
    RgTipo: TRadioGroup;
    MePesquisa: TMaskEdit;
    Label1: TLabel;
    QConsultaCODCLIENTE: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaCPF: TIBStringField;
    QConsultaRG: TIBStringField;
    QConsultaNUMERO: TIntegerField;
    QConsultaCODENDERECO: TIntegerField;
    QConsultaCODBAIRRO: TIntegerField;
    QConsultaCODCIDADE: TIntegerField;
    QConsultaDATA_NASCIMENTO: TDateTimeField;
    QConsultaDATA_CADASTRO: TDateTimeField;
    QConsultadscbairro: TStringField;
    QConsultadsccidade: TStringField;
    QConsultadscendereco: TStringField;
    procedure RgTipoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure QConsClienteCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sqlInicial: String;
  public
    { Public declarations }
  end;

var
  FClienteCons: TFClienteCons;

implementation

uses UDmCliente, UFuncoes;

{$R *.dfm}

procedure TFClienteCons.RgTipoClick(Sender: TObject);
begin
  inherited;
  MePesquisa.Clear;
  if RgTipo.ItemIndex = 0 then
    MePesquisa.EditMask := '';
  if RgTipo.ItemIndex = 1 then
    MePesquisa.EditMask := '!999999999;0;_';
  if RgTipo.ItemIndex = 2 then
    MePesquisa.EditMask := '!99/99/9999;1;_';

  MePesquisa.SetFocus;
end;

procedure TFClienteCons.BtnPesquisarClick(Sender: TObject);
begin
  if (RgTipo.ItemIndex = 2) then
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
  Begin
    if trim(MePesquisa.Text) = '' then
      QConsulta.SQL.Add('Where codcliente >= 0' + ' order by codcliente')
    else
      QConsulta.SQL.Add('Where codcliente >= ' + MePesquisa.Text + ' order by codcliente');
  End;
  if RgTipo.ItemIndex = 2 then
    if MePesquisa.Text = '  /  /    ' then
      QConsulta.SQL.Add('Where data_cadastro >= ' + QuotedStr(FormatDateTime('dd/MM/yyyy', StrToDate('01/01/1900'))) + ' order by data_cadastro')
    else
    Begin
      QConsulta.SQL.Add('Where data_cadastro >= :data_cadastro' + ' order by data_cadastro');
      QConsulta.ParamByName('data_cadastro').AsDate := StrToDate(FormatDateTime('dd/MM/yyyy', StrToDate(MePesquisa.Text)));
    End;

  QConsulta.Open;

  inherited;
end;

procedure TFClienteCons.QConsClienteCalcFields(DataSet: TDataSet);
begin
  inherited;
  QConsultadscendereco.Value := BuscaString('DSCENDERECO', 'TB_ENDERECO', 'CODENDERECO', QConsultaCODENDERECO.Value);
  QConsultadscbairro.Value := BuscaString('DSCBAIRRO', 'TB_BAIRRO', 'CODBAIRRO', QConsultaCODBAIRRO.Value);
  QConsultadsccidade.Value := BuscaString('DSCCIDADE', 'TB_CIDADE', 'CODCIDADE', QConsultaCODCIDADE.Value);
end;

procedure TFClienteCons.FormShow(Sender: TObject);
begin
  inherited;
  sqlInicial := QConsulta.SQL.Text;
  MePesquisa.EditMask := '';
end;

end.

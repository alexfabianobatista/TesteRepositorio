unit UTabelaPrecoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  DBCtrls;

type
  TFTabelaPrecoCons = class(TFTConsulta)
    DBGrid2: TDBGrid;
    DsTabelaPrecoItensCons: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    LbValorTabelaPreco: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTabelaPrecoCons: TFTabelaPrecoCons;

implementation
uses UTabelaPreco_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFTabelaPrecoCons.BtProcurarClick(Sender: TObject);
var wValorTotalTabela : real;
begin
  inherited;
  with DMTabelaPreco do
  begin
    QTabelaPrecoCons.Close;
    QTabelaPrecoCons.ClearVariables;
    if METexto.Text <> '' then
      QTabelaPrecoCons.SetVariable('DESCRICAO', '%'+METexto.Text+'%');
    QTabelaPrecoCons.Open;
    if DMParamSistema.CodEmpresa = 'ALVARES' then
      DMTabelaPreco.QTabelaPrecoItensConsVAL_PRECO.DisplayFormat := '#,####0.0000';
    {wValorTotalTabela := 0;
    QTabelaPrecoItensCons.First;
    while not QTabelaPrecoItensCons.Eof do
    begin
      wValorTotalTabela := wValorTotalTabela + QTabelaPrecoItensConsQT_QUANTIDADE.Value * QTabelaPrecoItensConsVAL_PRECO.Value;
      QTabelaPrecoItensCons.Next;
    end;
    LbValorTabelaPreco.Caption := FormatFloat('#,##0.00',wValorTotalTabela);}
{Solicitado por Kely da Deion para que a ordem das tabelas de preço seja pela descrição. CodSuporte: 8361. Alex 22/11/2023}
    if (DMParamSistema.CodEmpresa = 'DEION') then
    begin
      QTabelaPrecoCons.Close;
      QTabelaPrecoCons.SQL.Clear;
      QTabelaPrecoCons.SQL.Add('SELECT TB_TABELA_PRECO_CAB.COD_TABELA_PRECO_CAB, TB_TABELA_PRECO_CAB.DESC_TABELA_PRECO, TB_TABELA_PRECO_CAB.IND_SITUACAO');
      QTabelaPrecoCons.SQL.Add(' FROM TB_TABELA_PRECO_CAB WHERE (:DESCRICAO IS NULL OR TB_TABELA_PRECO_CAB.DESC_TABELA_PRECO LIKE :DESCRICAO) ');
      QTabelaPrecoCons.SQL.Add('ORDER BY DESC_TABELA_PRECO');
      QTabelaPrecoCons.ExecSQL;
      QTabelaPrecoCons.Open;
    end;

  end;
end;

procedure TFTabelaPrecoCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
var wValorTotalTabela : real;
begin
  inherited;
  DMTabelaPreco.QTabelaPrecoItensCons.Close;
  DMTabelaPreco.QTabelaPrecoItensCons.SetVariable('COD_TABELA_PRECO_CAB',DMTabelaPreco.QTabelaPrecoConsCOD_TABELA_PRECO_CAB.Value);
  DMTabelaPreco.QTabelaPrecoItensCons.Open;
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    wValorTotalTabela := 0;
    DMTabelaPreco.QTabelaPrecoItensCons.First;
    while not DMTabelaPreco.QTabelaPrecoItensCons.Eof do
    begin
      wValorTotalTabela := wValorTotalTabela + DMTabelaPreco.QTabelaPrecoItensConsQT_QUANTIDADE.Value * DMTabelaPreco.QTabelaPrecoItensConsVAL_PRECO.Value;
      DMTabelaPreco.QTabelaPrecoItensCons.Next;
    end;
    LbValorTabelaPreco.Caption := 'Valor total da tabela: ' + FormatFloat('#,##0.00',wValorTotalTabela);
  end;
end;

procedure TFTabelaPrecoCons.FormActivate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    DBGrid2.Columns.Items[3].Visible := True;
    DBGrid2.Columns.Items[3].Width := 40;
    DBGrid2.Columns.Items[4].Visible := True;
    DBGrid2.Columns.Items[4].Width := 58;
    LbValorTabelaPreco.Visible := True;
  end
  else
    DBGrid2.Columns.Items[1].Width := 300;
end;

end.

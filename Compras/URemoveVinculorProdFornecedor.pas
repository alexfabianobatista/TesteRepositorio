unit URemoveVinculorProdFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, UFmCadastro, Grids, DBGrids, UFmProduto;

type
  TFRemoveVinculoCodProdFornecedor = class(TFTCadSimples)
    FmCadastro1: TFmCadastro;
    FmProduto1: TFmProduto;
    DBGrid1: TDBGrid;
    EdCodProdFornecedor: TEdit;
    Label1: TLabel;
    BtProcura: TBitBtn;
    BtDeleta: TBitBtn;
    procedure BtProcuraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtDeletaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRemoveVinculoCodProdFornecedor: TFRemoveVinculoCodProdFornecedor;

implementation

uses UNfe_cl, uOracle_cl;

{$R *.dfm}

procedure TFRemoveVinculoCodProdFornecedor.BtProcuraClick(Sender: TObject);
begin
  inherited;
  with DMNfe do
  begin
    QProdutoXml.close;
    if Trim(FmCadastro1.MeCadastro.Text) = '' then
      QProdutoXml.SetVariable('COD_FORNECEDOR',null)
    else
      QProdutoXml.SetVariable('COD_FORNECEDOR',Trim(FmCadastro1.MeCadastro.Text));
    if trim(FmProduto1.MeProduto.Text) = '' then
      QProdutoXml.SetVariable('COD_PRODUTO',null)
    else
      QProdutoXml.SetVariable('COD_PRODUTO',Trim(FmProduto1.MeProduto.Text));
    if Trim(EdCodProdFornecedor.Text) = '' then
      QProdutoXml.SetVariable('CPROD',null)
    else
      QProdutoXml.SetVariable('CPROD',Trim(EdCodProdFornecedor.Text));

    QProdutoXml.Open;
  end;

end;

procedure TFRemoveVinculoCodProdFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  DMNfe.QProdutoXml.Open;
end;

procedure TFRemoveVinculoCodProdFornecedor.BtDeletaClick(Sender: TObject);
var
  wRegistros: string;
begin
  inherited;
  with DMNfe do
  begin
    QProdutoXml.Close;
    if Trim(FmCadastro1.MeCadastro.Text) = '' then
      QProdutoXml.SetVariable('COD_FORNECEDOR',null)
    else
      QProdutoXml.SetVariable('COD_FORNECEDOR',Trim(FmCadastro1.MeCadastro.Text));
    if trim(FmProduto1.MeProduto.Text) = '' then
      QProdutoXml.SetVariable('COD_PRODUTO',null)
    else
      QProdutoXml.SetVariable('COD_PRODUTO',Trim(FmProduto1.MeProduto.Text));
    if Trim(EdCodProdFornecedor.Text) = '' then
      QProdutoXml.SetVariable('CPROD',null)
    else
      QProdutoXml.SetVariable('CPROD',Trim(EdCodProdFornecedor.Text));

    QProdutoXml.Open;
    QProdutoXml.First;
{Valida se os campos de filtros estão vazios antes de prosseguir}    
    if (Trim(FmCadastro1.MeCadastro.Text) = '') and (Trim(FmProduto1.MeProduto.Text) = '') and (Trim(EdCodProdFornecedor.Text) = '') then
    begin
      if MessageDlg('Nenhum filtro foi informado. Isso vai remover TODOS os vínculos de produtos cadastrados. Deseja continuar?',
          mtWarning, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    end;
    try

      if MessageDlg('Isso vai remover TODOS os vínculos de produtos cadastrados. Deseja continuar?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.DBCemapa.StartTransaction;
        wRegistros := IntToStr(QProdutoXml.RecordCount);
        while not QProdutoXml.Eof do
          QProdutoXml.Delete;
        DMOracle.DBCemapa.Commit;
        ShowMessage('Removidos: ' + wRegistros + ' vínculo(s) dos produtos removidos com sucesso. Realize a importação da nota de compra e refaça os vínculos novamente!');
      end;
    except
      DMOracle.DBCemapa.Rollback;
      ShowMessage('Nenhum registro removido!');
    end;
  end;
end;

end.

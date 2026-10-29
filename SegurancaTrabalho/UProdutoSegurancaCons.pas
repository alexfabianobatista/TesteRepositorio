unit UProdutoSegurancaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFProdutoSegurancaCons = class(TFTConsulta)
    CBSituacao: TComboBox;
    Label3: TLabel;
    RGRetornavel: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSegurancaCons: TFProdutoSegurancaCons;

implementation

uses UProdutoSeguranca_cl;

{$R *.DFM}

procedure TFProdutoSegurancaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProdutoSeguranca do
  begin
    QProdutoSegurancaCons.Close;
    if Trim(METexto.Text) = '' then
      QProdutoSegurancaCons.SetVariable('DESC_PRODUTO',NULL)
    else
      QProdutoSegurancaCons.SetVariable('DESC_PRODUTO',Trim(METexto.Text));
    if (CBSituacao.Text = '') or (CBSituacao.Text = 'TODOS') then
      QProdutoSegurancaCons.SetVariable('IND_SITUACAO', NULL)
    else
      QProdutoSegurancaCons.SetVariable('IND_SITUACAO',CBSituacao.Text);
    if RGRetornavel.ItemIndex = 0 then
      QProdutoSegurancaCons.SetVariable('IND_RETORNAVEL','SIM')
    else if RGRetornavel.ItemIndex = 1 then
      QProdutoSegurancaCons.SetVariable('IND_RETORNAVEL','NAO')
    else
      QProdutoSegurancaCons.SetVariable('IND_RETORNAVEL',NULL);
      QProdutoSegurancaCons.Open;
  end;
end;

end.

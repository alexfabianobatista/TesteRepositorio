unit UCestCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFCestCons = class(TFTConsulta)
    MECest: TMaskEdit;
    MEDesc: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MECestChange(Sender: TObject);
    procedure MEDescChange(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  FCestCons: TFCestCons;

implementation

uses UProduto_cl;

{$R *.dfm}

procedure TFCestCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QCestCons.Close;
    if trim(MECest.text) <> '' then
      QCestCons.SetVariable('COD_CEST', trim(MECest.Text))
    else
      QCestCons.SetVariable('COD_CEST', null);
    if trim(METexto.text) <> '' then
      QCestCons.SetVariable('COD_NCM', trim(METexto.Text))
    else
      QCestCons.SetVariable('COD_NCM', null);
    if trim(MEDesc.text) <> '' then
      QCestCons.SetVariable('DESC_CEST', trim(MEDesc.Text))
    else
      QCestCons.SetVariable('DESC_CEST', null);
    QCestCons.Open;
  end;
end;

procedure TFCestCons.LimpaCampos;
begin    
  if (not MECest.Focused) and (not MEDesc.Focused) and (not METexto.Focused) then
    exit;
  if not MECest.Focused then
    MECest.Clear;
  if not MEDesc.Focused then
    MEDesc.Clear;
  if not METexto.Focused then
    METexto.Clear;
end;

procedure TFCestCons.METextoChange(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFCestCons.MECestChange(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFCestCons.MEDescChange(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFCestCons.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBGrid1.Hint := dmproduto.QCestConsDESC_CEST.Value;
end;

end.

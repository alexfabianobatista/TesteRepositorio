unit UPatrimonioItemCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants;

type
  TFPatrimonioItemCons = class(TFTConsulta)
    Label2: TLabel;
    MeTipoEquipamento: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioItemCons: TFPatrimonioItemCons;

implementation

uses Upatrimonio_cl;

{$R *.DFM}

procedure TFPatrimonioItemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPatrimonio do
  Begin
    QPatrimonio_Item_Cons.Close;
    If Trim(METexto.Text) = '' then
      QPatrimonio_Item_Cons.SetVariable('DESCRICAO',Null)
    Else
      QPatrimonio_Item_Cons.SetVariable('DESCRICAO',METexto.Text);
    If Trim(METipoEquipamento.Text) = '' then
      QPatrimonio_Item_Cons.SetVariable('TIPO_EQUIPAMENTO',Null)
    Else
      QPatrimonio_Item_Cons.SetVariable('TIPO_EQUIPAMENTO',METipoEquipamento.Text);
    QPatrimonio_Item_Cons.SetVariable('COD_PATRIMONIO_ITEM',Null);
    QPatrimonio_Item_Cons.Open;
  End;

end;

procedure TFPatrimonioItemCons.FormActivate(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QPatrimonio_Item_Cons.Close;
end;

end.

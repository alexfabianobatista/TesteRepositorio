unit UHistContabilCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus;

type
  TFHistContabilCons = class(TFTConsulta)
    RgOrdem: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistContabilCons: TFHistContabilCons;

implementation

uses UHistContabil_cl;

{$R *.DFM}

procedure TFHistContabilCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMHistContabil do
  Begin
    QHistContabilCons.Close;
    QHistContabilCons.SetVariable('DESC_HISTORICO',Trim(METexto.Text));
    QHistContabilCons.SQL[QHistContabilCons.SQL.Count-1]:='';
    If RgOrdem.ItemIndex = 0 Then
       QHistContabilCons.SQL.Add('Desc_Historico_Contabil')
    Else
       QHistContabilCons.SQL.Add('Cod_Historico_Contabil');
    QHistcontabilCons.Open;
  End;
end;

end.

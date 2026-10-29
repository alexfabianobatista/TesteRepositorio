unit UEquipamentoFichaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFEquipamentoCons = class(TFTConsulta)
    MECodigo: TMaskEdit;
    Label2: TLabel;
    CBTipoEquipamento: TComboBox;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoCons: TFEquipamentoCons;

implementation

Uses UOrdemServico_cl;

{$R *.dfm}

procedure TFEquipamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  begin
    QEquipamentoFichaCons.Close;

    If Trim(METexto.Text) = '' Then
      QEquipamentoFichaCons.SetVariable('EQUIPAMENTO',Null)
    Else
      QEquipamentoFichaCons.SetVariable('EQUIPAMENTO', '%' + trim(METexto.Text) + '%');

    If Trim(MeCodigo.Text) = '' Then
      QEquipamentoFichaCons.SetVariable('CODIGO',Null)
    Else
      QEquipamentoFichaCons.SetVariable('CODIGO',StrToInt(Trim(MeCodigo.Text)));

    if trim(CBTipoEquipamento.Text) = '' then
      QEquipamentoFichaCons.SetVariable('TIPO', Null)
    else
      QEquipamentoFichaCons.SetVariable('TIPO', trim(CBTipoEquipamento.Text));

    QEquipamentoFichaCons.Open;
  end;

end;

end.

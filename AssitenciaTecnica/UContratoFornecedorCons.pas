unit UContratoFornecedorCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFContratoFornecedorCons = class(TFTConsulta)
    BtConsFilial: TBitBtn;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoFornecedorCons: TFContratoFornecedorCons;

implementation

uses UOrdemServico_cl, UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFContratoFornecedorCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeTexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFContratoFornecedorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  begin
    QContratoFornecedorCons.Close;
    If Trim(METexto.Text) = '' Then
      QContratoFornecedorCons.SetVariable('COD_FILIAL',Null)
    Else
      QContratoFornecedorCons.SetVariable('COD_FILIAL',Trim(METexto.Text));
    QContratoFornecedorCons.Open;
  end;
end;

end.

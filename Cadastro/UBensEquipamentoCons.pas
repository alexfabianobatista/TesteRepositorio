unit UBensEquipamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFBemEquipamentoCons = class(TFTConsulta)
    MECadastro: TMaskEdit;
    Label2: TLabel;
    BtConsCadastro: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBemEquipamentoCons: TFBemEquipamentoCons;

implementation

uses UBensEquipamentoCad, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFBemEquipamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBensEquipamento do
  Begin
    QBensEquipamentosCons.Close;

    If Trim(METexto.Text) <> '' Then
      QBensEquipamentosCons.setVariable('DESC_MODELO',Trim(METexto.Text))
    else
      QBensEquipamentosCons.setVariable('DESC_MODELO',null);

    If Trim(MECadastro.Text) <> '' Then
      QBensEquipamentosCons.setVariable('COD_CADASTRO',Trim(MECadastro.Text))
    else
      QBensEquipamentosCons.setVariable('COD_CADASTRO',null);

    QBensEquipamentosCons.Open;
  end;
end;

procedure TFBemEquipamentoCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

end.

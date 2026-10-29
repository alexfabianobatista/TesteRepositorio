unit UFmVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmVeiculo = class(TFrame)
    Label1: TLabel;
    MeVeiculo: TMaskEdit;
    BtVeiculo: TBitBtn;
    EdVeiculo: TEdit;
    procedure MeVeiculoExit(Sender: TObject);
    procedure BtVeiculoClick(Sender: TObject);
    procedure MeVeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UVeiculoCons, UVeiculo_cl;

{$R *.dfm}

procedure TFmVeiculo.MeVeiculoExit(Sender: TObject);
begin
  if Trim(MEVeiculo.Text) <> '' then
    EdVeiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                        'COD_VEICULO = '+Trim(MEVeiculo.Text))
  else
    EdVeiculo.Text := 'Todos';
end;

procedure TFmVeiculo.BtVeiculoClick(Sender: TObject);
begin
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    MEVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
    MEVeiculoExit(Self);
  end;
end;

procedure TFmVeiculo.MeVeiculoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtVeiculo.Click;
end;

end.

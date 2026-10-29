unit UFmHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmHistorico = class(TFrame)
    Label1: TLabel;
    MeHistorico: TMaskEdit;
    BtHistorico: TBitBtn;
    EdHistorico: TEdit;
    procedure BtHistoricoClick(Sender: TObject);
    procedure MeHistoricoExit(Sender: TObject);
    procedure MeHistoricoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UHistoricoCons, UOracle_cl, UHistorico_cl;

{$R *.dfm}

procedure TFmHistorico.BtHistoricoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal = mrOk then
    MEHistorico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;
  MEHistoricoExit(Self);
end;

procedure TFmHistorico.MeHistoricoExit(Sender: TObject);
begin
  If Trim(MEHistorico.Text) <> '' Then
    EdHistorico.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO',
                                           'COD_HISTORICO = '+Trim(MEHistorico.Text))
  Else
    EdHistorico.Text := 'Todos';

end;

procedure TFmHistorico.MeHistoricoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtHistorico.Click;
end;

end.

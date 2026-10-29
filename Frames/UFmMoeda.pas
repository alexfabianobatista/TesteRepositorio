unit UFmMoeda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMoeda = class(TFrame)
    Label1: TLabel;
    MeMoeda: TMaskEdit;
    BtMoeda: TBitBtn;
    EdMoeda: TEdit;
    procedure BtMoedaClick(Sender: TObject);
    procedure MeMoedaExit(Sender: TObject);
    procedure MeMoedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UMoedaCons, UMoeda_cl, UOracle_cl;

{$R *.dfm}

procedure TFmMoeda.BtMoedaClick(Sender: TObject);
begin
  if FMoedaCons = Nil then
    FMoedaCons := TFMoedaCons.Create(Application);
  if FMoedaCons.ShowModal = MrOk then
  begin
    MeMoeda.Text := DMMoeda.QMoedaConsCOD_MOEDA.Text;
    MeMoedaExit(Self);
  end;
end;

procedure TFmMoeda.MeMoedaExit(Sender: TObject);
begin
  if Trim(MeMoeda.Text) <> '' then
    EdMoeda.Text := DMOracle.BuscaNome('SELECT DESC_MOEDA FROM TB_MOEDA','COD_MOEDA = ' +
                           MeMoeda.Text, true)
  else
    EdMoeda.Text := 'Todas';
end;

procedure TFmMoeda.MeMoedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtMoeda.Click;
end;

end.

unit UFmBalanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmBalanca = class(TFrame)
    Label1: TLabel;
    MeBalanca: TMaskEdit;
    BtBalanca: TBitBtn;
    EdBalanca: TEdit;
    procedure BtBalancaClick(Sender: TObject);
    procedure MeBalancaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UBalancaCons, URomaneioAgricola_cl, UOracle_cl;

{$R *.dfm}

procedure TFmBalanca.BtBalancaClick(Sender: TObject);
begin
  If FBalancaCons = nil then
    FBalancaCons := TFBalancaCons.Create(Application);
  If FBalancaCons.ShowModal = mrOK then
    MeBalanca.Text := DMRomaneioAgricola.QBalancaConsDESC_PLACA.Text;
end;

procedure TFmBalanca.MeBalancaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
    BtBalanca.Click;
end;

end.

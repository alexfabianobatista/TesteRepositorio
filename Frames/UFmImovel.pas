unit UFmImovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmImovel = class(TFrame)
    Label1: TLabel;
    MeImovel: TMaskEdit;
    BtImovel: TBitBtn;
    EdImovel: TEdit;
    procedure MeImovelExit(Sender: TObject);
    procedure BtImovelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UImovel_Cons, UImobiliaria_cl;

{$R *.dfm}

procedure TFmImovel.MeImovelExit(Sender: TObject);
begin
  if Trim(MeImovel.Text) <> '' then
    EdImovel.Text := DMOracle.BuscaNome('SELECT DESC_IMOVEL FROM TB_IMOVEL','COD_IMOVEL = ' + MeImovel.Text, true)
  else
    EdImovel.Text := 'Todos';

end;

procedure TFmImovel.BtImovelClick(Sender: TObject);
begin
  if FImovel_Cons = Nil then
    FImovel_Cons := TFImovel_Cons.Create(Application);
  if FImovel_Cons.ShowModal = MrOk then
  begin
    MeImovel.Text := DMImobiliaria.QImovel_ConsCOD_IMOVEL.Text;
    MeImovelExit(Self);
  end;

end;

end.

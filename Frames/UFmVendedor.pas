unit UFmVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmVendedor = class(TFrame)
    Label1: TLabel;
    MeVendedor: TMaskEdit;
    BtVendedor: TBitBtn;
    EdVendedor: TEdit;
    procedure BtVendedorClick(Sender: TObject);
    procedure MeVendedorExit(Sender: TObject);
    procedure MeVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UVendedorCons, UVendedor_cl, UOracle_cl;

{$R *.dfm}

procedure TFmVendedor.BtVendedorClick(Sender: TObject);
begin
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
  begin
    MeVendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
    MeVendedorExit(Self);
  end;
end;

procedure TFmVendedor.MeVendedorExit(Sender: TObject);
begin
  if Trim(MeVendedor.Text) <> '' then
    EdVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = ' + MeVendedor.Text, true)
  else
    EdVendedor.Text := 'Todos';
end;

procedure TFmVendedor.MeVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtVendedor.Click;
end;

end.

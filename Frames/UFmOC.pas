unit UFmOC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmOC = class(TFrame)
    Label1: TLabel;
    MeOrdemCompra: TMaskEdit;
    BtOrdemCompra: TBitBtn;
    EdOrdemCompra: TEdit;
    procedure MeOrdemCompraExit(Sender: TObject);
    procedure MeOrdemCompraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtOrdemCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UOrdemCompraCons, UOrdemCompra_cl;

{$R *.dfm}

procedure TFmOC.MeOrdemCompraExit(Sender: TObject);
begin
  if Trim(MeOrdemCompra.Text) <> '' then
    EdOrdemCompra.Text := DMOracle.BuscaNome(
      'SELECT '+ QuotedStr('OC: ') + '|| NUM_ORDEM_COMPRA ||' + QuotedStr('  -  ') + '|| DT_EMISSAO FROM TB_ORDEM_COMPRA_CAB',
      'COD_ORDEM_COMPRA_CAB = ' + MeOrdemCompra.Text, true)
  else
    EdOrdemCompra.Text := 'Todas';
end;

procedure TFmOC.MeOrdemCompraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtOrdemCompra.Click;
end;

procedure TFmOC.BtOrdemCompraClick(Sender: TObject);
begin
  if FOrdemCompraCons = Nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  if FOrdemCompraCons.ShowModal = MrOk then
  begin
    MeOrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsCOD_ORDEM_COMPRA_CAB.Text;
    MeOrdemCompraExit(Self);
  end;
end;

end.

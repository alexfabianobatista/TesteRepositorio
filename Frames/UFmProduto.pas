unit UFmProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmProduto = class(TFrame)
    Label1: TLabel;
    MeProduto: TMaskEdit;
    BtProduto: TBitBtn;
    EdProduto: TEdit;
    procedure BtProdutoClick(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure MeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UProdutoCons, UProduto_cl, UOracle_cl;

{$R *.dfm}

procedure TFmProduto.BtProdutoClick(Sender: TObject);
begin
   if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    MeProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    MeProdutoExit(Self);
  end;
end;

procedure TFmProduto.MeProdutoExit(Sender: TObject);
begin
  if Trim(MeProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + MeProduto.Text, true)
  else
    EdProduto.Text := 'Todos';
end;

procedure TFmProduto.MeProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtProduto.Click;
end;

end.

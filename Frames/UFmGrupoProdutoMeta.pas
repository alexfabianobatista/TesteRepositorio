unit UFmGrupoProdutoMeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmGrupoProdutoMeta = class(TFrame)
    Label1: TLabel;
    MeGrupoProdutoMeta: TMaskEdit;
    BtGrupoProdutoMeta: TBitBtn;
    EdGrupoProdutoMeta: TEdit;
    procedure BtGrupoProdutoMetaClick(Sender: TObject);
    procedure MeGrupoProdutoMetaExit(Sender: TObject);
    procedure MeGrupoProdutoMetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UGrupoProdutoMeta_cl, UGrupoProdutoMetaCons;

{$R *.dfm}

procedure TFmGrupoProdutoMeta.BtGrupoProdutoMetaClick(Sender: TObject);
begin
   if FGrupoProdutoMetaCons = Nil then
    FGrupoProdutoMetaCons := TFGrupoProdutoMetaCons.Create(Application);
  if FGrupoProdutoMetaCons.ShowModal = MrOk then
  begin
    MeGrupoProdutoMeta.Text := DMGrupoProdutoMeta.QGrupoProdutoMetaConsCOD_GRUPO_PRODUTO_META.Text;
    MeGrupoProdutoMetaExit(Self);
  end;
end;

procedure TFmGrupoProdutoMeta.MeGrupoProdutoMetaExit(Sender: TObject);
begin
  if Trim(MeGrupoProdutoMeta.Text) <> '' then
    EdGrupoProdutoMeta.Text := DMOracle.BuscaNome('SELECT DESC_GRUPO_PRODUTO_META FROM TB_GRUPO_PRODUTO_META','COD_GRUPO_PRODUTO_META = ' + MeGrupoProdutoMeta.Text, true)
  else
    EdGrupoProdutoMeta.Text := 'Todos';
end;

procedure TFmGrupoProdutoMeta.MeGrupoProdutoMetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
    BtGrupoProdutoMeta.Click;
end;

end.

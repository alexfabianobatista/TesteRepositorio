unit UGrupoProduto_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFGrupoProduto_Cons = class(TFTConsulta)
    Label2: TLabel;
    MeMes: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoProduto_Cons: TFGrupoProduto_Cons;

implementation

uses UGrupoProduto_cl;

{$R *.dfm}

procedure TFGrupoProduto_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMGrupoProduto.QGrupoProduto_Cons.Close;
  DMGrupoProduto.QGrupoProduto_Cons.SetVariable('Num_Ano',StrToInt(Trim(MeTexto.Text)));
  DMGrupoProduto.QGrupoProduto_Cons.SetVariable('Num_Mes',StrToInt(Trim(MeMes.Text)));
  DMGrupoProduto.QGrupoProduto_Cons.Open;
end;

procedure TFGrupoProduto_Cons.FormActivate(Sender: TObject);
Var Day,Month,Year:Word;
begin
  inherited;
  DecodeDate(Date,Year,Month,Day);
  MeTexto.Text := IntToStr(Year);
  MeMes.Text := IntToStr(Month);
end;

end.

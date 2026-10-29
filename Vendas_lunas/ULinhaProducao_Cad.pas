unit ULinhaProducao_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls;

type
  TFLinhaProducao_Cad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLinhaProducao_Cad: TFLinhaProducao_Cad;

implementation

uses ULinhaProducao_cl, ULinhaProducao_Cons;

{$R *.dfm}

procedure TFLinhaProducao_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMLinhaProducao.QLinhaProducao.Open;
end;

procedure TFLinhaProducao_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FLinhaProducao_Cons = Nil then
    FLinhaProducao_Cons := TFLinhaProducao_Cons.Create(Application);  
  If FLinhaProducao_Cons.ShowModal = mrOk then
  With DMLinhaProducao do
  Begin
    QLinhaProducaoCons.Close;
    QLinhaProducaoCons.SetVariable('PK',QLinhaProducaoConsCod_Linha_Producao.Value);
    QLinhaProducaoCons.Open;
  End;

end;

end.

unit UMenuPromotor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuPromotor = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Promotor1: TMenuItem;
    Reposio1: TMenuItem;
    Histrico1: TMenuItem;
    Movimento1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Promotor1Click(Sender: TObject);
    procedure Reposio1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Movimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPromotor: TFMenuPromotor;

implementation

uses UPromotorCad, UTela_cl, UReposicaoCad, UHistoricoPromotorCad,
  UReposicaoMov;

{$R *.DFM}

procedure TFMenuPromotor.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuPromotor.pModulo := 'PROMOTOR';
end;

procedure TFMenuPromotor.Promotor1Click(Sender: TObject);
begin
  inherited;
  If FPromotorCad = Nil then
    FPromotorCad := TFPromotorCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPromotorCad.Caption,FPromotorCad.Name);
  FPromotorCad.ShowModal;
end;

procedure TFMenuPromotor.Reposio1Click(Sender: TObject);
begin
  inherited;
  If FReposicaoCad = Nil then
    FReposicaoCad := TFReposicaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FReposicaoCad.Caption,FReposicaoCad.Name);
  FReposicaoCad.ShowModal;
end;

procedure TFMenuPromotor.Histrico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoPromotorCad = Nil then
    FHistoricoPromotorCad := TFHistoricoPromotorCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistoricoPromotorCad.Caption,FHistoricoPromotorCad.Name);
  FHistoricoPromotorCad.ShowModal;

end;

procedure TFMenuPromotor.Movimento1Click(Sender: TObject);
begin
  inherited;
  If FReposicaoMov = Nil then
    FReposicaoMov := TFReposicaoMov.Create(Application);
  DMTela.VerificaTela(pModulo,FReposicaoMov.Caption,FReposicaoMov.Name);
  FReposicaoMov.ShowModal;

end;

end.

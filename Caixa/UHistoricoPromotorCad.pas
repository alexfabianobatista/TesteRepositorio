unit UHistoricoPromotorCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants;

type
  TFHistoricoPromotorCad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Histricos1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Histricos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoPromotorCad: TFHistoricoPromotorCad;

implementation

uses UHistoricoPromotor_cl, UHistoricoPromotorCons, UPromotorParam,
  URHistoricoPromotor;

{$R *.DFM}

procedure TFHistoricoPromotorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FHistoricoPromotorCons = Nil then
    FHistoricoPromotorCons:= TFHistoricoPromotorCons.Create(Application);
  If FHistoricoPromotorCons.Showmodal = mrOk then
  With DMHistoricoPromotor do
  Begin
    QHistoricoPromotor.Close;
    QHistoricoPromotor.SetVariable('PK', QHistoricoPromotorConsCod_Historico_Promotor.Value);
    QHistoricoPromotor.Open;
  End;

end;

procedure TFHistoricoPromotorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMHistoricoPromotor.QHistoricoPromotor.open;
end;

procedure TFHistoricoPromotorCad.Histricos1Click(Sender: TObject);
begin
  inherited;
   If(FPromotorParam = nil)Then
    FPromotorParam := TFPromotorParam.Create(Application);
  FPromotorParam.PGRelatorio.Pages[2].TabVisible := True;
  if FPromotorParam.ShowModal = mrOk then
  begin
    With DMHistoricoPromotor do
    Begin
      QRHistoricoPromotor.Close;
      Case FPromotorParam.RG3SITUACAO.ItemIndex of
        0 : QRHistoricoPromotor.SetVariable('SITUACAO','SIM');
        1 : QRHistoricoPromotor.SetVariable('SITUACAO','NAO');
        2 : QRHistoricoPromotor.SetVariable('SITUACAO',null);
      end;

      Case FPromotorParam.RG3OPERACAO.ItemIndex of
        0 : QRHistoricoPromotor.SetVariable('OPERACAO','+');
        1 : QRHistoricoPromotor.SetVariable('OPERACAO','-');
        2 : QRHistoricoPromotor.SetVariable('OPERACAO',null);
      end;

      QRHistoricoPromotor.Open;

      If FRHistoricoPromotor = Nil then
        FRHistoricoPromotor := TFRHistoricoPromotor.Create(Application);

      If FPromotorParam.RGPreview.ItemIndex=0 then
        FRHistoricoPromotor.QRPrimario.Preview
      Else
        FRHistoricoPromotor.QRPrimario.Print;
      QRHistoricoPromotor.Close;
    End;
  end;

end;

end.

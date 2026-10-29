unit UPromotorCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFPromotorCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    BTCidadeCons: TBitBtn;
    RelaoPromotores1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BTCidadeConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoPromotores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPromotorCad: TFPromotorCad;

implementation

uses UPromoto_cl, UCidadeCons, UCidade_cl, UPromotorCons, UPromotorParam,
  UCadastroParam, URPromotor;

{$R *.DFM}

procedure TFPromotorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPromotor.QPromotor.open;
end;

procedure TFPromotorCad.BTCidadeConsClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
    DMPromotor.QPromotorCod_Cidade.Value := DMCidade.QCidadeConsCod_Cidade.Value;
end;
procedure TFPromotorCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BTCidadeCons.Enabled:=DSPrimario.State<>dsBrowse;
end;

procedure TFPromotorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons:= TFPromotorCons.Create(Application);
  If FPromotorCons.Showmodal = mrOk then
  With DMPromotor do
  Begin
    QPromotor.Close;
    QPromotor.SetVariable('PK', QPromotorConsCod_Promotor.Value);
    QPromotor.Open;
  End;
end;

procedure TFPromotorCad.RelaoPromotores1Click(Sender: TObject);
begin
  inherited;
   If(FPromotorParam = nil)Then
    FPromotorParam := TFPromotorParam.Create(Application);
  FPromotorParam.PGRelatorio.Pages[0].TabVisible := True;
  if FPromotorParam.ShowModal = mrOk then
  begin
    With DMPromotor do
    Begin
      QRPromotor.Close;
      QRPromotor.SQL[QRPromotor.SQL.Count-1]:='';
      Case FPromotorParam.RG1SITUACAO.ItemIndex of
        0 : QRPromotor.SQL.Add('AND TB_PROMOTOR.IND_SITUACAO = '+chr(39)+'A'+chr(39)+' ORDER BY NOME');
        1 : QRPromotor.SQL.Add('AND TB_PROMOTOR.IND_SITUACAO = '+chr(39)+'I'+chr(39)+' ORDER BY NOME');
        2 : QRPromotor.SQL.Add('ORDER BY NOME');
      end;
      QRPromotor.Open;

      If FRPromotor = Nil then
        FRPromotor := TFRPromotor.Create(Application);

      If FPromotorParam.RGPreview.ItemIndex=0 then
        FRPromotor.QRPrimario.Preview
      Else
        FRPromotor.QRPrimario.Print;
      QRPromotor.Close;
    End;
  end;
end;

end.

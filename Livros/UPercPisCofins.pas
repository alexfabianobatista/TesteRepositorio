unit UPercPisCofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, DBCtrls, DBDirceu, Buttons, ImgList, DB,
  Menus, ComCtrls, Mask, ExtCtrls, ActnList;

type
  TFPercPisCofins = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GbPis: TGroupBox;
    GbCofins: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LPIS: TLabel;
    LCOFINS: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPercPisCofins: TFPercPisCofins;

implementation

uses ULivroFiscal_Cl, UPercPisCofinsCons;

{$R *.dfm}

procedure TFPercPisCofins.FormActivate(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QPercPisCofins.Open;
end;

procedure TFPercPisCofins.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPercPisCofinsCons = nil then
    FPercPisCofinsCons := TFPercPisCofinsCons.Create(Application);
  if FPercPisCofinsCons.ShowModal = mrOK then
    with DMLivroFiscal do
    begin
      QPercPisCofins.Close;
      QPercPisCofins.SetVariable('PK', QPercPisCofinsConsCOD_PERC_PIS_COFINS.Value);
      QPercPisCofins.Open;
    end;
end;

procedure TFPercPisCofins.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
var wTotalPIS, wTotalCOFINS: Double;
begin
  inherited;
  wTotalPIS := DMLivroFiscal.QPercPisCofinsPERC_PIS_EXP.Value +
               DMLivroFiscal.QPercPisCofinsPERC_PIS_TRIB.Value +
               DMLivroFiscal.QPercPisCofinsPERC_PIS_NAO_TRIB.Value;
  LPIS.Caption := FormatFloat('###.##', wTotalPIS) + ' %';

  if wTotalPIS <> 100.00 then
    LPIS.Font.Color := clRed
  else
    LPIS.Font.Color := clWindowText;

  wTotalCOFINS := DMLivroFiscal.QPercPisCofinsPERC_COFINS_EXP.Value +
               DMLivroFiscal.QPercPisCofinsPERC_COFINS_TRIB.Value +
               DMLivroFiscal.QPercPisCofinsPERC_COFINS_NAO_TRIB.Value;
  LCOFINS.Caption := FormatFloat('###.##', wTotalCOFINS) + ' %';

  if wTotalCOFINS <> 100.00 then
    LCOFINS.Font.Color := clRed
  else
    LCOFINS.Font.Color := clWindowText;
end;

end.


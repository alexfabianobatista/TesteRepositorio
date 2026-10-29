unit UParamPisCofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, DBCtrls, DBDirceu, Buttons, ImgList, DB,
  Menus, ComCtrls, Mask, ExtCtrls, ActnList;

type
  TFParamPisCofins = class(TFTCadSimples)
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    EdOperacao: TDBEdit;
    BtConsOperacao: TBitBtn;
    DBDirceu1: TDBDirceu;
    GbPis: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GbCofins: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    Opes1: TMenuItem;
    PercentuaisdePISCOFINS1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure PercentuaisdePISCOFINS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParamPisCofins: TFParamPisCofins;

implementation

uses ULivroFiscal_Cl, UOperacao_cl, UOperacaoCons, UParamPisCofinsCons,
  UPercPisCofins;

{$R *.dfm}

procedure TFParamPisCofins.FormActivate(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QParamPisCofins.Open;
end;

procedure TFParamPisCofins.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FParamPisCofinsCons = nil then
    FParamPisCofinsCons := TFParamPisCofinsCons.Create(Application);
  if FParamPisCofinsCons.ShowModal = mrOK then
    with DMLivroFiscal do
    begin
      QParamPisCofins.Close;
      QParamPisCofins.SetVariable('PK', QParamPisCofinsConsCOD_PARAM_PIS_COFINS.Value);
      QParamPisCofins.Open;
    end;
end;

procedure TFParamPisCofins.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOK then
    DMLivroFiscal.QParamPisCofinsCOD_OPERACAO.Value := DMOperacao.QOperacaoConsCOD_OPERACAO.Value;
end;

procedure TFParamPisCofins.PercentuaisdePISCOFINS1Click(Sender: TObject);
begin
  inherited;
  If FPercPisCofins = Nil Then
    FPercPisCofins := TFPercPisCofins.Create(Application);
  FPercPisCofins.ShowModal;
end;

end.

